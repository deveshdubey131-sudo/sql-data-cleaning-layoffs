-- Exploratory Data Analysis

SELECT *
FROM layoffs_stagging2;

-- Lets check few details before major EDA

-- Lets find Maxmium and Minium layoff in 1 day

SELECT MAX(total_laid_off), MIN(total_laid_off)
FROM layoffs_stagging2;

-- Finding how many companies laid off 100%

SELECT COUNT(company)
FROM layoffs_stagging2
WHERE percentage_laid_off = 1;

-- Total 116 Companies had 100% lay off

-- Lets find out which company had the highest lay off

SELECT company, SUM(total_laid_off) AS Total_layoffs
FROM layoffs_stagging2
GROUP BY company
ORDER BY SUM(total_laid_off) DESC;

-- Amazon had the highest layoff - 18150

-- Lets find which industry had highest layoff

SELECT industry, SUM(total_laid_off) AS Total_layoffs
FROM layoffs_stagging2
GROUP BY industry
ORDER BY SUM(total_laid_off) DESC;

-- Consumer Industry was affected the highest -- 45182 People

-- Lets based on Country as well

SELECT country, SUM(total_laid_off) AS Total_layoffs
FROM layoffs_stagging2
GROUP BY country
ORDER BY SUM(total_laid_off) DESC;

-- United States was most affected - 256559 People

-- Lets check which Year was highest layoff


SELECT YEAR(`date`), SUM(total_laid_off) AS Total_layoffs
FROM layoffs_stagging2
GROUP BY YEAR(`date`)
ORDER BY SUM(total_laid_off) DESC;

-- So 2022 was the highest Layoff 160661

-- YEAR IS a function to represent the entire date into just Year

-- Progression of Layoff or Rolling total Based per Year and Company

SELECT *
FROM layoffs_stagging2;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY company, YEAR(`date`)
ORDER BY company ASC;

WITH Company_year (company, Years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY company, YEAR(`date`)
), Company_year_rank AS
(
SELECT *,
DENSE_RANK() OVER(PARTITION BY Years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_year
WHERE Years IS NOT NULL
)
SELECT *
FROM Company_year_rank
WHERE Ranking <= 5;

