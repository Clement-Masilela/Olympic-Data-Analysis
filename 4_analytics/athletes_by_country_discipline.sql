-- athletes_by_country_discipline
USE TokyoOlympicDB;

SELECT
  Country,
  Discipline,
  COUNT(DISTINCT PersonName) AS athlete_count
FROM athletes
GROUP BY Country, Discipline
ORDER BY Country, athlete_count DESC;