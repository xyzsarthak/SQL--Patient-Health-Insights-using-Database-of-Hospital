

CREATE DATABASE MEDICAL_PROJECT

USE MEDICAL_PROJECT

SELECT * FROM MEDICATIONS

SELECT * FROM Patients


-- SECTION 1

--1 all patients sorted by age from oldest to youngest

SELECT NAME FROM PATIENTS 
ORDER BY AGE DESC

--2  number of registered patients in each city

SELECT COUNT(PATIENT_ID)[REGISTERED PATIENTS],CITY FROM PATIENTS
GROUP BY CITY


--3 average age of patients in the system

SELECT AVG(AGE)[AVERAGE AGE OF PATIENTS] FROM PATIENTS

--4 names of the 5 most recently registered patients

SELECT  TOP 5 NAME,REGISTRATION_DATE FROM PATIENTS
ORDER BY REGISTRATION_DATE DESC

--5 gender distribution among all patients

SELECT GENDER,
COUNT(GENDER)[GENDER DISTRIBUTION]
FROM PATIENTS
GROUP BY GENDER

--6 patients who are above 60 years old

SELECT NAME,AGE FROM PATIENTS
WHERE AGE>60

--7 Patients by age range (0–18, 19–35, 36–60, 60+) and count in each group.

SELECT
COUNT( CASE 
WHEN   AGE BETWEEN 0 AND 18 THEN patient_id ELSE NULL END )[0-18], 
COUNT ( CASE WHEN AGE BETWEEN 19 AND 35 THEN PATIENT_ID ELSE NULL END)[19-35],
COUNT ( CASE WHEN AGE BETWEEN 36 AND 60 THEN PATIENT_ID ELSE NULL END )[26-60],
COUNT (CASE WHEN AGE >60 THEN PATIENT_ID ELSE NULL END )[60+]
FROM PATIENTS

--8 City having the highest number of registered patients

SELECT MAX(CITY)[CITY WITH HIGHEST PATIENTS]
FROM (SELECT 
COUNT(PATIENT_ID)[REGISTERED PATIENTS],CITY FROM PATIENTS
GROUP BY CITY) AS T1

--9 number of patients registered in each month

SELECT MONTH(REGISTRATION_DATE)[MONTH OF REGISTRATION]
,COUNT(PATIENT_ID)[NUMBER OF PATIENTS REGISTERED]
FROM PATIENTS
GROUP BY MONTH(REGISTRATION_DATE)

--10 list of patients who registered after January 1st, 2024.

SELECT NAME,REGISTRATION_DATE FROM Patients
WHERE REGISTRATION_DATE>'2024-01-01 00:00:00.000';


--SECTION 2

--1 all appointments in descending order of appointment date

SELECT * FROM Appointments 
ORDER BY appointment_date DESC

--2 Number of appointments each doctor has handled

SELECT COUNT(patient_id)[Number of Patients], doctor_name  from Appointments
group by doctor_name

--3  most frequently visited department

SELECT TOP 1  DEPARTMENT FROM Appointments
GROUP BY department
ORDER BY COUNT(DEPARTMENT) DESC

--4  total number of appointments recorded

select count(appointment_id)[TOTAL APPOINTMRNTS] from Appointments

--5 frequency of each diagnosis in the database

SELECT DIAGNOSIS,COUNT(DIAGNOSIS)[FREQUENCY] FROM Appointments
GROUP BY  DIAGNOSIS

--6 Number of appointments  each patient has

SELECT PATIENT_ID,COUNT(PATIENT_ID)[NUMBER OF APPOINTMENTS] FROM APPOINTMENTS
GROUP BY patient_id

--7 date of the earliest appointment

SELECT MIN(APPOINTMENT_DATE)[EARLIEST APPOINTMENT] FROM Appointments

--8 doctors who handled more than 5 appointments
 
SELECT doctor_name,count(doctor_name)[app.> 5]
from Appointments
group by doctor_name
having  COUNT(doctor_name) > 5

