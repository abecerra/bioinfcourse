#!/bin/bash

# script to download all SARS-CoV-2 genomes from ncbi 
# dependencies: 
#  - efetch from ncbi EDirect utils
#  - wget 
#  - awk
#  - sed
#  - tr

wget -N https://www.ncbi.nlm.nih.gov/projects/genome/sars-cov-2-seqs/ncov-sequences.yaml
cat ncov-sequences.yaml | grep 'accession"' | awk '{print $2}' | sed 's/"//g' | sed 's/,//g' > sarscov2genbankids.txt
efetchlist=$(cat sarscov2genbankids.txt | tr '\n' ',' | sed 's/,$//')
efetch -db sequences -format fasta -id $efetchlist > sarscov2genomes.fna

# Perform alignment
#muscle -in sarscov2genomes.fna -out sarscov2genomes.aln
