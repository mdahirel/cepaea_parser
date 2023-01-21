cepaea_parser <- function(string){
  #get background colour character
  bg <- substr(string,1,1)
  bg <- case_when(
    bg %in% c("Y","P","B") ~ bg,
    TRUE ~ NA_character_
    )
  if(sum(!is.na(bg))==0){stop("no correct Cepaea string in vector")}
  
  #get band numbers
  nbands <- gsub("[^0-5]","",string) #remove what is not 0,1,2,3,4,5
  nbands <- case_when(
    nchar(nbands) != 5 ~ NA_integer_,
    TRUE ~ nchar(gsub("[^1-5]","",nbands))
  )
  
  if( (sum(!is.na(bg))==0) | (sum(!is.na(nbands))==0)){
    stop("no correct Cepaea string in vector")
    }
  
  #get presence or absence of fusion
  
  nfusions <- str_extract_all(string,"\\([:digit:]+\\)") |> lapply(length) |> unlist()
  
  return(data.frame(originalstring=string,background=bg,Nbands=nbands, nfusions))
}
