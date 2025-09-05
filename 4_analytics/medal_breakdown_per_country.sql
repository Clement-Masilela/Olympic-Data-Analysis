--medal_breakdown_per_country
USE TokyoOlympicDB;

SELECT
  TeamCountry AS Country,
  Gold, Silver, Bronze, Total
FROM medals
ORDER BY Gold DESC, Silver DESC, Bronze DESC;
