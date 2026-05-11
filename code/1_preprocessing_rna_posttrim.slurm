#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_rna_trimmed
#SBATCH --mail-type=ALL
#SBATCH -o /home/asma7174/GA_project/06_RNA_seq/fastqc_rna_posttrim.%j.out
#SBATCH -e /home/asma7174/GA_project/06_RNA_seq/fastqc_rna_posttrim.%j.err

module load FastQC/0.12.1-Java-17

# Trimmed RNA
TRIM_CTRL=/proj/uppmax2026-1-61/nobackup/asma7174/Trimming/control
TRIM_SERUM=/proj/uppmax2026-1-61/nobackup/asma7174/Trimming/serum

# Output directory for FastQC after trimming
OUT_TRIM=/home/asma7174/GA_project/06_RNA_seq/fastqc_post_trimming
mkdir -p $OUT_TRIM

# FastQC: trimmed RNA
fastqc $TRIM_CTRL/*.fastq.gz -o $OUT_TRIM
fastqc $TRIM_SERUM/*.fastq.gz -o $OUT_TRIM

