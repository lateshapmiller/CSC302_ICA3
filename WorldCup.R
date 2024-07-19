library(readr)

df = read.csv("C:/Users/user/Documents/Users/user/Downloads/WorldCupMatches.csv")

num_rows <- nrow(df)
num_cols <- ncol(df)
cat("Number of rows:", num_rows, "\n")
cat("Number of columns:", num_cols, "\n\n")

#2a: Number of Rows generated = 852 & Number of Columns generated = 20

#2b

summary_data <- summary(df)
print(summary_data)

cat("\n")

unique_locations <- n_distinct(df$City)
cat("Number of unique locations Olympics were held at:", unique_locations, "\n\n")

#2c: Number of unique locations Olympics were held at: 151

average_attendance <- mean(df$Attendance, na.rm = TRUE)
cat("Average attendance:", average_attendance, "\n\n")

#2d: Average attendance: 45164.8

str(df)
#2e
goals_scored <- df %>%
  group_by(Home.Team.Name) %>%
  summarize(total_goals = sum(Home.Team.Goals, na.rm = TRUE))
  print(goals_scored, n = Inf)


average_attendance_by_year <- df %>%
  group_by(Year) %>%
  summarize(avg_attendance = mean(Attendance, na.rm = TRUE))
  print(average_attendance_by_year)
  
#2f: Average number of attendees for each year below.
#Trends:  There was a large spike between 1938 & 1950.  My inference would be that this was due to war.
#Attendance tapered  back off in 1954, but spiked again in 1966. The attendance rate stayed roughly in the high 40000's.
#There was another large increase in 1994, this could be due to the gaining popularity of soccer.
#Attendance decreased again, but never dipped below 40K.

