<details>
  <summary><h1>Intro Seminar Questions (project planning based)</h1></summary>

This document answers the project‑planning questions from the course manual and links them directly to the analyses performed in the study **“RNA‑seq and Tn‑seq reveal fitness determinants of vancomycin‑resistant Enterococcus faecium during growth in human serum”** by Zhang et al. (2017).

---

## 1. What software would you use?

### **Genome Assembly**
- FastQC / MultiQC — quality control  
- fastp / Trimmomatic — trimming  
- SPAdes / Canu / Flye — assembly  
- QUAST — assembly quality assessment  
- Prokka — genome annotation  

### **RNA‑seq Differential Expression**
- FastQC / MultiQC — QC  
- fastp / Trimmomatic — trimming  
- HISAT2 / STAR — alignment  
- samtools — BAM processing  
- featureCounts / HTSeq — quantification  
- DESeq2 — differential expression  
- R / ggplot2 — visualisation  

### **Tn‑seq Fitness Analysis**
- FastQC / MultiQC — QC  
- Cutadapt / fastp — trimming transposon sequences  
- Bowtie2 — mapping insertion sites  
- Custom Python/R scripts — insertion counting  
- edgeR / DESeq2 / TRANSIT — fitness scoring  
- R / Python — plotting  

---

## 2. In what order?

### **A. Genome Assembly**
1. Download raw reads  
2. Perform QC  
3. Trim reads  
4. Assemble genome  
5. Polish assembly  
6. Annotate genome  

### **B. RNA‑seq Workflow**
1. Download RNA‑seq FASTQ files  
2. QC  
3. Trim  
4. Align to E745 genome  
5. Generate BAM files  
6. Count reads per gene  
7. Differential expression (DESeq2)  
8. Visualise results  
9. Compare with paper  

### **C. Tn‑seq Workflow**
1. Download Tn‑seq FASTQ files  
2. QC  
3. Trim transposon sequences  
4. Map insertion sites  
5. Count insertions per gene  
6. Compute fitness (serum vs BHI)  
7. Identify essential genes  
8. Visualise results  
9. Compare with paper  

---

## 3. What is input and output data?

### **Genome Assembly**
- **Input:** Illumina, PacBio, Nanopore reads  
- **Output:**  
  - Assembled genome (FASTA)  
  - Annotation (GFF)  
  - QC reports  

### **RNA‑seq**
- **Input:** Paired‑end FASTQ files (BHI vs serum)  
- **Output:**  
  - QC reports  
  - Trimmed reads  
  - BAM alignment files  
  - Count matrix  
  - Differential expression table  
  - Volcano plots, heatmaps  

### **Tn‑seq**
- **Input:** FASTQ files containing transposon + genomic sequence  
- **Output:**  
  - QC reports  
  - Trimmed reads  
  - Insertion site map  
  - Fitness scores  
  - List of essential genes  
  - Plots  

---

## 4. What happens in each step?

### **QC (FastQC/MultiQC)**
Assess read quality, GC content, adapter contamination.

### **Trimming (fastp/Trimmomatic)**
Remove adapters, low‑quality bases, and transposon sequences (Tn‑seq).

### **Alignment (HISAT2/STAR/Bowtie2)**
Map reads to the E745 genome.  
- RNA‑seq → gene expression  
- Tn‑seq → insertion locations  

### **Counting (featureCounts / custom scripts)**
- RNA‑seq: number of reads per gene  
- Tn‑seq: number of insertions per gene  

### **Differential Expression (DESeq2)**
Identify genes up/downregulated in serum vs BHI.

### **Fitness Analysis (Tn‑seq)**
Compare insertion abundance in serum vs BHI.  
Genes with fewer insertions in serum → essential for growth.

### **Visualisation**
- Volcano plots  
- Heatmaps  
- Genome‑wide insertion maps  

### **Interpretation**
Compare your results with the paper’s findings:  
- Purine biosynthesis genes upregulated  
- 37 genes essential for serum growth  
- PTS carbohydrate uptake genes important  

---

## 5. Mapping Technologies to Analyses

| Term | Belongs to |
|------|------------|
| **Illumina** | Genome Assembly |
| **PacBio** | Genome Assembly |
| **Nanopore** | Genome Assembly |
| **Genome Assembly** | Genome Assembly |
| **RNA‑Seq** | RNA‑seq analysis |
| **Differential Expression** | RNA‑seq analysis |
| **Tn‑Seq** | Tn‑seq fitness analysis |

</details>

---

<details>
  <summary><h1>Paper1 Specific Questions</h1></summary>

**“RNA‑seq and Tn‑seq reveal fitness determinants of vancomycin‑resistant Enterococcus faecium during growth in human serum”** by Zhang et al. (2017)

---

### **Why was *E. faecium* selected?**
It is a major multidrug‑resistant hospital pathogen causing bloodstream infections. The study focuses on how it survives in human serum.

### **What sequencing data were used for genome assembly? Why multiple techniques?**
- Illumina short reads  
- PacBio long reads  
- Oxford Nanopore long reads  
Multiple technologies improve accuracy and resolve plasmids and repeats.

### **How was the assembly curated and annotated? Other ways?**
Assembled with Celera, polished with Illumina reads.  
Other options: SPAdes, Canu, Flye, Prokka.

### **What is read trimming and why is it useful?**
Removing low‑quality bases and adapters improves alignment and reduces noise.

### **What is differential expression analysis?**
Statistical comparison of gene expression between conditions.  
Used here to compare BHI vs serum.

### **Why compare serum vs rich medium?**
Serum mimics bloodstream conditions; rich medium is a control.  
This reveals infection‑related gene activation.

### **What is a transposon and how does insertion affect a gene?**
A mobile DNA element.  
Insertion usually disrupts the gene, turning it off.

### **What genes were important for pathogenicity? How did they conclude this?**
Purine biosynthesis (purD, purH, purL), pyrimidine biosynthesis (pyrK_2, pyrF), carbohydrate uptake (manY_2).  
Mutants showed reduced growth in serum and reduced virulence in zebrafish.

### **What do they hope these genes will be used for?**
As targets for new antimicrobials.

### **Main results and conclusions**
- 860 genes differentially expressed  
- Purine biosynthesis strongly upregulated  
- 37 genes essential for serum growth  
- Nucleotide biosynthesis and carbohydrate uptake are key for survival  
- These pathways contribute to virulence 

</details>

---

