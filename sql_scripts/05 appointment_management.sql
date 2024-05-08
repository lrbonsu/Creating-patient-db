--Appointment Management

--Sorting by Last Appointment Date
SELECT first, last, *
FROM encounters AS e
LEFT JOIN patients AS t1
ON t1.id = e.patient
ORDER BY start DESC

--Identifying Top Organizations by Appointments
SELECT name, COUNT(name) AS num_of_appts
FROM organizations
GROUP BY name
ORDER BY COUNT(name) DESC

--Finding Inactive Patients
--subquery with anti join in WHERE statement, from different table
SELECT id, first, last
FROM patients
WHERE id NOT IN
	(SELECT patient
	FROM encounters
	WHERE start > CURRENT_DATE - INTERVAL '6 months')
