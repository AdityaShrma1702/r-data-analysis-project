# 01_setup.R
# Student Performance Analysis and Prediction

packages <- c("readr", "dplyr", "ggplot2")
new_packages <- packages[!(packages %in% installed.packages()[, "Package"])]

if(length(new_packages) > 0) {
  install.packages(new_packages)
}

library(readr)
library(dplyr)
library(ggplot2)

students <- read_csv("data/students.csv")
1
head(students)
str(students)
summary(students)

cat("\nDataset loaded successfully!\n")
cat("Rows:", nrow(students), "\n")
cat("Columns:", ncol(students), "\n")
