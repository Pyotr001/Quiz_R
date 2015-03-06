best <- function(state = "RI", outcome = "pneumonia") {
        
        ## Read outcome data
        table <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",
                          colClasses = "character")  

        ## Check that state and outcome are valid
        if ((sum((unique(table[7]))  == state)) == 0){
                stop("Не могу найти такой штат")
        }
        if (outcome == "pneumonia"){
                outcome.data <- table[which(table[7] == state), 23]
        }else{
                if(outcome == "heart attack"){
                        outcome.data <- table[which(table[7] == state), 11]  
                }else{
                        if(outcome == "heart failure"){
                                outcome.data <- table[which(table[7] == state), 17]    
                        }else{
                                stop("нет такого заболевания")
                        }
                }
        }
        min.mortality <- which(outcome.data == min(outcome.data, na.rm = T))
        hospital.name <- sort(table[min.mortality, 2])
        ## print(hospital.name)
        hospital.name[1]
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
}

