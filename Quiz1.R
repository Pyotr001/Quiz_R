# читаем таблицу
table <- read.csv("hw1_data-2.csv")

# Extract the first 2 rows of the data frame and print them to the console.
# What does the output look like?
head(table, 2)

# How many observations (i.e. rows) are in this data frame?
nrow(table)

# Extract the last 2 rows of the data frame and print them to the console.
# What does the output look like?
tail(table, 2)

# What is the value of Ozone in the 47th row?
table[47,1] # строка, потом столбец
table[47,"Ozone"]
table[[1]][[47]] # столбец, потом строка

# How many missing values are in the Ozone column of this data frame?
sum(is.na(table$Ozone))

# What is the mean of the Ozone column in this dataset? Exclude missing values
# (coded as NA) from this calculation.
mean(table$Ozone, na.rm = TRUE)


# Extract the subset of rows of the data frame where Ozone values are above 31
# and Temp values are above 90. What is the mean of Solar.R in this subset?
v <- table$Ozone > 31 & table$Temp > 90
mean(table$Solar.R[v], na.rm = T)
# table[v, ] выдаст новую матрицу по условию

# What is the mean of "Temp" when "Month" is equal to 6?
v <- table$Month == 6
mean(table$Temp[v])

# What was the maximum ozone value in the month of May (i.e. Month = 5)?
v <- table$Month == 5
max(table$Ozone[v], na.rm = T)