#corr <- function(directory, threshold = 0) 


corr <- function(x, y) {

  directory <-x
  threshold <- y
  files <- list.files(x) 
   #length(files)
  
  results <-data.frame(sulfate = numeric(0), nitrate = numeric(0))

  #Find each file name, read each file


  for(n in 1:length(files)){
     counter = 0
	 file <- files[n]
	 #file <- paste(id2, c("csv"), sep = ".")  #make a full filename
     path <-paste(directory, file, sep="/") #put together the file path
     table <-read.csv(path, sep=",") #read file
	sample_results <-data.frame(sulfate = numeric(0), nitrate = numeric(0))
	for(o in 1:nrow(table)){
       if(is.na(table[o,2]) == FALSE && is.na(table[o,3]) == FALSE){
	#		thisid <- (table[o,4])
			counter = counter +1
			thisresult <-data.frame(sulfate = table[o,2], nitrate = table[o,3] )
			sample_results <- rbind(sample_results, thisresult)
		
		}
	}	

	 #For files where the number of complete observations is greater than the treshhold
	 if (counter > 0){
	 	 results <- rbind(results,sample_result)
	 
	 }


	print(results)

}
