#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 01:00:00
#SBATCH -J coverage_estimation
#SBATCH -o /home/asma7174/GA_project/03_evaluation/polished_coverage_estimation/coverage_estimation.%j.out
#SBATCH -e /home/asma7174/GA_project/03_evaluation/polished_coverage_estimation/coverage_estimation.%j.err

module load SAMtools/1.22.1-GCC-13.3.0
module load BCFtools/1.22.1-GCC-13.3.0

# PATH
ASSEMBLY=/home/asma7174/GA_project/02_assembly/polishing/output/assembly.polished.fasta
BAM=/home/asma7174/GA_project/02_assembly/polishing/output/mapped.polished.sorted.bam
OUTDIR=/home/asma7174/GA_project/03_evaluation/polished_coverage_estimation

mkdir -p $OUTDIR

# INDEXING
samtools faidx $ASSEMBLY
samtools index $BAM

# depth
samtools depth -a $BAM > $OUTDIR/depth.txt

# coverage estimation
bcftools mpileup -f $ASSEMBLY $BAM | \
  bcftools stats > $OUTDIR/coverage_stats.txt
