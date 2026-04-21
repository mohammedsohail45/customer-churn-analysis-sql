-- Customer Churn Analysis Project (SQL)

CREATE DATABASE ChurnAnalysis;
GO

USE ChurnAnalysis;
GO

-- Create Table
CREATE TABLE Customers (
    Customer_ID VARCHAR(10),
    Age INT,
    Gender VARCHAR(10),
    Plan_Type VARCHAR(20),
    Monthly_Charges INT,
    Tenure INT,
    Churn VARCHAR(5)
);
GO

-- Insert Data
INSERT INTO Customers VALUES
('C001',22,'Male','Basic',300,2,'Yes'),
('C002',35,'Female','Premium',800,12,'No'),
('C003',28,'Male','Standard',500,6,'No'),
('C004',40,'Female','Premium',900,15,'No'),
('C005',30,'Male','Basic',350,3,'Yes'),
('C006',45,'Female','Standard',600,10,'No'),
('C007',50,'Male','Premium',1000,20,'No'),
('C008',26,'Female','Basic',320,4,'Yes'),
('C009',38,'Male','Standard',550,8,'No'),
('C010',29,'Female','Premium',850,11,'No');
GO

-- Basic Analysis
SELECT COUNT(*) AS Total_Customers FROM Customers;

SELECT COUNT(*) AS Churn_Customers 
FROM Customers 
WHERE Churn = 'Yes';

SELECT 
COUNT(CASE WHEN Churn='Yes' THEN 1 END)*100.0/COUNT(*) AS Churn_Rate
FROM Customers;

-- Business Insights
SELECT Plan_Type, COUNT(*) AS Churn_Count
FROM Customers
WHERE Churn='Yes'
GROUP BY Plan_Type;

-- Average charges based on churn
SELECT Churn, AVG(Monthly_Charges) AS Avg_Charges
FROM Customers
GROUP BY Churn;

-- Top 3 highest paying customers
SELECT TOP 3 *
FROM Customers
ORDER BY Monthly_Charges DESC;

-- Customers with low tenure who churned
SELECT *
FROM Customers
WHERE Tenure < 5 AND Churn = 'Yes';

-- Plan-wise average charges
SELECT Plan_Type, AVG(Monthly_Charges) AS Avg_Charges
FROM Customers
GROUP BY Plan_Type;

-- Gender-wise churn analysis
SELECT Gender, COUNT(*) AS Churn_Count
FROM Customers
WHERE Churn='Yes'
GROUP BY Gender;