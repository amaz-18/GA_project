#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 04:00:00
#SBATCH -J deseq2_expression
#SBATCH --mail-type=ALL
#SBATCH -o /home/asma7174/GA_project/06_RNA_seq/deseq2_expression.%j.out
#SBATCH -e /home/asma7174/GA_project/06_RNA_seq/deseq2_expression.%j.err

module load R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2

Rscript deseq2_script.R
