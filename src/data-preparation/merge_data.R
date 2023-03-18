#load("./gen/data-preparation/src/data-preparation/listing_type.csv")
#load("./gen/data-preparation/src/data-preparation/listings_sorted.csv")

## Join the listings tibble with listings_sorted to add the listing_type column

listings_joined <- inner_join(listings_sorted, listing_type, by = c("id" = "listing_id"))

## Save dataframe
# assume listings_sorted is a dataframe
write.csv(listings_joined, "listings_joined.csv", row.names = FALSE)


