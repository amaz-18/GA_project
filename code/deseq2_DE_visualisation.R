install.packages("BiocManager")
BiocManager::install("DESeq2")

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("EnhancedVolcano")


library(dplyr)
library(DESeq2)
library(EnhancedVolcano)
library(ggplot2)
library(ggrepel)


# load HTSeq count files
count_directory <- "C:/Users/sandi/Dropbox/UU_25/Masters 2027/SEMESTER_2/Genome Analysis/Project/counts"


files <- list.files(count_directory, pattern = "counts.txt$", full.names = TRUE)

count_list <- lapply(files, function(f) {
  df <- read.table(f, header = FALSE, col.names = c("ID", basename(f)))
  df
})

# merge all count files
counts <- Reduce(function(x, y) merge(x, y, by = "ID", all = TRUE), count_list)

# remove HTSeq summary rows
summary_rows <- c("__no_feature", "__ambiguous", "__too_low_aQual",
                  "__not_aligned", "__alignment_not_unique")

counts <- counts %>% filter(!ID %in% summary_rows)

# convert to matrix format
count_matrix <- counts
rownames(count_matrix) <- count_matrix$ID
count_matrix$ID <- NULL

# create metadata
sample_meta <- data.frame(
  sample = colnames(count_matrix),
  condition = c("control", "control", "control",
                "serum", "serum", "serum")
)

rownames(sample_meta) <- sample_meta$sample

# build DESeq2 object
dds <- DESeqDataSetFromMatrix(
  countData = count_matrix,
  colData = sample_meta,
  design = ~ condition
)

# run DESeq2
dds <- DESeq(dds)

# extract results
DE_results <- results(dds)

# cleaned prokka output for annotation
gff <- file.path(count_directory, "efaecium_clean.gff")

annotation <- read.table(
  gff,
  comment.char = "#",
  sep = "\t",
  header = FALSE,
  quote = "",
  fill = TRUE,
  stringsAsFactors = FALSE
)

# Keep only CDS features
annotation <- annotation[annotation$V3 == "CDS", ]

# Extract locus tag (ID)
annotation$ID <- sub(".*ID=([^;]+).*", "\\1", annotation$V9)

# get gene name if present, else use ID
annotation$gene_name <- ifelse(
  grepl("gene=", annotation$V9),
  sub(".*gene=([^;]+).*", "\\1", annotation$V9),
  annotation$ID
)

# get product
annotation$product <- ifelse(
  grepl("product=", annotation$V9),
  sub(".*product=([^;]+).*", "\\1", annotation$V9),
  NA
)

annotation <- annotation[, c("ID", "gene_name", "product")]

# set up dataframes
results_df <- as.data.frame(DE_results)
results_df$ID <- rownames(results_df)

# merge annotation to the dataframe

results_annotated  <- merge(
  results_df,
  annotation,
  by = "ID",
  all.x = TRUE
)

# save the deseq2 annotated results into table
write.table(
  results_annotated,
  file.path(count_directory, "deseq2_results_annotated.tsv"),
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)

# test if my result got ~28% DE genes, jus like the paper
sum(results_annotated$padj < 0.05, na.rm = TRUE) / nrow(results_annotated)

sum(results_annotated$padj < 0.05 & abs(results_annotated$log2FoldChange) > 1, na.rm = TRUE) / nrow(results_annotated)


# volcano plot 
EnhancedVolcano(
  results_annotated,
  lab = results_annotated$gene_name, 
  x = 'log2FoldChange',
  y = 'padj',
  pCutoff = 0.01,    # FDR<1%, high confidence
  FCcutoff = 1,
  title = 'Human serum vs Rich medium (control)',
  subtitle = 'DESeq2 differential expression',
  pointSize = 2.0,
  labSize = 3.5
)

# heatmap 
library(pheatmap)

# Get top 20
top_ids <- results_annotated[order(results_annotated$padj), ][1:20, "ID"]

# Extract normalized counts
norm_counts <- counts(dds, normalized = TRUE)
mat <- norm_counts[top_ids, ]

# Replace rownames (IDs) with gene names
gene_names <- results_annotated$gene_name[match(rownames(mat), results_annotated$ID)]
rownames(mat) <- gene_names

# Scale and plot
mat_scaled <- t(scale(t(mat)))

pheatmap(
  mat_scaled,
  cluster_rows = TRUE,
  cluster_cols = TRUE,
  show_rownames = TRUE,
  fontsize_row = 7,
  annotation_col = as.data.frame(colData(dds)[, "condition", drop = FALSE]),
  main = "Top 20 Differentially Expressed Genes"
)
