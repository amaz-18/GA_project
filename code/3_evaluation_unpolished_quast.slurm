#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 00:30:00
#SBATCH -J quast_unpolished
#SBATCH -o /home/asma7174/GA_project/03_evaluation/quast/logs/quast_unpolished_evaluation.%j.out
#SBATCH -e /home/asma7174/GA_project/03_evaluation/quast/logs/quast_unpolished_evaluation.%j.err

module load QUAST/5.3.0-gfbf-2024a

quast \
  /home/asma7174/GA_project/02_assembly/canu/output/assembly.contigs.fasta \
  -o /home/asma7174/GA_project/03_evaluation/unpolished_quast \
  -t 4