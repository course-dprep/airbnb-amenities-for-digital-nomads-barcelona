# Load packages
library(tidyverse)
library(readr)
library(dplyr)
library(stringr)
library(stringi)
library(magrittr)

# Load data
listings_joined2_cleaned <- read_csv('../../gen/data-preparation/output/listings_joined3_cleaned.csv')

# Clean amenities.R

## Subset only amenities column and store in amenities_df2
amenities_df2 <- subset(listings_joined2_cleaned, select = c(amenities, id, listing_type))

## Split the amenities column into separate rows
amenities_df2 <- amenities_df2 %>% 
  separate_rows(amenities, sep = ",")

## Remove any leading/trailing white space and quotes from the amenities
amenities_df2$amenities <- gsub("^\\s+|\\s+$|\"", "", amenities_df2$amenities)

## Remove the square brackets
amenities_df2$amenities <- str_replace_all(amenities_df2$amenities, "\\[|\\]","")

## Remove the white spaces; - ; \ ; / ; +
amenities_df2$amenities <- gsub(" ", "_", amenities_df2$amenities)
amenities_df2$amenities <- gsub("-", "_", amenities_df2$amenities)
amenities_df2$amenities <- gsub("\\\\", "", amenities_df2$amenities)
amenities_df2$amenities <- gsub("/", "", amenities_df2$amenities)
amenities_df2$amenities <- gsub(":", "_", amenities_df2$amenities)
amenities_df2$amenities <- gsub("+", "", amenities_df2$amenities)
amenities_df2$amenities <- str_replace_all(amenities_df2$amenities, fixed("+"), "")
amenities_df2$amenities <- str_replace_all(amenities_df2$amenities, fixed("("), "")
amenities_df2$amenities <- str_replace_all(amenities_df2$amenities, fixed(")"), "")

# Create amenity_counts2_(short/long)
## Count the frequency of each amenity
amenity_counts2 <- amenities_df2 %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

head(amenity_counts2)

## Filter for short stays
amenity_counts2_short <- amenities_df2 %>% 
  filter(listing_type == "short")

## Count the frequency of each amenity for short stays
amenity_counts2_short <- amenity_counts2_short %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

## Filter for long stays
amenity_counts2_long <- amenities_df2 %>% 
  filter(listing_type == "long")

## Count the frequency of each amenity for long stays
amenity_counts2_long <- amenity_counts2_long %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

## Join two df with counts
counts_long_short2 <- inner_join(amenity_counts2_long, amenity_counts2_short, by = c("amenities"), suffix = c("_long","_short"))
write_csv(counts_long_short2, "../../gen/analysis/input/counts_long_short2.csv")

## Create regression subset with all amenities
amenities <- counts_long_short2$amenities

all_amenities <- amenities_df2 %>%
  filter(amenities %in% amenities)

## Numeric  
wide_df <- pivot_wider(all_amenities, 
                       id_cols = c("id", "listing_type"), 
                       names_from = "amenities", 
                       values_from = "amenities", 
                       values_fn = function(x) as.integer(length(x) > 0), 
                       values_fill = 0
                       ,names_prefix = "has_")

write_csv(wide_df, "../../gen/analysis/input/wide_df2.csv")


# Dataset: only first 100 amenities
## Filtering for the first 100 amenities
counts_long_short2_100 <- counts_long_short2 %>% slice(1:100)
common_amenities2_100 <- counts_long_short2_100$amenities

# Create regression subset with only largest 100 amenities
## Filter amenities of amenities_df2 such that only the first 100 of counts_long_short2 maintain
filtered_amenities_df2_100 <- amenities_df2 %>%
  filter(amenities %in% common_amenities2_100)

## From long to wide dataframe
wide_df2_100 <- pivot_wider(filtered_amenities_df2_100, 
                          id_cols = c("id", "listing_type"), 
                          names_from = "amenities", 
                          values_from = "amenities", 
                          values_fn = function(x) ifelse(length(x) > 0, "yes", "no"), 
                          values_fill = "no", 
                          names_prefix = "has_")

## Numeric instead of yes and no 
wide_df2_100 <- pivot_wider(filtered_amenities_df2_100, 
                          id_cols = c("id", "listing_type"), 
                          names_from = "amenities", 
                          values_from = "amenities", 
                          values_fn = function(x) as.integer(length(x) > 0), 
                          values_fill = 0, 
                          names_prefix = "has_")

# Create counts2_100
counts2_100 <-  counts_long_short2 %>% slice(1:100)

# Count total number of long and short listings
long_listings2 <- wide_df2_100 %>% filter(listing_type == "long") 
short_listings2 <- wide_df2_100 %>% filter(listing_type == "short") 

## Add a column for the proportion of listings with each amenity in the long category
counts2_100 <- counts2_100 %>%
  mutate(prop_long = count_long / nrow(long_listings2))

## Add a column for the proportion of listings with each amenity in the short category
counts2_100 <- counts2_100 %>%
  mutate(prop_short = count_short / nrow(short_listings2))

# Store data
write_csv(wide_df2_100, "../../gen/analysis/input/wide_df2_100.csv")
write_csv(counts2_100, "../../gen/analysis/input/counts2_100.csv")

