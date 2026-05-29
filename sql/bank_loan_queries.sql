1. SELECT COUNT(*) AS total_loan_applications
FROM credit_risk;

2. SELECT SUM(loan_amnt) AS total_loan_amount
FROM credit_risk;

3. SELECT ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate
FROM credit_risk;

4. SELECT 
  ROUND(AVG(loan_status) * 100, 2) AS default_rate_percent
FROM credit_risk;

5. SELECT 
  loan_grade,
  COUNT(*) AS total_loans,
  SUM(loan_status) AS default_loans,
  ROUND(AVG(loan_status) * 100, 2) AS default_rate
FROM credit_risk
GROUP BY loan_grade
ORDER BY default_rate DESC;

6. SELECT
  CASE
    WHEN person_income < 30000 THEN 'Low Income'
    WHEN person_income BETWEEN 30000 AND 70000 THEN 'Middle Income'
    ELSE 'High Income'
  END AS income_group,
  COUNT(*) AS total_loans,
  SUM(loan_status) AS default_loans,
  ROUND(AVG(loan_status) * 100, 2) AS default_rate
FROM credit_risk
GROUP BY income_group
ORDER BY default_rate DESC;

7. SELECT 
  loan_intent,
  COUNT(*) AS total_loans,
  SUM(loan_amnt) AS total_loan_amount
FROM credit_risk
GROUP BY loan_intent
ORDER BY total_loan_amount DESC;

8. SELECT 
  loan_grade,
  person_home_ownership,
  loan_intent,
  COUNT(*) AS total_loans,
  ROUND(AVG(loan_status) * 100, 2) AS default_rate
FROM credit_risk
GROUP BY loan_grade, person_home_ownership, loan_intent
HAVING COUNT(*) > 50
ORDER BY default_rate DESC
LIMIT 10;

9. SELECT
  loan_grade,
  ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
  ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade;

10. SELECT
  person_age,
  person_income,
  loan_amnt,
  loan_grade,
  RANK() OVER (ORDER BY loan_amnt DESC) AS loan_amount_rank
FROM credit_risk
LIMIT 20;

