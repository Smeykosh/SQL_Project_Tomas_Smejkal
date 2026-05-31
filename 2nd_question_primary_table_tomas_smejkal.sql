
--Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?213

--Jako první a poslední porovnatelné období beru roky 2006 a 2018. Jako průměrnou mzdu beru jako průměrnou mzdu ze všech odvětví. a cenu produktu beru jako průměrnou cenu z celého ročního období.

SELECT round(((sum(avg_payroll_value_czk) / count(avg_payroll_value_czk)) / (sum(price_czk) / count(price_czk)))::NUMERIC, 2) AS products_to_buy_in_payroll_year, 
		name, payroll_year,
		round(((sum(avg_payroll_value_czk) / count(avg_payroll_value_czk)))::NUMERIC, 2) AS avg_payroll_value_czk_in_payroll_year ,
		round((sum(price_czk) / count(price_czk))::NUMERIC, 2) AS avg_product_price_in_payroll_year		
FROM t_tomas_smejkal_project_sql_primary
	WHERE name in ('Máslo', 'Chléb konzumní kmínový')
GROUP BY name, payroll_year 
	HAVING payroll_year in(2018, 2006)
ORDER BY payroll_year
;





