SELECT * FROM bankloandashboard.loandatacsv;
use bankloandashboard;

#Total Loan Amount Funded: Measures the total value of loans disbursed
SELECT SUM(Loan_amount) AS total_loan_amount_funded
FROM loandatacsv;
 
#Total Loans: Tracks the number of loans issued.
SELECT COUNT(*) AS total_loans
FROM loandatacsv;

#Total Collection: Reflects repayment performance, including principal and interest
SELECT SUM(Total_pymnt + Interest_Amount) AS total_collection
FROM loandatacsv;

#Product Group-Wise Loan: Categorizes loans by product types (e.g., personal, auto).
SELECT purpose_category, 
       COUNT(*) AS total_loans, 
       SUM(loan_amount) AS total_loan_amount
FROM loandatacsv
GROUP BY purpose_category;

#Default Loan Count: Counts loans in default.
SELECT COUNT(*) AS default_loan_count
FROM loandatacsv
WHERE loan_status = 'Default';

#Loan Maturity: Tracks the timeline until full repayment 
SELECT client_id, 
       Disbursement_Date,
       Maturity_date, 
       DATEDIFF(Maturity_date,Disbursement_Date) AS loan_maturity_days
FROM loandatacsv;

#State-Wise Loan: Shows geographic distribution of loans
SELECT state_name, 
       COUNT(*) AS total_loans, 
       SUM(loan_amount) AS total_loan_amount
FROM loandatacsv
GROUP BY state_name;













