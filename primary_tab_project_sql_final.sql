
---Vytvoření první primární tabulky
CREATE TABLE t_tomas_smejkal_project_sql_primary AS 
SELECT 	cp.value AS price_CZK, 
		cp.category_code,
		TO_CHAR(cp.date_from, 'DD.Month YYYY') AS price_measured_from,
		TO_CHAR(CP.date_to, 'DD.MM.YYYY') AS price_measured_to,
		cpay.value AS avg_payroll_value_CZK,
		cpay.payroll_year,
		cpc.name, 
		cpc.price_value, 
		cpc.price_unit, 
		cpib.name AS industry_name 
FROM czechia_price	AS cp
JOIN czechia_payroll AS cpay
	ON date_part('year', cp.date_from) = cpay.payroll_year
	AND cpay.value_type_code = 5958
	AND unit_code = 200
	AND calculation_code = 200
	AND cp.region_code IS NULL
JOIN czechia_price_category AS cpc
	ON cp.category_code = cpc.code 
JOIN czechia_payroll_industry_branch AS cpib
	ON cpib.code = cpay.industry_branch_code
;

SELECT *
FROM t_tomas_smejkal_project_sql_primary
;

