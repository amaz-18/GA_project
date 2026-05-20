#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH -J synteny_blast
#SBATCH -o /home/asma7174/GA_project/05_comparison/synteny_%j.out 
#SBATCH -e /home/asma7174/GA_project/05_comparison/synteny_%j.err

module load BLAST+/2.17.0-gompi-2024a

cd ~/GA_project/05_comparison/

# Paths
REFERENCE=/home/asma7174/GA_project/data/reference_NCBI/efaecium_ref.fna
# prokka annotated assembly
QUERY=/home/asma7174/GA_project/04_annotation/prokka_output/efaecium.fna


# Build BLAST database from reference genome
makeblastdb -in $REFERENCE -dbtype nucl -out ref_db

# Run BLAST comparison (polished assembly vs reference)
blastn \
  -query $QUERY \
  -db ref_db \
  -out synteny_comparison.tab \
  -outfmt 6 \
  -evalue 1e-10 
