## 3. Paper‑Specific Questions (Zhang et al., 2017)

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
