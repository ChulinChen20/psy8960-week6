# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(stringr)
library(tidyverse)



# Data Import
citations <- stri_read_lines("../data/citations.txt",encoding="Latin-1")
citations_txt <-citations[citations!=""]
length(citations)-length(citations_txt)
mean(str_length(citations_txt))

# Data Cleaning
sample(citations_txt,size=10)
citations_tbl <- tibble(line=c(1:length(citations_txt)),cite=citations_txt)
