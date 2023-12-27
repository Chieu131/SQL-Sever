create database LAB12
go
use LAB12
go
-- Tạo bảng Employee
CREATE TABLE Employee (
    EmployeeID int PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Tel char(11),
    Email varchar(30)
);
GO
-- Tạo bảng Group
CREATE TABLE Groups (
    GroupID int PRIMARY KEY,
    GroupName varchar(30),
    LeaderID int,
    ProjectID int,
    FOREIGN KEY (LeaderID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);
GO
-- Tạo bảng Project
CREATE TABLE Project (
    ProjectID int PRIMARY KEY,
    ProjectName varchar(30),
    StartDate datetime,
    EndDate datetime,
    Period int,
    Cost money
);
GO
-- Tạo bảng GroupDetail
CREATE TABLE GroupDetail (
    GroupID int,
    EmployeeID int,
    Status char(20),
    PRIMARY KEY (GroupID, EmployeeID),
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

GO
DROP  database LAB12
INSERT INTO Employee (EmployeeID, Name, Tel, Email)
VALUES (1, 'Nguyen Van A', '0123456789', 'nva@example.com');

Go
SELECT * FROM Employee;
Go
SELECT e.Name FROM Employee AS e
JOIN Project AS p ON e.ProjectID = p.ProjectID
WHERE p.ProjectName = 'Chính phủ điện tử';

Go
ALTER TABLE Employee 
MODIFY Name NOT NULL;

Go

ALTER TABLE Project
ADD CONSTRAINT CHECK (Cost > 1000);

