DATA = ../../data
OUTPUT = ../../gen/data-preparation/output
DAINPUT = ../../gen/analysis/input
ANOUT = ../../gen/analysis/output


all: $(ANOUT)df_significant_amenities_100.csv $(DAINPUT)/counts.csv

#linear regression
$(ANOUT)df_significant_amenities_100.csv: regression1.R
	Rscript regression1.R
	
#Previsualization
$(DAINPUT)/counts.csv: previsualization.R
	Rscript previsualization.R

#linear regression2
#$(ANOUT)df_significant_amenities_100.csv: regression2.R
	#Rscript regression2.R
	

