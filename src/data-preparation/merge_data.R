# Load packages
library(dplyr)
library(readr)

# Load data
listing_type <- read_csv('../../gen/data-preparation/output/listing_type.csv')
listings_sorted <- read_csv('../../gen/data-preparation/output/listings_sorted.csv')

# Join the listings tibble with listings_sorted to add the listing_type column
listings_joined <- inner_join(listings_sorted, listing_type, by = c("id" = "listing_id"))
listings_joined <- data.frame(listings_joined)

# Store data
write_csv(listings_joined, "../../gen/data-preparation/output/listings_joined.csv")


