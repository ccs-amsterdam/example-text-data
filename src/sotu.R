
library(tidyverse)
x = read_csv("~/Downloads/State-of-the-Union-Addresses.csv") %>% select(President:Text)
x$President = stringi::stri_match_first(x$President, regex=' "(.*)::')[,2]
x$President = gsub("([A-Z])([A-Z])", "\\1. \\2", x$President)
x$President = gsub("([A-Z])([A-Z])", "\\1. \\2", x$President)
x$President = gsub("([a-z])([A-Z])", "\\1 \\2", x$President)
x$President  = gsub("Mc Kinley", "McKinley", x$President)
x

x$Date = stringi::stri_match_first(x$Date, regex='\\{(.*)\\}')[,2]

x$President = gsub("([A-Z])([A-Z])", "\\1. \\2", x$Date)
