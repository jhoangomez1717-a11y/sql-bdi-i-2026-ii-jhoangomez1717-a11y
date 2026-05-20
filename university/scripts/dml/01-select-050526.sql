-- QUERY EXAMPLE
SELECT 
    name AS program
FROM university.programs
WHERE faculty_id = 6
LIMIT 5;

-- Mostrar los estudiantes que vean
-- los programas de Ing Sistemas 
-- y vayan en 5to semestre o superior



-- Obtener el nombre completo y el correo
-- de los profesores de la Universidad.
-- ||' '||

-- Listar los cursos que se dan en mas de una
-- facultad



 SELECT 'buildings' AS table, COUNT(*) FROM university.buildings
 UNION ALL
 SELECT 'classrooms' AS table, COUNT(*) FROM university.classrooms
 UNION ALL
 SELECT 'course_offerings' AS table, COUNT(*) FROM university.course_offerings
 UNION ALL
 SELECT 'courses' AS table, COUNT(*) FROM university.courses
 UNION ALL
 SELECT 'enrollments' AS table, COUNT(*) FROM university.enrollments
 UNION ALL
 SELECT 'faculties' AS table, COUNT(*) FROM university.faculties
 UNION ALL
 SELECT 'programs' AS table, COUNT(*) FROM university.programs
 UNION ALL
 SELECT 'programs_courses' AS table, COUNT(*) FROM university.programs_courses
 UNION ALL
 SELECT 'programs_students' AS table, COUNT(*) FROM university.programs_students
 UNION ALL
 SELECT 'roles' AS table, COUNT(*) FROM university.roles
 UNION ALL
 SELECT 'schedules' AS table, COUNT(*) FROM university.schedules
 UNION ALL
 SELECT 'users' AS table, COUNT(*) FROM university.users;

 --- nombre completo estudiante, semestre, nombre programa estudiant, cursos que esta viendo, capacidad y salon en que lo esta viendo estudiante con el id 5
SELECT 
    T1.first_name || ' ' || T1.last_name AS student,
    T2.current_semester AS semester,
    T3.name AS program,
    T6.name AS course,
    T7.name AS classroom,
    T5.capacity AS capacity_course
FROM university.users T1
INNER JOIN university.programs_students T2
    ON T1.user_id = T2.user_id
INNER JOIN university.programs T3
    ON T2.program_id = T3.program_id
INNER JOIN university.enrollments T4
    ON T1.user_id = T4.user_id
INNER JOIN university.course_offerings T5
    ON T4.course_offering_id = T5.course_offering_id
INNER JOIN university.courses T6
    ON T5.course_id = T6.course_id
INNER JOIN university.classrooms T7
    ON T5.classroom_id = T7.classroom_id
WHERE T1.user_id = 5;

SELECT 
    T1.name AS course,
    SUM(T2.capacity) AS total_capacity
FROM university.courses T1
INNER JOIN university.course_offerings T2
    ON T1.course_id = T2.course_id
GROUP BY T1.course_id, T1.name
HAVING SUM(T2.capacity) > 40;

