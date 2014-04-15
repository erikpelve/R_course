#corr <- function(directory, threshold = 0) 


corr <- function(x, y) {

  directory <-x
  threshold <- y
  files <- list.files(x) 
   #length(files)
  
  results <-data.frame(sulfate = numeric(0), nitrate = numeric(0))

  
#My own function from previous, run for all files
output_complete <- complete(directory, 1:length(files))
#While I test, I only run the first 10 samples

#output_complete <- complete(directory, 1:10)

 #For each line in the output 
for(n in 1:nrow(output_complete)){
	id <- output_complete[n,1]
	no_complete <- output_complete[n,2]
	#For files where the number of complete observations is greater 	than the threshold
	 if (no_complete > threshold){
	   sample_results <-data.frame(sulfate = numeric(0), nitrate = numeric(0))
	 	 #open file
		if (nchar(id) == 1){ id2<- paste(c("00"), id, sep = "")}
		if (nchar(id) == 2){ id2<- paste(c("0"), id, sep = "")}
		if (nchar(id) == 3){ id2<-id}
		file <- paste(id2, c("csv"), sep = ".")  #make a full filename
		path <-paste(directory, file, sep="/") #put together the file path
		table <-read.csv(path, sep=",") #read file
		#read through file and collect values for sulfate and nitrate
		for(o in 1:nrow(table)){
			if(is.na(table[o,2]) == FALSE && is.na(table[o,3]) == FALSE){
				thisresult <- data.frame(sulfate = table[o,2], nitrate = table[o,3] )
				sample_results <- rbind(sample_results, thisresult)
				}
		}
		
		#Here I collect all datapoints with both sulfate and nitrate data from stations over the treshhold 
		 results <- rbind(results,sample_results)
	}
}	

	correlated_results <- cor(results)
	return(correlated_results)
	 
}



