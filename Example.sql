USE AdventureWorks2022
GO 
SELECT * FROM HumanResources.Employee
SELECT * FROM HumanResources.Department WHERE DepartmentID > 15 
SELECT DepartmentID, Name, GroupName FROM HumanResources.Department WHERE DepartmentID > 15

GO 
DECLARE @deptID INT 
SELECT @deptID=12 
SELECT DepartmentID, Name, GroupName FROM HumanResources.Department
                      WHERE DepartmentID >= @deptID
GO

USE Northwind 
GO 
SELECT * FROM Categories
SELECT CategoryID, CategoryName, [Description] FROM Categories
SELECT EmployeeID, LastName, FirstName FROM Employees
SELECT TOP 1 * FROM Employees

SELECT @@LANGUAGE
SELECT @@VERSION

GO
SELECT SUM (StandardCost) FROM Production.ProductCostHistory
SELECT AVG (StandardCost) FROM Production.ProductCostHistory
SELECT MAX (StandardCost) FROM Production.ProductCostHistory
SELECT COUNT(*) AS TotalRecords FROM Production.ProductPhoto
SELECT GETDATE ()
SELECT DATEPART (hh,GETDATE())
SELECT CONVERT(VarChar(50), GETDATE(), 103)

SELECT DB_ID('AdvantureWorks')
Create database lab
Use lab
CREATE TABLE Users
(UserID VARCHAR(20),
FirstName NTEXT,
LastName Ntext,
Age INT,
Email NVARCHAR(50))
ALTER TABLE Users ADD Address NVARCHAR(50)

INSERT INTO Users values (1 ,'john', 'Doe','25','maike1@gmail.com')
INSERT INTO Users values (2 ,'Jane', 'Smith','30','maike2@gmail.com')
INSERT INTO Users values (3 ,N'Bob', 'Johnson','22','maike3@gmail.com')

SELECT * FROM Users

DELETE FROM Users WHERE UserID='maike@gmail.com'

UPDATE Users SET FirstName=N'David' WHERE UserID=3

CREATE LOGIN Example WITH PASSWORD='123456'

CREATE USER Example FROM LOGIN Example

REVOKE ALL ON Contacts FROM Example

GRANT SELECT ON Contacts TO Example
