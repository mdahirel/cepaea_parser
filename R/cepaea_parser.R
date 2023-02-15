cepaea_parser <- function(string) {
  require(stringr)
  require(dplyr)

  test <- gsub("[0-5]|[:]|[.]|[PYBDL]|[()]", "", string) # only legitimate characters in a Cepaea phenotype
  badstring <- test != "" # any string that contains a non-legitimate character is bad

  
  # get background colour

  bg <- substr(string, 1, 2)
  bg <- gsub("[0-5]|[:]|[.]|[()]", "", bg)
  bg.main <- case_when(
    bg %in% c("Y", "PY", "DY", "LY") ~ "yellow",
    bg %in% c("B", "PB", "DB", "LB") ~ "brown",
    bg %in% c("P", "PP", "DP", "LP") ~ "pink",
    TRUE ~ NA_character_
  )

  bg.modifier <- case_when(
    bg %in% c("Y", "P", "B") ~ "",
    bg %in% c("PY", "PB", "PB", "LY", "LP", "LB") ~ "light ",
    bg %in% c("DY", "DP", "DB") ~ "dark ",
    TRUE ~ NA_character_
  )

  # get band number

    
  # check for string with wrong number of band characters
  n.bandslots <- gsub("[A-Z]|[()]", "", string)
  badstring <- case_when(
    nchar(n.bandslots) == 5 ~ badstring,
    TRUE ~ TRUE
  )
  
  nband.string <- gsub("[0]|[A-Z]|[()]", "", string)
  nbands <- nchar(nband.string)
  nbands.punctuate <- nchar(gsub("[0-5]|[.]", "", nband.string)) # keeps only :
  nbands.partial <- nchar(gsub("[0-5]|[:]", "", nband.string)) # keeps only .

  # band fusion
  open.pars <- gsub("[^(]", "", string)
  close.pars <- gsub("[^)]", "", string)

  # check for mistyped fusions
  badstring <- case_when(
    nchar(open.pars) == nchar(close.pars) ~ badstring,
    TRUE ~ TRUE
  )

  fusion <- nchar(open.pars) > 0

  data <- data.frame(
    string = string,
    morph = case_when(
      badstring == TRUE ~ NA_character_,
      TRUE ~ string
    ),
    col = case_when(
      badstring == TRUE ~ NA_character_,
      TRUE ~ bg.main
    ),
    col2 = case_when(
      badstring == TRUE ~ NA_character_,
      TRUE ~ paste0(bg.modifier, bg.main)
    ),
    nbands = case_when(
      badstring == TRUE ~ NA_integer_,
      TRUE ~ nbands
    ),
    fusion = case_when(
      badstring == TRUE ~ NA,
      TRUE ~ fusion
    ),
    nbands.punctuate = case_when(
      badstring == TRUE ~ NA_integer_,
      TRUE ~ nbands.punctuate
    ),
    nbands.partial = case_when(
      badstring == TRUE ~ NA_integer_,
      TRUE ~ nbands.partial
    )
  )


  if (all(badstring == TRUE)) {
    stop("all character strings in input are invalid")
  }
  
  if (any(badstring == TRUE)) {
    warning("invalid character strings detected, NA returned")
  }
  
  
  return(data)
}
