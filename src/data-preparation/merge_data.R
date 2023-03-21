#load("$(OUTPUT)/listing_type.csv"/gen/data-preparation/data-preparation/output/listing_type.csv")
#load("./gen/data-preparation/src/data-preparation/listings_sorted.csv")
library(dplyr)
library(readr)

listing_type <- read_csv('../../gen/data-preparation/output/listing_type.csv')
listings_sorted <- read_csv('../../gen/data-preparation/output/listings_sorted.csv')

## Join the listings tibble with listings_sorted to add the listing_type column

listings_joined <- inner_join(listings_sorted, listing_type, by = c("id" = "listing_id"))

## Save dataframem
# assume listings_sorted is a dataframe
write_csv(listings_joined, "../../gen/data-preparation/output/listings_joined.csv")


