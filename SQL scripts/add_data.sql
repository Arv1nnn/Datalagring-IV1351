INSERT INTO adress (street, zip, city)
VALUES 
('Main Street 12', '12345', 'Stockholm'),
('Second Avenue 5', '54321', 'Gothenburg'),
('Kungsgatan 12', '168 52', 'Stockholm'),
('Lucky Landing 12', '34565', 'Houston');

INSERT INTO person (personal_number, first_name, last_name)
VALUES
('199901019999', 'Alex', 'Berg'),
('200012129999', 'Anna', 'Karlsson'),
('198501119999', 'Arn', 'Hornhuvud'),
('199802129999', 'Erik', 'Eriksson');


INSERT INTO person_adress (person_id, adress_id)
VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 4);


INSERT INTO phone (phone_number)
VALUES
('0701234567'),
('0739876543'),
('084647480');

INSERT INTO person_phone(person_id, phone_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3);



INSERT INTO job_title (job_title)
VALUES
('Professor'),
('TA');

INSERT INTO department (department_name)
VALUES
('Computer Science'),
('Mathematics'),
('Physics');

INSERT INTO employee (employment_id, salary, department_id, person_id, employee_manager_id, job_id)
VALUES
('EMP01', 100000, 1, 1, NULL, 1),
('EMP02', 78000, 2, 2, NULL, 1),
('EMP03', 78000, 3, 3, NULL, 1),
('EMP04', 50000, 1, 4, 3, 2);


UPDATE department
SET department_manager_id = 1
WHERE id = 1;

UPDATE department
SET department_manager_id = 2
WHERE id = 2;

UPDATE department
SET department_manager_id = 3
WHERE id = 3;


INSERT INTO skill_set (skill)
VALUES
('C programming'),
('Mathematics'),
('Physics'),
('Hardware');

INSERT INTO employee_skill (employee_id, skill_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3);

INSERT INTO course_layout (course_code, course_name, min_students, max_students, hp)
VALUES
('CS101', 'Intro to CS', 5, 50, 7.5),
('MATH101', 'Calculus I', 5, 60, 6.0),
('PHYS101', 'Modern physics', 5, 60, 6.0);

INSERT INTO course_instance (instance_id, num_students, study_period, study_year, course_layout_id)
VALUES
('CS101-2025P', 30, 'P1', 2025, 1),
('MATH101-2025P', 40, 'P2', 2025, 2),
('PHYS101-2025P', 50, 'P3', 2025, 3);


INSERT INTO teaching_activity (activity_name, factor)
VALUES
('Lecture', 1.0),
('Lab', 1.5);


INSERT INTO planned_activity (teaching_act_id, course_instance_id, planned_hours)
VALUES
(1, 1, 20), -- Lecture for CS101
(2, 1, 10), -- Lab for CS101
(1, 2, 25), -- Lecture for MATH101
(2, 2, 15), -- Lab for MATH101
(1, 3, 25), -- Lecture for PHYS101
(2, 3, 15); -- Lab for PHYS101



INSERT INTO employ_planned_activity (employee_id, teaching_act_id, course_instance_id)
VALUES
(1, 1, 1), -- Alex teaches Lecture CS101
(1, 2, 1), -- Alex teaches Lab CS101
(2, 1, 2), -- Anna teaches Lecture MATH101
(2, 2, 2), -- Anna teaches Lab MATH101
(2, 1, 3), -- Arn teaches Lecture PHYS101
(4, 2, 3); -- Erik teaches Lab PHYS101























