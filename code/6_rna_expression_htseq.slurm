#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 06:00:00
#SBATCH -J expression_htseq_paired
#SBATCH --mail-type=ALL
#SBATCH -o /home/asma7174/GA_project/06_RNA_seq/expression_htseq_reverse.%j.out
#SBATCH -e /home/asma7174/GA_project/06_RNA_seq/expression_htseq_reverse.%j.err

module load HTSeq/2.1.2-gfbf-2024a

ANNOT=/home/asma7174/GA_project/04_annotation/prokka_output/efaecium.gff

# Cleaned GFF (FASTA removed)
ANNOT_CLEAN=/home/asma7174/GA_project/04_annotation/prokka_output/efaecium_clean.gff

# Remove FASTA section from GFF
awk '/^##FASTA/ {exit} {print}' "$ANNOT" > "$ANNOT_CLEAN"

BAMDIR=/home/asma7174/GA_project/06_RNA_seq/Alignment
OUTDIR=/home/asma7174/GA_project/06_RNA_seq/Expression

mkdir -p "$OUTDIR"

for BAM in "$BAMDIR"/*sorted.bam
do
    SAMPLE=$(basename "$BAM" .sorted.bam)

    htseq-count \
        -f bam \
        -r pos \
        -s reverse \
        -t CDS \
        -i ID \
        "$BAM" \
        "$ANNOT_CLEAN" \
        > "$OUTDIR/${SAMPLE}.counts.txt"
done
