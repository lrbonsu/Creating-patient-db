--Data Analytics
--Calculate the Rounded Average Age of All Patients:
SELECT ROUND(AVG((CURRENT_DATE - birthdate)/365))
FROM patients

--Calculate the Standard Deviation of Patient Ages:
--Set up CTE
WITH age_patients AS
	(SELECT birthdate,
 	((CURRENT_DATE - birthdate)/365) AS age
 FROM patients
)
--STDDEV query
SELECT STDDEV(age)
FROM patients AS t1
INNER JOIN age_patients AS t2
ON t1.birthdate = t2.birthdate

--Determine Total Number of Patients by Race and Ethnicity:
--Find distinct race types
SELECT DISTINCT race 
FROM patients
--Find distinct ethnicity types
SELECT DISTINCT ethnicity
FROM patients
--Create new categorical variable from two columns and determine counts
SELECT
COUNT (CASE WHEN race = 'hawaiian' AND ethnicity = 'nonhispanic' THEN 1 
	   END) AS hawaiian_nonhispanic,   
COUNT (CASE	WHEN race = 'hawaiian' AND ethnicity = 'hispanic' THEN 1 
	   END) AS hawaiian_hispanic,
COUNT (CASE WHEN race = 'native' AND ethnicity = 'nonhispanic' THEN 1 
	   END) AS native_nonhispanic,
COUNT (CASE	WHEN race = 'native' AND ethnicity = 'hispanic' THEN 1 
	   END) AS native_hispanic,
COUNT (CASE	WHEN race = 'black' AND ethnicity = 'nonhispanic' THEN 1 
	   END) AS black_nonhispanic,
COUNT (CASE	WHEN race = 'black' AND ethnicity = 'hispanic' THEN 1 
	   END) AS black_hispanic,
COUNT (CASE	WHEN race = 'white' AND ethnicity = 'nonhispanic' THEN 1 
	   END) AS white_nonhispanic,
COUNT (CASE	WHEN race = 'white' AND ethnicity = 'hispanic' THEN 1 
	   END) AS white_hispanic,
COUNT (CASE	WHEN race = 'asian' AND ethnicity = 'nonhispanic' THEN 1 
	   END) AS asian_nonhispanic,
COUNT (CASE	WHEN race = 'asian' AND ethnicity = 'hispanic' THEN 1 
	   END) AS asian_hispanic,
COUNT (CASE	WHEN race = 'other' AND ethnicity = 'nonhispanic' THEN 1 
	   END) AS other_nonhispanic,
COUNT (CASE	WHEN race = 'other' AND ethnicity = 'hispanic' THEN 1 
	   END) AS other_hispanic,
COUNT (CASE	WHEN race = 'other' AND ethnicity = 'nonhispanic' THEN 1 
	   END) AS other_nonhispanic
FROM patients

--cleaner version of same query above
SELECT race,
	COUNT (CASE WHEN ethnicity = 'nonhispanic' THEN 1 END) AS race_nonhispanic,   
	COUNT (CASE WHEN ethnicity = 'hispanic' THEN 1 END) AS race_hispanic
FROM patients
GROUP BY race

--Find the Patient with the Most Appointments: 
SELECT t1.id, COUNT(t1.id) AS num_of_appts
FROM encounters AS e
INNER JOIN patients AS t1
ON e.patient = t1.id
GROUP BY t1.id
ORDER BY COUNT(t1.id) DESC