#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 00:05:00
#SBATCH -J map_polish_bwa
#SBATCH -o /home/asma7174/GA_project/02_assembly/polishing/logs/canu_assembly.%j.out
#SBATCH -e /home/asma7174/GA_project/02_assembly/polishing/logs/canu_assembly.%j.err

module load BWA/0.7.19-GCCcore-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0
module load BCFtools/1.22.1-GCC-13.3.0

# Paths
ASSEMBLY=/home/asma7174/GA_project/02_assembly/canu/output/assembly.contigs.fasta
READS_R1=/home/asma7174/GA_project/data/raw_dna/illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz
READS_R2=/home/asma7174/GA_project/data/raw_dna/illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz

OUTDIR=/home/asma7174/GA_project/02_assembly/polishing/output

cd $OUTDIR

# Index assembly
bwa index $ASSEMBLY

# Map Illumina reads to assembly
bwa mem -t 4 $ASSEMBLY $READS_R1 $READS_R2 | \
    samtools sort -@ 4 -o mapped.sorted.bam

samtools index mapped.sorted.bam

# Variant calling
bcftools mpileup -Ou -f $ASSEMBLY mapped.sorted.bam | \
    bcftools call -mv -Oz -o variants.vcf.gz

bcftools index variants.vcf.gz

# Apply variants to produce polished assembly
bcftools consensus -f $ASSEMBLY variants.vcf.gz > assembly.polished.fasta