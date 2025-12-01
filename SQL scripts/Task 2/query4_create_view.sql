CREATE OR REPLACE VIEW v_teacher_instance_count_current_period AS
SELECT
    e.employment_id,
    (p.first_name || ' ' || p.last_name) AS teacher_name,
    ci.study_period AS period,
    COUNT(DISTINCT ci.id) AS no_of_courses
FROM employ_planned_activity epa
JOIN employee e ON epa.employee_id = e.id
JOIN person p ON e.person_id = p.id
JOIN course_instance ci ON epa.course_instance_id = ci.id
WHERE ci.study_year = EXTRACT(YEAR FROM CURRENT_DATE)
	AND ci.study_period = 'P1'
GROUP BY e.employment_id, teacher_name, ci.study_period
ORDER BY teacher_name;


