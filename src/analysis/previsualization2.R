# Load packages
library(tidyverse)
library(readr)
library(stringr)

# Load data
df_significant_amenities_100_2 <- read_csv("../../gen/analysis/output/df_significant_amenities_100_2.csv")
wide_df2_100 <- read_csv("../../gen/analysis/input/wide_df2_100.csv")
counts2_100 <- read_csv("../../gen/analysis/input/counts2_100.csv")

# List of significant amenities without prefix
significant_amenities2_100_cleaned <- lapply(df_significant_amenities_100_2$significant_amenities_100_2, function(x) gsub("has_", "", x))

# Select only significant amenities in counts2_100
counts2 <- counts2_100 %>% filter(amenities %in% significant_amenities2_100_cleaned)

# Store data
write_csv(counts2, "../../gen/analysis/input/counts2.csv")