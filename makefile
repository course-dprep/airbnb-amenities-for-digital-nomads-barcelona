
# Download data
data/dataset1/dataset1.csv data/dataset2/dataset2.csv: src/data-preparation/download_data.R 
	Rscript src/data-preparation/download_data.R 

# Clean-up: Deletes temporary files
# Note: Using R to delete files keeps platform-independence. 
# 	    --vanilla option prevents from storing .RData output
clean: 
	Rscript --vanilla src/clean-up.R
	
