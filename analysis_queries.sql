--CREATE A DATABASE 
CREATE DATABASE HOSPITAL; --CREATE A TABLE 
CREATE TABLE hospital_data ( 
    Hospital_Name VARCHAR(100), 
    Location VARCHAR(100), 
    Department VARCHAR(100), 
    Doctors_Count INT, 
    Patients_Count INT, 
    Admission_Date DATE, 
    Discharge_Date DATE, 
    Medical_Expenses DECIMAL(10,2) 
); 
 
SELECT * FROM hospital_data; 
 -- Import Data into hospital_data 
COPY hospital_data 
(Hospital_Name,Location,Department,Doctors_Count,Patients_Count,Admission_Dat
e,Discharge_Date,Medical_Expenses 
)  
FROM 'C:\Users\anjal\Desktop\SQL\Hospital_Data.csv'  
CSV HEADER; 
 --1 Write an SQL query to find the total number of patients across all hospitals. 
 
   SELECT SUM(Patients_Count) AS total_patients 
   FROM hospital_data; 
  
-- 2Retrieve the average count of doctors available in each hospital.  
 
   SELECT AVG(Doctors_Count) AS avg_doctors_per_hospital 
   FROM hospital_data; 
  --3Find the top 3 hospital departments that have the highest number of patients. 
 
    SELECT Department, SUM(Patients_Count) AS total_patients 
     FROM hospital_data 
     GROUP BY Department 
     ORDER BY total_patients DESC 
     LIMIT 3; 
  --4 Identify the hospital that recorded the highest medical expenses.  
 
SELECT Hospital_Name, 
       SUM(Medical_Expenses) AS total_expenses 
       FROM hospital_data 
       GROUP BY Hospital_Name 
       ORDER BY total_expenses DESC 
       LIMIT 1; 
 
  -- 5Calculate the average medical expenses per day for each hospital. 
 
SELECT Hospital_Name, 
       Admission_Date, 
       AVG(Medical_Expenses) AS avg_daily_expenses 
       FROM hospital_data 
       GROUP BY Hospital_Name, Admission_Date; 
  --6 Find the patient with the longest stay by calculating the diAerence between  
              --Discharge Date and Admission Date. 
    
SELECT  Hospital_Name, 
        Department, 
       (Discharge_Date - Admission_Date) AS stay_days 
       FROM hospital_data 
       ORDER BY stay_days DESC 
       LIMIT 1; 
   -- 7Count the total number of patients treated in each city. 
 
SELECT Location, 
       SUM(Patients_Count) AS total_patients 
       FROM hospital_data 
       GROUP BY Location; 
     -- 8Calculate the average number of days patients spend in each department. 
 
SELECT Department, 
    AVG(Discharge_Date - Admission_Date) AS avg_stay_days 
    FROM hospital_data 
    GROUP BY Department; 
 --9 Find the department with the least number of patients. 
 
SELECT Department, 
       SUM(Patients_Count) AS total_patients 
       FROM hospital_data 
       GROUP BY Department 
       ORDER BY total_patients ASC 
       LIMIT 1; 
      --10 Group the data by month and calculate the total medical expenses for each month. 
 
    SELECT  
       EXTRACT(MONTH FROM Admission_Date) AS month, 
       SUM(Medical_Expenses) AS total_expenses 
       FROM hospital_data 
       GROUP BY EXTRACT(MONTH FROM Admission_Date) 
       ORDER BY month; 
