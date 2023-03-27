all: data-preparation analysis 
	
data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis
	
clean: 
	find . -type f -name "*.csv" -delete
