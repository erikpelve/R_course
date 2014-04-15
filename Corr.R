#corr <- function(directory, threshold = 0) 


corr <- function(x, y) {

  directory <-x

  results <-data.frame(id = numeric(0), nobs = numeric(0))
  #Find each file name, read each file
  for(n in 1:length(id)){
     #add initial zeroes
     counter <-0
     if (nchar(id[n]) == 1){ id2<- paste(c("00"), id[n], sep = "")}
     if (nchar(id[n]) == 2){ id2<- paste(c("0"), id[n], sep = "")}
     if (nchar(id[n]) == 3){ id2<-id[n]}
     file <- paste(id2, c("csv"), sep = ".")  #make a full filename
     path <-paste(directory, file, sep="/") #put together the file path
     table <-read.csv(path, sep=",") #read file


}





}
