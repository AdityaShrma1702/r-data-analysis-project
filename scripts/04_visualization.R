# 04_visualization.R

library(readr)
library(dplyr)
library(ggplot2)

students <- read_csv("results/students_clean.csv")

p1 <- ggplot(students, aes(x = Final_Score)) +
  geom_histogram(bins = 10, color = "blue") +
  labs(title = "Distribution of Final Scores",
       x = "Final Score",
       y = "Number of Students")

print(p1)
ggsave("results/final_score_histogram.png", p1, width = 7, height = 5)

p2 <- ggplot(students, aes(x = Attendance, y = Final_Score)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Attendance vs Final Score",
       x = "Attendance (%)",
       y = "Final Score")

print(p2)
ggsave("results/attendance_vs_score.png", p2, width = 7, height = 5)

result_count <- students %>% count(Result)

p3 <- ggplot(result_count, aes(x = Result, y = n)) +
  geom_col() +
  labs(title = "Pass and Fail Distribution",
       x = "Result",
       y = "Number of Students")

print(p3)
ggsave("results/pass_fail_bar.png", p3, width = 7, height = 5)
