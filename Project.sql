create database LAB12
go
use LAB12
go
DROP DATABASE LAB12
GO
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
-- Ví dụ thêm dữ liệu cho bảng Employee
INSERT INTO Employee (EmployeeID, Name, Tel, Email) VALUES (1, 'Nguyen Van A', '01234567891', '1nva@example.com');
INSERT INTO Employee (EmployeeID, Name, Tel, Email) VALUES (2, 'Nguyen Van B', '01234567892', '2nva@example.com');
INSERT INTO Employee (EmployeeID, Name, Tel, Email) VALUES (3, 'Nguyen Van C', '01234567893', '3nva@example.com');
INSERT INTO Employee (EmployeeID, Name, Tel, Email) VALUES (4, 'Nguyen Van D', '01234567894', '4nva@example.com');

-- Lặp lại tương tự cho các bảng khác.

Go
-- a. Hiển thị thông tin của tất cả nhân viên
SELECT * FROM Employee;

-- b. Liệt kê danh sách nhân viên đang làm dự án “Chính phủ điện tử”
SELECT e.* FROM Employee e
JOIN GroupDetail gd ON e.EmployeeID = gd.EmployeeID
JOIN Groups g ON gd.GroupID = g.GroupID
JOIN Project p ON g.ProjectID = p.ProjectID
WHERE p.ProjectName = 'Chính phủ điện tử';

-- c. Thống kê số lượng nhân viên đang làm việc tại mỗi nhóm
SELECT g.GroupID, COUNT(e.EmployeeID) AS NumberOfEmployees
FROM Groups g
JOIN GroupDetail gd ON g.GroupID = gd.GroupID
JOIN Employee e ON gd.EmployeeID = e.EmployeeID
GROUP BY g.GroupID;

-- d. Liệt kê thông tin cá nhân của các trưởng nhóm
SELECT e.* FROM Employee e
JOIN Groups g ON e.EmployeeID = g.LeaderID;

-- e. Liệt kê thông tin về nhóm và nhân viên đang làm các dự án có ngày bắt đầu làm trước ngày 12/10/2010
SELECT g.*, e.* FROM Groups g
JOIN GroupDetail gd ON g.GroupID = gd.GroupID
JOIN Employee e ON gd.EmployeeID = e.EmployeeID
JOIN Project p ON g.ProjectID = p.ProjectID
WHERE p.StartDate < '2010-10-12';

-- f. Liệt kê tất cả nhân viên dự kiến sẽ được phân vào các nhóm làm việc
SELECT e.* FROM Employee e
LEFT JOIN GroupDetail gd ON e.EmployeeID = gd.EmployeeID
WHERE gd.Status = 'sắp làm';

-- g. Liệt kê tất cả thông tin về nhân viên, nhóm làm việc, dự án của những dự án đã hoàn thành
SELECT e.*, g.*, p.* FROM Employee e
JOIN GroupDetail gd ON e.EmployeeID = gd.EmployeeID
JOIN Groups g ON gd.GroupID = g.GroupID
JOIN Project p ON g.ProjectID = p.ProjectID
WHERE p.EndDate IS NOT NULL;

Go

-- a. Trường tên nhân viên không được null
ALTER TABLE Employee
MODIFY Name varchar(100) NOT NULL;

-- b. Trường giá trị dự án phải lớn hơn 1000
ALTER TABLE Project
ADD CONSTRAINT CheckCost CHECK (Cost > 1000);
