# 03_eda.R

library(readr)
library(dplyr)

students <- read_csv("results/students_clean.csv")

cat("AVERAGE VALUES\n")
cat("Average Attendance:", mean(students$Attendance), "\n")
cat("Average Study Hours:", mean(students$Study_Hours), "\n")
cat("Average Assignment Score:", mean(students$Assignment_Score), "\n")
cat("Average Final Score:", mean(students$Final_Score), "\n\n")

cat("PASS / FAIL COUNT\n")
print(table(students$Result))

cat("\nGRADE DISTRIBUTION\n")
print(table(students$Grade))

cat("\nTOP 10 STUDENTS\n")
top10 <- students %>%
  arrange(desc(Final_Score)) %>%
  select(Student_ID, Final_Score, Grade, Result) %>%
  head(10)

print(top10)
write_csv(top10, "results/top10_students.csv")

cat("\nCORRELATION MATRIX\n")
numeric_data <- students %>%
  select(Attendance, Study_Hours, Assignment_Score, Previous_Score, Final_Score)

print(cor(numeric_data))
