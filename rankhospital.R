source('~/Documents/Документы/Самообразование/Data Science/R Programming/Quiz_R/Assingment3_read_data.R')

rankhospital <- function(state = "MD", outcome = "pneumonia", num = "best") {
        ## Read outcome data
        table <- data.frame()
        read_data()
        
        ## Check that state and outcome are valid
        # if ((sum((unique(table[2]))  == state)) == 0) stop("invalid state")
                
        
                
                
                print(head(table))
}