--estimated_medals_by_gender
USE TokyoOlympicDB;

WITH team_disciplines AS (
  SELECT DISTINCT Country, Discipline
  FROM teams
),
discipline_counts AS (
  SELECT Country, COUNT(*) AS discipline_count
  FROM team_disciplines
  GROUP BY Country
),
-- allocate country medals to each discipline equally (heuristic)
discipline_medal_alloc AS (
  SELECT
    m.TeamCountry AS Country,
    td.Discipline,
    m.Gold  * 1.0 / dc.discipline_count AS est_gold,
    m.Silver* 1.0 / dc.discipline_count AS est_silver,
    m.Bronze* 1.0 / dc.discipline_count AS est_bronze
  FROM medals m
  JOIN discipline_counts dc ON m.TeamCountry = dc.Country
  JOIN team_disciplines td   ON td.Country = m.TeamCountry
),
-- apply discipline-level gender participation ratios
gender_alloc AS (
  SELECT
    dma.Country,
    dma.Discipline,
    dma.est_gold,
    dma.est_silver,
    dma.est_bronze,
    eg.Female,
    eg.Male,
    eg.Total,
    CASE WHEN eg.Total IS NULL OR eg.Total = 0 THEN NULL
         ELSE dma.est_gold  * (eg.Female * 1.0 / eg.Total) END AS est_female_gold,
    CASE WHEN eg.Total IS NULL OR eg.Total = 0 THEN NULL
         ELSE dma.est_gold  * (eg.Male   * 1.0 / eg.Total) END AS est_male_gold,
    CASE WHEN eg.Total IS NULL OR eg.Total = 0 THEN NULL
         ELSE dma.est_silver* (eg.Female * 1.0 / eg.Total) END AS est_female_silver,
    CASE WHEN eg.Total IS NULL OR eg.Total = 0 THEN NULL
         ELSE dma.est_silver* (eg.Male   * 1.0 / eg.Total) END AS est_male_silver,
    CASE WHEN eg.Total IS NULL OR eg.Total = 0 THEN NULL
         ELSE dma.est_bronze* (eg.Female * 1.0 / eg.Total) END AS est_female_bronze,
    CASE WHEN eg.Total IS NULL OR eg.Total = 0 THEN NULL
         ELSE dma.est_bronze* (eg.Male   * 1.0 / eg.Total) END AS est_male_bronze
  FROM discipline_medal_alloc dma
  LEFT JOIN entriesgender eg
    ON eg.Discipline = dma.Discipline
)
SELECT
  Country,
  ROUND(SUM(COALESCE(est_female_gold,0) + COALESCE(est_female_silver,0) + COALESCE(est_female_bronze,0)),3) AS est_female_medals,
  ROUND(SUM(COALESCE(est_male_gold,0)   + COALESCE(est_male_silver,0)   + COALESCE(est_male_bronze,0)),3)   AS est_male_medals,
  ROUND(SUM(COALESCE(est_female_gold,0) + COALESCE(est_female_silver,0) + COALESCE(est_female_bronze,0)
            + COALESCE(est_male_gold,0) + COALESCE(est_male_silver,0) + COALESCE(est_male_bronze,0)),3) AS est_total_medals
FROM gender_alloc
GROUP BY Country
ORDER BY est_total_medals DESC;
