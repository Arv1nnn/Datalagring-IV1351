INSERT INTO adress (street, zip, city)
VALUES 
('Main Street 12', '12345', 'Stockholm'),
('Second Avenue 5', '54321', 'Gothenburg'),
('Kungsgatan 12', '168 52', 'Stockholm'),
('Lucky Landing 12', '34565', 'Houston'),
('Brogatan 123', '25454', 'Malmo');

INSERT INTO person (personal_number, first_name, last_name)
VALUES
('194011019999', 'Fredrik', 'Ros'),    -- Person 1
('199901019999', 'Waldemar', 'Rosen'),  -- Person 2
('200012129999', 'Anna', 'Karlsson'),  -- Person 3
('198501119999', 'Arn', 'Hornhuvud'),  -- Person 4
('199802129999', 'Erik', 'Eriksson'),  -- Person 5
('198707199999', 'Jon', 'Jones'),      -- Person 6
('198707079999', 'Alex', 'Periera');   -- Person 7


INSERT INTO person_adress (person_id, adress_id)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 4),
(7, 5);


INSERT INTO phone (phone_number)
VALUES
('0701234567'),
('0739876543'),
('084647480'),
('0789858483'),
('0791919191');


INSERT INTO person_phone(person_id, phone_id)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 4),
(7, 5);




INSERT INTO job_title (job_title)
VALUES
('Professor'),
('Lecturer'),
('TA');

INSERT INTO department (department_name)
VALUES
('Computer Science'),
('Mathematics'),
('Physics');

INSERT INTO employee (employment_id, salary, department_id, person_id, employee_manager_id, job_id)
VALUES
('EMP01', 100000, 1, 1, NULL, 1),
('EMP02', 30000, 1, 2, 1, 1),
('EMP03', 78000, 2, 3, NULL, 1),
('EMP04', 78000, 3, 4, NULL, 1),
('EMP05', 50000, 1, 5, 3, 3),
('EMP06', 69000, 2, 6, NULL, 2),
('EMP07', 68000, 3, 7, 3, 2);


UPDATE department
SET department_manager_id = 1
WHERE id = 1;

UPDATE department
SET department_manager_id = 3
WHERE id = 2;

UPDATE department
SET department_manager_id = 4
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
(2, 4),
(3, 2),
(4, 3),
(5, 3),
(6, 2),
(7, 3);

INSERT INTO course_layout (course_code, course_name, min_students, max_students, hp)
VALUES
('CS101', 'Intro to CS', 5, 50, 7.5),
('MATH101', 'Calculus I', 5, 60, 6.0),
('PHYS101', 'Modern physics', 5, 60, 6.0),
('MATH202', 'Complex analysis', 5, 60, 9.5),
('PHYS202', 'Quantum physics', 10, 100, 7.5);

INSERT INTO course_instance (instance_id, num_students, study_period, study_year, course_layout_id)
VALUES
('CS101-2025P', 30, 'P1', 2025, 1),
('MATH101-2025P', 40, 'P2', 2025, 2),
('PHYS101-2025P', 50, 'P3', 2025, 3),
('MATH202-2025P', 40, 'P4', 2025, 4),
('PHYS202-2025P', 50, 'P4', 2025, 5),
('CS101-2024P', 25, 'P1', 2024, 1),
('MATH101-2024P', 35, 'P2', 2024, 2),
('PHYS101-2024P', 45, 'P3', 2024, 3),
('MATH202-2024P', 35, 'P4', 2024, 4),
('PHYS202-2024P', 45, 'P4', 2024, 5);



INSERT INTO teaching_activity (activity_name, factor)
VALUES
('Lecture', 1.2),
('Lab', 1.5),
('Seminar', 1.1),
('Other', 1.0),
('Tutorial', 1.3);  -- Giving it a factor between Lecture and Lab




INSERT INTO planned_activity (teaching_act_id, course_instance_id, planned_hours)
VALUES
-- 2025 Course Instances
-- CS101 (course_instance_id = 1)
(1, 1, 80),  -- Lecture for CS101
(2, 1, 70),  -- Lab for CS101
(3, 1, 30),  -- Seminar for CS101
(4, 1, 30), -- Other for CS101
(5, 1, 40),  -- Tutorial for CS101 (course_instance_id = 1)

-- MATH101 (course_instance_id = 2)
(1, 2, 100), -- Lecture for MATH101 
(2, 2, 45),  -- Lab for MATH101 
(3, 2, 20),  -- Seminar for MATH101
(4, 2, 10),  -- Other for MATH101
(5, 2, 35),  -- Tutorial for MATH101 (course_instance_id = 2)  


-- PHYS101 (course_instance_id = 3)
(1, 3, 90),  -- Lecture for PHYS101
(2, 3, 90),  -- Lab for PHYS101
(3, 3, 20),  -- Seminar for PHYS101
(4, 3, 20),  -- Other for PHYS101
(5, 3, 45),  -- Tutorial for PHYS101 (course_instance_id = 3)


-- MATH202 (course_instance_id = 4)
(1, 4, 50),  -- Lecture for MATH202
(2, 4, 10),  -- Lab for MATH202
(3, 4, 10),  -- Seminar for MATH202
(4, 4, 5),   -- Other for MATH202
(5, 4, 25),  -- Tutorial for MATH202 (course_instance_id = 4)


-- PHYS202 (course_instance_id = 5)
(1, 5, 40),  -- Lecture for PHYS202
(2, 5, 40),  -- Lab for PHYS202
(3, 5, 40),  -- Seminar for PHYS202
(4, 5, 40),  -- Other for PHYS202
(5, 5, 30),  -- Tutorial for PHYS202 (course_instance_id = 5)



-- 2024 Course Instances
-- CS101 (course_instance_id = 6)
(1, 6, 80),  -- Lecture for CS101
(2, 6, 70),  -- Lab for CS101
(3, 6, 30),  -- Seminar for CS101
(4, 6, 30),  -- Other for CS101
(5, 6, 40),  -- Tutorial for CS101 (course_instance_id = 6)


-- MATH101 (course_instance_id = 7)
(1, 7, 100), -- Lecture for MATH101 
(2, 7, 45),  -- Lab for MATH101 
(3, 7, 20),  -- Seminar for MATH101
(4, 7, 10),  -- Other for MATH101
(5, 7, 35),  -- Tutorial for MATH101 (course_instance_id = 7)

-- PHYS101 (course_instance_id = 8)
(1, 8, 90),  -- Lecture for PHYS101
(2, 8, 90),  -- Lab for PHYS101
(3, 8, 20),  -- Seminar for PHYS101
(4, 8, 20),  -- Other for PHYS101
(5, 8, 45),  -- Tutorial for PHYS101 (course_instance_id = 8)


-- MATH202 (course_instance_id = 9)
(1, 9, 50),  -- Lecture for MATH202
(2, 9, 10),  -- Lab for MATH202
(3, 9, 10),  -- Seminar for MATH202
(4, 9, 5),   -- Other for MATH202
(5, 9, 25),  -- Tutorial for MATH202 (course_instance_id = 9)


-- PHYS202 (course_instance_id = 10)
(1, 10, 40), -- Lecture for PHYS202
(2, 10, 40), -- Lab for PHYS202
(3, 10, 40), -- Seminar for PHYS202
(4, 10, 40), -- Other for PHYS202
(5, 10, 30); -- Tutorial for PHYS202 (course_instance_id = 10)



INSERT INTO employ_planned_activity (employee_id, teaching_act_id, course_instance_id, employee_hours)
VALUES
(1, 1, 1, 80), -- Fredrik teaches Lecture CS101
(1, 2, 1, 20), -- Fredrik teaches Lab CS101
(2, 2, 1, 50), -- Waldemar teaches Lab CS101
(2, 3, 1, 30), -- Waldemar holds seminar CS101
(2, 4, 1, 30), -- Waldemar does other activities CS101
(2, 5, 1, 40),   -- Waldemar teaches CS101 Tutorial (2025)



