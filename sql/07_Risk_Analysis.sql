--SELECT 
--    grade,
--    purpose,
--    COUNT(*) AS loans,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate
--FROM loans_clean
--WHERE grade IS NOT NULL AND purpose IS NOT NULL AND  dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100
--GROUP BY grade, purpose
--HAVING COUNT(*) > 500
--ORDER BY grade, default_rate DESC;

--SELECT 
--    grade,
--    term,
--    COUNT(*) AS loans,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
--    CAST(AVG(int_rate) AS DECIMAL(5,2)) AS avg_int_rate
--FROM loans_clean
--WHERE grade IS NOT NULL AND term IS NOT NULL AND  dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100
--GROUP BY grade, term
--ORDER BY grade, term;

SELECT 
    CASE 
        WHEN grade IN ('A', 'B') AND dti < 20 AND home_ownership IN ('OWN', 'MORTGAGE') 
            THEN '1. Low Risk'
        WHEN grade IN ('C', 'D') OR (dti >= 20 AND dti < 30)
            THEN '2. Medium Risk'
        WHEN grade IN ('E', 'F', 'G') OR dti >= 30
            THEN '3. High Risk'
        ELSE '4. Undetermined'
    END AS risk_segment,
    COUNT(*) AS loans,
    SUM(is_default) AS defaults,
    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
    CAST(AVG(int_rate) AS DECIMAL(5,2)) AS avg_int_rate,
    CAST(AVG(loan_amnt) AS DECIMAL(12,2)) AS avg_loan_amt
FROM loans_clean
WHERE grade IS NOT NULL AND dti IS NOT NULL AND home_ownership IS NOT NULL AND  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100
GROUP BY 
    CASE 
        WHEN grade IN ('A', 'B') AND dti < 20 AND home_ownership IN ('OWN', 'MORTGAGE') 
            THEN '1. Low Risk'
        WHEN grade IN ('C', 'D') OR (dti >= 20 AND dti < 30)
            THEN '2. Medium Risk'
        WHEN grade IN ('E', 'F', 'G') OR dti >= 30
            THEN '3. High Risk'
        ELSE '4. Undetermined'
    END
ORDER BY risk_segment;

--SELECT 
--    grade,
--    COUNT(*) AS defaulted_loans,
--    SUM(loan_amnt) AS total_defaulted_amount,
--    SUM(total_rec_prncp) AS total_recovered_principal,
--    CAST(100.0 * SUM(total_rec_prncp) / SUM(loan_amnt) AS DECIMAL(5,2)) AS recovery_rate_pct,
--    SUM(loan_amnt) - SUM(total_rec_prncp) AS total_loss
--FROM loans_clean
--WHERE is_default = 1 AND  dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100
--GROUP BY grade
--ORDER BY grade;