#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 04:00:00
#SBATCH -J trimmomatic_rna
#SBATCH --mail-type=ALL
#SBATCH -o /home/asma7174/GA_project/06_RNA_seq/trimmomatic_rna.%j.out
#SBATCH -e /home/asma7174/GA_project/06_RNA_seq/trimmomatic_rna.%j.err

module load Trimmomatic/0.39-Java-17

RAW_CTRL=/home/asma7174/GA_project/data/rna/control/raw
RAW_SERUM=/home/asma7174/GA_project/data/rna/serum/raw

# Output directories
OUT_CTRL=/proj/uppmax2026-1-61/nobackup/asma7174/Trimming/control
OUT_SERUM=/proj/uppmax2026-1-61/nobackup/asma7174/Trimming/serum

mkdir -p $OUT_CTRL
mkdir -p $OUT_SERUM

# CONTROL SAMPLES

# ERR1797972
trimmomatic PE -threads 4 \
    $RAW_CTRL/ERR1797972_1.fastq.gz $RAW_CTRL/ERR1797972_2.fastq.gz \
    $OUT_CTRL/trim_paired_ERR1797972_1.fastq.gz $OUT_CTRL/trim_unpaired_ERR1797972_1.fastq.gz \
    $OUT_CTRL/trim_paired_ERR1797972_2.fastq.gz $OUT_CTRL/trim_unpaired_ERR1797972_2.fastq.gz \
    ILLUMINACLIP:$TRIMMOMATIC_ROOT/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

# ERR1797973
trimmomatic PE -threads 4 \
    $RAW_CTRL/ERR1797973_1.fastq.gz $RAW_CTRL/ERR1797973_2.fastq.gz \
    $OUT_CTRL/trim_paired_ERR1797973_1.fastq.gz $OUT_CTRL/trim_unpaired_ERR1797973_1.fastq.gz \
    $OUT_CTRL/trim_paired_ERR1797973_2.fastq.gz $OUT_CTRL/trim_unpaired_ERR1797973_2.fastq.gz \
    ILLUMINACLIP:$TRIMMOMATIC_ROOT/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

# ERR1797974
trimmomatic PE -threads 4 \
    $RAW_CTRL/ERR1797974_1.fastq.gz $RAW_CTRL/ERR1797974_2.fastq.gz \
    $OUT_CTRL/trim_paired_ERR1797974_1.fastq.gz $OUT_CTRL/trim_unpaired_ERR1797974_1.fastq.gz \
    $OUT_CTRL/trim_paired_ERR1797974_2.fastq.gz $OUT_CTRL/trim_unpaired_ERR1797974_2.fastq.gz \
    ILLUMINACLIP:$TRIMMOMATIC_ROOT/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

# SERUM SAMPLES

# ERR1797969
trimmomatic PE -threads 4 \
    $RAW_SERUM/ERR1797969_1.fastq.gz $RAW_SERUM/ERR1797969_2.fastq.gz \
    $OUT_SERUM/trim_paired_ERR1797969_1.fastq.gz $OUT_SERUM/trim_unpaired_ERR1797969_1.fastq.gz \
    $OUT_SERUM/trim_paired_ERR1797969_2.fastq.gz $OUT_SERUM/trim_unpaired_ERR1797969_2.fastq.gz \
    ILLUMINACLIP:$TRIMMOMATIC_ROOT/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

# ERR1797970
trimmomatic PE -threads 4 \
    $RAW_SERUM/ERR1797970_1.fastq.gz $RAW_SERUM/ERR1797970_2.fastq.gz \
    $OUT_SERUM/trim_paired_ERR1797970_1.fastq.gz $OUT_SERUM/trim_unpaired_ERR1797970_1.fastq.gz \
    $OUT_SERUM/trim_paired_ERR1797970_2.fastq.gz $OUT_SERUM/trim_unpaired_ERR1797970_2.fastq.gz \
    ILLUMINACLIP:$TRIMMOMATIC_ROOT/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

# ERR1797971
trimmomatic PE -threads 4 \
    $RAW_SERUM/ERR1797971_1.fastq.gz $RAW_SERUM/ERR1797971_2.fastq.gz \
    $OUT_SERUM/trim_paired_ERR1797971_1.fastq.gz $OUT_SERUM/trim_unpaired_ERR1797971_1.fastq.gz \
    $OUT_SERUM/trim_paired_ERR1797971_2.fastq.gz $OUT_SERUM/trim_unpaired_ERR1797971_2.fastq.gz \
    ILLUMINACLIP:$TRIMMOMATIC_ROOT/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

echo "Trimming completed."
