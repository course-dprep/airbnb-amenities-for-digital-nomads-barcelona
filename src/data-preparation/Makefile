DATA = ../../add
OUTPUT = ../../gen/data-preparation/output

# Download data
$(DATA)/calendar.csv.gz data/listings.csv.gz: src/data-preparation/download_data.R 
	Rscript src/data-preparation/download_data.R 

# Transform data
#$(OUTPUT)/listing_type.csv $(OUTPUT)/listings_sorted.csv : gen/data-preparation/output/listing_type.csv gen/data-preparation/output/listings_sorted.csv
#	Rscript src/data-preparation/transform_data.R

# Clean-up: Deletes temporary files
# Note: Using R to delete files keeps platform-independence. 
# 	    --vanilla option prevents from storing .RData output
#clean: 
#	Rscript --vanilla src/clean-up.R
	
