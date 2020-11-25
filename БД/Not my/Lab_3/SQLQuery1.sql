--№1
USE master;
CREATE DATABASE Karlenok_UNIVER;

--№2
CREATE TABLE STUDENT(
[Номер зачётки] int,
[Фамилия студета] nvarchar(10),
[Номер группы] int
);
SELECT * FROM STUDENT;

--№3
ALTER TABLE STUDENT ADD [Дата поступления] date;
SELECT * FROM STUDENT;
ALTER TABLE STUDENT DROP COLUMN [Дата поступления];

--№4
INSERT STUDENT([Номер зачётки],[Фамилия студета],[Номер группы]) VALUES
(71170001,'Бородина',4),
(71170002,'Карленок',4),
(71170003,'Лэ',4),
(71170004,'Марковский',4),
(71170005,'Матюх',4),
(71170006,'Мацуев',4),
(71170007,'Сикорский',4);

--№5
SELECT * FROM STUDENT;
SELECT [Фамилия студета] FROM STUDENT;
SELECT [Номер зачётки],[Фамилия студета] FROM STUDENT;
SELECT COUNT(*) FROM STUDENT;

--№6
UPDATE STUDENT SET [Номер группы] = 5;
DROP TABLE STUDENT;

--№7
CREATE TABLE STUDENT(
[Номер зачётки] int CONSTRAINT PK_STUDENT PRIMARY KEY,
[Фамилия студета] nvarchar(10) NOT NULL,
[Номер группы] int
);

INSERT STUDENT([Номер зачётки],[Фамилия студета],[Номер группы]) VALUES
(0002,N'Карленок',2);
DROP TABLE STUDENT;

CREATE TABLE STUDENT(
NZACH int CONSTRAINT PK_STUDENT PRIMARY KEY,
NAME nvarchar(10),
NGROUP int NOT NULL,
POL nchar(1) CHECK(POL IN ('м','ж'))
);
DROP TABLE STUDENT;

--№10
CREATE TABLE STUDENT(
[Номер зачётки] int CONSTRAINT PK_STUDENT PRIMARY KEY,
[ФИО] nvarchar(30) NOT NULL,
[Дата рождения] date,
[Пол] nchar(1) CHECK([Пол] IN ('м','ж')),
[Дата поступления] date
);

INSERT STUDENT([Номер зачётки], [ФИО], [Дата рождения], [Пол], [Дата поступления]) VALUES
(0001,'Бородина','1999-12-14','ж','20170101'),
(0002,'Карленок','2000-05-16','м','20170101'),
(0003,'Лэ','2000-05-17','м','20170101');

SELECT [ФИО]
FROM STUDENT
WHERE [ПОЛ]='ж' AND (YEAR([Дата поступления])-YEAR([Дата рождения])>=18);
