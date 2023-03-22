all: packages data-preparation analysis

packages:
	Rscript install_packages.R
	
data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis
	
clean: 
	-rm -r data
	-rm -r gen