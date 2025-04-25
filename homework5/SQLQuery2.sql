-- Homework 02.1
CREATE OR ALTER PROCEDURE usp_CreateGrade
	@StudentID INT,
    @CourseID INT,
    @TeacherID INT,
    @Grade TINYINT,
    @CreatedDate DATETIME
AS
BEGIN
    INSERT INTO Grade (StudentID, CourseID, TeacherID, Grade, CreatedDate)
    VALUES (@StudentID, @CourseID, @TeacherID, @Grade, @CreatedDate);

	SELECT COUNT(*) AS TotalGradesForStudent
    FROM Grade
    WHERE StudentID = @StudentID;

	SELECT MAX(Grade) AS MaxGradeForStudentAndTeacher
    FROM Grade
    WHERE StudentID = @StudentID AND TeacherID = @TeacherID;
END
GO

EXEC usp_CreateGrade
    @StudentID = 222,
    @CourseID = 11,
    @TeacherID = 2,
    @Grade = 9,
    @CreatedDate = '2025-04-25 10:00:00';

-- Homework 02.2
GO

CREATE OR ALTER PROCEDURE usp_CreateGradeDetail
@GradeID INT,
@AchievementTypeID INT,
@AchievementPoints NVARCHAR(100),
@AchievementMaxPoints NVARCHAR(100),
@AchievementDate DATE,
@ParticipationRate FLOAT
AS
BEGIN

    INSERT INTO GradeDetails (GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
    VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate);

	SELECT SUM(CAST(@AchievementPoints AS FLOAT) / CAST(@AchievementMaxPoints AS FLOAT) * @ParticipationRate) AS GradePoints
    FROM [dbo].[GradeDetails]
    WHERE GradeID = @GradeID;
END
GO

EXEC usp_CreateGradeDetail
    @GradeID = 101,
    @AchievementTypeID = 1,
    @AchievementPoints = '85',
    @AchievementMaxPoints = '100',
    @AchievementDate = '2025-04-25',
    @ParticipationRate = 0.8;
