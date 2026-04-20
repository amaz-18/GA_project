#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 01:00:00
#SBATCH -J busco_polished
#SBATCH -o /home/asma7174/GA_project/03_evaluation/busco/logs/busco_evaluation.%j.out
#SBATCH -e /home/asma7174/GA_project/03_evaluation/busco/logs/busco_evaluation.%j.err

module load BUSCO/5.8.2-gfbf-2024a

busco \
  -i /home/asma7174/GA_project/02_assembly/polishing/output/assembly.polished.fasta \
  -l bacteria_odb10 \
  -o busco_output \
  -m genome \
  -c 4