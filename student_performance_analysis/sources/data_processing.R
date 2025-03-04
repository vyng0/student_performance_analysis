# Load libraries
library(dplyr)
library(ggplot2)

# Read the dataset
data_path <- "/Users/vyngo/Desktop/UMKC/CS5530/student_performance_analysis/raw_data/StudentsPerformance.csv"
students_data <- read.csv(data_path, stringsAsFactors = TRUE)
students_data

# View structure of dataset
str(students_data)

# Check for missing values
missing_values <- sum(is.na(students_data))
cat("Total missing values:", missing_values, "\n")

# Data Dimension
dim(students_data)

# Convert categorical columns to factors
students_data$gender <- as.factor(students_data$gender)
students_data$test.preparation.course<- as.factor(students_data$test.preparation.course)

#Save processed data
write.csv(students_data, "cleaned_data/processed_data.csv", row.names = FALSE)
print("✅ Cleaned data saved in cleaned_data/")
file.exists("cleaned_data/processed_data.csv")

write.csv(students_data, "/Users/vyngo/Desktop/UMKC/CS5530/student_performance_analysis/cleaned_data/processed_data.csv", row.names = FALSE)
source("/Users/vyngo/Desktop/UMKC/CS5530/student_performance_analysis/sources/data_processing.R")


