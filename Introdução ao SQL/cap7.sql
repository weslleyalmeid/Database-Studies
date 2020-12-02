-- CASE
SELECT report_code, year, month, wind_speed,
CASE
    WHEN wind_speed >= 40 THEN 'HIGH'
    WHEN wind_speed >= 30 THEN 'MODERATE'
    ELSE 'LOW'
END AS wind_severity
FROM STATION_DATA;

SELECT year,
CASE
    WHEN wind_speed >= 40 THEN 'HIGH'
    WHEN wind_speed >= 30 THEN 'MODERATE'
    ELSE 'LOW'
END AS wind_severity,
COUNT(year) AS record_count
FROM STATION_DATA
GROUP BY year, wind_severity;

--case NULL
SELECT year, month,
SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) AS tornado_precipitaion,
SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END) AS non_tornado_precipitaion
FROM STATION_DATA
GROUP BY year, month;

SELECT year,
MAX(CASE WHEN tornado = 0 THEN precipitation ELSE NULL END) AS max_non_tornado_precipitation,
MAX(CASE WHEN tornado = 1 THEN precipitation ELSE NULL END) AS max_tornado_precipitation
FROM STATION_DATA
GROUP BY year;


SELECT month,
AVG(CASE WHEN rain OR hail THEN temperature ELSE null END) AS avg_precipitation_temp,
AVG(CASE WHEN NOT(rain OR hail) THEN temperature ELSE null END) AS avg_nin_precipitation_temp
FROM STATION_DATA
WHERE year > 2000
GROUP BY month;