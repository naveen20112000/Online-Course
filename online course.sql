CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Role ENUM('Student', 'Instructor') NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    InstructorID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (InstructorID) REFERENCES Users(UserID)
);
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    CourseID INT,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    DueDate DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
CREATE TABLE Submissions (
    SubmissionID INT PRIMARY KEY,
    AssignmentID INT,
    StudentID INT,
    SubmissionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FilePath VARCHAR(255),
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    SubmissionID INT,
    Grade DECIMAL(5, 2),
    Comments TEXT,
    GradedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SubmissionID) REFERENCES Submissions(SubmissionID)
);
