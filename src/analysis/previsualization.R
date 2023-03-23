# Libraries

# Load data
df_significant_amenities_100 <- read_csv("../../gen/analysis/output/df_significant_amenities_100")
wide_df100 <- read_csv("../../gen/analysis/input/wide_df100.csv")
counts_100 <- read_csv("../../gen/analysis/input/counts_100.csv")

# Create new dataframe
#wide_df_significant <- wide_df100 %>% select(c(id, listing_type, significant_amenities_100))
#wide_df_significant %>% group_by(wide_df_significant[3:22]) %>% filter(listing_type == "long") %>% summarise(long_count = sum())


# List of significant amenities without prefix
significant_amenities_100_cleaned <- lapply(significant_amenities_100, function(x) gsub("has_", "", x))


# Ignore below/don't remove pls :)
short_count <- wide_df %>%  filter(listing_type == "short")  %>% count(significant_amenities_100_cleaned[1])
short_count
short_count0 <- short_count %>% filter(has_Essentials == 0) 
short_count0$n
short_count1 <- short_count %>% filter(has_Essentials == 1) 
short_count1$n
short_proportion <- short_count0$n/sum(short_count1$n, short_count0$n)
wide_df %>%  filter(listing_type == "long") %>% count(has_Essentials)

df <- counts_100 %>% subset(amenities == c("Essentials")) # change variable names 