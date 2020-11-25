--�1
USE master;
CREATE DATABASE Karlenok_UNIVER;

--�2
CREATE TABLE STUDENT(
[����� �������] int,
[������� �������] nvarchar(10),
[����� ������] int
);
SELECT * FROM STUDENT;

--�3
ALTER TABLE STUDENT ADD [���� �����������] date;
SELECT * FROM STUDENT;
ALTER TABLE STUDENT DROP COLUMN [���� �����������];

--�4
INSERT STUDENT([����� �������],[������� �������],[����� ������]) VALUES
(71170001,'��������',4),
(71170002,'��������',4),
(71170003,'��',4),
(71170004,'����������',4),
(71170005,'�����',4),
(71170006,'������',4),
(71170007,'���������',4);

--�5
SELECT * FROM STUDENT;
SELECT [������� �������] FROM STUDENT;
SELECT [����� �������],[������� �������] FROM STUDENT;
SELECT COUNT(*) FROM STUDENT;

--�6
UPDATE STUDENT SET [����� ������] = 5;
DROP TABLE STUDENT;

--�7
CREATE TABLE STUDENT(
[����� �������] int CONSTRAINT PK_STUDENT PRIMARY KEY,
[������� �������] nvarchar(10) NOT NULL,
[����� ������] int
);

INSERT STUDENT([����� �������],[������� �������],[����� ������]) VALUES
(0002,N'��������',2);
DROP TABLE STUDENT;

CREATE TABLE STUDENT(
NZACH int CONSTRAINT PK_STUDENT PRIMARY KEY,
NAME nvarchar(10),
NGROUP int NOT NULL,
POL nchar(1) CHECK(POL IN ('�','�'))
);
DROP TABLE STUDENT;

--�10
CREATE TABLE STUDENT(
[����� �������] int CONSTRAINT PK_STUDENT PRIMARY KEY,
[���] nvarchar(30) NOT NULL,
[���� ��������] date,
[���] nchar(1) CHECK([���] IN ('�','�')),
[���� �����������] date
);

INSERT STUDENT([����� �������], [���], [���� ��������], [���], [���� �����������]) VALUES
(0001,'��������','1999-12-14','�','20170101'),
(0002,'��������','2000-05-16','�','20170101'),
(0003,'��','2000-05-17','�','20170101');

SELECT [���]
FROM STUDENT
WHERE [���]='�' AND (YEAR([���� �����������])-YEAR([���� ��������])>=18);
