#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH -t 03:00:00
#SBATCH -J canu_assembly
#SBATCH -o /home/asma7174/GA_project/02_assembly/canu/logs/canu_assembly.%j.out
#SBATCH -e /home/asma7174/GA_project/02_assembly/canu/logs/canu_assembly.%j.err

module load canu/2.3-GCCcore-13.3.0-Java-17

canu \
 -p assembly \
 -d /home/asma7174/GA_project/02_assembly/canu/output \
 genomeSize=3.2m \
 useGrid=false \
 bamOutput=false \
 -pacbio-raw /home/asma7174/GA_project/data/raw_dna/pacbio/*.fastq.gz

