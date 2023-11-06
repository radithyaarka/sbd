-- Mohammad Arkananta Radithya Taratugang
-- 5027221003

-- Soal 1

-- nampilin data
SELECT desc_task, name_course, name_lecturer
FROM akademik.lecturer
INNER JOIN akademik.task ON akademik.lecturer.id = akademik.task.id_dos
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
WHERE akademik.task.id_mhs = (
    SELECT id_mhs
    FROM task
    GROUP BY id_mhs
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- itung data count
SELECT COUNT(*) AS total_row
FROM (
SELECT desc_task, name_course, name_lecturer
FROM akademik.lecturer
INNER JOIN akademik.task ON akademik.lecturer.id = akademik.task.id_dos
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
WHERE akademik.task.id_mhs = (
    SELECT id_mhs
    FROM task
    GROUP BY id_mhs
    ORDER BY COUNT(*) DESC
    LIMIT 1
)) AS subquery

-- Soal 2

-- nampilin data
SELECT name_course, name_lecturer
FROM course
INNER JOIN akademik.lecturer ON akademik.course.id = akademik.lecturer.id
WHERE akademik.course.id = (
    SELECT id_mk
    FROM akademik.task
    GROUP BY id_mk
    ORDER BY COUNT(DISTINCT desc_task) DESC
    LIMIT 1
);
-- itung data count

SELECT COUNT(*) AS total_row
FROM (
SELECT name_course, name_lecturer
FROM course
INNER JOIN akademik.lecturer ON akademik.course.id = akademik.lecturer.id
WHERE akademik.course.id = (
    SELECT id_mk
    FROM akademik.task
    GROUP BY id_mk
    ORDER BY COUNT(DISTINCT desc_task) DESC
    LIMIT 1
)) AS subquery;

-- Soal 3

-- nampilin data
SELECT desc_task, name_course, name_lecturer
FROM akademik.task
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
WHERE akademik.task.id IN (
    SELECT id
    FROM akademik.task
    GROUP by id
   	HAVING AVG(akademik.task.score) BETWEEN 70 AND 80
);
    
--  itung data count

-- nampilin data
SELECT COUNT(*) AS total_row
FROM (
SELECT desc_task, name_course, name_lecturer
FROM akademik.task
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
WHERE akademik.task.id IN (
    SELECT id
    FROM akademik.task
    GROUP by id
   	HAVING AVG(akademik.task.score) BETWEEN 70 AND 80
)) AS subquery;

-- Soal 4

-- nampilin data
SELECT name_student, nrp, score
FROM akademik.student
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
WHERE akademik.task.score < (
    SELECT AVG(score)
    FROM task
    WHERE desc_task LIKE "%car%"
);
    
-- itung data count

SELECT COUNT(*) AS total_row
FROM (
SELECT name_student, nrp, score
FROM akademik.student
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
WHERE akademik.task.score < (
    SELECT AVG(score)
    FROM task
    WHERE desc_task LIKE "%car%"
)) AS subquery;

-- Soal 5

-- nampilin data
SELECT desc_task, name_course, name_lecturer
FROM akademik.task
INNER JOIN akademik.course ON akademik.course.id = akademik.task.id_mk
INNER JOIN akademik.lecturer ON akademik.lecturer.id = akademik.task.id_dos
GROUP BY akademik.task.id
HAVING AVG(score) < (
    SELECT AVG(score)
    FROM task
);

-- itung data count

SELECT count(*) AS total_row
FROM (
SELECT desc_task, name_course, name_lecturer
FROM akademik.task
INNER JOIN akademik.course ON akademik.course.id = akademik.task.id_mk
INNER JOIN akademik.lecturer ON akademik.lecturer.id = akademik.task.id_dos
GROUP BY akademik.task.id
HAVING AVG(score) < (
    SELECT AVG(score)
    FROM task
)) AS subquery; 