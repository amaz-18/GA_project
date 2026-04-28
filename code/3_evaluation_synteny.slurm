#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 01:00:00
#SBATCH -J synteny
#SBATCH -o /home/asma7174/GA_project/03_evaluation/polished_synteny/synteny.%j.out
#SBATCH -e /home/asma7174/GA_project/03_evaluation/polished_synteny/synteny.%j.err


# Load modules
module load MUMmer/4.0.1-GCCcore-13.3.0

# Define paths
REF=~/GA_project/data/reference_NCBI/efaecium_ref.fna
ASSEMBLY=/home/asma7174/GA_project/02_assembly/polishing/output/assembly.polished.fasta
OUTDIR=/home/asma7174/GA_project/03_evaluation/polished_synteny

# Create output directory if missing
mkdir -p $OUTDIR
cd $OUTDIR

# Run nucmer
nucmer --prefix=synteny $REF $ASSEMBLY

# Filter alignments
delta-filter -1 synteny.delta > synteny.filtered.delta

# Plot
mummerplot -t png --layout --filter \
    -R $REF \
    -Q $ASSEMBLY \
    -p synteny synteny.filtered.delta

