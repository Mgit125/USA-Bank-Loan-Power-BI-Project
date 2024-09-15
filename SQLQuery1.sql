
	
							-----KPI’s-----

1. Calculate the total loan applications received 

	SELECT 
		COUNT(id) AS Total_loan_applications_received
	FROM bank_loan_data;


2. Calculate the MTD (month-to-date) applications for the month of December

	SELECT 
		COUNT(id) AS MTD_Total_loan_applications_received_december
	FROM bank_loan_data
	WHERE
		MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;



3. Calculate the PMTD (month-to-date) applications for the month of November     --MOM month over the month


	SELECT 
		COUNT(id) AS PMTD_total_loan_applications_received_november
	FROM bank_loan_data
	WHERE
		MONTH(issue_date) = 11 AND YEAR(issue_date)= 2021;


4. Total Funded Amount by Bank


	SELECT 
		SUM(loan_amount) AS Total_funded_Amount
	FROM bank_loan_data;



5. Total Funded Amount by Bank in the month of December 2021


	SELECT 
		SUM(loan_amount) AS Total_funded_Amount_Dec_2021
	FROM bank_loan_data
	WHERE
		MONTH(issue_date) = 12
		AND
		YEAR(issue_date) = 2021;


6. Total Funded Amount by Bank in the month of November 2021 (PMTD)


	SELECT 
		SUM(loan_amount) AS Total_funded_Amount_Nov_2021
	FROM bank_loan_data
	WHERE
		MONTH(issue_date) = 11
		AND
		YEAR(issue_date) = 2021;


7. Calculate the total loan amount received by Bank

	
	SELECT * FROM bank_loan_data;

	SELECT 
		SUM(total_payment) As total_amount_collected_by_bank
	FROM bank_loan_data;



8. Calculate the total loan amount received by Bank in the month of Decemner (MTD)


	SELECT 
		SUM(total_payment) As total_amount_collected_by_bank_MTD
	FROM bank_loan_data
	WHERE
		MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;




9. Calculate the total loan amount received by Bank in the month of November (PMTD)


	SELECT 
		SUM(total_payment) As total_amount_collected_by_bank_PMTD
	FROM bank_loan_data
	WHERE
		MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;


10. Calculate the Average Interest rate for all the loans



	SELECT 
		ROUND(AVG(int_rate),4)*100 AS Average_Bank_intrest_rate
	FROM bank_loan_data;


11. Calculate the Average Interest rate for all the loans in the month December 2021 (MTD)


	SELECT 
		ROUND(AVG(int_rate), 4)*100 AS MTD_Average_Bank_intrest_rate_Dec
	FROM bank_loan_data
	WHERE
		MONTH(issue_date) = 12 AND YEAR(issue_date) =2021;


12. Calculate the Average Interest rate for all the loans in the month November 2021 (PMTD)


	SELECT
		ROUND(AVG(int_rate), 4)*100 AS PMTD_Average_Bank_intrest_rate_Nov
	FROM bank_loan_data
	WHERE
		MONTH(issue_date) = 11 AND YEAR(issue_date) =2021;


13. Calculate the Average DTI-(Dept-to-Income) ratio of customers


	SELECT 
		ROUND(AVG(dti),4)*100 AS Avg_DTI_of_customers
	FROM bank_loan_data;


14. Calculate the Average MTD-DTI-(Dept-to-Income) ratio of customers in the month of December 2021


	SELECT 
		ROUND(AVG(dti),4)*100 AS Avg_MTD_DTI_of_customers
	FROM bank_loan_data
	WHERE
	MONTH(issue_date) = 12  AND YEAR(issue_date) = 2021


15. Calculate the Average PMTD-DTI-(Dept-to-Income) ratio of customers in the month of November 2021


	SELECT 
		ROUND(AVG(dti),4)*100 AS Avg_PMTD_DTI_of_customers
	FROM bank_loan_data
	WHERE
	MONTH(issue_date) = 11  AND YEAR(issue_date) = 2021



			----- Good Loan KPI's -----


