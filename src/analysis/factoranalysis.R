# Load packages
library(psych)

# Load data
read_csv("../../gen/analysis/input/df_factor_analysis.csv")

from long-to-wide
wide_df_1 <- wide_df %>% 
  subset()


df_factors <- df_factor_analysis[, c("count_short", "count_long")]
fa_obj <- fa(df_factors, nfactors = 1, rotate = "varimax")

print(fa_obj, cut = 0.3, sort = TRUE, digits = 2)


#PCA
amenities_matrix <- as.matrix(wide_df)
amenities_matrix_numeric <- apply(amenities_matrix, 2, as.numeric)
amenities_matrix_scaled <- scale(amenities_matrix_numeric)

head(wide_df)

library(dplyr)

# assuming your original dataframe is called "airbnb_listings"
amenities_counts <- wide_df %>% 
  group_by(listing_type) %>% # group by the listing type
  summarize(across(starts_with("has_"), sum)) # get the sum of each column starting with "amenity_"

# the resulting dataframe "amenities_counts" will have two rows (short and long listing types) 
# and each column will represent a specific amenity with the count of its presence for each listing type.

# Store data