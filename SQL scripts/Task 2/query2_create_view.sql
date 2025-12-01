CREATE OR REPLACE VIEW v_allocated_hours_per_teacher_current_year AS
SELECT
    cl.course_code,
    ci.instance_id,
    cl.hp,

    (p.first_name || ' ' || p.last_name) AS teacher_name,
    jt.job_title AS designation,

    ROUND(SUM(CASE WHEN ta.activity_name = 'Lecture'
                   THEN epa.employee_hours * ta.factor ELSE 0 END), 2) AS lecture_hours,

    ROUND(SUM(CASE WHEN ta.activity_name = 'Tutorial'
                   THEN epa.employee_hours * ta.factor ELSE 0 END), 2) AS tutorial_hours,

    ROUND(SUM(CASE WHEN ta.activity_name = 'Lab'
                   THEN epa.employee_hours * ta.factor ELSE 0 END), 2) AS lab_hours,

    ROUND(SUM(CASE WHEN ta.activity_name = 'Seminar'
                   THEN epa.employee_hours * ta.factor ELSE 0 END), 2) AS seminar_hours,

    ROUND(SUM(CASE WHEN ta.activity_name = 'Other'
                   THEN epa.employee_hours * ta.factor ELSE 0 END), 2) AS other_overhead_hours,

    ROUND((2.0 * cl.hp) + 28.0 + (0.2 * ci.num_students), 2) AS admin_hours,
    ROUND(32.0 + (0.725 * ci.num_students), 2) AS exam_hours,

    ROUND(
        COALESCE(SUM(epa.employee_hours * ta.factor), 0)
        + ((2.0 * cl.hp) + 28.0 + (0.2 * ci.num_students))
        + (32.0 + (0.725 * ci.num_students))
    , 2) AS total_hours

FROM employ_planned_activity epa
JOIN teaching_activity ta
     ON epa.teaching_act_id = ta.id
JOIN course_instance ci
     ON epa.course_instance_id = ci.id
JOIN course_layout cl
     ON ci.course_layout_id = cl.id
JOIN employee e
     ON epa.employee_id = e.id
JOIN person p
     ON e.person_id = p.id
LEFT JOIN job_title jt
     ON e.job_id = jt.id

WHERE ci.study_year = EXTRACT(YEAR FROM CURRENT_DATE)

GROUP BY
    cl.course_code,
    ci.instance_id,
    cl.hp,
    teacher_name,
    designation,
    ci.num_students

ORDER BY cl.course_code, ci.instance_id, teacher_name;