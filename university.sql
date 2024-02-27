CREATE DATABASE university;

USE university;

CREATE TABLE universities (
university_id INT AUTO_INCREMENT PRIMARY KEY,
university_name VARCHAR(255) NOT NULL,
adress VARCHAR(255),
phone VARCHAR(255),
email VARCHAR(255)
);


CREATE TABLE courses (
course_id INT AUTO_INCREMENT PRIMARY KEY,
university_id INT NOT NULL,
course_name VARCHAR(255) NOT NULL,
teacher VARCHAR(255),
credits INT NOT NULL,
FOREIGN KEY (university_id) REFERENCES universities (university_id)
);

CREATE TABLE students (
student_id INT AUTO_INCREMENT PRIMARY KEY,
student_name VARCHAR(255) NOT NULL,
phone VARCHAR(255),
email VARCHAR(255)
);

CREATE TABLE student_course_grades (
student_courses_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,
course_id INT NOT NULL,
grade VARCHAR(255),
start_date DATE,
end_date DATE,
FOREIGN KEY (student_id) REFERENCES students (student_id),
FOREIGN KEY (course_id) REFERENCES courses (course_id)
);





