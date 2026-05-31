--vytvoření sekundární tabulky
CREATE TABLE t_tomas_smejkal_project_sql_secondary_final AS 
		SELECT 	round(avg(price_czk)::NUMERIC, 2) AS avg_payroll_year_price,
				round(avg(avg_payroll_value_czk)::NUMERIC, 2) AS avg_payroll_year_value,
				payroll_year,
				e.country,
				e.gdp
		FROM t_tomas_smejkal_project_sql_primary AS ttspsp
		JOIN economies AS e
		ON ttspsp.payroll_year = e.YEAR
		AND e.country = 'Czech Republic'
		GROUP BY ttspsp.payroll_year, e.country, e.YEAR, e.gdp
		;

SELECT *
FROM t_tomas_smejkal_project_sql_secondary_final
;

