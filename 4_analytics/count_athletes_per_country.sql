-- 01_count_athletes_per_country
USE TokyoOlympicDB;

SELECT
  Country,
  COUNT(DISTINCT PersonName) AS athlete_count
FROM athletes
GROUP BY Country
ORDER BY athlete_count DESC;