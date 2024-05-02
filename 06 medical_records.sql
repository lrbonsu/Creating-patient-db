--Medical Records

--Retrieving Patient and Physician Information
SELECT t1.id AS patient_id, t1.first, t1.last, 
	t2.provider AS provider_id, 
	t3.name AS attending_physician
FROM patients AS t1
INNER JOIN encounters AS t2
ON t1.id = t2.patient
INNER JOIN providers AS t3
ON t2.provider = t3.id

--Identifying Patients by Procedure (Screening for Domestic Abuse)
SELECT t1.id, t2.description
FROM procedures AS t2
INNER JOIN patients AS t1
ON t1.id = t2.patient
WHERE description LIKE '%domestic%'

--Identifying Patients by Medication (Lisinopril)
SELECT t1.id, t2.description
FROM medications AS t2
INNER JOIN patients AS t1
ON t1.id = t2.patient
WHERE description LIKE '%lisinopril%'