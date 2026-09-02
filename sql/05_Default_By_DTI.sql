SELECT 
    CASE 
        WHEN dti < 10 THEN '1. Low (<10)'
        WHEN dti < 20 THEN '2. Moderate (10-20)'
        WHEN dti < 30 THEN '3. High (20-30)'
        WHEN dti < 40 THEN '4. Very High (30-40)'
        ELSE '5. Extreme (40+)'
    END AS dti_bucket,
    COUNT(*) AS loans,
    SUM(is_default) AS defaults,
    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
    CAST(AVG(int_rate) AS DECIMAL(5,2)) AS avg_int_rate
FROM loans_clean
WHERE dti IS NOT NULL AND dti > 0 AND dti < 100 
  AND annual_inc > 0
   
GROUP BY 
    CASE 
        WHEN dti < 10 THEN '1. Low (<10)'
        WHEN dti < 20 THEN '2. Moderate (10-20)'
        WHEN dti < 30 THEN '3. High (20-30)'
        WHEN dti < 40 THEN '4. Very High (30-40)'
        ELSE '5. Extreme (40+)'
    END
ORDER BY dti_bucket;

--SELECT 
--    CASE 
--        WHEN int_rate < 8 THEN '1. <8%'
--        WHEN int_rate < 12 THEN '2. 8-12%'
--        WHEN int_rate < 16 THEN '3. 12-16%'
--        WHEN int_rate < 20 THEN '4. 16-20%'
--        WHEN int_rate < 25 THEN '5. 20-25%'
--        ELSE '6. 25%+'
--    END AS interest_bucket,
--    COUNT(*) AS loans,
--    SUM(is_default) AS defaults,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
--    CAST(AVG(loan_amnt) AS DECIMAL(12,2)) AS avg_loan_amt
--FROM loans_clean
--WHERE int_rate IS NOT NULL
--GROUP BY 
--    CASE 
--        WHEN int_rate < 8 THEN '1. <8%'
--        WHEN int_rate < 12 THEN '2. 8-12%'
--        WHEN int_rate < 16 THEN '3. 12-16%'
--        WHEN int_rate < 20 THEN '4. 16-20%'
--        WHEN int_rate < 25 THEN '5. 20-25%'
--        ELSE '6. 25%+'
--    END
--ORDER BY interest_bucket;

--SELECT 
--    CASE 
--        WHEN loan_amnt < 5000 THEN '1. <5K'
--        WHEN loan_amnt < 10000 THEN '2. 5K-10K'
--        WHEN loan_amnt < 20000 THEN '3. 10K-20K'
--        WHEN loan_amnt < 30000 THEN '4. 20K-30K'
--        ELSE '5. 30K+'
--    END AS loan_size,
--    COUNT(*) AS loans,
--    SUM(is_default) AS defaults,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate
--FROM loans_clean
--WHERE loan_amnt IS NOT NULL AND  dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100
--GROUP BY 
--    CASE 
--        WHEN loan_amnt < 5000 THEN '1. <5K'
--        WHEN loan_amnt < 10000 THEN '2. 5K-10K'
--        WHEN loan_amnt < 20000 THEN '3. 10K-20K'
--        WHEN loan_amnt < 30000 THEN '4. 20K-30K'
--        ELSE '5. 30K+'
--    END
--ORDER BY loan_size;

--SELECT 
--    CASE 
--        WHEN revol_util < 25 THEN '1. Low (<25%)'
--        WHEN revol_util < 50 THEN '2. Moderate (25-50%)'
--        WHEN revol_util < 75 THEN '3. High (50-75%)'
--        ELSE '4. Very High (75%+)'
--    END AS credit_util_bucket,
--    COUNT(*) AS loans,
--    SUM(is_default) AS defaults,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate
--FROM loans_clean
--WHERE revol_util IS NOT NULL AND  dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100
--GROUP BY 
--    CASE 
--        WHEN revol_util < 25 THEN '1. Low (<25%)'
--        WHEN revol_util < 50 THEN '2. Moderate (25-50%)'
--        WHEN revol_util < 75 THEN '3. High (50-75%)'
--        ELSE '4. Very High (75%+)'
--    END
--ORDER BY credit_util_bucket;