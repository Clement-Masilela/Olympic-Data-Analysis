-- medals_per_discipline_entered
USE TokyoOlympicDB;

WITH discipline_counts AS (
  SELECT Country, COUNT(DISTINCT Discipline) AS disciplines_entered
  FROM teams
  GROUP BY Country
)
SELECT
  m.TeamCountry AS Country,
  m.Total AS medals,
  dc.disciplines_entered,
  ROUND(m.Total * 1.0 / NULLIF(dc.disciplines_entered,0), 3) AS medals_per_discipline
FROM medals m
LEFT JOIN discipline_counts dc
  ON m.TeamCountry = dc.Country
ORDER BY medals_per_discipline DESC;
