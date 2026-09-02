SELECT 
    YEAR(issue_d) AS loan_year,
    COUNT(*) AS loans_issued,
    SUM(is_default) AS defaults,
    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate,
    CAST(AVG(loan_amnt) AS DECIMAL(12,2)) AS avg_loan_size,
    CAST(AVG(int_rate) AS DECIMAL(5,2)) AS avg_interest,
    SUM(loan_amnt) / 1000000 AS total_disbursed_millions
FROM loans_clean
WHERE issue_d IS NOT NULL AND  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100
GROUP BY YEAR(issue_d)
ORDER BY loan_year;

--SELECT 
--    FORMAT(issue_d, 'yyyy-MM') AS month,
--    COUNT(*) AS loans,
--    SUM(is_default) AS defaults,
--    CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS default_rate
--FROM loans_clean
--WHERE issue_d IS NOT NULL AND  dti IS NOT NULL 
--  AND annual_inc > 0
--  AND dti < 100
--GROUP BY FORMAT(issue_d, 'yyyy-MM')
--ORDER BY month;