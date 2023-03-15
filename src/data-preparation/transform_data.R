#load("./gen/data-preparation/src/data-preparation/calendar.csv.gz")
#load("./gen/data-preparation/src/data-preparation/listings.csv.gz")

# Calendar dataset: creating listings
## New column 0-1
calendar <- calendar %>% mutate(available1 = (as.numeric(!available)))

## Create a function to count consecutive ranges of 1

### Create a new column 'consecutive_count' and initialize it to zero
calendar$consecutive_count <- 0

### Find the start and end indices of consecutive ranges of 1's
start_indices <- which(diff(c(0, calendar$available1)) == 1)
end_indices <- which(diff(c(calendar$available1, 0)) == -1)

### Loop through each consecutive range and assign its length to the 'consecutive_count' column
for (i in seq_along(start_indices)) {
  calendar$consecutive_count[start_indices[i]:end_indices[i]] <- end_indices[i] - start_indices[i] + 1
}

## New dataframe with only listing_id's > 28
listings_long <- calendar %>% group_by(listing_id) %>% filter(consecutive_count >= 28)

## New dataframe with only listing_id's < 28 
listings_short <- calendar %>% anti_join(listings_long, by = "listing_id") %>% group_by(listing_id) %>% filter(consecutive_count < 28) 

## Only return unique listing_id's
listings_long <- unique(listings_long$listing_id)
listings_short <- unique(listings_short$listing_id)

## Check if length of listings_long + listings_short is similar to total listings
sum(length(listings_long), length(listings_short)) #6898
length(unique(calendar$listing_id)) #6898

## Format the new lists

### Create a tibble with the listings_long and listings_short
listing_type <- tibble(listing_id = c(listings_long, listings_short),
                   listing_type = c(rep("long", length(listings_long)),
                                    rep("short", length(listings_short))))

## creating a subset of important columns 
listings_sorted <- subset(listings_unsorted, select = c(id, name, neighbourhood, property_type, room_type, accommodates, bathrooms_text, bedrooms, beds, amenities, price, minimum_nights, maximum_nights))


# Download created csv files
write_csv(listing_type, "listing_type.csv")
write_csv(listings_sorted, "listings_sorted.csv")
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes

