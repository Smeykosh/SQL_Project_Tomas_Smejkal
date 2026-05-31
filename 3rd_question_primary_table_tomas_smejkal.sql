--Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? 
-- minimální přirůstek v roce
SELECT round(((max(ttspsp.price_czk) - min(ttspsp.price_czk ))/ min(ttspsp.price_czk) * 100 )::NUMERIC, 2) AS price_percent_enc_in_payroll_year, 
		ttspsp.payroll_year , 
		ttspsp."name" 
FROM t_tomas_smejkal_project_sql_primary ttspsp 
GROUP BY payroll_year, name 
ORDER BY price_percent_enc_in_payroll_year asc, payroll_year
LIMIT 1
;

