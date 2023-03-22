
# required packages
library(tidyverse)
library(dplyr)
library(tidyr)

# loading in the data
wide_df100 <- read_csv("../../gen/analysis/input/wide_df100.csv")

# FOR FIRST 100 AMENITIES
# Create list of dependent variables, i.e. all 100 amenities
dep_vars <- names(wide_df100[3:102])

# Loop over each dependent variable and run regression
for (dep_var in dep_vars) {
  str <- paste(dep_var, "~ listing_type")  
  model <- lm(str, wide_df100)
  print(summary(model))
}


# Create a list with only significant amenities
## empty list
significant_amenities_100 <- c()

## loop as before
for (dep_var in dep_vars) {
  str <- paste(dep_var, "~ listing_type")  
  model <- lm(str, wide_df100)
  summary <- summary(model)
  
  ## check for which amenities p < 0.05 (significant)
  if (summary$coefficients[2, 4] < 0.05) {
    ### if effect is negative
    if (summary$coefficients[2, 1] < 0) {
      significant_amenities_100 <- c(significant_amenities_100, dep_var)
    }
  }
}


# Amenities significantly more available in long listings
print(significant_amenities_100)
length(significant_amenities_100)


# Create dataframe 
significant_amenities_negative100 <- data.frame(significant_amenities_100)

# Save as lists
write_csv(significant_amenities_negative100, "../../gen/analysis/output/significant_amenities_100")

