--gender_participation_by_discipline
USE TokyoOlympicDB;

SELECT
  Discipline,
  Female,
  Male,
  Total,
  ROUND( CASE WHEN Total = 0 THEN 0 ELSE Female * 1.0 / Total END, 4) AS female_ratio,
  ROUND( CASE WHEN Total = 0 THEN 0 ELSE Male   * 1.0 / Total END, 4) AS male_ratio
FROM entriesgender
ORDER BY Total DESC;
