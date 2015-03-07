read_data <- function(){
        table <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",
                          colClasses = "character")
        table <- table[, c(2,7,11,17,23)]
        names(table) <- c("name", "state", "HeartAttack", "HeartFailure", "Pneumonia")
        
        table[3:5] <- apply(table, 2, as.numeric)
        table <<- table
}