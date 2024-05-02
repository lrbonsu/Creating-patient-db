--Data Modification

--Update the Address of a Specific Patient
UPDATE patients
SET address = '123 Mulberry Lane'
WHERE address = '533 Daniel Bypass'

--Change the Status of a Patient from "Single" to "Married"
UPDATE patients
SET marital = 'M'
WHERE last = 'Bernier607'