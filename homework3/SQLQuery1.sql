USE SEDC_ACADEMY_HOMEWORK

-- Calculate the count of all grades per Teacher in the system
SELECT * FROM [dbo].[Teacher]
SELECT * FROM [dbo].[GradeDetails]
SELECT * FROM [dbo].[Grade]
SELECT t.ID, t.FirstName, t.LastName, g.TeacherID, COUNT(g.Grade) as CountGrade FROM [dbo].[Teacher] t JOIN [dbo].[Grade] g ON t.ID = g.TeacherID GROUP BY t.ID, t.FirstName, t.LastName, g.TeacherID

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT t.ID, t.FirstName, t.LastName, g.TeacherID, COUNT(g.Grade) as CountGrade FROM [dbo].[Teacher] t JOIN [dbo].[Grade] g ON t.ID = g.TeacherID WHERE g.StudentID < 100 GROUP BY t.ID, t.FirstName, t.LastName, g.TeacherID

-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.FirstName, s.LastName, SUM(g.Grade) as TotalGrade, AVG(g.Grade) as AverageGrade FROM [dbo].[Student] s JOIN [dbo].[Grade] g ON s.ID = g.StudentID GROUP BY s.FirstName, s.LastName

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName as TeacherFirstName, t.LastName as TeacherLastName, COUNT(g.Grade) as TeacherTotalGrade FROM [dbo].[Teacher] t JOIN [dbo].[Grade] g ON t.ID = g.TeacherID GROUP BY t.FirstName, t.LastName HAVING COUNT (g.Grade) >= 200

-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
-- List Student First Name and Last Name next to the other details from previous query
SELECT s.FirstName, s.LastName, COUNT(g.Grade) as CountGrade, MAX(g.Grade) as MaximalGrade, AVG(g.Grade) as AverageGrade FROM [dbo].[Grade] g JOIN [dbo].[Student] s ON s.ID = g.StudentID GROUP BY s.FirstName, s.LastName HAVING MAX(g.Grade) = AVG(g.Grade)
GO
-- Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vv_StudentGrades
AS
SELECT s.ID as StudentID, COUNT(g.Grade) as CountGrades FROM [dbo].[Student] s JOIN [dbo].[Grade] g ON s.ID = g.StudentID GROUP BY s.ID
GO

-- Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW [dbo].[vv_StudentGrades] 
AS
SELECT s.FirstName, s.LastName, COUNT(g.Grade) as CountGrades FROM [dbo].[Student] s JOIN [dbo].[Grade] g ON s.ID = g.StudentID GROUP BY s.FirstName, s.LastName
GO
-- List all rows from view ordered by biggest Grade Count
SELECT * FROM [dbo].[vv_StudentGrades] ORDER BY CountGrades DESC;