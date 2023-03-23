# required packages
library(tidyverse)
library(dplyr)
library(tidyr)

wide_df <- read_csv("../../gen/analysis/input/wide_df.csv")

# Create list of dependent variables, i.e. all 1859 amenities
dep_vars <- names(wide_df[3:10])

# Create a list with only significant amenities
## empty list
significant_amenities_negative <- c()
significant_amenities_positive <- c()

## loop as before
for (dep_var in dep_vars) {
  if (dep_var %in% wide_df) { 
    str <- paste(dep_var, "~ listing_type")  
    model <- lm(str, wide_df100)
    summary <- summary(model)
    
    ## check for which amenities p < 0.05 (significant)
    if (summary$coefficients[2, 4] < 0.05) {
      ### if effect is negative
      if (summary$coefficients[2, 1] < 0) {
        significant_amenities_negative <- c(significant_amenities_negative, dep_var)
        ### if effect is positive
      } else if (summary$coefficients[2, 1] > 0) {
        significant_amenities_positive <- c(significant_amenities_positive, dep_var)
      }
    }
  }
} 

## loop as before
# for (dep_var in dep_vars) {
# if (dep_var %in% wide_df) {  # add this check
#    str <- paste(dep_var, "~ listing_type")
#    model_data <- wide_df[, c("listing_type", dep_var)]
#    model_data <- model_data[complete.cases(model_data), ]
#    model <- lm(as.formula(str), data = model_data)
#    summary <- summary(model)
#    
## check for which amenities p < 0.05 (significant)
#    if (summary$coefficients[2, 4] < 0.05) {
#      ### if effect is negative
#      if (summary$coefficients[2, 1] < 0) {
#        significant_amenities_negative <- c(significant_amenities_negative, dep_var)
#        ### if effect is positive
#      } else if (summary$coefficients[2, 1] > 0) {
#        significant_amenities_positive <- c(significant_amenities_positive, dep_var)
#     }
#   }
#  }
# } # Terminates R...

# Total number of significant amenities
# length(significant_amenities_negative) + length(significant_amenities_positive)

# Amenities significantly more available in short listings
# print(significant_amenities_negative)
# length(significant_amenities_negative)

# Amenities significantly more available in long listings
# print(significant_amenities_positive)
# length(significant_amenities_positive)

# Save as lists
#write_csv(significant_amenities_positive, "significant_amenities_long")
#write_csv(significant_amenities_negative, "significant_amenities_short")

#write_csv(significant_amenities_positive, "significant_amenities_long")
#write_csv(significant_amenities_negative, "significant_amenities_short"