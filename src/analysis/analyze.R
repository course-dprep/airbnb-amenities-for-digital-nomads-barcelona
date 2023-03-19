# load 
#load("./gen/analysis/input/data_cleaned.RData")

# Estimate model 1 
#m1 <- lm(V1 ~ V3 + V4,df_cleaned)

# Estimate model 2 
#m2 <- lm(V1 ~ V3 + V4 + V5 , df_cleaned)

# Save results
#save(m1,m2,file="./gen/analysis/output/model_results.RData")


# H0: count_long = count_short
# H1: count_long > count_short 

# long:  ; short: 3615
sum(length(wide_df$listing_type["short"]))
length(listings_long) + length(listings_short)

short_count <- wide_df %>%  filter(listing_type == "short")  %>% count(has_Essentials)
short_count
short_count0 <- short_count %>% filter(has_Essentials == 0) 
short_count0$n
short_count1 <- short_count %>% filter(has_Essentials == 1) 
short_count1$n
short_proportion <- short_count0$n/sum(short_count1$n, short_count0$n)

wide_df %>%  filter(listing_type == "long") %>% count(has_Essentials)

# regression for has_Essentials
summary(lm(has_Essentials ~ listing_type, wide_df))
summary(lm(has_Crib ~ listing_type, wide_df))


dep_vars <- names(wide_df[3:100])
names(wide_df)
wide_df
dep_vars

# Create an empty list to store the output
output_list <- list()

# Loop over the dependent variables and fit a linear regression model for each
for (dep_var in dep_vars) {
  formula <- paste(dep_var, "~ listing_type")
  model <- lm(formula, data = wide_df)
  output_list[[dep_var]] <- summary(model)
}

# Print the output list
print(output_list)
