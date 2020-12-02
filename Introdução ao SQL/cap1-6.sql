SELECT * FROM STATION_DATA
WHERE year != 2010;

SELECT * FROM STATION_DATA
WHERE year >= 2005 AND year <= 2010;

SELECT * FROM STATION_DATA
WHERE 
month = 3 OR
month = 6 OR
month = 9 OR
month = 12;


SELECT * FROM STATION_DATA
WHERE month IN (3, 6, 8, 12);

-- COMEÇA COM A LETRA A
SELECT * FROM STATION_DATA
WHERE report_code LIKE 'A%';

SELECT * FROM STATION_DATA
WHERE report_code LIKE 'B_C%';

SELECT * FROM STATION_DATA
WHERE tornado = 1 AND hail = 1;

SELECT * FROM STATION_DATA
WHERE snow_depth IS NULL;


SELECT * FROM STATION_DATA
WHERE precipitation <= 0.5;

SELECT * FROM STATION_DATA
WHERE precipitation IS NULL OR precipitation <= 0.5;

-- PREENCHER OS VALORES NULOS COM VALOR
SELECT * FROM STATION_DATA
WHERE coalesce(precipitation, 0) <= 0.5;

SELECT 
report_code, 
coalesce(precipitation, 0) AS rainfall
FROM STATION_DATA; 

-- count para contar registros
SELECT COUNT(*) AS record_count
FROM STATION_DATA
WHERE tornado = 1;

--AGRUPANDO REGISTROS GROUP BY
SELECT 
year,
COUNT(*) AS record_count
FROM STATION_DATA
WHERE tornado = 1
GROUP BY year;

SELECT 
year,
month,
COUNT(*) AS record_count
FROM STATION_DATA
WHERE tornado = 1
GROUP BY year, month;

-- equivalente a anterior
SELECT 
year,
month,
COUNT(*) AS record_count
FROM STATION_DATA
WHERE tornado = 1
GROUP BY 1, 2;

--ORDENANDO REGISTROS ORDER BY
SELECT 
year,
month,
COUNT(*) AS record_count
FROM STATION_DATA
WHERE tornado = 1
GROUP BY year, montH
ORDER BY year DESC, month;

--FUNÇAO DE AGRAGAÇAO
SELECT 
COUNT(snow_depth) AS recorded_snow_deth_count
FROM STATION_DATA;


SELECT 
month,
ROUND(AVG(temperature), 2) AS avg_temperature
FROM STATION_DATA
WHERE year >= 2000
GROUP BY month;


SELECT
year,
ROUND(SUM(snow_depth), 2) AS total_snow
FROM STATION_DATA
WHERE year >= 2000
GROUP BY year;

SELECT 
year,
SUM(snow_depth) AS total_snow,
SUM(precipitation) AS total_precipitation,
MAX(precipitation) AS max_precipitation
FROM STATION_DATA
WHERE year >= 2000
GROUP BY year;

SELECT
year,
SUM(precipitation) AS tornado_pricipitation
FROM STATION_DATA
WHERE tornado = 1
GROUP BY year;

--INSTRUÇAO HAVING - filtro de agregaçoes
SELECT
year,
SUM(precipitation) AS total_precipitation
FROM STATION_DATA
GROUP BY year
HAVING total_precipitation > 30;

-- DISTINCT
SELECT 
DISTINCT station_number, year
FROM STATION_DATA;

SELECT temperature, year, month FROM STATION_DATA;

SELECT
MIN(year),
MAX(year)
FROM STATION_DATA;

SELECT 
year,
month,
temperature
FROM STATION_DATA
WHERE (year < 2010) AND (year > 1990) AND (month = 1)
GROUP BY year;

SELECT
COUNT(hail)
FROM STATION_DATA
WHERE tornado = 1

