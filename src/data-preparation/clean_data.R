# Load packages
library(tidyverse)
library(readr)
library(stringr)
library(lubridate)

# Load data
listings_joined <- read_csv('../../gen/data-preparation/output/listings_joined.csv')

# Missing values
## Beds: remove NA's
listings_joined <- listings_joined %>% filter(!is.na(listings_joined$beds))

## Bedrooms: NA's -> 0 (studio)
listings_joined <- listings_joined %>% 
  mutate(bedrooms = ifelse(is.na(bedrooms), 0, bedrooms))

## Bathrooms: remove NA's
listings_joined <- listings_joined %>% filter(!is.na(listings_joined$bathrooms_text))
  

# Mutate columns
## Bathrooms
### private / shared
listings_joined <- listings_joined %>% 
  mutate(bathroom_shared = ifelse(grepl("shared", bathrooms_text, ignore.case = TRUE), "shared", "private"))

## room_type
### private / shared
listings_joined <- listings_joined %>% 
  mutate(room_shared = ifelse(grepl("shared", room_type, ignore.case = TRUE), "shared", "private"))

## Strip text
listings_joined <- listings_joined %>% 
  mutate(baths_numeric = str_extract(listings_joined$bathrooms_text, "\\d+\\.?\\d*"))  

## Character to numeric + round
listings_joined <- listings_joined %>% 
  mutate(baths_numeric2 = round(as.numeric(baths_numeric), 0)) # or as.double(my_col)

## Changing the NA's to value 1
listings_joined_cleaned <- listings_joined %>% 
  mutate(baths_numeric2 = ifelse(is.na(baths_numeric2), 1, baths_numeric2))

# Create dataframe listings_joined_cleaned
listings_joined_cleaned <- data.frame(listings_joined_cleaned)

# Store data
write_csv(listings_joined_cleaned, '../../gen/data-preparation/output/listings_joined_cleaned.csv')
