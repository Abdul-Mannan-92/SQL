-- Students Table
CREATE TABLE Students5(
    StudentID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    BirthDate DATE,
    Major VARCHAR2(50)
);

INSERT INTO Students5 (StudentID, FirstName, LastName, BirthDate, Major)
VALUES (1, 'John', 'Doe', TO_DATE('1998-05-15', 'YYYY-MM-DD'), 'Computer Science');

INSERT INTO Students5 (StudentID, FirstName, LastName, BirthDate, Major)
VALUES (2, 'Jane', 'Smith', TO_DATE('1999-02-20', 'YYYY-MM-DD'), 'Mathematics');

-- Courses Table
CREATE TABLE Courses3 (
    CourseID NUMBER PRIMARY KEY,
    CourseName VARCHAR2(50),
    Department VARCHAR2(50),
    Credits NUMBER
);

INSERT INTO Courses3 (CourseID, CourseName, Department, Credits)
VALUES (101, 'Introduction to Programming', 'Computer Science', 3);

INSERT INTO Courses3 (CourseID, CourseName, Department, Credits)
VALUES (201, 'Calculus I', 'Mathematics', 4);

-- Grades Table
CREATE TABLE Grades4 (
    GradeID NUMBER PRIMARY KEY,
    StudentID NUMBER,
    CourseID NUMBER,
    Grade VARCHAR2(2),
    CONSTRAINT fk_student FOREIGN KEY (StudentID) REFERENCES Students5(StudentID),
    CONSTRAINT fk_course FOREIGN KEY (CourseID) REFERENCES Courses3(CourseID)
);


-- Inserting Courses records
INSERT INTO Courses3 (CourseID, CourseName, Department, Credits)
VALUES (101, 'Introduction to Programming', 'Computer Science', 3);

INSERT INTO Courses3 (CourseID, CourseName, Department, Credits)
VALUES (201, 'Calculus I', 'Mathematics', 4);

-- Inserting Grades4 records
INSERT INTO Grades4 (GradeID, StudentID, CourseID, Grade)
VALUES (1, 1, 101, 'A');

INSERT INTO Grades4 (GradeID, StudentID, CourseID, Grade)
VALUES (2, 2, 201, 'B');

SELECT * FROM Students5;

UPDATE Students5
SET Major = 'Data Science'
WHERE StudentID = 1;

SELECT * FROM Students5;

SELECT * FROM Courses3;

DELETE FROM Courses3
WHERE CourseID = 201;


SELECT * FROM Courses3;
SELECT * FROM Grades4;

CREATE TABLE TempTable (
    TempID NUMBER,
    TempName VARCHAR2(50)
);

INSERT INTO TempTable (TempID, TempName) VALUES (1, 'Temporary Data');

DROP TABLE TempTable;








