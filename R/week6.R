# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(stringi)
library(tidyverse)



# Data Import
citations <- stri_read_lines("../data/citations.txt",encoding="WINDOWS-1252")
citations_txt <- citations[!stri_isempty(citations)]
length(citations)-length(citations_txt)
mean(str_length(citations_txt))

# Data Cleaning
sample(citations_txt,size=10)

citations_tbl <- tibble(line=c(1:length(citations_txt)),cite=citations_txt) %>%
  mutate(cite=str_remove_all(cite,"[\"\']")) %>%
  mutate(year=str_match(cite,"\\((\\d{4})(,\\s[\\w+\\s-]+)?\\)")[,2]) %>%
  mutate(page_start=str_match(cite,"(\\d+)-\\d+\\.")[,2]) %>%
  mutate(perf_ref=str_detect(str_to_lower(cite),"performance")) %>%
  mutate(title=str_match(cite,"\\(\\d{4}(,\\s[\\w+\\s-]+)?\\)\\.\\s([^\\.\\(\\)]+(\\s\\(\\w+\\sed\\.\\))?[\\.\\?\\!])\\s")[,3]) %>%
  mutate(first_author=str_match(cite,"^[A-Za-z-]+,[\\sA-Z\\.]+"))

  sum(!is.na(citations_tbl$first_author))
  
