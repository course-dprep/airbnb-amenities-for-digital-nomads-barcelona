all: data-preparation analysis clean

#packages:
#	Rscript install_packages.R
	
data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis
	
#paper: data-preparation analysis
#	make -C src/paper
	
clean: 
	find . -type f -name "*.csv" -delete
