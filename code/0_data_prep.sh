
# Make folders for the data
mkdir -p ~/GA_project/data/raw_dna
mkdir -p ~/GA_project/data/rna/control
mkdir -p ~/GA_project/data/rna/serum
mkdir -p ~/GA_project/data/rna/control/raw
mkdir -p ~/GA_project/data/rna/control/trimmed
mkdir -p ~/GA_project/data/rna/serum/raw
mkdir -p ~/GA_project/data/rna/serum/trimmed

# RAW DNA (Illumina + PacBio)
ln -s /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
      ~/GA_project/data/raw_dna/

ln -s /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
      ~/GA_project/data/raw_dna/

ln -s /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/pacbio_long.fastq.gz \
      ~/GA_project/data/raw_dna/

# RAW RNA (control)
ln -s /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/raw/*.fastq.gz \
      ~/GA_project/data/rna/control/raw/

# RAW RNA (serum)
ln -s /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/raw/*.fastq.gz \
      ~/GA_project/data/rna/serum/raw/

# TRIMMED RNA (control)
ln -s /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trimmed/*.fastq.gz \
      ~/GA_project/data/rna/control/trimmed/

# TRIMMED RNA (serum)
ln -s /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trimmed/*.fastq.gz \
      ~/GA_project/data/rna/serum/trimmed/



