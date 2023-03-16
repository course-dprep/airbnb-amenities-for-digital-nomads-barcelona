
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


#filter for counts that are 10 or greater
amenity_counts_long <- amenity_counts_long %>% 
  filter(count>=10)

amenity_counts_short <- amenity_counts_short %>% 
  filter(count>=10)

#join two df with counts
counts_long_short <- inner_join(amenity_counts_long, amenity_counts_short, by = c("amenities"), suffix = c("_long","_short"))



#from long to wide format
amenities_df$value <- "yes"

wide_amenities <- amenities_df%>% 
  pivot_wider(names_from = amenities, values_from = value)

amenities$value <- "yes"
wide_amenities_filled <- replace_na(wide_amenities, replace = list(NULL = "no"))
