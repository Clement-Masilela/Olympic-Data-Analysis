--coaches_vs_athletes
USE TokyoOlympicDB;

WITH coach_counts AS (
  SELECT Country, COUNT(DISTINCT Name) AS num_coaches
  FROM coaches
  GROUP BY Country
),
athlete_counts AS (
  SELECT Country, COUNT(DISTINCT PersonName) AS num_athletes
  FROM athletes
  GROUP BY Country
)
SELECT
  COALESCE(a.Country, c.Country) AS Country,
  a.num_athletes,
  c.num_coaches,
  CASE WHEN a.num_athletes IS NULL OR a.num_athletes = 0 THEN NULL
       ELSE ROUND(c.num_coaches * 1.0 / a.num_athletes, 4) END AS coaches_per_athlete
FROM athlete_counts a
FULL OUTER JOIN coach_counts c
  ON a.Country = c.Country
ORDER BY coaches_per_athlete DESC;
