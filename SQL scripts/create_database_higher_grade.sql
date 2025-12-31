CREATE TABLE adress (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 street VARCHAR(100),
 zip VARCHAR(100),
 city VARCHAR(100)
);

ALTER TABLE adress ADD CONSTRAINT PK_adress PRIMARY KEY (id);


CREATE TABLE course_layout (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 course_code  VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE course_layout ADD CONSTRAINT PK_course_layout PRIMARY KEY (id);


CREATE TABLE course_layout_version (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 course_name VARCHAR(100),
 min_students INT,
 max_students INT,
 hp DECIMAL(5,2),
 course_layout_id INT NOT NULL
);

ALTER TABLE course_layout_version ADD CONSTRAINT PK_course_layout_version PRIMARY KEY (id);


CREATE TABLE department (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 department_name VARCHAR(100) UNIQUE NOT NULL,
 department_manager_id INT
);

ALTER TABLE department ADD CONSTRAINT PK_department PRIMARY KEY (id);


CREATE TABLE employee (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 employment_id VARCHAR(100) UNIQUE NOT NULL,
 salary_version_id INT,
 department_id INT NOT NULL,
 person_id INT NOT NULL,
 employee_manager_id INT,
 job_id INT
);

ALTER TABLE employee ADD CONSTRAINT PK_employee PRIMARY KEY (id);


CREATE TABLE job_title (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 job_title VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE job_title ADD CONSTRAINT PK_job_title PRIMARY KEY (id);


CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 personal_number VARCHAR(12) UNIQUE NOT NULL,
 first_name VARCHAR(100),
 last_name VARCHAR(100)
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE person_adress (
 person_id INT NOT NULL,
 adress_id INT NOT NULL
);

ALTER TABLE person_adress ADD CONSTRAINT PK_person_adress PRIMARY KEY (person_id,adress_id);


CREATE TABLE phone (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_number VARCHAR(20) UNIQUE NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (id);


CREATE TABLE salary_version (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 salary DECIMAL(10,2) NOT NULL,
 employee_id INT NOT NULL,
 start_date DATE,
 end_date DATE
);

CREATE TABLE teaching_limit (
 max_courses_per_teacher_per_period INT NOT NULL
);

ALTER TABLE teaching_limit ADD CONSTRAINT PK_teaching_limit PRIMARY KEY (max_courses_per_teacher_per_period);


ALTER TABLE salary_version ADD CONSTRAINT PK_salary_version PRIMARY KEY (id);


CREATE TABLE skill_set (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE skill_set ADD CONSTRAINT PK_skill_set PRIMARY KEY (id);


CREATE TABLE teaching_activity (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 activity_name VARCHAR(100) UNIQUE NOT NULL,
 preparation_factor DECIMAL(4,2) DEFAULT 1.0,
 fixed_hours DECIMAL(4,2) DEFAULT 1.0,
 student_factor DECIMAL(4,2) DEFAULT 1.0,
 hp_factor DECIMAL(4,2) DEFAULT 1.0
);

ALTER TABLE teaching_activity ADD CONSTRAINT PK_teaching_activity PRIMARY KEY (id);




CREATE TABLE course_instance (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instance_id VARCHAR(100) UNIQUE NOT NULL,
 num_students INT NOT NULL,
 study_period VARCHAR(2) NOT NULL,
 study_year INT NOT NULL,
 course_layout_version_id INT NOT NULL
);

ALTER TABLE course_instance ADD CONSTRAINT PK_course_instance PRIMARY KEY (id);


CREATE TABLE employee_skill (
 employee_id INT NOT NULL,
 skill_id INT NOT NULL
);

ALTER TABLE employee_skill ADD CONSTRAINT PK_employee_skill PRIMARY KEY (employee_id,skill_id);


CREATE TABLE person_phone (
 person_id INT NOT NULL,
 phone_id INT NOT NULL
);

ALTER TABLE person_phone ADD CONSTRAINT PK_person_phone PRIMARY KEY (person_id,phone_id);


CREATE TABLE planned_activity (
 teaching_act_id INT NOT NULL,
 course_instance_id INT NOT NULL,
 planned_hours DECIMAL(5,2)
);

ALTER TABLE planned_activity ADD CONSTRAINT PK_planned_activity PRIMARY KEY (teaching_act_id,course_instance_id);


CREATE TABLE employ_planned_activity (
 employee_id INT NOT NULL,
 teaching_act_id INT NOT NULL,
 course_instance_id INT NOT NULL,
 employee_hours DECIMAL(5,2)
);

ALTER TABLE employ_planned_activity ADD CONSTRAINT PK_employ_planned_activity PRIMARY KEY (employee_id,teaching_act_id,course_instance_id);


ALTER TABLE course_layout_version ADD CONSTRAINT FK_course_layout_version_0 FOREIGN KEY (course_layout_id) REFERENCES course_layout (id);


ALTER TABLE department ADD CONSTRAINT FK_department_0 FOREIGN KEY (department_manager_id) REFERENCES employee (id);


ALTER TABLE employee ADD CONSTRAINT FK_employee_0 FOREIGN KEY (department_id) REFERENCES department (id);
ALTER TABLE employee ADD CONSTRAINT FK_employee_1 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE employee ADD CONSTRAINT FK_employee_2 FOREIGN KEY (employee_manager_id) REFERENCES employee (id);
ALTER TABLE employee ADD CONSTRAINT FK_employee_3 FOREIGN KEY (job_id) REFERENCES job_title (id);


ALTER TABLE person_adress ADD CONSTRAINT FK_person_adress_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE person_adress ADD CONSTRAINT FK_person_adress_1 FOREIGN KEY (adress_id) REFERENCES adress (id);


ALTER TABLE salary_version ADD CONSTRAINT FK_salary_version_0 FOREIGN KEY (employee_id) REFERENCES employee (id);


ALTER TABLE course_instance ADD CONSTRAINT FK_course_instance_0 FOREIGN KEY (course_layout_version_id) REFERENCES course_layout_version (id);


ALTER TABLE employee_skill ADD CONSTRAINT FK_employee_skill_0 FOREIGN KEY (employee_id) REFERENCES employee (id);
ALTER TABLE employee_skill ADD CONSTRAINT FK_employee_skill_1 FOREIGN KEY (skill_id) REFERENCES skill_set (id);


ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_1 FOREIGN KEY (phone_id) REFERENCES phone (id);


ALTER TABLE planned_activity ADD CONSTRAINT FK_planned_activity_0 FOREIGN KEY (teaching_act_id) REFERENCES teaching_activity (id);
ALTER TABLE planned_activity ADD CONSTRAINT FK_planned_activity_1 FOREIGN KEY (course_instance_id) REFERENCES course_instance (id);


ALTER TABLE employ_planned_activity ADD CONSTRAINT FK_employ_planned_activity_0 FOREIGN KEY (employee_id) REFERENCES employee (id);
ALTER TABLE employ_planned_activity ADD CONSTRAINT FK_employ_planned_activity_1 FOREIGN KEY (teaching_act_id,course_instance_id) REFERENCES planned_activity (teaching_act_id,course_instance_id);


