# metagenome_annotation
annotation pipeline to annotate metagenomic data using KEGG, UniProt, NCBI, PFAM and IPERscan

This script takes a scaffold fasta file of nucleic acids, calls genes using prodigal and then annotates those genes against KEGG, NCBI, PFAM and Uniprot databaseses. The result of this script is multiple prodigal files for gene mapping, the specific database hits, and then a summary directory with a text file containing the full annotation, an annotated amino acid fasta file with the best hit for the protein, and an annotated nucleic acid fasta file (genes) with the annotation.

use annotate_fasta.sh

Software dependencies

  prodigal

  KEGG

  interproscan

  ublast

  uniref
  
For sotware, be sure the script calls to the correct database name depending on the software that you have and databases you use. This is completely set up for our server, but should be transferrable with a few tweaks.

Additional dependent scripts:

pullcontigs.pl

ANNOTATION_PIPELINE_IPER_OPTION.sh

make_fasta_seq_single_line.py

interproscan_parallel.sh

parallel_PfamScan.py

convert_pfam_to_iperscan.py

reverse_best_hits.sh

perl1.pl

perl2.pl

perl4_NEW.pl

pull_all_contig_annotations.py

perl6.pl

write_annotation_to_fasta.py

Dependent scripts must me in the same directory, or executable from a root directory.

Run this command as follows:

bash annotate_fasta.sh scaffold.fa DATABASE ID
$1 File to annotate

$2 IPER NO_IPER PFAM

$3 ID for metagenome that will be added to the beginning of all of the scaffolds

