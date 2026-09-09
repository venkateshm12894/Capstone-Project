CREATE DATABASE Work_assignment;
USE Work_assignment;


CREATE TABLE Learners (
Learner_id Int PRIMARY KEY,
Full_name Varchar(20),
Country Varchar(10)
) ;


CREATE TABLE Courses (
Course_id Int PRIMARY KEY,
Course_name Varchar(20),
Category Varchar(20),
Unit_Price Decimal (10,2),
Learner_id Int,
FOREIGN KEY (Learner_id) REFERENCES Learners(Learner_id),
Quantity Int,
Total_Price Decimal(10,2)
) ;

INSERT INTO Learners (Learner_id, Full_name, Country)
 VALUES (1, 'Ajay', 'India'),
 (2, 'John', 'America'),
 (3, 'Ram', 'India'),
 (4, 'Helen', 'UK'),
 (5, 'Riya', 'Canada'),
 (6, 'Ram', 'India');
 

  INSERT INTO Courses (Course_id, Course_name, Category, Unit_Price, Learner_id, Quantity, Total_Price)
 VALUES (101, 'Data Analytics', 'IT', 25000.00, 1, 2, 50000.00),
 (102, 'Software Testing', 'IT', 30000.00, 2, 3, 90000.00),
 (103, 'AML', 'cyber', 25000.00, 3, 5, 125000.00),
 (104, 'Company Secretary', 'Commerce', 50000.00, 4, 6, 300000.00),
 (105, 'CFA', 'Finance', 60000.00, 5, 4, 240000.00),
 (106, 'Data Scientist', 'IT', 35000.00, 6, 3, 105000.00);

 
 
## Display each learner’s total spending (quantity × unit_price) along with their country

Select Full_name, Country, SUM(Total_Price) as Total_spending
FROM Learners
INNER JOIN Courses ON Learners.Learner_Id = Courses.Learner_Id
GROUP BY Full_name, Country
ORDER BY Total_Spending;



##Top 3 most purchased courses based on total quantity sold.

Select Course_name, SUM(Quantity) As Total_Quantity
FROM Courses
GROUP BY Course_name
ORDER BY Total_Quantity Desc
LIMIT 3;

##Show each course category’s total revenue and the number of unique learners who purchased from that category.

Select Category, SUM(Total_Price) As Total_Revenue,
COUNT(Full_name) FROM Courses
INNER JOIN Learners ON Courses.Learner_Id = Learners.Learner_Id
GROUP BY Category
ORDER BY Total_Revenue;

## List all learners who have purchased courses from more than one category- Pending

SELECT Full_name, Count(Distinct Category) As Category_Count
From Courses
INNER JOIN Learners ON Courses.Learner_Id = Learners.Learner_Id
GROUP BY Full_name
Having Count(Distinct Category) > 1;


##Identify courses that have not been purchased at all.

Select * FROM Learners
Left JOIN Courses ON Courses.Learner_Id = Learners.Learner_Id




