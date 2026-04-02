# Project Plan  
_Reproduce analysis and visualisations from Zhang et al. (2017)_

Good project planning and data organisation are essential for efficient and reproducible bioinformatics research.  
This project plan outlines the aim, analyses, timeline, data requirements, and organisational strategy for re‑analysing the RNA‑seq and Tn‑seq datasets from the study:

**“RNA‑seq and Tn‑seq reveal fitness determinants of vancomycin‑resistant Enterococcus faecium during growth in human serum” — Zhang et al., 2017**

---

<details>
  <summary><h2>1. Project Aim</h2></summary>

The aim of this project is to reproduce and evaluate the transcriptomic and fitness analyses performed in Zhang et al. (2017) to identify genes that enable *Enterococcus faecium* E745 to grow and survive in human serum.

### **Research Questions**
- Which genes are differentially expressed in serum vs BHI (rich medium)?
- Which genes are essential for growth in human serum?
- Do the re‑analysed results support the conclusions of the original study?
- Are purine biosynthesis, carbohydrate uptake, and stress‑response pathways enriched among essential genes?

</details>

---

<details>
  <summary><h2>2. Analyses to Perform (Order, Tools, Bottlenecks)</h2></summary>

## **Overview**
This project includes:
- **RNA‑seq differential expression analysis**
- **Tn‑seq fitness analysis**

It does **not** include genome assembly or RNA assembly, because the reference genome is already provided in the paper.

---

## **A. RNA‑seq Differential Expression Workflow**

### **Steps**
1. Download FASTQ files  
2. Quality control (FastQC, MultiQC)  
3. Trimming (Trimmomatic)  
4. Alignment to reference genome (HISAT2 or STAR)  
5. BAM processing (samtools)  
6. Read counting (HTSeq or featureCounts)  
7. Differential expression (DESeq2)  
8. Visualisation (R, ggplot2)  
9. Interpretation and comparison with paper  

### **Software**
- FastQC  
- Trimmomatic  
- HISAT2 / STAR  
- samtools  
- HTSeq / featureCounts  
- DESeq2  
- R + ggplot2  
- (Optional) rrvgo for GO enrichment  

### **Time Bottlenecks**
- Alignment (HISAT2/STAR)  
- Counting (HTSeq for paired‑end can be slow)  

---

## **B. Tn‑seq Fitness Analysis Workflow**

### **Steps**
1. Download Tn‑seq FASTQ files  
2. Quality control (FastQC)  
3. Trim transposon sequences (Trimmomatic or Cutadapt)  
4. Map insertion sites (Bowtie2 or BWA)  
5. Count insertions per gene (custom scripts)  
6. Compute fitness scores (TRANSIT / edgeR / DESeq2)  
7. Identify essential genes  
8. Visualisation (R/Python)  
9. Compare with paper findings  

### **Software**
- FastQC  
- Trimmomatic  
- Bowtie2 or BWA  
- samtools  
- Python/R scripts  
- TRANSIT / edgeR / DESeq2  

### **Time Bottlenecks**
- Mapping insertion sites  
- Fitness scoring on large datasets  

</details>

---

<details>
  <summary><h2>3. Software Summary (Appendix‑Aligned)</h2></summary>

### **Genome Assembly (Not Performed in This Project)**  
_These tools are listed in the Appendix but not used here. The E745 genome is already assembled._  
- FastQC  
- Trimmomatic  
- SPAdes  
- Canu  
- QUAST  
- Prokka  

### **RNA‑seq Tools (Used in This Project)**  
- FastQC  
- Trimmomatic  
- HISAT2 / STAR  
- samtools  
- HTSeq / featureCounts  
- DESeq2  
- R + ggplot2  
- rrvgo (optional)

### **Tn‑seq Tools (Used in This Project)**  
- FastQC  
- Trimmomatic  
- Bowtie2 or BWA  
- samtools  
- Python/R scripts  
- TRANSIT / edgeR / DESeq2  

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
  <summary><h2>5. Timeline and Checkpoints</h2></summary>

| Week | Task |
|------|------|
| **Week 1** | Read paper, define aims, set up repo, plan analyses |
| **Week 2** | Download data, run QC + trimming |
| **Week 3** | RNA‑seq alignment + counting |
| **Week 4** | DESeq2 analysis + visualisation |
| **Week 5** | Tn‑seq mapping + insertion counting |
| **Week 6** | Fitness scoring + essential gene identification |
| **Week 7** | Interpretation, comparison with paper |
| **Week 8** | Final documentation and cleanup |

### **Critical Checkpoint**
All heavy computations (alignment, mapping) must be completed by **Week 4–5**.

</details>

---

<details>
  <summary><h2>6. Data Organisation Strategy</h2></summary>

Directory layout:
GA_project/
│
├── Project_Planning.md
│── Question & Answers.md
│   
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
