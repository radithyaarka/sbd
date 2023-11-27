-- Mohammad Arkananta Radithya Taratugang
-- 5027221003


-- 1. INDEX
CREATE INDEX id ON task(desc_task)

SELECT *
FROM task
USE INDEX(id)
WHERE id = 1;

-- 2. TRANSACTION
START TRANSACTION;

UPDATE lecturer SET name_lecturer = "Harry Maguire" WHERE id = "2";

COMMIT;

-- 3. VIEW
CREATE VIEW not_passed_score AS
SELECT
    t.id AS task_id,
    t.desc_task,
    t.score,
    s.nrp AS student_nrp,
    s.name_student AS student_name,
    c.name_course AS course_name,
    l.nip AS lecturer_nip,
    l.name_lecturer AS lecturer_name
FROM
    task t
JOIN student s ON t.id_mhs = s.id
JOIN course c ON t.id_mk = c.id
JOIN lecturer l ON t.id_dos = l.id
WHERE
    t.score < 60;

-- 4. STORED PROCEDURE
DELIMITER $$
CREATE PROCEDURE deleteTask(IN id_task INT)
BEGIN 
	DELETE FROM task 
    WHERE id = id_task;
END $$
DELIMITER ;

-- 5. TRIGGER
DELIMITER $$

CREATE TRIGGER limit_task_score
BEFORE INSERT ON task
FOR EACH ROW
BEGIN
   IF NEW.score > 100 THEN
       SET NEW.score = 100;
   END IF;
END $$

DELIMITER ;
