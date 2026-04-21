# sql-data-cleaning-layoffs

SQL Data Cleaning Project – Layoffs Dataset

Objective

Clean and prepare raw layoffs data for analysis using SQL.

Tools Used

MySQL

1. Data Preparation
Created staging table to avoid modifying raw data

2. Removed Duplicates
Used ROW_NUMBER() window function to identify duplicates
Deleted duplicate rows

3. Standardized Data
Removed extra spaces using TRIM()
Standardized industry values (e.g., Crypto variations)
Cleaned country names

4. Handled Missing Values
Converted blanks to NULL
Used self-join to fill missing industry values

5. Data Transformation
Converted date from TEXT to DATE format

6. Final Cleanup
Removed rows with no useful layoff data
Dropped unnecessary columns

📈 Outcome
Clean, consistent dataset ready for analysis and visualization
