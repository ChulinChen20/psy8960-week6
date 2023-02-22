# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(stringr)




# Data Import
citations <- stri_read_lines("../data/citations.txt",encoding="Latin-1")
citations_txt <-citations[citations!=""]
length(citations)-length(citations_txt)
mean(str_length(citations_txt))

