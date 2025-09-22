 CREATE DATABASE SchoolDB;
USE SchoolDB;

-- School Table
CREATE TABLE School (
     SchoolId INT AUTO_INCREMENT PRIMARY KEY,
     SchoolName VARCHAR(100) NOT NULL,
     Description TEXT,
     Address VARCHAR(200),
     Phone VARCHAR(20),
   PostCode VARCHAR(20),
   PostAddress VARCHAR(200)
);


-- CLASS Table
CREATE TABLE Class (
    ClassId INT AUTO_INCREMENT PRIMARY KEY,
    SchoolId INT,
    ClassName VARCHAR(100) NOT NULL,
    Description TEXT,
    CONSTRAINT fk_class_school FOREIGN KEY (SchoolId) REFERENCES School(SchoolId)
);

-- STUDENT Table
CREATE TABLE Student (
    StudentId INT AUTO_INCREMENT PRIMARY KEY,
    ClassId INT,
    StudentName VARCHAR(100) NOT NULL,
    StudentNumber VARCHAR(20) UNIQUE,
    TotalGrade DECIMAL(5,2),
    Address VARCHAR(200),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    CONSTRAINT fk_student_class FOREIGN KEY (ClassId) REFERENCES Class(ClassId)
);

-- COURSE Table
CREATE TABLE Course (
    CourseId INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    SchoolId INT,
    Description TEXT,
    CONSTRAINT fk_course_school FOREIGN KEY (SchoolId) REFERENCES School(SchoolId)
);

-- TEACHER Table
CREATE TABLE Teacher (
    TeacherId INT AUTO_INCREMENT PRIMARY KEY,
    SchoolId INT,
    TeacherName VARCHAR(100) NOT NULL,
    Description TEXT,
    CONSTRAINT fk_teacher_school FOREIGN KEY (SchoolId) REFERENCES School(SchoolId)
);

-- STUDENT_COURSE Table (Many-to-Many relation)
CREATE TABLE Student_Course (
    StudentId INT,
    CourseId INT,
    PRIMARY KEY (StudentId, CourseId),
    CONSTRAINT fk_sc_student FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
    CONSTRAINT fk_sc_course FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);

-- TEACHER_COURSE Table (Many-to-Many relation)
CREATE TABLE Teacher_Course (
    TeacherId INT,
    CourseId INT,
    PRIMARY KEY (TeacherId, CourseId),
    CONSTRAINT fk_tc_teacher FOREIGN KEY (TeacherId) REFERENCES Teacher(TeacherId),
    CONSTRAINT fk_tc_course FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);

-- GRADE Table
CREATE TABLE Grade (
    GradeId INT AUTO_INCREMENT PRIMARY KEY,
    StudentId INT,
    CourseId INT,
    Grade VARCHAR(5),
    Comment TEXT,
    CONSTRAINT fk_grade_student FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
    CONSTRAINT fk_grade_course FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);




