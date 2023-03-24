# Load packages
library(tidyverse)
library(readr)
library(stringr)
library(lubridate)


# Load data
listings_joined2 <- read_csv('../../gen/data-preparation/output/listings_joined2.csv')

# Missing values
## Beds: remove 273 NA's
listings_joined2 <- listings_joined2 %>% filter(!is.na(listings_joined2$beds))

## Bedrooms: NA's -> 0 (studio)
listings_joined2 <- listings_joined2 %>% 
  mutate(bedrooms = ifelse(is.na(bedrooms), 0, bedrooms))

# Bathrooms: remove 9 NA's
listings_joined2 <- listings_joined2 %>% filter(!is.na(listings_joined2$bathrooms_text))

# Check NA's for characters


# Mutate columns
## Bathrooms
### private / shared
listings_joined2 <- listings_joined2 %>% 
  mutate(bathroom_shared = ifelse(grepl("shared", bathrooms_text, ignore.case = TRUE), "shared", "private"))

## room_type
### private / shared
listings_joined2 <- listings_joined2 %>% 
  mutate(room_shared = ifelse(grepl("shared", room_type, ignore.case = TRUE), "shared", "private"))

##strip text
listings_joined2 <- listings_joined2 %>% 
  mutate(baths_numeric = str_extract(listings_joined2$bathrooms_text, "\\d+\\.?\\d*"))  


#Character to numeric + round
listings_joined2 <- listings_joined2 %>% 
  mutate(baths_numeric2 = round(as.numeric(baths_numeric), 0)) # or as.double(my_col)

#Changing the 50 NA's to value 1
listings_joined2_cleaned <- listings_joined2 %>% 
  mutate(baths_numeric2 = ifelse(is.na(baths_numeric2), 1, baths_numeric2))

listings_joined2_cleaned <- data.frame(listings_joined2_cleaned)

# Store data
write_csv(listings_joined2_cleaned, '../../gen/data-preparation/output/listings_joined2_cleaned.csv')
