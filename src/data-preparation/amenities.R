# Load packages
library(tidyverse)
library(readr)
library(dplyr)
library(stringr)
library(stringi)
library(magrittr)

# Load data
listings_joined_cleaned <- read_csv('../../gen/data-preparation/output/listings_joined_cleaned.csv')

# Clean amenities.R

## Subset only amenities column and store in amenities_df
amenities_df <- subset(listings_joined_cleaned, select = c(amenities, id, listing_type))

## Split the amenities column into separate rows
amenities_df <- amenities_df %>% 
  separate_rows(amenities, sep = ",")

## Remove any leading/trailing white space and quotes from the amenities
amenities_df$amenities <- gsub("^\\s+|\\s+$|\"", "", amenities_df$amenities)

## Remove the square brackets
amenities_df$amenities <- str_replace_all(amenities_df$amenities, "\\[|\\]","")

## Remove the white spaces; - ; \ ; / ; +
amenities_df$amenities <- gsub(" ", "_", amenities_df$amenities)
amenities_df$amenities <- gsub("-", "_", amenities_df$amenities)
amenities_df$amenities <- gsub("\\\\", "", amenities_df$amenities)
amenities_df$amenities <- gsub("/", "", amenities_df$amenities)
amenities_df$amenities <- gsub(":", "_", amenities_df$amenities)
amenities_df$amenities <- gsub("+", "", amenities_df$amenities)
amenities_df$amenities <- str_replace_all(amenities_df$amenities, fixed("+"), "")
amenities_df$amenities <- str_replace_all(amenities_df$amenities, fixed("("), "")
amenities_df$amenities <- str_replace_all(amenities_df$amenities, fixed(")"), "")

# Create amenity_counts_(short/long)
## Count the frequency of each amenity
amenity_counts <- amenities_df %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

head(amenity_counts)

## Filter for short stays
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
write_csv(counts_long_short, "../../gen/analysis/input/counts_long_short.csv")

## Create regression subset with all amenities
amenities <- counts_long_short$amenities

all_amenities <- amenities_df %>%
  filter(amenities %in% amenities)

## Numeric  
wide_df <- pivot_wider(all_amenities, 
                       id_cols = c("id", "listing_type"), 
                       names_from = "amenities", 
                       values_from = "amenities", 
                       values_fn = function(x) as.integer(length(x) > 0), 
                       values_fill = 0
                       ,names_prefix = "has_")

write_csv(wide_df, "../../gen/analysis/input/wide_df.csv")

# Dataset: only first 100 amenities
## Filtering for the first 100 amenities
counts_long_short100 <- counts_long_short %>% slice(1:100)
common_amenities100 <- counts_long_short100$amenities

# Create regression subset with only largest 100 amenities
## Filter amenities of amenities_df such that only the first 100 of counts_long_short maintain
filtered_amenities_df100 <- amenities_df %>%
  filter(amenities %in% common_amenities100)

## From long to wide dataframe
wide_df100 <- pivot_wider(filtered_amenities_df100, 
                          id_cols = c("id", "listing_type"), 
                          names_from = "amenities", 
                          values_from = "amenities", 
                          values_fn = function(x) ifelse(length(x) > 0, "yes", "no"), 
                          values_fill = "no", 
                          names_prefix = "has_")

## Numeric instead of yes and no 
wide_df100 <- pivot_wider(filtered_amenities_df100, 
                          id_cols = c("id", "listing_type"), 
                          names_from = "amenities", 
                          values_from = "amenities", 
                          values_fn = function(x) as.integer(length(x) > 0), 
                          values_fill = 0, 
                          names_prefix = "has_")

# Create counts_100
counts_100 <-  counts_long_short %>% slice(1:100)

# Count total number of long and short listings
long_listings <- wide_df100 %>% filter(listing_type == "long") 
short_listings <- wide_df100 %>% filter(listing_type == "short") 

## Add a column for the proportion of listings with each amenity in the long category
counts_100 <- counts_100 %>%
  mutate(prop_long = count_long / nrow(long_listings))

## Add a column for the proportion of listings with each amenity in the short category
counts_100 <- counts_100 %>%
  mutate(prop_short = count_short / nrow(short_listings))

# Store data
write_csv(wide_df100, "../../gen/analysis/input/wide_df100.csv")
write_csv(counts_100, "../../gen/analysis/input/counts_100.csv")

