DATA = ../../data
OUTPUT = ../../gen/data-preparation/output
DAINPUT = ../../gen/analysis/input
ANOUT = ../../gen/analysis/output


#all: $(ANOUT)/significant_amenities_long_100 $(ANOUT)/significant_amenities_short_100

all: $(ANOUT)/significant_amenities_negative100

# linear regression with 100 most common amenities
#$(ANOUT)/significant_amenities_long_100 $(ANOUT)/significant_amenities_short_100: analyze.R 
	Rscript analyze.R
	

# linear regression with 100 most common amenities
$(ANOUT)/significant_amenities_negative100: regression1.R 
	Rscript regression1.R
	
# linear regression with long listings >28 days

#factor analysis 
