# Load packages
library(tidyverse)
library(readr)
library(stringr)

# Load data
df_significant_amenities_100 <- read_csv("../../gen/analysis/output/df_significant_amenities_100.csv")
wide_df100 <- read_csv("../../gen/analysis/input/wide_df100.csv")
counts_100 <- read_csv("../../gen/analysis/input/counts_100.csv")

# List of significant amenities without prefix
significant_amenities_100_cleaned <- lapply(df_significant_amenities_100$significant_amenities_100, function(x) gsub("has_", "", x))

# Select only significant amenities in counts_100
counts <- counts_100 %>% filter(amenities %in% significant_amenities_100_cleaned)

# Store data
write_csv(counts, "../../gen/analysis/input/counts.csv")