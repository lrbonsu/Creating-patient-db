--Billing and Payments
--subquery with semi join in WHERE statement, from different table
SELECT first, last
FROM patients
WHERE id IN
	(SELECT patient
	FROM procedures
	WHERE base_cost > 500.0)