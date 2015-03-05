        ## загрузить файл

dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")


##Список файлов 
files <- list.files("diet_data", full.names = T) ## не терять путь к файлу
andy <- read.csv("diet_data/Andy.csv")
head(read.csv(files[3]))
head(andy)

dim(andy)
￼￼
str(andy)
summary(andy)
names(andy)

начальный вес
andy[1, "Weight"]

## which()  возвращает индексы по условию
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[,"Day"] == 30), "Weight"]

subset(andy$Weight, andy$Day==30)
subset(andy, andy$Weight == 137)


## Сцепить таблицы
andy_david <- rbind(andy, read.csv(files[2]))

day_25 <- andy_david[which(andy_david$Day == 25), ]
andy_david[andy_david$Day == 25, ]


dat <- data.frame() ## Важно не включать создание фрейма в цикл
for (i in 1:5) {
        dat <- rbind(dat, read.csv(files[i]))
}


dat_30 <- dat[which(dat[, "Day"] == 30),]


weightmedian <- function(directory, day)  {
        files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
        dat <- data.frame()                             #creates an empty data frame
        for (i in 1:5) {                                
                #loops through the files, rbinding them together 
                dat <- rbind(dat, read.csv(files_list[i]))
        }
        dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
        median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
        #while stripping out the NAs
} ## работает, но долго. Не нужно перекопировать в цикле

## The better approach is to create an output object of an appropriate size
## and then fill it up.
## So the first thing we do is create an empty list that's the length of
## our expected output. In this case, our input object is going to be 
##files_full and our empty list is going to be tmp.

summary(files)
tmp <- vector(mode = "list", length = length(files))
summary(tmp)

# Now we need to read in those csv files and drop them into tmp.

for (i in seq_along(files)) {
        tmp[[i]] <- read.csv(files[[i]])
}
str(tmp)

### Эквивалент строки
str(lapply(files_full, read.csv))


## We can use a function called do.call() to combine tmp into 
## a single data frame. do.call lets you specify a function 
## and then passes a list as if each element of the list 
##were an argument to the function. 

##The syntax is 
do.call(function_you_want_to_use, list_of_arguments). 
##In our case, we want to rbind() our list of data frames, tmp.

output <- do.call(rbind, tmp)
str(output)

