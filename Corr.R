corr <- function(directory = "specdata", threshold = 0) {
        outputVector <- c()
        for(i in 1:322){
                if(i[1] < 10){
                        f_name <- paste("00", i, ".csv", sep = "")
                }else{
                        if(i[1] < 100){
                                f_name <- paste("0", i, ".csv", sep = "") 
                        }else{
                                f_name <- paste(i, ".csv", sep = "") 
                        }
                }
                table <- read.csv(paste(directory, "/", f_name, sep = ""))
                # Check <- sum(!is.na(table$sulfate) & !is.na(table$nitrate))
                Check <- !is.na(table$sulfate) & !is.na(table$nitrate)
                if(sum(Check) > threshold){
                        dataCor <- cor(table$sulfate[Check], table$nitrate[Check])
                        # print(dataCor)
                        outputVector <- c(outputVector, dataCor)
                        # print(head(table$sulfate))
                        # print(outputVector)
                }
        }
                
        
        outputVector 
        #print(length(outputVector))
}
       

## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
