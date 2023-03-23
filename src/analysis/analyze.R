# load 
#load("./gen/analysis/input/data_cleaned.RData")

# Estimate model 1 
#m1 <- lm(V1 ~ V3 + V4,df_cleaned)

# Estimate model 2 
#m2 <- lm(V1 ~ V3 + V4 + V5 , df_cleaned)

# Save results
#save(m1,m2,file="./gen/analysis/output/model_results.RData")

# Load packages
library(tidyverse)
library(dplyr)
library(tidyr)

# Load data
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

###### TO ILLUSTRATE
t <- summary(lm(has_Crib ~ listing_type, wide_df100))
t
t$coefficients[2,1] # listing_typeshort 0.088444
# this means, that if listing_type = short, estimate of having that amenity increases with 0.08
# therefore, if we want amenities that are significantly more in long listings, this coefficient must be negative
######

# Create a list with only significant amenities
## empty list
significant_amenities_negative100 <- c()
significant_amenities_positive100 <- c()

## loop as before
for (dep_var in dep_vars) {
  str <- paste(dep_var, "~ listing_type")  
  model <- lm(str, wide_df100)
  summary <- summary(model)

  ## check for which amenities p < 0.05 (significant)
  if (summary$coefficients[2, 4] < 0.05) {
    ### if effect is negative
    if (summary$coefficients[2, 1] < 0) {
      significant_amenities_negative100 <- c(significant_amenities_negative100, dep_var)
      ### if effect is positive
    } else if (summary$coefficients[2, 1] > 0) {
      significant_amenities_positive100 <- c(significant_amenities_positive100, dep_var)
    }
  }
}

# Total number of significant amenities
length(significant_amenities_negative100) + length(significant_amenities_positive100)

# Amenities significantly more available in long listings
print(significant_amenities_negative100)
length(significant_amenities_negative100)

# Amenities significantly more available in short listings
print(significant_amenities_positive100)
length(significant_amenities_positive100)

# examples positives: more with short listings
summary(lm(has_Dryer ~ listing_type, wide_df100))
summary(lm(has_Bidet ~ listing_type, wide_df100))
summary(lm(has_Oven ~ listing_type, wide_df100))
summary(lm(has_Safe ~ listing_type, wide_df100))
summary(lm(has_Lockbox ~ listing_type, wide_df100))

# examples negatives: more with long listings
summary(lm(has_Essentials ~ listing_type, wide_df100))
summary(lm(has_Kitchen ~ listing_type, wide_df100))
summary(lm(has_Wifi ~ listing_type, wide_df100))
summary(lm(has_Baby_bath ~ listing_type, wide_df100))

significant_amenities_positive100 <- data.frame(significant_amenities_positive100)
significant_amenities_negative100 <- data.frame(significant_amenities_negative100)

# Save as lists
write_csv(significant_amenities_positive100, "../../gen/analysis/output/significant_amenities_positive100")
write_csv(significant_amenities_negative100, "../../gen/analysis/output/significant_amenities_negative100")

  
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