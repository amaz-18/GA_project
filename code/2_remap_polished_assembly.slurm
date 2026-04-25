#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 01:00:00
#SBATCH -J remap_polished_assembly
#SBATCH -o /home/asma7174/GA_project/02_assembly/polishing/logs/remap_polished.%j.out
#SBATCH -e /home/asma7174/GA_project/02_assembly/polishing/logs/remap_polished.%j.err

module load BWA/0.7.19-GCCcore-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0
module load BCFtools/1.22.1-GCC-13.3.0

# Paths
ASSEMBLY=/home/asma7174/GA_project/02_assembly/polishing/output/assembly.polished.fasta
READS_R1=/home/asma7174/GA_project/data/raw_dna/illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz
READS_R2=/home/asma7174/GA_project/data/raw_dna/illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz

OUTDIR=/home/asma7174/GA_project/02_assembly/polishing/output

cd $OUTDIR

# Index polished assembly
bwa index $ASSEMBLY

# Map Illumina reads to polished assembly
bwa mem -t 4 $ASSEMBLY $READS_R1 $READS_R2 | \
    samtools sort -@ 4 -o mapped.polished.sorted.bam

# Index BAM
samtools index mapped.polished.sorted.bam
