amenities_df <- listings_joined

#subset only amenities column
amenities_df <- subset(amenities_df, select = c(amenities, id, listing_type))

# Split the amenities column into separate rows
amenities_df <- amenities_df %>% 
  separate_rows(amenities, sep = ",")

# Remove any leading/trailing white space and quotes from the amenities
amenities_df$amenities <- gsub("^\\s+|\\s+$|\"", "", amenities_df$amenities)

# Remove the square brackets
amenities_df$amenities <- str_replace_all(amenities_df$amenities, "\\[|\\]","")


# Count the frequency of each amenity
amenity_counts <- amenities_df %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

head(amenity_counts)

#filter for short stays
amenity_counts_short <- amenities_df %>% 
  filter(listing_type == "short")

#count the frequency of each amenity for short stays
amenity_counts_short <- amenity_counts_short %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

head(amenity_counts_short)

#filter for long stays
amenity_counts_long <- amenities_df %>% 
  filter(listing_type == "long")

#count the frequency of each amenity for long stays
amenity_counts_long <- amenity_counts_long %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))
head(amenity_counts_long)


#join two df with counts
counts_long_short <- inner_join(amenity_counts_long, amenity_counts_short, by = c("amenities"), suffix = c("_long","_short"))

#filtering for the first 100 amenities
counts_long_short <- counts_long_short %>% slice(1:100)

common_amenities <- counts_long_short$amenities

#filter amenities of amenities_df such that only the first 100 of counts_long_short maintain
filtered_amenities_df <- amenities_df %>%
  filter(amenities %in% common_amenities)

#from long to wide dataframe
wide_df <- pivot_wider(filtered_amenities_df, 
                       id_cols = c("id", "listing_type"), 
                       names_from = "amenities", 
                       values_from = "amenities", 
                       values_fn = function(x) ifelse(length(x) > 0, "yes", "no"), 
                       values_fill = "no", 
                       names_prefix = "has_")
