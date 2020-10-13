create database University;

use University;


create table Staff (
	StaffNo int not null identity (1,1),
	name varchar(255) not null,
	Region varchar(255) not null,
	primary key(StaffNo)
);

create table Student (
	Student_id int not null identity (1,1),
	name varchar(255) not null,
	RegisteredDate datetime NOT NULL,
	Region varchar(255),
	StaffNo int not null,
	primary key(Student_id),
	foreign key(StaffNo) references Staff (StaffNo)
);

create table Course (
	CourseCode int not null identity (1,1),
	Title varchar(255),
	Credit int NOT NULL CONSTRAINT check_credit CHECK (Credit=15 OR Credit=30),
	Quota int not null,
	StaffNo int not null,
	primary key(CourseCode),
	foreign key(StaffNo) references Staff (StaffNo)
);

CREATE TABLE Enrollment (
  Student_id int NOT NULL,
  CourseCode int NOT NULL,
  EnrolledDate datetime NOT NULL,
  FinalGrade int,
  PRIMARY KEY (Student_id,CourseCode),
  FOREIGN KEY (Student_id) REFERENCES Student (Student_id),
  FOREIGN KEY (CourseCode) REFERENCES Course (CourseCode)
);

CREATE TABLE Assignment (
  Student_id int NOT NULL,
  CourseCode int NOT NULL,
  Assignment int not null,
  Grade int NOT NULL CONSTRAINT check_grade CHECK (Grade BETWEEN 0 AND 100),
  PRIMARY KEY (Student_id,CourseCode,Assignment),
  FOREIGN KEY (Student_id) REFERENCES Student (Student_id),
  FOREIGN KEY (CourseCode) REFERENCES Course (CourseCode)
);

