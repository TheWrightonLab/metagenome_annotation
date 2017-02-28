#!/bin/bash

#    ANNOTATE_PROTEIN_FASTA.sh
#
#   written by Richard Wolfe
#
#   $1 = protein sequence fasta file to annotate
#   $2 = IPER or NO_IPER or PFAM
#
#    makes a directory  annotate_IPER or annotate_NO_IPER or annotate_PFAM with the results



#make sure 1 attribute
#check if varialble 2 is empty
if [ -z $2 ]
then
  echo "You did not provide 2  attribute"
  exit 1
fi

#check if valid string for $2
if [ "$2" == "IPER" ]
then
   echo "iperscan option selected"
elif [ "$2" == "PFAM" ]
then
   echo "PFAM scripts will be run"
elif [ "$2" == "NO_IPER" ]
then
   echo "iperscan will not be performed"
else
   echo "Variable 2 must be either IPER or NO_IPER"
   exit 1
fi

#check if file exists
if [ ! -f $1 ]
then
   echo "Error .. file $1 does not exist. Exiting script"
   exit 1
fi

mkdir annotate_$2
cd annotate_$2

#we need to rename all the headers so they are 
#  scaffold_0_0 ... scaffold_0_N-1

python /ORG-Data/scripts/bin/convert_velvet_to_ida_output.py -i ../$1   -o  renamed_$1   

#need to add the scaffold 0  part

sed  -i "s/>scaffold_/>scaffold_0_/g" renamed_$1

#make the All_ContigstoPull.txt  txt file so all the genes are pulled
#1 line because only 1 scaffold (scaffold_0)

echo 'ORIG_scaffold_0' > All_contigstopull.txt 

#run pipeline
#we dont have .fna file so we will use NONEXIST.fna in the paramater 

/ORG-Data/scripts/bin/Phylogeny_Protpipe/ANNOTATION_PIPELINE_IPER_OPTION.sh renamed_$1  NONEXIST.fna All_contigstopull.txt ORIG $2

echo " "
echo "Script finished"
echo " "
