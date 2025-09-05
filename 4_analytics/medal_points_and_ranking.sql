-- medal_points_and_ranking
USE TokyoOlympicDB;

WITH medal_points AS (
  SELECT
    TeamCountry AS Country,
    Gold, Silver, Bronze, Total,
    (Gold*3 + Silver*2 + Bronze*1) AS MedalPoints
  FROM medals
)
SELECT
  Country,
  Gold, Silver, Bronze, Total, MedalPoints,
  DENSE_RANK() OVER (ORDER BY Gold DESC, Silver DESC, Bronze DESC) AS rank_podium,
  RANK()       OVER (ORDER BY MedalPoints DESC, Gold DESC)    AS rank_by_points
FROM medal_points
ORDER BY rank_by_points, Country;
