# Project Plan  
_Re-analyse real sequencing data from:_
**“RNA‑seq and Tn‑seq reveal fitness determinants of vancomycin‑resistant Enterococcus faecium during growth in human serum” — Zhang et al., 2017**

The project plan summarises the outlines of the project (aim, data and sample type(s), analyses and softwares, timeline, and data management plan.

---

<details>
  <summary><h2>Outline</h2></summary>

### Overall aims of this project are to:
- gain experience using common bioinformatics tools and methods for sequence analysis
- develop own workflow and learn to build and manage a clear and updated Github repository
- learn to answer important biological question through the interpretation of our analyses
- learn to troubleshoot errors and 

### My specific research Questions
- Which genes are differentially expressed when *E.faecium E745* is grown in human serum vs BHI (rich medium)?
- Does serum exposure induce genes associated with host adaptation or immune evasion?
- Which annotated pathways are activated in serum, and how do they relate to known virulence or stress‑response mechanisms?

</details>

---

<details>
  <summary><h2>Analyses to Perform (order, software etc.)</h2></summary>

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
| 1 | Download PacBio reads (ENA PRJEB19025) | — | Required for assembly |
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
| 1 | Identify a closely related *E. faecium* genome | NCBI GenBank |
| 2 | Generate whole‑genome alignment (pairwise) | **BLASTN** or **MUMmer/nucmer** |
| 3 | Synteny visualisation | **ACT (Artemis Comparison Tool)** |

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
  <summary><h2>Timeline and Checkpoints</h2></summary>

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
  <summary><h2>Data Management Plan</h2></summary>

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
