-- HR Analytics: Employee Attrition Analysis

-- 1. Total Employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- 2. Total Attrition
SELECT COUNT(*) AS attrition_count
FROM employees
WHERE Attrition = 'Yes';

-- 3. Attrition Rate
SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate
FROM employees;

-- 4. Attrition by Department
SELECT 
    Department,
    COUNT(*) AS employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY Department
ORDER BY attrition_count DESC;

-- 5. Attrition by Gender
SELECT 
    Gender,
    COUNT(*) AS employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY Gender;

-- 6. Attrition by Job Role
SELECT 
    JobRole,
    COUNT(*) AS employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY JobRole
ORDER BY attrition_count DESC;

-- 7. Overtime vs Attrition
SELECT 
    OverTime,
    COUNT(*) AS employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY OverTime;

-- 8. Average Monthly Income by Attrition
SELECT 
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM employees
GROUP BY Attrition;

-- 9. Average Years at Company by Attrition
SELECT 
    Attrition,
    ROUND(AVG(YearsAtCompany), 2) AS avg_years_at_company
FROM employees
GROUP BY Attrition;

-- 10. Job Satisfaction vs Attrition
SELECT 
    JobSatisfaction,
    COUNT(*) AS employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;