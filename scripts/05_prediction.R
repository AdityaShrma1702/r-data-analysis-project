# 05_prediction.R
# Simple Linear Regression Model

library(readr)

students <- read_csv("results/students_clean.csv")

model <- lm(
  Final_Score ~ Attendance +
    Study_Hours +
    Assignment_Score +
    Previous_Score,
  data = students
)

summary(model)

students$Predicted_Score <- predict(model, newdata = students)

mae <- mean(abs(students$Final_Score - students$Predicted_Score))
rmse <- sqrt(mean((students$Final_Score - students$Predicted_Score)^2))

cat("\nMODEL EVALUATION\n")
cat("MAE:", mae, "\n")
cat("RMSE:", rmse, "\n")

write_csv(students, "results/student_predictions.csv")

