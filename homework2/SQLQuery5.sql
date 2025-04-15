USE [SEDC_ACADEMY_HOMEWORK]

SELECT * FROM [dbo].[Student]

-- Find all Students with FirstName = Antonio
SELECT s.[FirstName], s.[LastName], s.[DateOfBirth] FROM [dbo].[Student] s WHERE FirstName = 'Antonio'

-- Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT s.[FirstName], s.[LastName], s.[DateOfBirth] FROM [dbo].[Student] s WHERE [DateOfBirth] >= '01.01.1999'

-- Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * FROM [dbo].[Student] s WHERE [LastName] LIKE 'J%' AND [EnrolledDate] >= '1998-01-01' AND [EnrolledDate] <= '1998-02-01'

-- List all Students ordered by FirstName
SELECT s.[FirstName], s.[LastName], s.[DateOfBirth] FROM [dbo].[Student] s ORDER BY [FirstName]

-- List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT [LastName] FROM [dbo].[Teacher]
UNION
SELECT [LastName] FROM [dbo].[Student]

-- Create Foreign key constraints from diagram or with script
ALTER TABLE [dbo].[GradeDetails]
ADD StudentId INT
ALTER TABLE [dbo].[GradeDetails]
ADD CONSTRAINT FK_GradeDetails_Student FOREIGN KEY (StudentId) REFERENCES Student(Id);

-- List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT * FROM [dbo].[Course]
SELECT * FROM [dbo].[AchievementType]
SELECT c.[Name], c.[Credit], a.[ParticipationRate] FROM [dbo].[Course] c CROSS JOIN [dbo].[AchievementType] a WHERE c.[Credit] >= 6

-- List all Teachers without exam Grade
SELECT * FROM [dbo].[Teacher]
SELECT * FROM [dbo].[Grade]
SELECT * FROM [dbo].[GradeDetails]
SELECT * FROM [dbo].[Teacher] t INNER JOIN [dbo].[Grade] g ON t.ID = g.TeacherID WHERE g.[Grade] = 0