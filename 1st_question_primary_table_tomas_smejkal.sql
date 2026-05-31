--Výzkumná otázka 1 - Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
SELECT avg(avg_payroll_value_CZK), industry_name, payroll_year
FROM t_tomas_smejkal_project_sql_primary
GROUP BY industry_name, payroll_year  
ORDER BY industry_name, payroll_year, avg 
;