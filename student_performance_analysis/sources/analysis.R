# Load libraries
library(ggplot2)
library(dplyr)

# Define file path for cleaned data
cleaned_data <- "/Users/vyngo/Desktop/UMKC/CS5530/student_performance_analysis/cleaned_data/processed_data.csv"

# Read cleaned dataset
students_data <- read.csv(cleaned_data, stringsAsFactors = TRUE)

# Check the structure
str(students_data)

# Summary statistics
summary(students_data)

# Correlation between Math, Reading, Writing scores
correlation_matrix <- cor(students_data[, c("math.score", "reading.score", "writing.score")], use = "complete.obs")
print(correlation_matrix)
## students who score high in math tend to score high in reading.
## students who do well in math also tend to do well in writing.
## students who do well in reading almost always do well in writing.
## these 3 subjects have high positive correlations, 
## meaning students tend to perfrom similar across all subjects.

# Histogram of Math Score distribution
math_hist <- ggplot(students_data, aes(x = math.score)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Distribution of Math Scores", x = "Math Score", y = "Count") +
  theme_minimal()
print(math_hist)
ggsave("/Users/vyngo/Desktop/UMKC/CS5530/student_performance_analysis/results/histogram_math_scores.png"
, plot = math_hist)
## The distribution appears to be approximately normal
## Most students score in the middle range (50-80)
## The distribution is slightly right-skewed, meaning there are a few exceptionally high scores

# Scatter Plot of Math scores and Writing scores by Gender
math_writ_scatter <- ggplot(students_data, aes(x = math.score, y = writing.score, color = gender)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Math vs Writing Score by Gender", x = "Math Score", y = "Writing Score") +
  theme_minimal()
print(math_writ_scatter)

ggsave("/Users/vyngo/Desktop/UMKC/CS5530/student_performance_analysis/results/math_writing_gender.png",
       plot = math_writ_scatter)
##students who perform well in math tend to perform well in writing too.
##females generally perform better in writing 

# Boxplot of Test Preparation Course and Math scores
test_prep_math <- ggplot(students_data, aes(x = test.preparation.course, y = math.score, fill = test.preparation.course)) +
  geom_boxplot() +
  labs(title = "Effect of Test Preparation Course on Math Scores", x = "Test Preparation Course", y = "Math Score") +
  theme_minimal()
print(test_prep_math)

ggsave("/Users/vyngo/Desktop/UMKC/CS5530/student_performance_analysis/results/test_prep_math.png", 
       plot = test_prep_math)
##Students who completed the test preparation course tend to have higher Math Scores
##Some students perform well even without test prep

# Bar Chart of Math Scores vs Parental Education Level
math_parent_edu <- students_data %>%
  group_by(parental.level.of.education) %>%
  summarise(avg_math = mean(math.score, na.rm = TRUE)) %>%
  ggplot(aes(x = parental.level.of.education, y = avg_math, fill = parental.level.of.education)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Math Score by Parental Education", x = "Parental Education", y = "Average Math Score") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(math_parent_edu)

ggsave("/Users/vyngo/Desktop/UMKC/CS5530/student_performance_analysis/results/parent_education.png", 
       plot = math_parent_edu)

##Higher parental education is associated with better math scores.
##Students of parents with a master's degree perform best, 
##while those with "some high school" perform the lowest.

# Violin plot of Math scores vs. Lunch Types
math_lunch <- ggplot(students_data, aes(x = lunch, y = math.score, fill = lunch)) +
  geom_violin() +
  labs(title = "Math Score Distribution by Lunch Type", x = "Lunch Type", y = "Math Score") +
  theme_minimal()

print(math_lunch)

ggsave("Users/vyngo/Desktop/UMKC/CS5530/student_performance_analysis/results/lunch_types_math_scores.png", 
       plot = math_lunch)
##Students with standard lunch tend to have higher math scores.
##Students on free/reduced lunch have a lower median math score

source("/Users/vyngo/Desktop/UMKC/CS5530/student_performance_analysis/sources/analysis.R")



















