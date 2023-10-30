# Laporan Tugas SBD

Nama : Mohammad Arkananta Radithya Taratugang <br>
NRP : 5027221003 <br>
Kelas : Sistem Basis Data B

## Soal 1

Display all the names of students, task descriptions, course names, and lecturer names of students who have completed the task.

### Query

```sql
SELECT
    student.name_student AS studentName,
    task.desc_task AS taskDescription,
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName,
    COUNT(task.id) AS totalCompletedTasks
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
GROUP BY student.name_student, task.desc_task, course.name_course, lecturer.name_lecturer;
```

```sql
SELECT
    COUNT(task.id) AS totalCompletedTasks
FROM task;
```

### Output

![Soal 1.1](https://github.com/radithyaarka/sbd/assets/143694651/12edcb3d-9874-4aee-b1b7-7e551112d477)


![Soal 1.2](https://github.com/radithyaarka/sbd/assets/143694651/f4572b1c-3afb-44a3-8e85-d07708c884dd)

## Soal 2

Display the names of students, task descriptions, course names, and lecturer names of students who have completed the task and the task was assigned by an instructor whose name starts with "H".

### Query


```sql
SELECT
    student.name_student AS studentName,
    task.desc_task AS taskDescription,
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.score IS NOT NULL
    AND LEFT(lecturer.name_lecturer, 1) = 'H';
```


```sql
SELECT
    COUNT(*) AS totalData
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.score IS NOT NULL
    AND LEFT(lecturer.name_lecturer, 1) = 'H';
```

### Output

![Soal 2.1](https://github.com/radithyaarka/sbd/assets/143694651/b41543a4-1fa8-4546-ba6d-e3af6160d4c7)


![Soal 2.2](https://github.com/radithyaarka/sbd/assets/143694651/7f8f6871-08e2-461f-bbfe-c107a48856f5)

## Soal 3

Display the names of students, task descriptions, course names, and lecturer names of students who have completed the task with a task score between 60 and 80, sorted from the smallest score

### Query

```sql
SELECT
    student.name_student AS studentName,
    task.desc_task AS taskDescription,
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName,
    task.score
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.score BETWEEN 60 AND 80
    ORDER BY task.score;
```

```sql
SELECT
    COUNT(*) AS totalData
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.score BETWEEN 60 AND 80;
```

### Output

![Soal 3.1](https://github.com/radithyaarka/sbd/assets/143694651/8f67299d-9650-4a37-a3b9-7750e9d1f2b6)

![Soal 3.2](https://github.com/radithyaarka/sbd/assets/143694651/bae34c18-f80c-43bc-93b6-15df02cf9ea8)

## Soal 4

Display the names and NRP of students who have never completed any tasks at all

### Query

```sql
SELECT
    student.name_student AS studentName,
    student.nrp AS studentNRP
FROM student
LEFT JOIN task ON student.id = task.id_mhs
WHERE task.id IS NULL;
```

```sql
SELECT COUNT(*) AS totalData
FROM student
LEFT JOIN task ON student.id = task.id_mhs
WHERE task.id IS NULL;
```

### Output

![Soal 4.1](https://github.com/radithyaarka/sbd/assets/143694651/c010ff45-4328-4e46-ba39-4e090a49352e)


![Soal 4 - B](https://github.com/radithyaarka/sbd/assets/143694651/a77cb412-3ab5-4f70-a614-241b1df8cc46)
