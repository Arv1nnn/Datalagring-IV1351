CREATE OR REPLACE VIEW v_planned_hours_current_year AS
SELECT
  cl.course_code,
  ci.instance_id,
  cl.hp,
  ci.study_period,
  ci.num_students,

  ROUND(COALESCE(SUM(
    CASE WHEN ta.activity_name = 'Lecture' THEN pa.planned_hours * ta.factor ELSE 0 END
  ),0), 2) AS lecture_hours,
  ROUND(COALESCE(SUM(
    CASE WHEN ta.activity_name = 'Tutorial' THEN pa.planned_hours * ta.factor ELSE 0 END
  ),0), 2) AS tutorial_hours,
  ROUND(COALESCE(SUM(
    CASE WHEN ta.activity_name = 'Lab' THEN pa.planned_hours * ta.factor ELSE 0 END
  ),0), 2) AS lab_hours,
  ROUND(COALESCE(SUM(
    CASE WHEN ta.activity_name = 'Seminar' THEN pa.planned_hours * ta.factor ELSE 0 END
  ),0), 2) AS seminar_hours,
  ROUND(COALESCE(SUM(
    CASE WHEN ta.activity_name = 'Other' THEN pa.planned_hours * ta.factor ELSE 0 END
  ),0), 2) AS other_overhead_hours,

  ROUND( (2.0 * cl.hp) + 28.0 + (0.2 * ci.num_students), 2) AS admin_hours,
  ROUND( 32.0 + (0.725 * ci.num_students), 2) AS exam_hours,

  ROUND(
    COALESCE(SUM(pa.planned_hours * ta.factor),0)
    + ((2.0 * cl.hp) + 28.0 + (0.2 * ci.num_students))
    + (32.0 + (0.725 * ci.num_students))
  , 2) AS total_hours
FROM planned_activity pa
JOIN teaching_activity ta
  ON pa.teaching_act_id = ta.id
JOIN course_instance ci
  ON pa.course_instance_id = ci.id
JOIN course_layout cl
  ON ci.course_layout_id = cl.id
WHERE ci.study_year = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY cl.course_code, ci.instance_id, cl.hp, ci.study_period, ci.num_students
ORDER BY cl.course_code, ci.instance_id;


