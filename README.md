# SQL_Project_Tomas_Smejkal ENGETO Data academy 22_04_2025

## **Zadání projektu**

### Projekt: Projekt z SQL
**Úvod do projektu**

Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

﻿

*Datové sady, které je možné požít pro získání vhodného datového podkladu*

**Primární tabulky:**

czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.
Číselníky sdílených informací o ČR:

czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.
czechia_district – Číselník okresů České republiky dle normy LAU.
Dodatečné tabulky:

countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.
﻿

**Výzkumné otázky**

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
﻿

**Výstupy z projektu**

Pomozte kolegům s daným úkolem. Výstupem by měly být dvě tabulky v databázi, ze kterých se požadovaná data dají získat. Tabulky pojmenujte ***t_{jmeno}_{prijmeni}_project_SQL_primary_final*** (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky) a ***t_{jmeno}_{prijmeni}_project_SQL_secondary_final (pro dodatečná data o dalších evropských státech)***.

Dále připravte sadu SQL, které z vámi připravených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky. Pozor, otázky/hypotézy mohou vaše výstupy podporovat i vyvracet! Záleží na tom, co říkají data.

Na svém GitHub účtu vytvořte veřejný repozitář, kam uložíte všechny informace k projektu – hlavně SQL skript generující výslednou tabulku, popis mezivýsledků (průvodní listinu) ve formátu markdown (.md) a informace o výstupních datech (například kde chybí hodnoty apod.).

Neupravujte data v primárních tabulkách! Pokud bude potřeba transformovat hodnoty, dělejte tak až v tabulkách nebo pohledech, které si nově vytváříte.

***

## **Analýza dat pro tvorbu primarní tabulky t_tomas_smejkal_project_sql_primary**

Zdroj tabulky **czechia_payroll**: https://csu.gov.cz/

Technická dokumentace zdrojové datové sady : https://csu.gov.cz/docs/107508/a7309d97-c5be-4ef4-de2f-d2962e385b93/110079-22dds.htm

### **Popis sloupců v tabulce czechia_payroll**:

id = id záznamu  unikátní identifikátor údaje Veřejné databáze ČSÚ

value 	
		- může být buď mzda v Kč.

	    - nebo počet zaměstnanců. 
	
Value_type_code 	(kódy také vyjádřené v tabulce **czechia_payroll_value_type**)

					- určuje jestli se zobrazí mzda 5958.

			        - nebo jestli počet zaměstnanců kod 316.

Unit_code 			(kódy vyjádřené také v tabulce **czechia_payroll_unit**)

					- jeslti se zobrazí cena v kč - tedy kod 200

		      		- nebo jestli je to počet zaměstnanců v tis - kod 80403

Calculation_code  (kódy vyjádřené také v tabulce **czechia_payroll_calculation**)

					- kod 100 - je fyzický počet zaměstnanců

			        - kod 200 je přepočtený počet zaměstnanců na plný úvazek
			
Payroll_year 		- rok kdy byla průměrná mzda zaznamenána

Payroll_quarter 	- kvártál z roku měření

industry_branch_code - kod měřeného odvětví (kódy vyjádřené také v tabulce **czechia_payroll_industry_branch**)

					A	Zemědělství, lesnictví, rybářství
					
					B	Těžba a dobývání

					C	Zpracovatelský průmysl

					D	Výroba a rozvod elektřiny, plynu, tepla a klimatizovaného vzduchu

					E	Zásobování vodou; činnosti související s odpadními vodami, odpady a sanacemi
					
					F	Stavebnictví
					
					G	Velkoobchod a maloobchod; opravy a údržba motorových vozidel

					H	Doprava a skladování
					
					I	Ubytování, stravování a pohostinství
					
					J	Informační a komunikační činnosti
					
					K	Peněžnictví a pojišťovnictví
					
					L	Činnosti v oblasti nemovitostí
					
					M	Profesní, vědecké a technické činnosti
					
					N	Administrativní a podpůrné činnosti
					
					O	Veřejná správa a obrana; povinné sociální zabezpečení
					
					P	Vzdělávání
					
					Q	Zdravotní a sociální péče
					
					R	Kulturní, zábavní a rekreační činnosti
					
					S	Ostatní činnosti

				

***Období dat od roku 2000 - 2021.*** 
***
Zdroj tabulky **czechia_price**: https://csu.gov.cz/

Technická dokumentace zdrojové datové sady : https://data.csu.gov.cz/datastat/info/SADA/CEN0101G

### **Popis sloupců v tabulce czechia_price**:

id = id záznamu

value - cena v czk

