library(tidyverse)
library(here)

source("R/cepaea_parser.R")

stringtest <- c("Y12345",
                "P123(45)",
                "P(123)(45)",
                "B00000",
                "Y00345",
                "PY12:45",
                "DP12.45",
                "DZ12685",
                "Z12345",
                "P123",
                "Y123450"
                )

cepaea_parser(stringtest)
cepaea_parser("X12345")
cepaea_parser(c("Y123","Z12345"))
cepaea_parser("Y12678")
