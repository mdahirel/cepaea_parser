library(tidyverse)
library(here)

source("R/functions.R")

stringtest <- c("Y12345","P123(45)","P(123)(45)","B00000","Y00345","Z12345")

cepaea_parser(stringtest)
cepaea_parser("X12345")
cepaea_parser("Y123")
cepaea_parser("Y12678")
