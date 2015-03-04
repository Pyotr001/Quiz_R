corr <- function(directory = "specdata", threshold = 0) {
        
        files_list <- dir(directory, full.names=TRUE)
        dat_temp <- lapply(files_list, read.csv) # Создаем список из загруженных фреймов
        dat <- as.numeric()
        
        for(i in 1:length(dat_temp)){
                print(i)
                if(sum(complete.cases(dat_temp[[i]])) > threshold){
                        dat <- c(dat, cor(dat_temp[[i]][["sulfate"]], dat_temp[[i]][["nitrate"]], use = "complete.obs"))
                }
        }
        dat
        # length(dat)
}
        
        

