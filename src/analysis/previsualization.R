# Load packages

# Load data
df_significant_amenities_100 <- read_csv("../../gen/analysis/output/df_significant_amenities_100")
wide_df100 <- read_csv("../../gen/analysis/input/wide_df100.csv")
counts_100 <- read_csv("../../gen/analysis/input/counts_100.csv")

# Create new dataframe
#wide_df_significant <- wide_df100 %>% select(c(id, listing_type, df_significant_amenities_100))
#wide_df_significant %>% group_by(wide_df_significant[3:22]) %>% filter(listing_type == "long") %>% summarise(long_count = sum())

# List of significant amenities without prefix
significant_amenities_100_cleaned <- lapply(df_significant_amenities_100$significant_amenities_100, function(x) gsub("has_", "", x))

# Select only significant amenities in counts_100
counts <- counts_100 %>% filter(amenities %in% significant_amenities_100_cleaned)

# Store data
write_csv(counts, "../../gen/analysis/input/counts.csv")