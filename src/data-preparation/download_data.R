# Download dataset 1
library(tidyverse)
library(dplyr)

## Calendar.csv.gz
download.file('http://data.insideairbnb.com/spain/catalonia/barcelona/2022-12-11/data/calendar.csv.gz', './calendar.csv.gz')
calendar <- read_csv("calendar.csv.gz")

## Listings.csv
download.file('http://data.insideairbnb.com/spain/catalonia/barcelona/2022-12-11/data/listings.csv.gz', './listings.csv.gz')
listings_unsorted <- read_csv("listings.csv.gz")



