# Load packages
library(dplyr)

# Load data
counts_long_short <- read_csv("../../gen/data-preparation/output/counts_long_short.csv")

# subset for short-term listings
df_short <- subset(wide_df, listing_type == "short")

# subset for long-term listings
df_long <- subset(wide_df, listing_type == "long")
head(df_long)

#remove columns 
df_short <- df_short[, -c(1, 2)]
df_long <- df_long[, -c(1, 2)]

# remove rows with missing values
df_short <- na.omit(df_short)
# check for columns with only NAs
library(dplyr)

# remove columns with all NAs
df_short <- select(df_short, -which(colSums(is.na(df_short)) == nrow(df_short)))

# run factor analysis
fa_short <- psych::fa(df_short, nfactors = 1000)

# run factor analysis
fa_short <- psych::fa(df_short, nfactors = 3)


# factor analysis for long-term listings
fa_long <- psych::fa(df_long, nfactors = 3)

# subset for short-term listings
#df_short <- df %>% 
#   filter(listing_type == "short")
#   filter(listing_type == "short")
# 
# # subset for long-term listings
# df_long <- subset(df, listing_type == "long")
# 
counts_long_short <- counts_long_short %>% 
  mutate(prop_long = count_long / (count_long + count_short))

counts_long_short <- counts_long_short %>% 
  mutate(prop_short = count_short / (count_long + count_short))

#from long to wide pivot
head(counts_long_short)
wide_df100 <- pivot_wider(counts_long_short, 
                          id_cols = c("prop_long", "prop_short"), 
                          names_from = "amenities", 
                          values_from = "amenities")

# # probabilities long
# df_factor_analysis <- df_factor_analysis %>%
#   mutate(prop_long = count_long / (count_long + count_short))
# 
# # probabilities short
# df_factor_analysis <- df_factor_analysis %>% 
#   mutate(prop_short = count_short / (count_long + count_short))
# 
# #write csv
# write_csv(df_factor_analysis, "../../gen/analysis/input/df_factor_analysis.csv")

head(wide_df)

wide_df_counts <- wide_df %>% 
  summarize(count = n())


#dataset for factor analysis
amenity_counts_short <- amenities_df %>% 
  filter(listing_type == "short")

## Count the frequency of each amenity for short stays
amenity_counts_short <- amenity_counts_short %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

## Filter for long stays
amenity_counts_long <- amenities_df %>% 
  filter(listing_type == "long")

## Count the frequency of each amenity for long stays
amenity_counts_long <- amenity_counts_long %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

## Join two df with counts
counts_long_short <- inner_join(amenity_counts_long, amenity_counts_short, by = c("amenities"), suffix = c("_long","_short"))

# probabilities
counts_long_short <- counts_long_short %>%
  mutate(prop_long = count_long / (count_long + count_short))

counts_long_short <- counts_long_short %>%
  mutate(prop_short = count_short / (count_long + count_short))

df_factors <- counts_long_short[, c("amenities", "prop_long", "prop_short")]

# dataframe for long
df_factors_long <- counts_long_short[, c("amenities", "prop_long")]

# dataframe for short 
df_factors_short <- counts_long_short[, c("amenities", "prop_short")]

library(psych)

# Assuming your dataset is called "amenities_data"
# Convert the "amenities" column to a rownames
rownames(df_factors_short) <- df_factors_short$amenities
df_factors_short$amenities <- NULL

# Perform factor analysis
fa <- fa(df_factors_short, nfactors = 2, rotate = "varimax")

# View the results
print(fa, sort = TRUE)

# Store data


                          