1. Find the total number of application percentage for Good loans ?


SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
	/
	COUNT(ID) AS Good_loan_percentage
FROM bank_loan_data



2. Find the total number of good loan applications?


SELECT 
	COUNT(id) AS good_loanapplications
FROM bank_loan_data
WHERE
	loan_status = 'Fully Paid' or loan_status = 'Current' ;


3.Find the total Good loan funded amount/sanctioned amount			

SELECT * FROM bank_loan_data

SELECT 
	SUM(loan_amount) AS Good_loan_funded_amount
FROM bank_loan_data
WHERE
	loan_status = 'Fully Paid' or loan_status = 'Current' ;


4. Find the Total amount received from customers for the Good loan funded amount/sanctioned amount	

	SELECT 
		SUM(total_payment) AS Good_loan_received_amount
	FROM bank_loan_data
	WHERE
		loan_status = 'Fully Paid' or loan_status = 'Current' ;






							---- Bad Loan KPI’s ----

1. Find the total number of application percentage for Bad-loans ?


	SELECT 
		(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100)
		/
		COUNT(ID) AS Bad_loan_percentage

	FROM bank_loan_data



2. Find the total number of bad loan applications?

	SELECT 
		COUNT(id) AS bad_loan_applications
	FROM bank_loan_data
	WHERE
		loan_status = 'Charged Off';



3.Find the total Bank Bad loan funded amount/sanctioned amount		


	SELECT 
		SUM(loan_amount) AS bad_loan_funded_amount
	FROM bank_loan_data
	WHERE
		loan_status = 'Charged Off';


4. Find the Total amount received from customers for the Bad loan funded amount/sanctioned amount	

	SELECT 
		SUM(total_payment) AS bad_loan_received_amount
	FROM bank_loan_data
	WHERE
		loan_status = 'Charged Off' ;


							-- Loan Status --

1. Calculate the overal Bank loan status

		SELECT 
			loan_status,
			COUNT(id) AS Total_loan_applications,
			SUM(total_payment) AS Total_amount_received,
			SUM(loan_amount) AS Total_funded_amount,
			ROUND(AVG(int_rate)*100,2) AS Avg_intrest,
			ROUND(AVG(dti)*100,2) AS DTI
		FROM bank_loan_data
		GROUP BY
			loan_status;

2. Find the loan status for the month December MTD in year 2021


		SELECT 
				loan_status,
				SUM(total_payment) AS MTD_Total_amount_received,
				SUM(loan_amount) AS MTD_Total_funded_amount
			FROM bank_loan_data
			WHERE
				MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
			GROUP BY
				loan_status;


				------ DASH BOARD 2 --------


1. Find the Monthly Trends by Issue Date

SELECT 
	MONTH(issue_date) AS month_number,
	DATENAME(MONTH, issue_date) AS Month_namee,
	COUNT(id) AS total_Applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_received_amount
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)




2. Find the State wise Bank loan analysis



SELECT 
	
	address_state AS State_name,
	COUNT(id) AS total_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_amount_received
FROM bank_loan_data
GROUP BY address_state
ORDER BY total_applications DESC;


3. Generate the report for Term-wise analysis  -- TERM --


SELECT 
	
	term,
	COUNT(id) AS total_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_amount_received
FROM bank_loan_data
GROUP BY term

4. FInd the each employee performance report   -- EMPLOYEE LENGTH --

SELECT 
	
	emp_length,
	COUNT(id) AS total_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_amount_received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(id) DESC;


5. Find the Purpose of each Loan and generate the report   --LOAN PURPOSE --


SELECT 
	
	purpose,
	COUNT(id) AS total_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_amount_received
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC;


6. Find the report for Individual financial status based on their home ownership    --HOME OWNERSHIP--


SELECT 
	home_ownership,
	COUNT(id) AS total_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_amount_received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC;