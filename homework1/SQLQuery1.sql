USE master

CREATE DATABASE SEDCACADEMYDB
GO

USE SEDCACADEMYDB;
GO

CREATE TABLE Students(
Id INT IDENTITY(1,1) NOT NULL,
FirstName NVARCHAR(30) NOT NULL,
DateOfBirth DATE NOT NULL,
EnrolledBirth BIT NOT NULL,
Gender NVARCHAR(6) NOT NULL,
NationalIDNumber BIGINT NOT NULL,
StudentCardNumber BIGINT NOT NULL
)
GO

INSERT INTO dbo.Students (FirstName, DateOfBirth, EnrolledBirth, Gender, NationalIDNumber, StudentCardNumber)
VALUES ('Filip', '2005-09-03', 1, 'Male', 1234567890123, 9876543210123)
GO

INSERT INTO dbo.Students (FirstName, DateOfBirth, EnrolledBirth, Gender, NationalIDNumber, StudentCardNumber)
VALUES ('Mihail', '2002-03-02', 1, 'Male', 8438565840890, 3457771216652),
       ('Ivana', '2001-11-10', 1, 'Female', 3457771216652, 8438565840890)
GO

SELECT * FROM dbo.Students
GO

CREATE TABLE Teachers(
Id INT IDENTITY(1,1) NOT NULL,
FirstName NVARCHAR(30) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
DateOfBirth DATE NOT NULL,
AcademicRank NVARCHAR(30) NOT NULL,
HireDate DATE NOT NULL
)
GO

INSERT INTO dbo.Teachers(FirstName, LastName, DateOfBirth, AcademicRank, HireDate)
VALUES ('Andrea', 'Trajanoska', '1991-02-20', 'Professor', '2008-08-27'),
       ('Dimitar', 'Petreski', '1992-03-27', 'Lecturer', '2003-11-07'),
	   ('Antonio', 'Krstanoski', '1989-09-11', 'Director', '2000-10-30')
GO

SELECT * FROM dbo.Teachers
GO

CREATE TABLE Grades(
Id INT IDENTITY(1,1) NOT NULL,
StudentID INT NOT NULL,
CourseID INT NOT NULL,
TeacherID INT NOT NULL,
Grade DECIMAL NOT NULL,
Comment NVARCHAR(200) NOT NULL,
CreatedDate DATETIME DEFAULT GETDATE()
)
GO

INSERT INTO dbo.Grades (StudentID, CourseID, TeacherID, Grade, Comment)
VALUES (1, 2, 2, 3.5, 'Dobar si!'),
       (2, 3, 1, 2.5, 'Dovolen si!'),
	   (8, 1, 10, 5.0, 'Odlicen si!')
GO

SELECT * FROM dbo.Grades

CREATE TABLE Course(
Id INT IDENTITY(1,1) NOT NULL,
Name NVARCHAR(30) NOT NULL,
Credit INT NOT NULL,
AcademicYear  NVARCHAR(9) NOT NULL,
Semester  NVARCHAR(10) NOT NULL,
)
GO

INSERT INTO dbo.Course (Name, Credit, AcademicYear, Semester)
VALUES 
    ('Mathematics', 6, '2024-2025', 'Fall'),
    ('Physics', 5, '2024-2025', 'Spring'),
    ('Chemistry', 4, '2023-2024', 'Fall')
GO

SELECT * FROM dbo.Course

CREATE TABLE GradeDetails(
Id INT IDENTITY(1,1) NOT NULL,
GradeID INT NOT NULL,
AchievementTypeID INT NOT NULL,
AchievementPoints INT NOT NULL,
AchievementMaxPoints INT NOT NULL,
AchievementDate DATE NOT NULL
)
GO

INSERT INTO dbo.GradeDetails (GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
VALUES (1, 1, 45, 50, '2025-04-09'),
       (2, 2, 80, 100, '2025-03-15'),
       (1, 3, 90, 100, '2025-02-20')
GO

SELECT * FROM dbo.GradeDetails

CREATE TABLE AchievementType(
Id INT IDENTITY(1,1) NOT NULL,
Name NVARCHAR(30) NOT NULL,
Description NVARCHAR(60) NOT NULL,
ParticipationRate DECIMAL NOT NULL
)
GO

INSERT INTO dbo.AchievementType (Name, Description, ParticipationRate)
VALUES 
    ('Project', 'Completed group project on database design', 80.10),
    ('Exam', 'Final written exam for the course', 95.05),
    ('Assignment', 'Individual homework assignment on SQL', 70.21)
GO

SELECT * FROM dbo.AchievementType