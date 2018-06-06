library(readr)
# Ingest Bullshit

## Filenames
fname1 <- "data/AMI-barcode-shipment-collection-itemtype-duration.tab"
fname2 <- "data/incomplete_audio_shipent_cost.csv"

fname3 <- "data/audio-barcode-shipment-collection-itemtype-duration.tab"
fname4 <- "data/incomplete_audio_shipent_cost.csv"
fname5 <- "data/darkblue_audio.txt"
fname6 <- "data/ht_audio_files_mets_runtime.txt"
fname7 <- "data/movingimage-barcode-shipment-collection-itemtype-videostandard-duration.tab"
fname8 <- "data/htrepoalt_audio_mets_runtime.txt"


## Read data frames
df1 <- read_tsv(fname1)
colnames(df1) <- c("id", "bsdate", "title", "duration")
df2 <- read_csv(fname2)
df3 <- read_tsv(fname3)
df4 <- read_csv(fname4)
df5 <- read_tsv(fname5)
df6 <- read_tsv(fname6)
df7 <- read_tsv(fname7)
df8 <- read_tsv(fname8)

## Merge data frames

## Write to disk