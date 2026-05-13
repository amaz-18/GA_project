library(dplyr)
library(stringr)

library(DESeq2)


# Read HTSeq count files

path <- "/home/asma7174/GA_project/06_RNA_seq/Expression"

files <- list.files(path, pattern = "counts.txt$", full.names = TRUE)

count_list <- lapply(files, function(f) {
  df <- read.table(f, header = FALSE, col.names = c("gene", basename(f)))
  df
})

counts <- count_list[[1]]
for (i in 2:length(count_list)) {
  counts <- merge(counts, count_list[[i]], by = "gene", all = TRUE)
}

# Remove HTSeq summary rows
summary_rows <- c("__no_feature", "__ambiguous", "__too_low_aQual",
                  "__not_aligned", "__alignment_not_unique")

counts <- counts %>% filter(!gene %in% summary_rows)


# Sample metadata

sample_info <- data.frame(
  sample = colnames(counts)[-1],
  condition = c("control", "control", "control",
                "serum", "serum", "serum")
)


# Run DESeq2 analysis, count matrix

count_matrix <- counts
rownames(count_matrix) <- count_matrix$gene
count_matrix$gene <- NULL

dds <- DESeqDataSetFromMatrix(
  countData = count_matrix,
  colData = sample_info,
  design = ~ condition
)

dds <- DESeq(dds)

res <- results(dds)

write.table(as.data.frame(res),
            "/home/asma7174/GA_project/06_RNA_seq/Expression/deseq2_results_all.txt",
            sep = "\t",
            quote = FALSE)


# Add annotation from cleaned Prokka GFF

gff <- "/home/asma7174/GA_project/04_annotation/prokka_output/efaecium_clean.gff"

annotation <- read.table(
  gff,
  comment.char = "#",
  sep = "\t",
  header = FALSE,
  quote = "",
  fill = TRUE,
  stringsAsFactors = FALSE
)

# Keep only CDS rows
annotation <- annotation[annotation$V3 == "CDS", ]

# Extract ID, gene_name, product
annotation$ID <- sub(".*ID=([^;]+).*", "\\1", annotation$V9)
annotation$gene_name <- sub(".*gene=([^;]+).*", "\\1", annotation$V9)
annotation$product <- sub(".*product=([^;]+).*", "\\1", annotation$V9)

annotation <- annotation[, c("ID", "gene_name", "product")]

res_df <- as.data.frame(res)
res_df$ID <- rownames(res_df)

# Merge annotation with deseq2 results
res_annot <- merge(res_df, annotation, by = "ID", all.x = TRUE)

write.table(res_annot,
            "/home/asma7174/GA_project/06_RNA_seq/Expression/deseq2_results_annotated.tsv",
            sep = "\t",
            quote = FALSE,
            row.names = FALSE)
