DATA = ../../data
OUTPUT = ../../gen/data-preparation/output
DAINPUT = ../../gen/analysis/input
ANOUT = ../../gen/analysis/output
PAPER = ../../src/paper
PREP = ../../src/data-preparation

all: $(ANOUT)/df_significant_amenities_100.csv $(DAINPUT)/counts.csv $(ANOUT)/df_significant_amenities_100_2.csv $(DAINPUT)/counts2.csv $(PAPER)/paper.Rmd 

# Linear regression
$(ANOUT)/df_significant_amenities_100.csv: regression1.R
	Rscript regression1.R
	
# Previsualization
$(DAINPUT)/counts.csv: previsualization.R
	Rscript previsualization.R

# Linear regression 2
# Linear regression
$(ANOUT)/df_significant_amenities_100_2.csv: regression2.R
	Rscript regression2.R
	
# Previsualization
$(DAINPUT)/counts2.csv: previsualization2.R
	Rscript previsualization2.R
	
# Making the R-markdown file with visual results
#$(PAPER)/paper.Rmd: regression2.R previsualization2.R regression1.R previsualization.R $(PREP)/transform_data1.R $(PREP)/transform_data2.R
#	Rscript regression1.R previsualization2.R regression2.R previsualization.R $(PREP)/transform_data1.R $(PREP)/transform_data2.R
