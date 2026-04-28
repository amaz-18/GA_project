#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 12:00:00
#SBATCH -J eggnog_annotation_refinement
#SBATCH -o /home/asma7174/GA_project/04_annotation/eggnog_%j.out
#SBATCH -e /home/asma7174/GA_project/04_annotation/eggnog_%j.err
#SBATCH --mail-type=ALL

module load Miniconda3/25.7.0-2
conda activate $CONDA_ENVS_PATH/eggnog

FAA=/home/asma7174/GA_project/04_annotation/prokka_output/efaecium.faa
OUTDIR=/home/asma7174/GA_project/04_annotation/eggnog
DBDIR=/home/asma7174/GA_project/resources/eggnog-mapper

mkdir -p $OUTDIR

emapper.py \
    -i $FAA \
    -o efaecium_emapper \
    --cpu 4 \
    --data_dir $DBDIR \
    --itype proteins \
    --output_dir $OUTDIR \
    --override
