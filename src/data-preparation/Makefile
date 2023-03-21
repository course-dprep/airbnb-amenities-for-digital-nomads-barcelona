DATA = ../../data
OUTPUT = ../../gen/data-preparation/output
DAINPUT = ../../gen/analysis/input

all: $(DATA)/dataset1.csv $(DATA)/dataset2.csv $(OUTPUT)/listing_type.csv $(OUTPUT)/listings_sorted.csv $(OUTPUT)/listings_joined.csv $(OUTPUT)/listings_joined_cleaned.csv $(DAINPUT)/counts_100.csv $(DAINPUT)/wide_df.csv $(DAINPUT)/wide_df100.csv

# Download data
$(DATA)/dataset1.csv $(DATA)/dataset2.csv: download_data.R 
	Rscript download_data.R 

# Transform data
$(OUTPUT)/listing_type.csv $(OUTPUT)/listings_sorted.csv: transform_data.R
	Rscript transform_data.R

# Merge datasets
$(OUTPUT)/listings_joined.csv: merge_data.R
	Rscript merge_data.R
	
#cleaned dataset
$(OUTPUT)/listings_joined_cleaned.csv: clean_data.R
	Rscript clean_data.R
	
#cleaning amenities before analyzing
$(DAINPUT)/counts_100.csv $(DAINPUT)/wide_df.csv $(DAINPUT)/wide_df100.csv: amenities2.R
	Rscript amenities2.R
	
#$(OUTPUT)/listing_type.csv: src/data-preparation/transform_data.R
	#Rscript src/data-preparation/transform_data.R
	
#gen/data-preparation/OUTPUT

# Clean-up: Deletes temporary files
# Note: Using R to delete files keeps platform-independence. 
# 	    --vanilla option prevents from storing .RData output
#clean: 
#	Rscript --vanilla src/clean-up.R
	
