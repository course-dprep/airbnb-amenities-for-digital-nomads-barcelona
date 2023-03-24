# Load packages
library(dplyr)
library(readr)

# Load data
listing_type2 <- read_csv('../../gen/data-preparation/output/listing_type2.csv')
listings_sorted2 <- read_csv('../../gen/data-preparation/output/listings_sorted2.csv')

# Join the listings tibble with listings_sorted to add the listing_type column
listings_joined2 <- inner_join(listings_sorted2, listing_type2, by = c("id" = "listing_id"))
listings_joined2 <- data.frame(listings_joined2)

# Store data
write_csv(listings_joined2, "../../gen/data-preparation/output/listings_joined2.csv")


