# Project Plan  
_Reproduce analysis and visualisations from:_
**“RNA‑seq and Tn‑seq reveal fitness determinants of vancomycin‑resistant Enterococcus faecium during growth in human serum” — Zhang et al., 2017**

The project plan outlines the aim, analyses, timeline, data requirements, and some strategies for re‑analysing the RNA‑seq and Tn‑seq datasets.

---

<details>
  <summary><h2>1. Aim</h2></summary>

The aim of this project is to reproduce and evaluate the transcriptomic and fitness analyses performed in Zhang et al. (2017) to identify genes that enable *Enterococcus faecium* E745 to grow and survive in human serum.

### **Research Questions**
- Which genes are differentially expressed in serum vs BHI (rich medium)?
- Which genes are essential for growth in human serum?
- Do the re‑analysed results support the conclusions of the original study?
- Are purine biosynthesis, carbohydrate uptake, and stress‑response pathways enriched among essential genes?

</details>

---

<details>
  <summary><h2>2. Analyses to Perform (order, software, timeline)</h2></summary>

This project includes (mandatory):
- **Genome assembly with PacBio reads**  
- **Assembly evaluation**  
- **Structural and functional annotation**  
- **Synteny comparison with a closely related genome**  
- **Reads preprocessing (QC + trimming)**  
- **RNA‑seq alignment against the assembled genome**  
- **Differential expression analysis (serum vs rich medium)**

---

## **A. Genome Assembly Workflow**

| Step | Description | Software | Notes |
|------|-------------|----------|-------|
| 1 | Download PacBio reads (ENA PRJEB19025) | `prefetch`, `fasterq-dump` | Required for assembly |
| 2 | Long‑read assembly | Canu | Paper used Celera |
| 3 | Hybrid gap closing | SPAdes | Paper used SPAdes |
| 4 | Assembly polishing | BWA, samtools, bcftools | Align Illumina reads to correct errors |
| 5 | Generate final assembly | — | Produces chromosome + plasmids |

---

## **B. Assembly Evaluation**

| Step | Description | Software |
|------|-------------|----------|
| 1 | Assembly quality metrics | QUAST |
| 2 | Coverage estimation | samtools |
| 3 | Error inspection | samtools, bcftools |

---

## **C. Structural & Functional Annotation**

| Step | Description | Software |
|------|-------------|----------|
| 1 | Predict genes, CDS, RNAs | Prokka |
| 2 | Generate GFF + GBK files | Prokka | Used for RNA‑seq alignment and synteny |

---

## **D. Synteny Comparison**

| Step | Description | Software |
|------|-------------|----------|
| 1 | Identify closely related genome | NCBI GenBank |
| 2 | Core genome alignment | **ParSNP** |
| 3 | Synteny visualization | **Mauve** or ParSNP output |

---

## **E. RNA‑seq Differential Expression Workflow**

| Step | Description | Software |
|------|-------------|----------|
| 1 | Download RNA‑seq FASTQ files | — |
| 2 | Quality control | FastQC |
| 3 | Reads preprocessing/Trimming | Trimmomatic |
| 4 | Alignment to *my assembled genome* | HISAT2 or BWA |
| 5 | Read counting | HTSeq |
| 6 | Differential expression | DESeq2 (R) |
| 7 | Visualisation | R, ggplot2 etc. |
| 8 | Interpretation and comparison with paper | — |

</details>

---


<details>
  <summary><h2>4. Data Types and Storage Requirements</h2></summary>

### **Data Types**
- RNA‑seq paired‑end FASTQ files  
- Tn‑seq FASTQ files  
- Reference genome (FASTA + GFF)  
- BAM files  
- Count matrices  
- Fitness score tables  

### **Storage Considerations**
- Raw FASTQ files: several GB  
- BAM files: 2–5× FASTQ size  
- Keep track of UPPMAX quota  
- Delete intermediate files when no longer needed  

</details>

---

<details>
  <summary><h2>6. Data Organisation Strategy</h2></summary>

Directory layout:
GA_project/
│
├── Project_Planning.md
├── Questions_And_Answers.md
│
├── data/
│   ├── raw/
│   └── processed/
│
├── scripts/
│   ├── rnaseq/
│   └── tnseq/
│
├── results/
│   ├── rnaseq/
│   └── tnseq/
│
└── README.md
