CREATE DATABASE Module;
Use Module;


CREATE TABLE Learners (
Learner_id Int PRIMARY KEY,
Full_name Varchar(20),
Country Varchar(10)
) ;

CREATE TABLE Courses (
Course_id Int PRIMARY KEY,
Course_name Varchar(20),
Category Varchar(20),
Unit_Price Decimal (10,4)
) ;

CREATE TABLE Purchases (
Purchase_id Int PRIMARY KEY,
Learner_id int,
Course_id Int,
FOREIGN KEY (Learner_id) REFERENCES Learners(Learner_id),
FOREIGN KEY (Course_id) REFERENCES Courses(Course_id),
Quantity Int,
Purchase_date DATE
) ;


 INSERT INTO Learners (Learner_id, Full_name, Country)
 VALUES (1, 'Ajay', 'India'),
 (2, 'John', 'America'),
 (3, 'Ram', 'India'),
 (4, 'Helen', 'UK'),
 (5, 'Riya', 'Canada') ;
 
 INSERT INTO Courses (Course_id, Course_name, Category, Unit_Price)
 VALUES (101, 'Data Analytics', 'IT', 25000.00),
 (102, 'Software Testing', 'IT', 30000.00),
 (103, 'AML', 'cyber', 25000.00),
 (104, 'Company Secretary', 'Commerce', 50000.00),
 (105, 'CFA', 'Finance', 60000.00) ;
 
 INSERT INTO Purchases (Purchase_Id, Learner_id, Course_id, Quantity, Purchase_Date)
 VALUES (1501, 1, 101, 3, '2018-09-08'),
 (1502, 2, 102, 5, '2019-10-11'),
 (1503, 3, 103, 4, '2020-05-07'),
 (1504, 4, 104, 6, '2020-10-09'),
 (1505, 5, 105, 9, '2021-01-05') ;
 
 ## Format currency to 2 decimal points

ALTER TABLE Courses
MODIFY Unit_Price Decimal(10,2);

## Use ALIAS Name

Select Learner_id, Full_name AS Learner_name FROM Learners;

## Sort result- sorted named in ascendding order

Select * From Learners
ORDER BY Full_name Asc;

 
 ##INNER JOIN
 
Select * From Purchases
INNER JOIN Courses ON Purchases.Course_id = Courses.Course_id
INNER JOIN Learners ON Purchases.Learner_id = Learners.Learner_id ;


Select Course_name, Category, Quantity, Unit_price, Purchase_Date
FROM Purchases
LEFT JOIN Courses ON Purchases.Course_id = Courses.Course_id;


