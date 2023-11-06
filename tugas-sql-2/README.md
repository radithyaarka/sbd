# Laporan Tugas SBD

Nama : Mohammad Arkananta Radithya Taratugang <br>
NRP : 5027221003 <br>
Kelas : Sistem Basis Data B

## Soal 1

Tampilkan deskripsi tugas, nama mata kuliah, dan nama dosen dari tugas yang paling banyak dikerjakan oleh mahasiswa

### Query

**Untuk menampilkan data**

```sql
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
```

**Untuk menampilkan jumlah data**

```sql
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

```

### Output

## Soal 2

Tampilkan nama mata kuliah dan nama dosen yang memiliki paling banyak jenis tugas

### Query

**Untuk menampilkan data**

```sql
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

```

**Untuk menampilkan jumlah data**

```sql
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
```

### Output


## Soal 3

Tampilkan deskripsi tugas, nama mata kuliah, dan nama dosen dari tugas yang memiliki rata-rata nilai antara 70 sampai 80

### Query

**Untuk menampilkan data**

```sql
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
```

**Untuk menampilkan jumlah data**

```sql
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
```


### Output



## Soal 4

Tampilkan nama mahasiswa, NRP, dan nilai yang memiliki nilai dibawah rata-rata pada tugas yang memiliki kata 'car' di deskripsi

### Query

**Untuk menampilkan data**

```sql
SELECT name_student, nrp, score
FROM akademik.student
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
WHERE akademik.task.score < (
    SELECT AVG(score)
    FROM task
    WHERE desc_task LIKE "%car%"
);
```

**Untuk menampilkan jumlah data**

```sql
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
```

### Output

## Soal 5

Tampilkan deskripsi tugas, nama mata kuliah, dan nama dosen dari tugas yang memiliki nilai rata-rata dibawah rata-rata nilai semua tugas

### Query

**Untuk menampilkan data**

```sql
SELECT desc_task, name_course, name_lecturer
FROM akademik.task
INNER JOIN akademik.course ON akademik.course.id = akademik.task.id_mk
INNER JOIN akademik.lecturer ON akademik.lecturer.id = akademik.task.id_dos
GROUP BY akademik.task.id
HAVING AVG(score) < (
    SELECT AVG(score)
    FROM task
);
```

**Untuk menampilkan jumlah data**

```sql
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
```

### Output