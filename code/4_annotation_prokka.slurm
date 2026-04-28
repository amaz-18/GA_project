#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J sf_annotation
#SBATCH -o /home/asma7174/GA_project/04_annotation/prokka_%j.out
#SBATCH -e /home/asma7174/GA_project/04_annotation/prokka_%j.err

module load prokka/1.14.5-gompi-2024a

# Paths
ASSEMBLY=/home/asma7174/GA_project/02_assembly/polishing/output/assembly.polished.fasta
OUTDIR=/home/asma7174/GA_project/04_annotation/prokka_output

# Create output directory
mkdir -p $OUTDIR

# Run Prokka
prokka \
    --outdir $OUTDIR \
    --prefix efaecium \
    --force \
    --locustag EFA \
    --genus Enterococcus \
    --species faecium \
    --strain E745 \
    --cpus 2 \
    $ASSEMBLY
