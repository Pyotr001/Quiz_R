# читаем таблицу
table <- read.csv("hw1_data-2.csv")

# Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
head(table, 2)

# How many observations (i.e. rows) are in this data frame?
nrow(table)

# Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
tail(table, 2)

# What is the value of Ozone in the 47th row?
table[47,1] # строка, потом столбец
table[47,"Ozone"]
table[[1]][[47]] # столбец, потом строка

