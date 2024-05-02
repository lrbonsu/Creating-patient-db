--Time-Based Queries

--Finding the Busiest Months:
SELECT
	EXTRACT(MONTH FROM start) AS months, COUNT(EXTRACT(month FROM start)) AS total_appts
FROM encounters AS e
GROUP BY months
ORDER BY total_appts DESC

--Yearly Appointment Totals:
SELECT
	EXTRACT(YEAR FROM start) AS years, COUNT(EXTRACT(YEAR FROM start)) AS total_appts
FROM encounters
GROUP BY EXTRACT(YEAR FROM start)
ORDER BY COUNT(EXTRACT(YEAR FROM start))