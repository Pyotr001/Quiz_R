complete <- function(directory = "specdata", id = 1:332){
        c  <- data.frame(id = NULL, nobs = NULL) 
       
        for(i in id){
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
                Check <- sum(!is.na(table$sulfate) & !is.na(table$nitrate))
                
                c <- rbind.data.frame(c, c(i, Check))
        }
        # c=as.data.frame(c) # нужно изменить матрицу на фрейм, чтобы обращаться по именам через знак$
        colnames(c) <- c("id", "nobs")
        c
        
}
        
        
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases