SELECT 'Total Loans' AS metric, CAST(COUNT(*) AS VARCHAR(20)) AS value FROM loans_clean WHERE  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100
UNION ALL SELECT 'Total Defaults', CAST(SUM(is_default) AS VARCHAR(20)) FROM loans_clean WHERE  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100
UNION ALL SELECT 'Overall Default Rate (%)', CAST(CAST(100.0 * SUM(is_default) / COUNT(*) AS DECIMAL(5,2)) AS VARCHAR(20)) FROM loans_clean
WHERE  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100

UNION ALL SELECT 'Total Loan Volume ($M)', CAST(CAST(SUM(loan_amnt)/1000000 AS DECIMAL(15,2)) AS VARCHAR(20)) FROM loans_clean
WHERE  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100
UNION ALL SELECT 'Avg Loan Size ($)', CAST(CAST(AVG(loan_amnt) AS DECIMAL(12,2)) AS VARCHAR(20)) FROM loans_clean
WHERE  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100
UNION ALL SELECT 'Avg Interest Rate (%)', CAST(CAST(AVG(int_rate) AS DECIMAL(5,2)) AS VARCHAR(20)) FROM loans_clean
WHERE  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100
UNION ALL SELECT 'Avg Borrower Income ($)', CAST(CAST(AVG(annual_inc) AS DECIMAL(12,2)) AS VARCHAR(20)) FROM loans_clean
WHERE  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100
UNION ALL SELECT 'Total Charged Off ($M)', CAST(CAST(SUM(CASE WHEN is_default=1 THEN loan_amnt-total_rec_prncp ELSE 0 END)/1000000 AS DECIMAL(15,2)) AS VARCHAR(20)) FROM loans_clean
WHERE  dti IS NOT NULL 
  AND annual_inc > 0
  AND dti < 100;