category_code - kod kategorie produktu (kódy též vyjádřeny v tabulce **czechia_price_category**)

				- Hovězí maso zadní bez kosti [1 kg] [0112101]
				
				- Vepřová pečeně s kostí [1 kg] [0112201]
				
				- Šunkový salám [1 kg] [0112704]
				
				- Kuřata kuchaná celá [1 kg] [0112401]
				
				- Mléko polotučné pasterované [1 l] [0114201]
				
				- Eidamská cihla [1 kg] [0114501]
				
				- Jogurt bílý netučný [150 g] [0114401]
				
				- Vejce slepičí čerstvá [10 ks] [0114701]
				
				- Máslo [1 kg] [0115101]
				
				- Rostlinný roztíratelný tuk [1 kg] [0115201]
				
				- Pšeničná mouka hladká [1 kg] [0111201]
				
				- Rýže loupaná dlouhozrnná [1 kg] [0111101]
				
				- Těstoviny vaječné [1 kg] [0111602]
				
				- Chléb konzumní kmínový [1 kg] [0111301]
				
				- Pečivo pšeničné bílé [1 kg] [0111303]
				
				- Cukr krystalový [1 kg] [0118101]
				
				- Přírodní minerální voda uhličitá [1 l] [0122102]
				
				- Jakostní víno bílé - od 2015 [0,75 l] [0212101]
				
				- Jakostní víno bílé - do 2014 [1 l] [0212104]
				
				- Pivo výčepní, světlé, lahvové [0,5 l] [0213201]
				
				- Konzumní brambory [1 kg] [0117401]
				
				- Pomeranče [1 kg] [0116101]
				
				- Banány žluté [1 kg] [0116103]
				
				- Rajská jablka červená kulatá [1 kg] [0117101]
				
				- Jablka konzumní [1 kg] [0116104]
				
				- Papriky [1 kg] [0117103]
				
				- Mrkev [1 kg] [0117106]

date_from - provedené měření od

date_to - provedené měření do

region_code - kod regionu - uzemí

				- Česko [CZ]
				
				- Hlavní město Praha [CZ010]
				
				- Středočeský kraj [CZ020]
				
				- Jihočeský kraj [CZ031]
				
				. Plzeňský kraj [CZ032]
				
				- Karlovarský kraj [CZ041]
				
				- Ústecký kraj [CZ042]
				
				- Liberecký kraj [CZ051]
				
				- Královéhradecký kraj [CZ052]
				
				- Pardubický kraj [CZ053]
				
				- Kraj Vysočina [CZ063]
				
				- Jihomoravský kraj [CZ064]
				
				- Olomoucký kraj [CZ071]
				
				- Zlínský kraj [CZ072]
				
				- Moravskoslezský kraj [CZ080]

***Období měřených dat 2006 - 2018***.
				
***Poznámka - v dokumentaci není jednoznačně uvedeno že pro celorepublikové měření je hodnota NULL.***


## **Analýza dat pro tvorbu sekundární tabulky t_tomas_smejkal_project_sql_secondary_final**

Pro vytvoření sekundární tabulky jsou k dispozici data ze dvou tabulek: **countries** a **economies**.

Popis sloupců tabulky **countries**:

						- country
						- abbreviation
						- avg_height
						- calling_code
						- capital_city
						- continent
						- currency_name
						- religion
						- currency_code
						- domain_tld
						- elevation
						- north
						- south
						- west
						- east
						- government_type
						- independence_date
						- iso_numeric
						- landlocked
						- life_expectancy
						- national_symbol
						- national_dish
						- population_density
						- population
						- region_in_world
						- surface_area
						- yearly_average_temperature
						- median_age_2018
						- iso2
						- iso3
						
**_Poznámka - detailnějsí popis sloupců není nutný, protože pro zodpovězení výzkumných otázaek není tabulka relevantní a nebude použita_**.

Popis sloupců tabulky **economies**:

						- country 	( světové státy )
						- year		(rok měření )
						- gdp		(hrubý domácí produkt - HDP za měřený rok )
						- population
						- gini
						- taxes
						- fertility
						- mortaliy_under5

			**Obsahuje data z období 1960 - 2020**

**_Poznámka - dokumentace nenalezena na stránkách statistického úřadu. Pro zodpovězení výzkumné otázky budou potřeba pouze první tři sloupce_**.

*******

## **Vytvoření primarní tabulky t_tomas_smejkal_project_sql_primary**

Pro zodpovězení výzkumných otázek 1 - 4  budu potřebovat spojit tyto tabulky :
																				
																				- czechia_price				
																				- czechia_payroll
																				- czechia_price_category
																				- czechia_payroll_industry_branch

Výsledná tabulka obsahuje tyto sloupce:

																				- price_czk
																				- category_code
																				- price_measured_from
																				- price_measured_to
																				- avg_payroll_value_czk
																				- payroll_year
																				- name                            |
																				- price_value
																				- price_unit
																				- industry_name   

	



