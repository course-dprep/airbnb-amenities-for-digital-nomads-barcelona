DATA = ../../data
OUTPUT = ../../gen/data-preparation/output

#all: $(DATA)/calendar.csv.gz $(DATA)/listings.csv.gz $(OUTPUT)/listing_type.csv $(OUTPUT)/listings_sorted.csv

# Download data
$(DATA)/calendar.csv.gz $(DATA)/listings.csv.gz: src/data-preparation/download_data.R 
	Rscript src/data-preparation/download_data.R 

# Download transform_data.R output
#$(OUTPUT)/listing_type.csv $(OUTPUT)/listings_sorted.csv: src/data-preparation/transform_data.R 
#	Rscript src/data-preparation/transform_data.R
	


# Clean-up: Deletes temporary files
# Note: Using R to delete files keeps platform-independence. 
# 	    --vanilla option prevents from storing .RData output
#clean: 
	#Rscript --vanilla src/clean-up.R
	
