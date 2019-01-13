# Read and parse state of the union data sets from wolfram

library(tidyverse)
url = "https://www.wolframcloud.com/objects/ec61dd71-4b02-458c-a30c-3536376dc3b9"
x = read_csv(url) %>% select(President, Year, Date, Party, Text) 
x$President = stringi::stri_match_first(x$President, regex=' "(.*)::')[,2]
x$President = gsub("([A-Z])([A-Z])", "\\1. \\2", x$President)
x$President = gsub("([A-Z])([A-Z])", "\\1. \\2", x$President)
x$President = gsub("([a-z])([A-Z])", "\\1 \\2", x$President)
x$President  = gsub("Mc Kinley", "McKinley", x$President)


x$Date = stringi::stri_match_first(x$Date, regex='\\{(.*)\\}')[,2]
x$Date = as.Date(x$Date, "%Y, %m, %d")

x$Party = gsub("Missing[\"NotApplicable\"]", 'N/A', x$Party, fixed=T)
write_csv(x, "~/example-text-data/sotu.csv")
