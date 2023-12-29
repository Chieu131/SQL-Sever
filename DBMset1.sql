CREATE DATABASE DBMset1		
GO
USE DBMset1
GO

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(100) NOT NULL
);

CREATE TABLE Employee (
    EmpCode CHAR(6) PRIMARY KEY,
    FirstName NVARCHAR(30) NOT NULL,
    LastName NVARCHAR(30) NOT NULL,
    Birthday SMALLDATETIME NOT NULL,
    Gender BIT DEFAULT 1,
    Address NVARCHAR(100),
    DepartID INT FOREIGN KEY REFERENCES Department(DeptID),
    Salary MONEY
);

INSERT INTO Department VALUES (101, 'HR', 'Department responsible for finding employees');
INSERT INTO Department VALUES (102, 'Sales', 'Department responsible for sales');
INSERT INTO Department VALUES (103, 'Production', 'Department responsible for production');
INSERT INTO Department VALUES (104, 'Accounting', 'Department responsible for accounting');
INSERT INTO Department VALUES (105, 'Marketing', 'Department responsible for marketing');


INSERT INTO Employee VALUES ('a1', N'Chiểu', N'Đặng', '2004-01-13', 1, N'Thái Bình', 1, 300000);
INSERT INTO Employee VALUES ('a2', N'Long', N'Nguyễn', '2004-01-23', 0, N'Hà Nội', 2, 100000);
INSERT INTO Employee VALUES ('a3', N'Chung', N'Hoàng', '2004-02-06', 1, N'Nam Định', 3, 30000);
INSERT INTO Employee VALUES ('a4', N'Lan', N'Nguyễn', '2004-04-23', 0, N'Hà Nội', 2, 100000);
INSERT INTO Employee VALUES ('a5', N'Ngọc', N'Hoàng', '2004-02-15', 1, N'Nam Định', 3, 30000);
GO

UPDATE Employee SET Salary = Salary * 1.1;

GO

ALTER TABLE Employee ADD CONSTRAINT CK_Employee_Salary CHECK (Salary > 0);

GO
SELECT * FROM Department;
SELECT * FROM Employee;