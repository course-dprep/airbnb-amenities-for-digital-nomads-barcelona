# Load packages
library(tidyverse)
library(dplyr)
library(tidyr)
library(stringr)
library(tibble)
library(magrittr)
library(readr)

# Load data
## Calendar.csv.gz
download.file('http://data.insideairbnb.com/spain/catalonia/barcelona/2022-12-11/data/calendar.csv.gz', '../../data/dataset1.csv')

## Listings.csv.gz
download.file('http://data.insideairbnb.com/spain/catalonia/barcelona/2022-12-11/data/listings.csv.gz', '../../data/dataset2.csv')




