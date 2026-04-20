#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_rna
#SBATCH --cpus-per-task=2
#SBATCH --mem=10G
#SBATCH -o /home/asma7174/GA_project/logs/fastqc_rna.%j.out
#SBATCH -e /home/asma7174/GA_project/logs/fastqc_rna.%j.err

module load bioinfo-tools
module load FastQC/0.12.1-Java-17

# Raw RNA
RAW_CTRL=/home/asma7174/GA_project/data/rna/control/raw
RAW_SERUM=/home/asma7174/GA_project/data/rna/serum/raw

# Trimmed RNA
TRIM_CTRL=/home/asma7174/GA_project/data/rna/control/trimmed
TRIM_SERUM=/home/asma7174/GA_project/data/rna/serum/trimmed

# FastQC: RAW RNA
-------------------
# Control raw
fastqc $RAW_CTRL/*_F.fastq.gz -o $OUT_RAW
fastqc $RAW_CTRL/*_R.fastq.gz -o $OUT_RAW

# Serum raw
fastqc $RAW_SERUM/*_F.fastq.gz -o $OUT_RAW
fastqc $RAW_SERUM/*_R.fastq.gz -o $OUT_RAW

# FastQC: TRIMMED RNA
----------------------------
# Control trimmed
fastqc $TRIM_CTRL/trim_paired_*_pass_1.fastq.gz -o $OUT_TRIM
fastqc $TRIM_CTRL/trim_paired_*_pass_2.fastq.gz -o $OUT_TRIM

# Serum trimmed
fastqc $TRIM_SERUM/trim_paired_*_pass_1.fastq.gz -o $OUT_TRIM
fastqc $TRIM_SERUM/trim_paired_*_pass_2.fastq.gz -o $OUT_TRIM


