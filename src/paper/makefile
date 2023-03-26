all: paper.pdf

paper.pdf: paper.Rmd
  Rscript -e "rmarkdown::render('paper.Rmd', output_format = 'pdf_document')"

clean:
  rm -f paper.pdf
