best <- function(state = "RI", outcome = "pneumonia") {
        
        ## Read outcome data
        table <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",
                          colClasses = "character")  

        ## Check that state and outcome are valid
        if ((sum((unique(table[7]))  == state)) == 0){
                stop("invalid state")
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
                                stop("invalid outcome")
                        }
                }
        }
        suppressWarnings(outcome.data <- as.numeric(outcome.data))
        min.mortality <- which(outcome.data == min(outcome.data, na.rm = T))
        # print(min(outcome.data, na.rm = T))
        hospital.name_list <- table[which(table[7] == state), 2]
        # print(min.mortality)
        hospital.name <- sort(hospital.name_list[min.mortality])
        # print(sort(table[min.mortality, 2]))
        # print(hospital.name)
        hospital.name[1]
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
}

