--disciplines_per_country
USE TokyoOlympicDB;

SELECT
  Country,
  COUNT(DISTINCT Discipline) AS num_disciplines
FROM teams
GROUP BY Country
ORDER BY num_disciplines DESC, Country;
