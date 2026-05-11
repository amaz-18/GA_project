#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 08:00:00
#SBATCH -J rna_to_canu_assembly
#SBATCH --mail-type=ALL
#SBATCH -o /home/asma7174/GA_project/06_RNA_seq/rna_to_canu_assembly.%j.out
#SBATCH -e /home/asma7174/GA_project/06_RNA_seq/rna_to_canu_assembly.%j.err

module load bwa-mem2/2.3-GCC-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0

ASSEMBLY=/home/asma7174/GA_project/02_assembly/canu/output/assembly.contigs.fasta
TRIM_CTRL=/proj/uppmax2026-1-61/nobackup/asma7174/Trimming/control
TRIM_SERUM=/proj/uppmax2026-1-61/nobackup/asma7174/Trimming/serum
OUTDIR=/home/asma7174/GA_project/06_RNA_seq/Alignment

mkdir -p $OUTDIR

bwa-mem2 index $ASSEMBLY

# Control samples

for SAMPLE in ERR1797972 ERR1797973 ERR1797974
do
    R1=${TRIM_CTRL}/trim_paired_${SAMPLE}_1.fastq.gz
    R2=${TRIM_CTRL}/trim_paired_${SAMPLE}_2.fastq.gz
    BAM=${OUTDIR}/CTRL_${SAMPLE}.sorted.bam

    echo "Mapping CONTROL sample $SAMPLE to Canu assembly"

    bwa-mem2 mem -t 4 "$ASSEMBLY" "$R1" "$R2" | \
        samtools sort -@ 4 -o "$BAM"

    samtools index "$BAM"
    samtools flagstat "$BAM" > ${OUTDIR}/CTRL_${SAMPLE}.flagstat.txt
done

# Serum samples

for SAMPLE in ERR1797969 ERR1797970 ERR1797971
do
    R1=${TRIM_SERUM}/trim_paired_${SAMPLE}_1.fastq.gz
    R2=${TRIM_SERUM}/trim_paired_${SAMPLE}_2.fastq.gz
    BAM=${OUTDIR}/SERUM_${SAMPLE}.sorted.bam

    echo "Mapping SERUM sample $SAMPLE to Canu assembly"

    bwa-mem2 mem -t 4 "$ASSEMBLY" "$R1" "$R2" | \
        samtools sort -@ 4 -o "$BAM"

    samtools index "$BAM"
    samtools flagstat "$BAM" > ${OUTDIR}/SERUM_${SAMPLE}.flagstat.txt
done