(3, 1, 2, 70), -- Anna teaches Lecture MATH101
(3, 2, 2, 35), -- Anna teaches Lab MATH101
(6, 1, 2, 30), -- Jon teaches Lecture MATH101
(6, 2, 2, 10), -- Jon teaches Lab MATH101
(6, 3, 2, 20), -- Jon Holds seminar MATH101
(6, 4, 2, 10), -- Jon does other activities MATH101
(6, 5, 2, 35),   -- Jon teaches MATH101 Tutorial (2025)



(6, 1, 4, 50), -- Jon teaches Lecture MATH202
(6, 2, 4, 10), -- Jon teaches Lab MATH202
(6, 3, 4, 10), -- Jon Holds seminar MATH202
(6, 4, 4, 5), -- Jon does other activities MATH202
(6, 5, 4, 25),   -- Jon teaches MATH202 Tutorial (2025)



(4, 1, 3, 90), -- Arn teaches Lecture PHYS101
(5, 2, 3, 90), -- Erik teaches Lab PHYS101
(5, 3, 3, 20), -- Erik holds seminar PHYS101
(5, 4, 3, 20), -- Erik does other activities PHYS101
(5, 5, 3, 45),   -- Erik teaches PHYS101 Tutorial (2025)




(7, 1, 5, 40), -- Alex teaches Lecture PHYS202
(7, 2, 5, 40), -- Alex teaches Lab PHYS202
(7, 3, 5, 40), -- Alex Holds seminar PHYS202
(7, 4, 5, 40), -- Alex does other activities PHYS202
(7, 5, 5, 30),   -- Alex teaches PHYS202 Tutorial (2025)


   --------- 2024
(1, 1, 6, 80), -- Fredrik teaches Lecture CS101        
(1, 2, 6, 20), -- Fredrik teaches Lab CS101
(2, 2, 6, 50), -- Waldemar teaches Lab CS101
(2, 3, 6, 30), -- Waldemar holds seminar CS101
(2, 4, 6, 30), -- Waldemar does other activities CS101
(2, 5, 6, 40),   -- Waldemar teaches CS101 Tutorial (2024)


(3, 1, 7, 70), -- Anna teaches Lecture MATH101
(3, 2, 7, 35), -- Anna teaches Lab MATH101
(6, 1, 7, 30), -- Jon teaches Lecture MATH101
(6, 2, 7, 10), -- Jon teaches Lab MATH101
(6, 3, 7, 20), -- Jon Holds seminar MATH101
(6, 4, 7, 10), -- Jon does other activities MATH101
(6, 5, 7, 35),   -- Jon teaches MATH101 Tutorial (2024)



(6, 1, 9, 50), -- Jon teaches Lecture MATH202
(6, 2, 9, 10), -- Jon teaches Lab MATH202
(6, 3, 9, 10), -- Jon Holds seminar MATH202
(6, 4, 9, 5), -- Jon does other activities MATH202
(6, 5, 9, 25),   -- Jon teaches MATH202 Tutorial (2024)



(4, 1, 8, 90), -- Arn teaches Lecture PHYS101
(5, 2, 8, 90), -- Erik teaches Lab PHYS101
(5, 3, 8, 20), -- Erik holds seminar PHYS101
(5, 4, 8, 20), -- Erik does other activities PHYS101
(5, 5, 8, 45),   -- Erik teaches PHYS101 Tutorial (2024)




(7, 1, 10, 40), -- Alex teaches Lecture PHYS202
(7, 2, 10, 40), -- Alex teaches Lab PHYS202
(7, 3, 10, 40), -- Alex Holds seminar PHYS202
(7, 4, 10, 40), -- Alex does other activities PHYS202
(7, 5, 10, 30);  -- Alex teaches PHYS202 Tutorial (2024)


