DATA = ../../data
OUTPUT = ../../gen/data-preparation/output
INPUT = ../../gen/data-preparation/input
DAINPUT = ../../gen/analysis/input

all: $(DATA)/dataset1.csv $(DATA)/dataset2.csv $(OUTPUT)/listing_type.csv $(OUTPUT)/listings_sorted.csv $(INPUT)calendar_updated.csv $(OUTPUT)/listings_joined.csv $(OUTPUT)/listings_joined_cleaned.csv $(DAINPUT)/counts_100.csv $(DAINPUT)/wide_df.csv $(DAINPUT)/wide_df100.csv $(DAINPUT)/counts_long_short.csv $(OUTPUT)/listing_type2.csv $(OUTPUT)/listings_sorted2.csv $(OUTPUT)/listings_joined2.csv $(OUTPUT)/listings_joined2_cleaned.csv $(DAINPUT)/counts2_100.csv $(DAINPUT)/wide_df2_100.csv $(DAINPUT)/wide_df2.csv $(DAINPUT)/counts_long_short2.csv
# Download data
$(DATA)/dataset1.csv $(DATA)/dataset2.csv: download_data.R 
	Rscript download_data.R 

# Transform data
$(OUTPUT)/listing_type.csv $(OUTPUT)/listings_sorted.csv $(INPUT)calendar_updated.csv: transform_data.R
	Rscript transform_data.R
	
# Merge datasets
$(OUTPUT)/listings_joined.csv: merge_data.R
	Rscript merge_data.R
	
#cleaned dataset
$(OUTPUT)/listings_joined_cleaned.csv: clean_data.R
	Rscript clean_data.R
	
#cleaning amenities before analyzing
$(DAINPUT)/counts_100.csv $(DAINPUT)/wide_df.csv $(DAINPUT)/wide_df100.csv $(DAINPUT)/counts_long_short.csv: amenities2.R
	Rscript amenities2.R
	
	
## second regression
# Transform data
$(OUTPUT)/listing_type2.csv $(OUTPUT)/listings_sorted2.csv: transform_data2.R transform_data.R
	Rscript transform_data2.R

# Merge datasets
$(OUTPUT)/listings_joined2.csv: merge_data2.R
	Rscript merge_data2.R

#cleaned dataset
$(OUTPUT)/listings_joined2_cleaned.csv: clean_data2.R
	Rscript clean_data2.R
	
#cleaning amenities before analyzing
$(DAINPUT)/counts2_100.csv $(DAINPUT)/wide_df2_100.csv $(DAINPUT)/wide_df2.csv $(DAINPUT)/counts_long_short2.csv: amenities2.R
	Rscript amenities2.R
	



