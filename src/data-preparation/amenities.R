# Clean amenities.R
## Subset only amenities column and store in amenities_df
amenities_df <- subset(listings_joined, select = c(amenities, id, listing_type))

## Split the amenities column into separate rows
amenities_df <- amenities_df %>% 
  separate_rows(amenities, sep = ",")

## Remove any leading/trailing white space and quotes from the amenities
amenities_df$amenities <- gsub("^\\s+|\\s+$|\"", "", amenities_df$amenities)

## Remove the square brackets
amenities_df$amenities <- str_replace_all(amenities_df$amenities, "\\[|\\]","")

## Remove the white spaces; - ; \ ; / ; +
amenities_df$amenities <- gsub(" ", "_", amenities_df$amenities)
amenities_df$amenities <- gsub("-", "_", amenities_df$amenities)
amenities_df$amenities <- gsub("\\\\", "", amenities_df$amenities)
amenities_df$amenities <- gsub("/", "", amenities_df$amenities)
amenities_df$amenities <- gsub(":", "_", amenities_df$amenities)
amenities_df$amenities <- gsub("+", "", amenities_df$amenities)
amenities_df$amenities <- str_replace_all(amenities_df$amenities, fixed("+"), "")
amenities_df$amenities <- str_replace_all(amenities_df$amenities, fixed("("), "")
amenities_df$amenities <- str_replace_all(amenities_df$amenities, fixed(")"), "")

# Create amenity_counts_(short/long)
## Count the frequency of each amenity
amenity_counts <- amenities_df %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

head(amenity_counts)

## Filter for short stays
amenity_counts_short <- amenities_df %>% 
  filter(listing_type == "short")

## Count the frequency of each amenity for short stays
amenity_counts_short <- amenity_counts_short %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

## Filter for long stays
amenity_counts_long <- amenities_df %>% 
  filter(listing_type == "long")

## Count the frequency of each amenity for long stays
amenity_counts_long <- amenity_counts_long %>% 
  group_by(amenities) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

## Join two df with counts
counts_long_short <- inner_join(amenity_counts_long, amenity_counts_short, by = c("amenities"), suffix = c("_long","_short"))

# Dataset: all amenities

## Create regression subset with all amenities
amenities <- counts_long_short$amenities

all_amenities <- amenities_df %>%
  filter(amenities %in% amenities)

## Numeric  
wide_df <- pivot_wider(all_amenities, 
                          id_cols = c("id", "listing_type"), 
                          names_from = "amenities", 
                          values_from = "amenities", 
                          values_fn = function(x) as.integer(length(x) > 0), 
                          values_fill = 0, 
                          names_prefix = "has_")


# Dataset: only first 100 amenities
## Filtering for the first 100 amenities
counts_long_short100 <- counts_long_short %>% slice(1:100)
common_amenities100 <- counts_long_short100$amenities

# Create regression subset with only largest 100 amenities
## Filter amenities of amenities_df such that only the first 100 of counts_long_short maintain
filtered_amenities_df100 <- amenities_df %>%
  filter(amenities %in% common_amenities100)

## From long to wide dataframe
wide_df100 <- pivot_wider(filtered_amenities_df100, 
                       id_cols = c("id", "listing_type"), 
                       names_from = "amenities", 
                       values_from = "amenities", 
                       values_fn = function(x) ifelse(length(x) > 0, "yes", "no"), 
                       values_fill = "no", 
                       names_prefix = "has_")

## Numeric instead of yes and no 
wide_df100 <- pivot_wider(filtered_amenities_df100, 
                       id_cols = c("id", "listing_type"), 
                       names_from = "amenities", 
                       values_from = "amenities", 
                       values_fn = function(x) as.integer(length(x) > 0), 
                       values_fill = 0, 
                       names_prefix = "has_")



# Create counts_100
counts_100 <-  counts_long_short %>% slice(1:100)

## Add a column for the proportion of listings with each amenity in the long category
counts_100 <- counts_100 %>%
  mutate(prop_long = count_long / (count_long + count_short))

## Add a column for the proportion of listings with each amenity in the short category
counts_100 <- counts_100 %>%
  mutate(prop_short = count_short / (count_long + count_short))

# Output of this R-file for regression
## wide_df
## counts_100


# Ignore below/don't remove pls :)
##short_count <- wide_df %>%  filter(listing_type == "short")  %>% count(has_Essentials)
##short_count
##short_count0 <- short_count %>% filter(has_Essentials == 0) 
##short_count0$n
##short_count1 <- short_count %>% filter(has_Essentials == 1) 
##short_count1$n
##short_proportion <- short_count0$n/sum(short_count1$n, short_count0$n)
##wide_df %>%  filter(listing_type == "long") %>% count(has_Essentials)

