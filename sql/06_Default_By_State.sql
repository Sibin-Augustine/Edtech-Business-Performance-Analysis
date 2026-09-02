SELECT TOP 10
    addr_state,
    COUNT(*) AS loans,
    SUM(is_default) AS defaults,
    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
    CAST(AVG(annual_inc) AS DECIMAL(12,2)) AS avg_income
FROM loans_clean
WHERE addr_state IS NOT NULL AND  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100
GROUP BY addr_state
HAVING COUNT(*) > 1000
ORDER BY default_rate DESC;

--SELECT TOP 10
--    addr_state,
--    COUNT(*) AS loans,
--    SUM(is_default) AS defaults,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate
--FROM loans_clean
--WHERE addr_state IS NOT NULL AND  dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100
--GROUP BY addr_state
--HAVING COUNT(*) > 1000
--ORDER BY default_rate ASC;