#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_rna_before
#SBATCH -o /home/asma7174/GA_project/06_RNA_seq/fastqc_rna_before.%j.out
#SBATCH -e /home/asma7174/GA_project/06_RNA_seq/fastqc_rna_before.%j.err

module load FastQC/0.12.1-Java-17

# Raw RNA
RAW_CTRL=/home/asma7174/GA_project/data/rna/control/raw
RAW_SERUM=/home/asma7174/GA_project/data/rna/serum/raw

OUT_RAW=/home/asma7174/GA_project/06_RNA_seq/fastqc_raw_before_trim
mkdir -p $OUT_RAW

# FastQC: RAW RNA
# Control raw
fastqc $RAW_CTRL/*_1.fastq.gz -o $OUT_RAW
fastqc $RAW_CTRL/*_2.fastq.gz -o $OUT_RAW

# Serum raw
fastqc $RAW_SERUM/*_1.fastq.gz -o $OUT_RAW
fastqc $RAW_SERUM/*_2.fastq.gz -o $OUT_RAW
