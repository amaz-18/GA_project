#  Project Summary:

In this project we will reproduce and analyse sequencing data from:

**“RNA‑seq and Tn‑seq reveal fitness determinants of vancomycin‑resistant Enterococcus faecium during growth in human serum” -Zhang et al., 2017**

## Workflow:

The overall workflow of the project is shown below, including the major steps of Genome assembly and RNA-seq, tools, and outputs produced.

_It should be noted that polishing with short reads (after the assembly step) is not show in the diagram but it was performed_

---

<img width="1940" height="1818" alt="Image" src="https://github.com/user-attachments/assets/c30c32ad-1d69-4436-906d-7fb8be76d197" />

**Figure:** Genome assembly and RNA‑seq analysis pipeline integrating Illumina and PacBio data.  

_Diagram created through draw.io_

## Sequencing data files:

All sequencing data is and can be soft‑linked from the UPPMAX course project directory:

- **Raw DNA (Illumina + PacBio)**  
  `/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/`

- **Raw RNA‑seq (control)**  
  `/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/raw/`

- **Raw RNA‑seq (serum)**  
  `/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/raw/`

- **Trimmed RNA‑seq (control + serum)**  
  `/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/*/trimmed/`

## Software & Versions:
The following pipeline tools  were used at various steps through the workflow:

- **FastQC** – quality assessment of raw and trimmed reads  
- **Trimmomatic** – sequence read trimming  
- **Canu** – long‑read genome assembly  
- **BWA** – used twice:
  - short‑read mapping for assembly polishing  
  - RNA‑seq read mapping to the Canu assembly
- **samtools** – BAM processing  
- **BUSCO** – assembly completeness assessment  
- **QUAST** – assembly quality evaluation  
- **Prokka** – genome annotation  
- **EggNOG‑mapper** – functional annotation   
- **HTSeq** – read counting  
- **DESeq2 (R)** – differential expression analysis  

> Module versions correspond to those available on UPPMAX at the time of analysis.

## How to:

Each analysis step is run via bash/SLURM scripts located in the `code/` directory. 

The scripts are numbered according to the workflow order from 01 → 06 (incl. one R script in the directory that is executed within a SLURM script).

for example:

```bash
sbatch code/1_preprocessing_dna.slurm
sbatch code/2_<title>slurm
...
sbatch code/6_<title>.slurm
```

## Data Management
All slurm and R scripts, as well as directories of each analysis (incl. log files and output results) are organized as below:

```text
├── 01_preprocessing
│   ├── fastqc_post_trimming
│   ├── fastqc_raw_before_trim
│   ├── fastqc_raw_dna
│   └── logs
├── 02_assembly
│   ├── canu
│   │   ├── logs
│   │   └── output
│   └── polishing
│       ├── logs
│       └── output
├── 03_evaluation
│   ├── polished_busco
│   │   ├── logs
│   │   └── output
│   ├── polished_quast
│   │   ├── logs
│   │   └── output
│   ├── polished_synteny
│   └── unpolished_quast
├── 04_annotation
│   ├── prokka_output
│   ├── eggnog
│   └── logs
├── 05_comparison
│   ├── synteny_comparison.tab
│   ├── logs
├── 06_RNA_seq
│   ├── Alignment
│   ├── Counts & Expression
│   └── logs
├── code
│   ├── 0_data_prep.sh
│   ├── 1_preprocessing_dna.slurm
│   ├── 1_preprocessing_rna.slurm
│   ├── 1_preprocessing_rna_posttrim.slurm
│   ├── 2_assembly_canu.slurm
│   ├── 2_map_polish_bwa.slurm
│   ├── 2_remap_polished_assembly.slurm
│   ├── 3_evaluation_busco.slurm
│   ├── 3_evaluation_quast.slurm
│   ├── 3_evaluation_synteny.slurm
│   ├── 3_evaluation_unpolished_quast.slurm
│   ├── 4_annotation_eggnog.slurm
│   ├── 4_annotation_prokka.slurm
│   ├── 5_synteny_comparison.slurm
│   ├── 6_rna_expression.slurm
│   ├── 6_rna_expression_htseq.slurm
│   ├── 6_rna_mapping_canu.slurm
│   ├── 6_rna_trimming.slurm
│   └── deseq2_script.R
├── data
│   └── reference_NCBI
├── README.md
└── .gitignore
```

## Citation:

Zhang et al. (2017). *Genome-wide identification of fitness determinants of vancomycin-resistant Enterococcus faecium in human serum.*  
BMC Genomics, 18:893.  
https://doi.org/10.1186/s12864-017-4299-9





