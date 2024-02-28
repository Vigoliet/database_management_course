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



INSERT INTO universities (university_name, address, phone, email) VALUES
("Jensen U", "Kista 33a", NULL, "jensen.u@jensen.se"),
("JU", "Gjuterigatan", "076-312 34 56", NULL),
("Science Uni", "Framgången 1", NULL, NULL);

SELECT * FROM universities;

INSERT INTO courses(university_id, course_name, teacher, credits) VALUES
(1, "Systematiskt", "Linus", 50),
(1, "Databashantering", "Marta", 25),
(2, "Systematiskt", "Linus", 30);

SELECT * FROM courses;

INSERT INTO students(student_name, phone, email) VALUES
("Linus", "07121342314", email),
("Bob", NULL, "bob@jensen.se"),
("Alice", NULL, "alice@jensen.se");

SELECT * FROM courses;
SELECT * FROM students;

INSERT INTO student_course_grades (student_id, course_id, grade, start_date, end_date) VALUES
(2, 3, "VG", "2022-03-14", "2022-04-14"),
(2, 2, "G", "2022-04-15", "2022-05-30"),
(3, 3, "VG", "2022-03-14", "2022-04-14");

SELECT s.student_name, c.course_name, scg.grade, u.university_name
	FROM student_course_grades AS scg
    INNER JOIN students AS s ON s.student_id = scg.student_id
    INNER JOIN courses AS c on c.course_id = scg.course_id
    INNER JOIN universities AS u on u.university_id = c.university_id;
    








