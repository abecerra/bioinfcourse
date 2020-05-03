<!-- # SARS-CoV2 -->

# Introduction


https://www.nytimes.com/interactive/2020/04/03/science/coronavirus-genome-bad-news-wrapped-in-protein.html

http://education.expasy.org/bioinformatique/pdfs/Coronavirus_EN.pdf

https://swissmodel.expasy.org/repository/species/2697049


## Data

### Genomes 

https://www.ncbi.nlm.nih.gov/genbank/sars-cov-2-seqs/


### Proteins

https://covid-19.uniprot.org/uniprotkb?query=*



## Getting data

Download yaml file with the sequence ids and some metadata with **wget**:
```bash
wget -N https://www.ncbi.nlm.nih.gov/projects/genome/sars-cov-2-seqs/ncov-sequences.yaml
```
Now analyze the first 20 lines in file with **cat** and **head**:
```bash
cat ncov-sequences.yaml | head -n 20 
```
What is the pipe character **|** ?

Now filter the accession numbers with **grep**
```bash
cat ncov-sequences.yaml | grep 'accession"' | head -n 10
```

Now print the second word in the line with **awk**:
```bash
cat ncov-sequences.yaml | grep 'accession"' | awk '{print $2}' | head -n 5
```

Now replace " for nothing (deleting ") with **sed**:
```bash
cat ncov-sequences.yaml | grep 'accession"' | awk '{print $2}' | sed 's/"//g' | head -n 5
```

The same goes for ,:
```bash
cat ncov-sequences.yaml | grep 'accession"' | awk '{print $2}' | sed 's/"//g' | sed 's/,//g' | head -n 5
```

Save in file with redirection operator **>**:
```bash
cat ncov-sequences.yaml | grep 'accession"' | awk '{print $2}' | sed 's/"//g' | sed 's/,//g' > sarscov2genbankids.txt
```

How many sequences? (with **wc**)
```bash
cat sarscov2genbankids.txt | wc -l 
```
We can not download this manually **2051** !

### Install ncbi EDirect command line utils:

This tools assume you have a unix compatible system with **bash**, **wget** or **curl** and **perl** installed.

Follow instructions:
https://www.ncbi.nlm.nih.gov/books/NBK179288/

Now, the ids in the file are put in an **environment variable** in memory, with **tr** an sed
```bash
efetchlist=$(cat sarscov2genbankids.txt | tr '\n' ',' | sed 's/,$//')
```
The $ means the end of file, so ,$ is replaced by nothing, i.e. the last , is deleted

Check the value of the environment variable:
```bash
echo $efetchlist
```
Download the sequences:
```bash
efetch -db sequences -format fasta -id $efetchlist > sars2covgenomes.fna
```

How many genomes?
```bash
cat sarscov2genomes.fa |grep "^>" | wc -l
```

## Going back and creating a program to get the data

```bash
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
```

6 lines of code, 6 of documentation, not bad!
