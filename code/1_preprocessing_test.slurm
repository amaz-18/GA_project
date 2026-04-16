#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -c 2
#SBATCH -t 00:30:00
#SBATCH -J fastqc_test
#SBATCH --cpus-per-task=2
#SBATCH --mem=10G
#SBATCH -o /gorilla/home/asma7174/GA_project/logs/fastqc_test.%j.out
#SBATCH -e /gorilla/home/asma7174/GA_project/logs/fastqc_test.%j.err



module load bioinfo-tools
module load FastQC/0.12.1-Java-17

# Test only DNA FastQC
fastqc ~/GA_project/data/raw_dna/illumina/*_1_clean.fq.gz -o ~/GA_project/01_preprocessing/fastqc_raw
fastqc ~/GA_project/data/raw_dna/illumina/*_2_clean.fq.gz -o ~/GA_project/01_preprocessing/fastqc_raw
fastqc ~/GA_project/data/raw_dna/pacbio/*.fastq.gz -o ~/GA_project/01_preprocessing/fastqc_raw
