files <- list.files("rprog-data-ProgAssignment3-data", full.names = T)

outcome <- read.csv(files[3], colClasses = "character")
outcome2 <- read.csv(files[3])
dim(outcome)
names_outcome <- names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
head(outcome[, 20:26])

testStop <- function(x){
        if(x == 3) stop(call. = F, "Не делю на три")
        14/x
}

apply(outcome, 2, class) == apply(outcome2, 2, class)

head(outcome[2])
