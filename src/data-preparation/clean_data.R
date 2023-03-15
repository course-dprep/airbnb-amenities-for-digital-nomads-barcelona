# Load merged data 
#load("./gen/data-preparation/src/data-preparation/listings_joined.csv")

library(dplyr)

# Missing values
## Beds: remove 273 NA's
listings_joined <- listings_joined %>% filter(!is.na(listings_joined$beds))

## Bedrooms: NA's -> 0 (studio)
listings_joined <- listings_joined %>% 
  mutate(bedrooms = ifelse(is.na(bedrooms), 0, bedrooms))

# Bathrooms: remove 9 NA's
listings_joined <- listings_joined %>% filter(!is.na(listings_joined$bathrooms_text))
  
# Check NA's for characters
  
  
# Mutate columns
## Bathrooms
### private / shared
listings_joined <- listings_joined %>% 
  mutate(bathroom_shared = ifelse(grepl("shared", bathrooms_text, ignore.case = TRUE), "shared", "private"))

## room_type
### private / shared
listings_joined <- listings_joined %>% 
  mutate(room_shared = ifelse(grepl("shared", room_type, ignore.case = TRUE), "shared", "private"))

View(listings_joined)

##strip text
listings_joined <- listings_joined %>% 
  mutate(baths_numeric = str_extract(listings_joined$bathrooms_text, "\\d+\\.?\\d*")) %>% 


#Character to numeric + round
listings_joined <- listings_joined %>% 
  mutate(baths_numeric2 = round(as.numeric(baths_numeric), 0)) # or as.double(my_col)

#Changing the 50 NA's to value 1
listings_joined <- listings_joined %>% 
  mutate(baths_numeric2 = ifelse(is.na(baths_numeric2), 1, baths_numeric2))

## Amenities



# Save cleaned data
save(df_cleaned,file="./gen/data-preparation/output/data_cleaned.RData")
