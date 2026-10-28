# 02_data_cleaning.R

library(readr)
library(dplyr)

students <- read_csv("data/students.csv")

cat("Missing values before cleaning:\n")
print(colSums(is.na(students)))

students_clean <- students %>%
  distinct() %>%
  na.omit() %>%
  filter(
    Attendance >= 0 & Attendance <= 100,
    Assignment_Score >= 0 & Assignment_Score <= 100,
    Previous_Score >= 0 & Previous_Score <= 100,
    Final_Score >= 0 & Final_Score <= 100
  )
dir.create("results", showWarnings = FALSE)

write_csv(students_clean, "results/students_clean.csv")


cat("\nCleaning completed.\n")
cat("Rows after cleaning:", nrow(students_clean), "\n")
