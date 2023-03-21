# required package
install.packages("psych")
library(psych)


#from long-to-wide
#read_csv("../../gen/analysis/input/df_factor_analysis.csv")

wide_df_1 <- wide_df %>% 
  subset()

df_factors <- df_factor_analysis[, c("count_short", "count_long")]
fa_obj <- fa(df_factors, nfactors = 1, rotate = "varimax")

print(fa_obj, cut = 0.3, sort = TRUE, digits = 2)





