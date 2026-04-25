#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 01:00:00
#SBATCH -J error_inspection
#SBATCH -o /home/asma7174/GA_project/03_evaluation/polished_error_inspection/error_inspection.%j.out
#SBATCH -e /home/asma7174/GA_project/03_evaluation/polished_error_inspection/error_inspection.%j.err

module load SAMtools/1.22.1-GCC-13.3.0
module load BCFtools/1.22.1-GCC-13.3.0

# PATH
ASSEMBLY=/home/asma7174/GA_project/02_assembly/polishing/output/assembly.polished.fasta
BAM=/home/asma7174/GA_project/02_assembly/polishing/output/mapped.polished.sorted.bam
OUTDIR=/home/asma7174/GA_project/03_evaluation/polished_error_inspection

mkdir -p $OUTDIR

# variant calling
bcftools mpileup -Ou -f $ASSEMBLY $BAM | \
  bcftools call -mv -Oz -o $OUTDIR/error_inspection_variants.vcf.gz

# index VCF
bcftools index $OUTDIR/error_inspection_variants.vcf.gz

# stats
bcftools stats $OUTDIR/error_inspection_variants.vcf.gz > $OUTDIR/variant_stats.txt