--9 list of all unique diagnoses made

select distinct diagnosis from Appointments

--10 Number of appointments happened each month

select month (appointment_date)[MONTH],count( patient_id)[NO. OF appointments] from Appointments
group by month (appointment_date)


--SECTION 3

select * from Medications

--1 all medicines sorted by dosage per day in descending order

SELECT medicine_name FROM Medications
order by dosage_per_day desc

--2 average prescribed duration across all medications

select AVG(duration_days)[Average Duration] from Medications

--3 Number of different medicines prescribed

select distinct count(medicine_name)[MEDICINES] from Medications

--4 Frequency of each medicine was prescribed

SELECT MEDICINE_NAME,COUNT(MEDICINE_NAME)[NO. OF TIMES PRESCRIBED] FROM MEDICATIONS
GROUP BY MEDICINE_NAME

--5 medicines  prescribed for more than 10 days

SELECT MEDICINE_NAME FROM MEDICATIONS
WHERE duration_days>10

--6 count medicines by dosage_per_day.

SELECT DOSAGE_PER_DAY,COUNT(MEDICINE_NAME)[NO. OF MEDICINES] FROM Medications
GROUP BY DOSAGE_PER_DAY

--7 the most prescribed medicine overall

SELECT  TOP 1 medicine_name FROM (SELECT MEDICINE_NAME,COUNT(MEDICINE_NAME)[NO. OF TIMES PRESCRIBED] FROM MEDICATIONS
GROUP BY MEDICINE_NAME) AS T1
ORDER BY [NO. OF TIMES PRESCRIBED] DESC

--8 all medicines prescribed exactly 2 times a day

SELECT DISTINCT  MEDICINE_NAME FROM Medications
WHERE dosage_per_day=2

--9 medicines with longer-than-average durations

SELECT distinct  medicine_name  from Medications
where duration_days>( select AVG(duration_days) from Medications)

--10 medicines prescribed for less than 5 days

SELECT DISTINCT  MEDICINE_NAME FROM Medications
WHERE dosage_per_day<5



--SECTION 4 (JOINS)

SELECT * FROM Patients

SELECT * FROM Appointments

--1 patient’s name along with the dates of their appointments

SELECT  NAME,APPOINTMENT_DATE FROM Patients INNER JOIN Appointments ON Patients.patient_id=Appointments.patient_id
ORDER BY NAME 

--2 Number of appointments occurred in  each city

SELECT CITY , COUNT(APPOINTMENT_ID)[NO. OF APPOINTMENTS] FROM Patients INNER JOIN Appointments ON Patients.patient_id=Appointments.patient_id
GROUP BY CITY

--3 top 3 patients with the most appointments.

SELECT TOP 3 NAME FROM  Patients INNER JOIN Appointments ON Patients.patient_id=Appointments.patient_id
GROUP BY NAME
ORDER BY COUNT(APPOINTMENT_DATE) DESC

--4 the average age of patients who were diagnosed with “Diabetes”.

SELECT AVG(AGE)[AVG AGE OF DIABETIC] FROM Patients INNER JOIN Appointments ON Patients.patient_id=Appointments.patient_id
WHERE diagnosis='DIABETES'

--5 departments which  were visited most often by patients over 50

SELECT TOP 1 DEPARTMENT FROM Patients INNER JOIN Appointments ON Patients.patient_id=Appointments.patient_id
WHERE AGE >50
GROUP BY department
ORDER BY COUNT(DEPARTMENT) DESC

-------
SELECT * FROM Medications
SELECT * FROM Appointments
---------

--6 all medicines prescribed along with the associated diagnosis.

SELECT DISTINCT  MEDICINE_NAME, DIAGNOSIS FROM MEDICATIONS INNER JOIN Appointments ON Medications.appointment_id=Appointments.appointment_id

--7 average duration of medicine per diagnosis type

