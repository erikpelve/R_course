#Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows

#R


#complete <- function(directory, id = 1:332) {
complete <- function(x, y){


directory <-x
id <-y #vector with one or several numbers


#Find each file name, read each file
for(n in 1:length(id)){
     #add initial zeroes
     if (nchar(id[n]) == 1){ id2<- paste(c("00"), id[n], sep = "")}
     if (nchar(id[n]) == 2){ id2<- paste(c("0"), id[n], sep = "")}
     if (nchar(id[n]) == 3){ id2<-id[n]}
     file <- paste(id2, c("csv"), sep = ".")  #make a full filename
     path <-paste(directory, file, sep="/") #put together the file path
     table <-read.csv(path, sep=",") #read file
     
     




}
