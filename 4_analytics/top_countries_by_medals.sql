--top_countries_by_medals
USE TokyoOlympicDB;

SELECT TOP 50
  TeamCountry AS Country,
  Gold, Silver, Bronze, Total
FROM medals
ORDER BY Total DESC;