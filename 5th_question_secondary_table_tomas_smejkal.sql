
--Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, 
--projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

SELECT 
	avg_payroll_year_price,
	round(((avg_payroll_year_price - (LAG(avg_payroll_year_price) OVER ( ORDER BY payroll_year))) / (LAG(avg_payroll_year_price) OVER (ORDER BY avg_payroll_year_price)) * 100)::NUMERIC, 2) AS price_perc_growth,
	avg_payroll_year_value,
	round(((avg_payroll_year_value - (LAG(avg_payroll_year_value) OVER ( ORDER BY payroll_year))) / (LAG(avg_payroll_year_value) OVER (ORDER BY avg_payroll_year_value)) * 100)::NUMERIC, 2) AS payroll_perc_growth,
	gdp,
	round(((gdp - (LAG(gdp) OVER ( ORDER BY payroll_year))) / (LAG(gdp) OVER (ORDER BY gdp)) * 100)::NUMERIC, 2) AS gdp_perc_growth,
	payroll_year
FROM t_tomas_smejkal_project_sql_secondary_final
;

