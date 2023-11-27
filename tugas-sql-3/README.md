# Laporan Tugas SBD

Nama : Mohammad Arkananta Radithya Taratugang <br>
NRP : 5027221003 <br>
Kelas : Sistem Basis Data B

## Soal 1 INDEX

### Query

```sql
CREATE INDEX id ON task(desc_task)

SELECT *
FROM task
USE INDEX(id)
WHERE id = 1;
```

### Output

#### Without Index
![Screenshot 2023-11-27 215115](https://github.com/radithyaarka/sbd/assets/143694651/ff9e2555-41b9-4a73-b47b-584e9bcf9677)

#### With Index
![Screenshot 2023-11-27 215238](https://github.com/radithyaarka/sbd/assets/143694651/167a2a58-8cb3-4c66-8072-7da51889ebe9)

## Soal 2 TRANSACTION

### Query


```sql
START TRANSACTION;

UPDATE lecturer SET name_lecturer = "Harry Maguire" WHERE id = "2";

COMMIT;
```


### Output

#### Sebelum Commit
![Screenshot 2023-11-27 213800](https://github.com/radithyaarka/sbd/assets/143694651/5cbd0123-1470-4dc8-8557-0986ebebe8a0)

#### Setelah Commit
![Screenshot 2023-11-27 213837](https://github.com/radithyaarka/sbd/assets/143694651/ccc54e31-871a-4c2d-aef2-8c0f1095482d)


## Soal 3 VIEW

### Query

```sql
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
```

### Output

![Screenshot 2023-11-27 213433](https://github.com/radithyaarka/sbd/assets/143694651/d196e2d1-46a7-4913-bde2-02b96f7a820a)


## Soal 4 STORED PROCEDURE

### Query

```sql
DELIMITER $$
CREATE PROCEDURE deleteTask(IN id_task INT)
BEGIN 
	DELETE FROM task 
    WHERE id = id_task;
END $$
DELIMITER ;
```
### Output

#### Sebelum
![Screenshot 2023-11-27 214946](https://github.com/radithyaarka/sbd/assets/143694651/69e3aa33-120c-4cb5-a5bd-3a65c4b6f381)

#### Menjalankan Procedure
![Screenshot 2023-11-27 220215](https://github.com/radithyaarka/sbd/assets/143694651/d50ca47f-3073-42a0-acda-bafa6f505ba1)

#### Setelah
![Screenshot 2023-11-27 220224](https://github.com/radithyaarka/sbd/assets/143694651/53aee68b-b51f-49ba-a8bc-afebe761743e)

## Soal 5 TRIGGER

### Query

```sql
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
```

### Output

#### Memasukkan Data Baru
![Screenshot 2023-11-27 214641](https://github.com/radithyaarka/sbd/assets/143694651/02c81f54-03df-4f0a-b5f8-54cc991aa0e0)

#### Tampilan Setelah Data Baru Dimasukkan
![Screenshot 2023-11-27 214804](https://github.com/radithyaarka/sbd/assets/143694651/e7d1b1ed-b811-451e-8cdc-d0aea92ba286)

Terlihat bahwa walaupun saat INSERT score diberi "120", namun pada tabel tetap tidak melebihi 100

