# Part 1
pollutantmean <- function(directory = "specdata", 
                  pollutant = "sulfate", id = 1:332){
        files_list <- dir(directory, full.names=TRUE)
        dat_temp <- lapply(files_list[id], read.csv) # Создаем список из загруженных фреймов
        dat <- do.call(rbind, dat_temp) # Создаем один фрейм прменяя соединение к каждому листу
        mean(dat[, pollutant], na.rm=T)

}