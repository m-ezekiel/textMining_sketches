# markov_Fxn.R & corpusToVector
# Author: Mario Ezekiel H. (@m_ezkiel)
# February 23, 2016


corpusToVector <- function(file)
{
  text_data <- readLines(file)
  gsub("[()_!]", "", text_data) -> text_data; 
  gsub("--", " ", text_data) -> text_data
  wordVec <- unlist(strsplit(text_data, split = " "))
  
  return(wordVec)
}

# Import text corpus-- basically any free text file (see www.archive.org for resources)
corpusToVector("~/Documents/Data/Text Files/time_machine_Wells.txt") -> wordVector
wordVector

# Markov Function with Added parameter for "begins_with = " and return array
markov_Fxn <- function(n = 30, begin_with = "") 
{
  emptyArray <- rep(NA, n + 1)
  beginning <- wordVector[grep(begin_with, wordVector)]
  sample(beginning, 1) -> context; 
  emptyArray[1] <- context;
  ## print(context) 
  
  for(i in 1:n) {
    sample(wordVector[which(wordVector == context) + 1], size = 1) -> context; 
    emptyArray[i+1] <- context;
    ## print(context)
    if (grepl("[.]$", context) == TRUE)
      break
  }
  
  filledArray <- na.exclude(emptyArray)
  machineText <- ""
  
  for (i in 1:length(filledArray)) {
    machineText <- paste0(machineText, filledArray[i], " ")
  }
  
  # cat("\014") # Clear the console
  
  return(machineText)
}

# Initialize counter function and save.file
x <- 0;   
counter_fXn <- function() { 
  x <- x + 1 
  return(x) 
  }
save.file <- ""

# Run function, Print output
markov_Fxn() -> q;   q;   cat(rep("\n>",5));
# Save text to machineText.save
counter_fXn() -> x;   q -> save.file[x];   cat(rep("\n>",5));   save.file;   cat(rep("\n>",10))


