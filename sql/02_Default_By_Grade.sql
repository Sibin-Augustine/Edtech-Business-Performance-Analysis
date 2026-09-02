SELECT 
    grade,
    COUNT(*) AS total_loans,
    SUM(is_default) AS defaults,
    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate_pct,
    CAST(AVG(int_rate) AS DECIMAL(5,2)) AS avg_interest_rate,
    CAST(AVG(loan_amnt) AS DECIMAL(12,2)) AS avg_loan_amount,
    CAST(AVG(annual_inc) AS DECIMAL(12,2)) AS avg_borrower_income
FROM loans_clean
WHERE grade IS NOT NULL AND dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100 
GROUP BY grade
ORDER BY grade;

--SELECT 
--    sub_grade,
--    COUNT(*) AS loans,
--    SUM(is_default) AS defaults,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
--    CAST(AVG(int_rate) AS DECIMAL(5,2)) AS avg_int_rate
--FROM loans_clean
--WHERE sub_grade IS NOT NULL AND dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100   
--GROUP BY sub_grade
--ORDER BY sub_grade;

--SELECT 
--    purpose,
--    COUNT(*) AS loans,
--    SUM(is_default) AS defaults,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
--    CAST(AVG(loan_amnt) AS DECIMAL(12,2)) AS avg_loan_size
--FROM loans_clean
--WHERE purpose IS NOT NULL AND dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100   
--GROUP BY purpose
--ORDER BY default_rate DESC;

--SELECT 
--    term,
--    COUNT(*) AS loans,
--    SUM(is_default) AS defaults,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
--    CAST(AVG(int_rate) AS DECIMAL(5,2)) AS avg_interest,
--    CAST(AVG(loan_amnt) AS DECIMAL(12,2)) AS avg_loan_size
--FROM loans_clean
--WHERE term IS NOT NULL AND  dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100   
--GROUP BY term
--ORDER BY term;