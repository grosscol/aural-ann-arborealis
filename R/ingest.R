library(readr)
library(dplyr)
# Ingest Bullshit

## Filenames
fname1 <- "data/AMI-barcode-shipment-collection-itemtype-duration.tab"
fname2 <- "data/incomplete_audio_shipent_cost_sheet01.csv"

fname3 <- "data/incomplete_audio_shipent_cost_sheet02.csv"
fname4 <- "data/audio-barcode-shipment-collection-itemtype-duration.tab"
fname5 <- "data/darkblue_audio.txt"
fname6 <- "data/ht_audio_files_mets_runtime.txt"
fname7 <- "data/movingimage-barcode-shipment-collection-itemtype-videostandard-duration.tab"
fname8 <- "data/htrepoalt_audio_mets_runtime.txt"


## Read data frames
df1_cols <- c("barcode", "shipment", "title", "medium", "duration")
df1 <- read_tsv(fname1, col_names = df1_cols, col_types = "ccccc")

df2 <- read_csv(fname2, col_types = "ccccd___")
df3 <- read_csv(fname3, col_types = "cciccc")
df4_cols <- c("barcode", "shipment", "title", "medium", "duration")
df4 <- read_tsv(fname4, col_names = df4_cols, col_types = "ccccc")
df5 <- read_tsv(fname5, col_types = "ccdc")

df6 <- read_tsv(fname6, col_types = "i_ccc")

df7_cols <- c("barcode", "shipment", "title", "medium", "duration", "format")
df7 <- read_tsv(fname7, col_names = df7_cols, col_types = "ccccc_c")
df8 <- read_tsv(fname8, col_types = "ccicc")

## Merge data frames
barcode_filename_sets <- list(df5, df6, df8)
barcode_shipment_sets <- list(df1, df2, df4, df7)
shipment_only_data <- df3

barcode_filename_consolidated <- barcode_filename_sets %>% 
  Reduce(function(lhs, rhs) { full_join(lhs, rhs, by = c("barcode", "filename")) }, .)

barcode_shipment_consolidated <- barcode_shipment_sets %>%
  Reduce(function(lhs, rhs) { full_join(lhs, rhs, by = c("shipment", "barcode")) }, .) %>% unique

duplicate_indices <- which(duplicated(barcode_shipment_consolidated[, c("barcode", "shipment")]))
duplicate_df <- unique(barcode_shipment_consolidated[duplicate_indices, c("barcode", "shipment")])
conflicting_df <- semi_join(barcode_shipment_consolidated, duplicate_df, by = c("barcode", "shipment"))

## Write to disk