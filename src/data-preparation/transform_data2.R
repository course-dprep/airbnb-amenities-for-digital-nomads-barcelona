# Load packages
library(tidyverse)
library(dplyr)
library(tidyr)
library(stringr)
library(tibble)
library(magrittr)
library(readr)

# Load data
calendar_updated <- read_csv("../../gen/data-preparation/input/calendar_updated.csv.gz")
listings_unsorted <- read_csv("../../data/dataset2.csv")

# New dataframe with only listing_id's > 56
listings_long2 <- calendar_updated %>% group_by(listing_id) %>% filter(consecutive_count >= 56)

# New dataframe with only listing_id's < 56 
listings_short2 <- calendar_updated %>% anti_join(listings_long2, by = "listing_id") %>% group_by(listing_id) %>% filter(consecutive_count < 56) 

## Only return unique listing_id's
listings_long2 <- unique(listings_long2$listing_id)
listings_short2 <- unique(listings_short2$listing_id)

## Check if length of listings_long + listings_short is similar to total listings
sum(length(listings_long2), length(listings_short2)) 
length(unique(calendar_updated$listing_id)) 

# Format the new lists

## Create a tibble with the listings_long and listings_short
listing_type2 <- tibble(listing_id = c(listings_long2, listings_short2),
                         listing_type = c(rep("long", length(listings_long2)),
                                            rep("short", length(listings_short2))))

## creating a subset of important columns 
listings_sorted2 <- subset(listings_unsorted, select = c(id, name, neighbourhood, property_type, room_type, accommodates, bathrooms_text, bedrooms, beds, amenities, price, minimum_nights, maximum_nights))


# Store data
write_csv(listing_type2, "../../gen/data-preparation/output/listing_type2.csv")
write_csv(listings_sorted2, "../../gen/data-preparation/output/listings_sorted2.csv") 


