# SQL--Patient-Health-Insights-using-Database-of-Hospital

MediTrack: Relational Database for Patient Health Insights
________________________________________
Objective:

The aim of this project is to build a normalized SQL-based healthcare data system to track patient information, their medical appointments, and associated medication prescriptions. This project allows querying across these linked datasets to generate real-world health insights. It simulates the kind of backend data structure used by hospitals, clinics, or health-tech companies to monitor patient interactions, doctor performance, and medication trends.

________________________________________
Data Description

This health database consists of three relational tables with a one-to-many relationship among them:
________________________________________
Table 1: Patients

Column Name	         Data Type	     Description

patient_id	         INT (PK)	       Unique identifier for each patient
name	               VARCHAR	       Full name of the patient
age	                 INT	           Age in years
gender	             VARCHAR	       Gender (e.g., Male, Female, Other)
city	               VARCHAR	       City of residence
registration_date	   DATE	           Date when the patient registered in system
________________________________________


Table 2: Appointments

Column Name	         Data Type	    Description

appointment_id	     INT (PK)	      Unique ID for each appointment
patient_id	         INT (FK)	      References Patients(patient_id)
appointment_date	   DATE	          Date of the appointment
doctor_name	         VARCHAR	      Name of consulting doctor
department	         VARCHAR	      Medical department (e.g., Cardiology, General)
diagnosis	           VARCHAR	      Diagnosis made during the appointment
________________________________________
Table 3: Medications

Column Name	     Data Type	     Description

medication_id	    INT (PK)	     Unique ID for each medication prescribed
appointment_id	  INT (FK)	     References Appointments(appointment_id)
medicine_name	    VARCHAR	       Name of the medicine prescribed
dosage_per_day	  INT	           Times medicine should be taken per day
duration_days	    INT	           Number of days the medicine is prescribed for
________________________________________

Based on given table find these insight

Section 1

1.	List all patients sorted by age from oldest to youngest.

2.	Count the number of registered patients in each city.

3.	Find the average age of patients in the system.

4.	Retrieve names of the 5 most recently registered patients.

5.	Show gender distribution among all patients.

6.	Identify patients who are above 60 years old.

7.	Group patients by age range (0–18, 19–35, 36–60, 60+) and count how many are in each group.

8.	Which city has the highest number of registered patients?

9.	Display number of patients who registered in each month.

10.	Show a list of patients who registered after January 1st, 2024.

Section 2

1.	List all appointments in descending order of appointment date.

2.	Count how many appointments each doctor has handled.

3.	Identify the most frequently visited department.

4.	Get the total number of appointments recorded.

5.	Show frequency of each diagnosis in the database.

6.	How many appointments does each patient have?

7.	Find the date of the earliest appointment.

8.	List doctors who handled more than 5 appointments.

9.	Get a list of all unique diagnoses made.

10.	Show how many appointments happened each month.

Section 3

1.	Show all medicines sorted by dosage per day in descending order.

2.	Find the average prescribed duration across all medications.

3.	How many different medicines have been prescribed?

4.	Count how often each medicine was prescribed.

5.	Which medicines were prescribed for more than 10 days?

6.	Group and count medicines by dosage_per_day.

7.	Identify the most prescribed medicine overall.

8.	Show all medicines prescribed exactly 2 times a day.

9.	List medicines with longer-than-average durations.

10.	Which medicines were prescribed for less than 5 days?

________________________________________

Section 4

1.	List each patient’s name along with the dates of their appointments.

2.	Count how many appointments have occurred for each city.

3.	Identify top 3 patients with the most appointments.

4.	Get the average age of patients who were diagnosed with “Diabetes”.

5.	Which departments were visited most often by patients over 50?

6.	List all medicines prescribed along with the associated diagnosis.

7.	What is the average duration of medicine per diagnosis type?

8.	List all doctors who have prescribed the medicine “Amoxicillin”.

9.	Which diagnosis commonly results in medicines prescribed more than once per day?

10.	Count how many medicines have been prescribed per department.

________________________________________
Section  5

1.	Display each patient’s name, diagnosis, and medicine prescribed.

2.	Compute total dosage (dosage_per_day × duration_days) for each patient.

3.	Identify the top 5 patients with the longest total medication durations.

4.	Which city has the most medication prescriptions?

5.	Compare average medication duration between male and female patients.

6.	For each diagnosis, what is the average dosage per day prescribed?

7.	Count the number of medicines prescribed by each doctor.

8.	Find which department has the highest average medication duration.

9.	Identify patients who had more than one appointment and were prescribed at least two medicines.

10.	Get the list of all medicines prescribed to patients aged 60 and above.

