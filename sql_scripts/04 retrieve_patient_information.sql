--Retrieve Patient Information

--Basic Patient Data Retrieval:
SELECT first,last
FROM patients

--Basic Patient Data Retrieval:
SELECT first, last, address, city, state, county, zip
FROM patients
WHERE last = 'Veum823' and first = 'Ariane992'

--Admission Dates Retrieval:
SELECT patient, start
FROM encounters
WHERE start BETWEEN '2011-01-01 00:00:00' AND '2011-12-31 23:59:59'

--Age Distribution:
SELECT
    CASE
        WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', birthdate) BETWEEN 0 AND 10 THEN '0-10'
        WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', birthdate) BETWEEN 11 AND 20 THEN '11-20'
        WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', birthdate) BETWEEN 21 AND 30 THEN '21-30'
        WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', birthdate) BETWEEN 31 AND 40 THEN '31-40'
        WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', birthdate) BETWEEN 41 AND 50 THEN '41-50'
        WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', birthdate) BETWEEN 51 AND 60 THEN '51-60'
        WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', birthdate) BETWEEN 61 AND 70 THEN '61-70'
        WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', birthdate) BETWEEN 71 AND 80 THEN '71-80'
        ELSE '81+'
    END AS age_group,
    COUNT(*) AS number_of_patients
FROM patients
GROUP BY age_group
ORDER BY age_group

--Filtering by Age:
--Set up CTE
WITH age_patients AS
	(SELECT birthdate,
 	((CURRENT_DATE - birthdate)/365) AS age
 FROM patients
)
--Filter, sort, and join
SELECT first, last, age
FROM patients AS t1
LEFT JOIN age_patients AS t2
ON  t1.birthdate = t2.birthdate
WHERE age > 30
ORDER BY age ASC

--County-Based Filtering:
--subquery with semi join in WHERE statement, from same table
SELECT first, last
FROM patients
WHERE county IN
	(SELECT county
	FROM patients
	WHERE county = 'Tarrant County')