SELECT  DIAGNOSIS,AVG(DURATION_DAYS)[AVG DURATION]  FROM MEDICATIONS INNER JOIN Appointments ON Medications.appointment_id=Appointments.appointment_id
GROUP BY diagnosis

--8 all doctors who have prescribed the medicine “Amoxicillin”.

SELECT DISTINCT DOCTOR_NAME FROM MEDICATIONS INNER JOIN Appointments ON Medications.appointment_id=Appointments.appointment_id
WHERE medicine_name='AMOXICILLIN'

--9 diagnosis commonly results in medicines prescribed more than once per day

SELECT DISTINCT  DIAGNOSIS FROM MEDICATIONS INNER JOIN Appointments ON Medications.appointment_id=Appointments.appointment_id
WHERE dosage_per_day>1

--10 Number of  medicines prescribed per department.

SELECT DEPARTMENT,COUNT(MEDICINE_NAME)[NO. OF MEDICINES] FROM MEDICATIONS INNER JOIN Appointments ON Medications.appointment_id=Appointments.appointment_id
GROUP BY DEPARTMENT


--SECTION 5 (JOINS ON MULTIPLE TABLES)

SELECT * FROM Patients
SELECT * FROM Medications
SELECT * FROM Appointments

 
--1 patient’s name, diagnosis, and medicine prescribed.

select name,diagnosis,medicine_name
from Appointments inner join Medications on Appointments.appointment_id=Medications.appointment_id inner join Patients on
Appointments.patient_id=Patients.patient_id

-- 2  total dosage (dosage_per_day × duration_days) for each patient

select distinct
name,(
dosage_per_day*duration_days)as total_dosage 
from Appointments inner join Medications on Appointments.appointment_id=Medications.appointment_id inner join Patients on
Appointments.patient_id=Patients.patient_id

--3  top 5 patients with the longest total medication durations

select top 5 name,
sum(duration_days) as [sum of duration] from
Appointments inner join Medications on Appointments.appointment_id=Medications.appointment_id inner join Patients on
Appointments.patient_id=Patients.patient_id
group by name 
order by [sum of duration] desc

--4 city having the most medication prescriptions

select top 1 
city from 
Appointments inner join Medications on Appointments.appointment_id=Medications.appointment_id inner join Patients on
Appointments.patient_id=Patients.patient_id
group by city
order by count(medication_id) desc

--5 average medication duration between male and female patients

select gender,
AVG(duration_days) as [Avg medication duration]
from Appointments inner join Medications on Appointments.appointment_id=Medications.appointment_id inner join Patients on
Appointments.patient_id=Patients.patient_id
group by gender

--6  the average dosage per day prescribed for each diagnosis

select diagnosis,avg(dosage_per_day) as [Avg Dosage]
from Appointments inner join Medications on Appointments.appointment_id=Medications.appointment_id inner join Patients on
Appointments.patient_id=Patients.patient_id
group by diagnosis

--7 number of medicines prescribed by each doctor

select doctor_name,count(medicine_name) as [number of medicines] from 
 Appointments inner join Medications on Appointments.appointment_id=Medications.appointment_id inner join Patients on
Appointments.patient_id=Patients.patient_id
group by doctor_name

--8 department having the highest average medication duration

select top 1 department 
from Appointments inner join Medications on Appointments.appointment_id=Medications.appointment_id
group by department 
order by avg(duration_days) desc

-- 9 patients who had more than one appointment and were prescribed at least two medicines.

select name from (SELECT name ,count(appointment_date)[Total Appointments], count(medicine_name)[Number of Medicines Prescribed]
from Patients inner join Appointments on Patients.patient_id=Appointments.patient_id inner join Medications on Medications.appointment_id=Appointments.appointment_id
group by name) as sub
where [Total Appointments] >1 and [Number of Medicines Prescribed]>=2

--10 the list of all medicines prescribed to patients aged 60 and above

select medicine_name from
 Appointments inner join Medications on Appointments.appointment_id=Medications.appointment_id inner join Patients on
Appointments.patient_id=Patients.patient_id
where age >60




