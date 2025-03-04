# student_performance_analysis

## Overview
This project analyzes student performance on math, reading, and writing scores based on several factors including gender, race, parent level of education, lunch and test preparation course. 

student_performance_analysis/
├── raw_data/            # Stores original dataset
│   ├── StudentsPerformance.csv
├── cleaned_data/        # Stores cleaned/processed dataset
│   ├── processed_data.csv
├── results/             # Statistical outputs
│   ├── summary_statistics.txt
│   ├── histogram_math_scores.png
│   ├── math_writing_gender.png
│   ├── test_prep_math.png
│   ├── parent_education.png
│   ├── lunch_types_math_scores.png
├── sources/             # Stores all R scripts
│   ├── data_processing.R           # Cleans and processes raw data
│   ├── analysis.R       # Runs statistical analysis & visualization
│   ├── README.md                   # Project documentation

## How each visualization makes certain type of analysis easier
- **Histogram of Math Scores** - makes it easier to see the overall **distribution of scores**, score ranges, and outliers --> Best to perform trends
- **Scatter Plot: Math vs. Writing Scores by Gender** - Helps identify **correlations between subjects** and **gender-based differences** in performance.
--> Best to show the correlations between subjects
- **Boxplot: Test Preparation Course on Math Scores** - shows **whether test prep helps improve math scores**
- **Bar Chart: Average Math Score vs. Parental Education** - Shows how **parental education influences student performance**
- **Violin Plot: Math Score Distribution by Lunch Type** - identify **economic influences on academic performance**. 

