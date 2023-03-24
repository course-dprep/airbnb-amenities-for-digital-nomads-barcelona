# Load packages
library(tidyverse)
library(dplyr)
library(tidyr)

# Load data
wide_df2_100 <- read_csv("../../gen/analysis/input/wide_df2_100.csv")

# Create list of dependent variables, i.e. all 100 amenities
dep_vars <- names(wide_df2_100[3:102])

# Create a list with only significant amenities
## empty list
significant_amenities_100_2 <- c()

## loop over each dependent variable
for (dep_var in dep_vars) {
  str <- paste(dep_var, "~ listing_type")  
  model <- lm(str, wide_df2_100)
  summary <- summary(model)
  
  ## check for which amenities p < 0.05 (significant)
  if (summary$coefficients[2, 4] < 0.05) {
    ### if effect is negative
    if (summary$coefficients[2, 1] < 0) {
      significant_amenities_100_2 <- c(significant_amenities_100_2, dep_var)
    }
  }
}

# Amenities significantly more available in long listings
print(significant_amenities_100_2)
length(significant_amenities_100_2)

# Create dataframe 
df_significant_amenities_100_2 <- data.frame(significant_amenities_100_2)

# Store data in output 
write_csv(df_significant_amenities_100_2, "../../gen/analysis/output/df_significant_amenities_100_2.csv")
