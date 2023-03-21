counts_long_short <- read_csv("../../gen/data-preparation/output/counts_long_short.csv")

library(dplyr)

# loading in data
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
fa_short <- psych::fa(df_short, nfactors = 3)

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
# 
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