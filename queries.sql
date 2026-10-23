-- Conversion by contact channel
SELECT contact, COUNT(*) AS contacts, SUM(converted) AS conversions,
ROUND(100.0*SUM(converted)/COUNT(*),2) AS conv_rate
FROM campaign GROUP BY contact ORDER BY conv_rate DESC;

-- Conversion by month
SELECT month, COUNT(*) AS contacts, SUM(converted) AS conversions,
ROUND(100.0*SUM(converted)/COUNT(*),2) AS conv_rate
FROM campaign GROUP BY month ORDER BY conv_rate DESC;

-- Conversion by job
SELECT job, COUNT(*) AS contacts, SUM(converted) AS conversions,
ROUND(100.0*SUM(converted)/COUNT(*),2) AS conv_rate
FROM campaign GROUP BY job ORDER BY conv_rate DESC;

-- Conversion by previous campaign outcome
SELECT poutcome, COUNT(*) AS contacts, SUM(converted) AS conversions,
ROUND(100.0*SUM(converted)/COUNT(*),2) AS conv_rate
FROM campaign GROUP BY poutcome ORDER BY conv_rate DESC;

-- Conversion by age group
SELECT age_group, COUNT(*) AS contacts, SUM(converted) AS conversions,
ROUND(100.0*SUM(converted)/COUNT(*),2) AS conv_rate
FROM campaign GROUP BY age_group ORDER BY conv_rate DESC;

-- Conversion by number of contact attempts
SELECT CASE WHEN campaign=1 THEN '1' WHEN campaign<=3 THEN '2-3'
WHEN campaign<=6 THEN '4-6' ELSE '7+' END AS attempts,
COUNT(*) AS contacts, ROUND(100.0*SUM(converted)/COUNT(*),2) AS conv_rate
FROM campaign GROUP BY attempts;