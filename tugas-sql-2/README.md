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

**Screenshot Hasil**
![Screenshot 2023-11-06 204235](https://github.com/radithyaarka/sbd/assets/143694651/5103f067-d832-4884-a5a0-6a7d53fe83a4)
**Screenshot Data Count**
![Screenshot 2023-11-06 204242](https://github.com/radithyaarka/sbd/assets/143694651/8e5f7511-f59e-4a24-a85e-c4704ea23369)

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

**Screenshot Hasil**
![Screenshot 2023-11-06 204623](https://github.com/radithyaarka/sbd/assets/143694651/49e28d7a-d8f1-4d97-ae40-c0e923c5c056)
**Screenshot Data Count**
![Screenshot 2023-11-06 204650](https://github.com/radithyaarka/sbd/assets/143694651/2fb68bbd-9036-4447-bb06-2a13b5b70064)

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

**Screenshot Hasil**
![Screenshot 2023-11-06 204737](https://github.com/radithyaarka/sbd/assets/143694651/b7887a85-80bb-4714-845f-51973606d075)
**Screenshot Data Count**
![Screenshot 2023-11-06 204742](https://github.com/radithyaarka/sbd/assets/143694651/34dec906-ba72-4d7f-aa82-d3f5439b7f90)

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

**Screenshot Hasil**
![Screenshot 2023-11-06 204819](https://github.com/radithyaarka/sbd/assets/143694651/be814de8-4fc9-4eeb-b68c-ca879da0dbd3)
**Screenshot Data Count**
![Screenshot 2023-11-06 204824](https://github.com/radithyaarka/sbd/assets/143694651/165fbdbe-3892-4e1d-b02b-a54f5bed68bf)

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

**Screenshot Hasil**
![Screenshot 2023-11-06 204844](https://github.com/radithyaarka/sbd/assets/143694651/d1c7c27f-528c-43e3-926d-24200709a037)
**Screenshot Data Count**
![Screenshot 2023-11-06 204848](https://github.com/radithyaarka/sbd/assets/143694651/35b2c752-620f-4fe0-b602-af1abf1f609c)
