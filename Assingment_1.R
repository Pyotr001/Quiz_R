# Part 1
pollutantmean <- function(directory = "specdata", 
                  pollutant = "sulfate", id = 1:332){
       c <- c()
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
              
                # print(head(table)) # Проверка работы считывания файлов
                c <- c(c, table[[pollutant]])  
                
       }   
       mean(c, na.rm = TRUE)
}
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
