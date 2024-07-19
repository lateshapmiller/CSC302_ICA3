library(readr)

df <- read.csv("C:/Users/user/Documents/Users/user/Downloads/metabolite.csv")
head(df)
summary(df)

metabolite_data <- read_csv("C:/Users/user/Documents/Users/user/Downloads/metabolite.csv")
print(metabolite_data)

#3 a) Find how many Alzheimer's patients there are in the data set. (Hint: Please refer to question 1)
alzheimer_count <- sum(metabolite_data$Label == "Alzheimer")
print(alzheimer_count)

#Number of Alzheimer patients = 35

#3 b) Determine the number of missing values for each column

missing_counts <- colSums(is.na(metabolite_data))
print(missing_counts)

#3 c) Remove the rows which Remove the rows which has missing value for the Dopamine column and assign the result to a new data frame.

clean_data <- metabolite_data[!is.na(metabolite_data$Dopamine), ]
head(clean_data)

#3 d) In the new data frame, replace the missing values in the c4-OH-Pro column with the median value of the same column
df <- data.frame(c4.OH.Pro = c(1, 2, NA, 4, NA, 6))
median_c4_OH_Pro <- median(df$c4.OH.Pro, na.rm = TRUE)
df$c4.OH.Pro[is.na(df$c4.OH.Pro)] <- median_c4_OH_Pro
print(df)

#4 e) (Optional) Drop columns which have more than 25% missing values. (Hint: when you slice your data frame, you can use -c(.., ..., ...) where ... represent one column name)

missing_percentage <- colMeans(is.na(metabolite_data)) * 100
threshold <- 25
columns_to_drop <- names(metabolite_data)[missing_percentage > threshold]
metabolite_data <- metabolite_data[, !names(metabolite_data) %in% columns_to_drop]
print(metabolite_data)
