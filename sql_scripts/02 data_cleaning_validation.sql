--Data Cleaning, Integrity, and Validation

--Identify Duplicate Patient Records
SELECT last, first
FROM patients
GROUP BY last, first
HAVING COUNT(last)> 1

--Ensure that Patient Records are Complete
SELECT id
FROM careplans
WHERE reasoncode IS NULL OR reasondescription IS NULL
