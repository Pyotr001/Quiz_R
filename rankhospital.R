
rankhospital <- function(state = "MD", outcome = "pneumonia", num = "best") {
        ## Read outcome data
        table <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",
                          colClasses = "character")
        table <- table[, c(2,7,11,17,23)]
        names(table) <- c("name", "state", "HeartAttack", "HeartFailure", "Pneumonia")
        print(names(table))
        # suppressWarnings(table[3:5] <- apply(table, 2, as.numeric))
        
        ## Check that state and outcome are valid
        if ((sum((unique(table[2]))  == state)) == 0){
                stop("invalid state")
        }
        
        if (outcome == "pneumonia"){
                outcome.data <- table[which(table[2] == state), c(1, 5)]
        }else{
                if(outcome == "heart attack"){
                        outcome.data <- table[which(table[2] == state), c(1, 3)]  
                }else{
                        if(outcome == "heart failure"){
                                outcome.data <- table[which(table[2] == state), c(1, 4)]    
                        }else{
                                stop("invalid outcome")
                        }
                }
        }
        
        print(head(outcome.data))
        ## print(length(outcome.data[[1]]))
        ## убираем строчки NA
        outcome.data <- outcome.data[!is.na(outcome.data[2]), ]
        print(head(outcome.data))
        
        ## убираем пропущенные значения
        print(length(outcome.data[ ,2]))
        outcome.data <- outcome.data[outcome.data[ ,2] != "Not Available", ]
        print(length(outcome.data[ ,2]))
        
        ## сортируем в начале по значению, потом по имени
        outcome.data <- outcome.data[order(outcome.data[2], outcome.data[1]), ]
        print(head(outcome.data))
        print(tail(outcome.data))
        if(num == "best"){
                num <- 1
        }else{
                if(num == "worst"){
                        num <- nrow(outcome.data)
                }
        }
        
        outcome.data[num, 1]
        ## length(outcome.data[[1]])        
                
                # print(head(table))
}