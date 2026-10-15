-- SQL Server / LocalDB. Run in SSMS or sqlcmd before testing database pages.
IF DB_ID('PracticalDB') IS NULL CREATE DATABASE PracticalDB;
GO
USE PracticalDB;
GO
IF OBJECT_ID('dbo.Students','U') IS NULL
CREATE TABLE dbo.Students (
  RollNo INT PRIMARY KEY, Name NVARCHAR(50) NOT NULL,
  Age INT NOT NULL CHECK (Age BETWEEN 1 AND 120),
  Gender NVARCHAR(10) NOT NULL, Course NVARCHAR(30) NOT NULL
);
IF OBJECT_ID('dbo.Employee','U') IS NULL
CREATE TABLE dbo.Employee (
  EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
  EmployeeName NVARCHAR(50) NOT NULL, Department NVARCHAR(30) NOT NULL,
  Salary DECIMAL(10,2) NOT NULL CHECK (Salary >= 0),
  ContactNo NVARCHAR(15) NOT NULL
);
IF OBJECT_ID('dbo.Customer','U') IS NULL
CREATE TABLE dbo.Customer (
  CustomerID INT IDENTITY(1,1) PRIMARY KEY,
  CustomerName NVARCHAR(50) NOT NULL, Email NVARCHAR(60) NOT NULL,
  Phone NVARCHAR(15) NOT NULL, Address NVARCHAR(100) NOT NULL
);
IF OBJECT_ID('dbo.Medicine','U') IS NULL
CREATE TABLE dbo.Medicine (
  MedicineID INT IDENTITY(1,1) PRIMARY KEY,
  MedicineName NVARCHAR(50) NOT NULL, Category NVARCHAR(30) NOT NULL,
  Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
  Quantity INT NOT NULL CHECK (Quantity >= 0), ExpiryDate DATE NOT NULL
);
GO
-- Demonstration rows only, inserted once when empty.
IF NOT EXISTS (SELECT 1 FROM dbo.Students)
 INSERT dbo.Students (RollNo,Name,Age,Gender,Course) VALUES
 (101,'Prince',19,'Male','BCA'),(102,'Karan',20,'Male','BCA'),
 (103,'Harshit',21,'Male','BBA'),(104,'Jeel',18,'Male','BA');
IF NOT EXISTS (SELECT 1 FROM dbo.Employee)
 INSERT dbo.Employee (EmployeeName,Department,Salary,ContactNo) VALUES
 ('Prince','IT',45000,'9568650011'),('Karan','HR',32000,'9876588022'),
 ('Harshit','Sales',38000,'9876567033');
IF NOT EXISTS (SELECT 1 FROM dbo.Customer)
 INSERT dbo.Customer (CustomerName,Email,Phone,Address) VALUES
 ('Kevin','kevin4@example.com','9876589044','Surat'),
 ('Ram','ram3@example.com','9876592033','Gandhinagar');
IF NOT EXISTS (SELECT 1 FROM dbo.Medicine)
 INSERT dbo.Medicine (MedicineName,Category,Price,Quantity,ExpiryDate) VALUES
 ('Cetirizine','Tablet',35.50,80,'2027-08-31'),
 ('Vitamin Syrup','Syrup',95.00,50,'2027-09-15');
GO
