create database employee_data;

USE employee_data; 

SELECT * FROM employee;

-- Total employees by department
SELECT Education,
       ROUND(AVG(MonthlyIncome), 2) AS AvgMonthlyIncome
FROM employee
GROUP BY Education;

-- Atrition rate by Business Travel Frequency
SELECT 'Travel Frequently' AS TravelType,
       COUNT(*) AS Total,
       SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM employee
WHERE BusinessTravel_Travel_Frequently = TRUE
UNION

SELECT 'Travel Rarely',
       COUNT(*),
       SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END),
       ROUND(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*), 2)
FROM employee
WHERE BusinessTravel_Travel_Rarely = TRUE;

-- Attrition Count by Job Level
SELECT JobLevel,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount
FROM employee
GROUP BY JobLevel;

-- Work-Life Balance vs Attrition Rate
SELECT WorkLifeBalance,
       COUNT(*) AS Total,
       SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM employee
GROUP BY WorkLifeBalance;

-- Average Total Working Years by Performance Rating
SELECT PerformanceRating,
       ROUND(AVG(TotalWorkingYears), 1) AS AvgWorkingYears
FROM employee
GROUP BY PerformanceRating;

-- Attrition by Age Group
SELECT 
  CASE 
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 40 THEN '30-40'
    WHEN Age BETWEEN 41 AND 50 THEN '41-50'
    ELSE 'Above 50'
  END AS AgeGroup,
  COUNT(*) AS Total,
  SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM employee
GROUP BY AgeGroup;

-- Monthly Income by Education Field
SELECT Education,
       ROUND(AVG(MonthlyIncome), 2) AS AvgMonthlyIncome
FROM employee
GROUP BY Education;

-- Job Role vs Years at Company (Top 5 Roles)
SELECT Joblevel, 
       ROUND(AVG(YearsAtCompany), 1) AS AvgYearsAtCompany
FROM employee
WHERE Joblevel IS NOT NULL
GROUP BY Joblevel
ORDER BY AvgYearsAtCompany DESC
LIMIT 5;

-- Distance from Home and Attrition
SELECT 
  CASE 
    WHEN DistanceFromHome <= 5 THEN '0-5 km'
    WHEN DistanceFromHome <= 10 THEN '6-10 km'
    WHEN DistanceFromHome <= 20 THEN '11-20 km'
    ELSE 'Above 20 km'
  END AS DistanceGroup,
  COUNT(*) AS Total,
  SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM employee
GROUP BY DistanceGroup;

-- Attrition Rate by Marital Status
 SELECT 
  'Married' AS MaritalStatus,
  COUNT(*) AS Total,
  SUM(CASE WHEN MaritalStatus_Married = 1 THEN Attrition ELSE 0 END) AS AttritionCount,
  ROUND(100.0 * SUM(CASE WHEN MaritalStatus_Married = 1 THEN Attrition ELSE 0 END) / SUM(MaritalStatus_Married), 2) AS AttritionRate
FROM employee
UNION ALL
SELECT 
  'Single' AS MaritalStatus,
  COUNT(*) AS Total,
  SUM(CASE WHEN MaritalStatus_Single = 1 THEN Attrition ELSE 0 END) AS AttritionCount,
  ROUND(100.0 * SUM(CASE WHEN MaritalStatus_Single = 1 THEN Attrition ELSE 0 END) / SUM(MaritalStatus_Single), 2) AS AttritionRate
FROM employee;

-- Average Years in Current Role by Job Role
SELECT Joblevel,
       ROUND(AVG(YearsInCurrentRole), 1) AS AvgYearsInRole
FROM employee
GROUP BY Joblevel
ORDER BY AvgYearsInRole DESC;

--  Attrition by Stock Option Level
SELECT StockOptionLevel,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM employee
GROUP BY StockOptionLevel;

-- Training Times vs Attrition
SELECT TrainingTimesLastYear,
       COUNT(*) AS Total,
       SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM employee
GROUP BY TrainingTimesLastYear;

-- Job Involvement vs Job Satisfaction 
SELECT JobInvolvement,
       ROUND(AVG(JobSatisfaction), 2) AS AvgJobSatisfaction,
       COUNT(*) AS TotalEmployees
FROM employee
GROUP BY JobInvolvement;
