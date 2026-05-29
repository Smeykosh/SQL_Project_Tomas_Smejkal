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

## **Tvorba primarní tabulky t_tomas_smejkal_project_sql_primary**

Zdroj tabulky **czechia_payroll**: https://csu.gov.cz/

Technická dokumentace zdrojové datové sady : https://csu.gov.cz/docs/107508/a7309d97-c5be-4ef4-de2f-d2962e385b93/110079-22dds.htm

### **Popis sloupců v tabulce czechia_payroll**:

id = id záznamu  unikátní identifikátor údaje Veřejné databáze ČSÚ

value - může být buď mzda v Kč
	    - Nebo počet zaměstanců 
	
Value_type_code - určuje jestli se zobrazí mzda 5958
			          - nebo jestli počet zaměstnanců kod 316

Unit_code - jeslti se zobrazí cena v kč - tedy kod 200
		      - nebo jestli je to počet zaměstnanců v tis - kod 80403

Calculation_code - kod 100 - je fyzický počet zaměstnanců
			           - kod 200 je přepočtený počet zaměstnanců na plný úvazek
			
Payroll_year - rok kdy byla průměrná mzda zaznamenána

Payroll_quarter - kvártál z roku měření

***Období dat od roku 2000 - 2021.*** 

Zdroj tabulky **czechia_price**: https://csu.gov.cz/

Technická dokumentace zdrojové datové sady : https://data.csu.gov.cz/datastat/info/SADA/CEN0101G

### **Popis sloupců v tabulce czechia_price**:

id = id záznamu

value - cena v czk

category_code - kod kategorie produktu

date_from - provedené měření od

date_to - provedené měření do

region_code - kod regionu - uzemí
***Poznámka - v dokumentaci není jednoznačně uvedeno že pro celorepublikové měření je hodnota NULL.***



