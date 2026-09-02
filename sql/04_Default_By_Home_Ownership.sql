--SELECT 
--    emp_length,
--    COUNT(*) AS loans,
--    SUM(is_default) AS defaults,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
--    CAST(AVG(annual_inc) AS DECIMAL(12,2)) AS avg_income
--FROM loans_clean
--WHERE emp_length IS NOT NULL AND emp_length <> '' AND  dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100
--GROUP BY emp_length
--ORDER BY 
--    CASE emp_length
--        WHEN '< 1 year' THEN 0
--        WHEN '1 year' THEN 1
--        WHEN '2 years' THEN 2
--        WHEN '3 years' THEN 3
--        WHEN '4 years' THEN 4
--        WHEN '5 years' THEN 5
--        WHEN '6 years' THEN 6
--        WHEN '7 years' THEN 7
--        WHEN '8 years' THEN 8
--        WHEN '9 years' THEN 9
--        WHEN '10+ years' THEN 10
--    END;

SELECT 
    home_ownership,
    COUNT(*) AS loans,
    SUM(is_default) AS defaults,
    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
    CAST(AVG(annual_inc) AS DECIMAL(12,2)) AS avg_income,
    CAST(AVG(loan_amnt) AS DECIMAL(12,2)) AS avg_loan_amt
FROM loans_clean
WHERE home_ownership IS NOT NULL AND  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100
GROUP BY home_ownership
ORDER BY default_rate DESC;


--SELECT 
--    CASE 
--        WHEN annual_inc < 30000 THEN '1. <30K (Low)'
--        WHEN annual_inc < 60000 THEN '2. 30K-60K (Lower Mid)'
--        WHEN annual_inc < 100000 THEN '3. 60K-100K (Upper Mid)'
--        WHEN annual_inc < 150000 THEN '4. 100K-150K (High)'
--        ELSE '5. 150K+ (Very High)'
--    END AS income_bracket,
--    COUNT(*) AS loans,
--    SUM(is_default) AS defaults,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
--    CAST(AVG(loan_amnt) AS DECIMAL(12,2)) AS avg_loan_amt,
--    CAST(AVG(dti) AS DECIMAL(5,2)) AS avg_dti
--FROM loans_clean
--WHERE annual_inc IS NOT NULL AND annual_inc > 0 AND  dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100
--GROUP BY 
--    CASE 
--        WHEN annual_inc < 30000 THEN '1. <30K (Low)'
--        WHEN annual_inc < 60000 THEN '2. 30K-60K (Lower Mid)'
--        WHEN annual_inc < 100000 THEN '3. 60K-100K (Upper Mid)'
--        WHEN annual_inc < 150000 THEN '4. 100K-150K (High)'
--        ELSE '5. 150K+ (Very High)'
--    END
--ORDER BY income_bracket;


--SELECT 
--    verification_status,
--    COUNT(*) AS loans,
--    SUM(is_default) AS defaults,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
--    CAST(AVG(annual_inc) AS DECIMAL(12,2)) AS avg_income
--FROM loans_clean
--WHERE verification_status IS NOT NULL AND  dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100
--GROUP BY verification_status
--ORDER BY default_rate DESC;