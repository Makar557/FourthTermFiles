use ТМРKarle_UNIVER

--1-- представление таблицы TEACHER
go
CREATE VIEW [Преподаватели] 
as select TEACHER [Код], TEACHER_NAME [Имя преподавателя], GENDER [Пол], PULPIT [Код кафедры] 
from  TEACHER;
go
select * from Преподаватели
drop view [Преподаватели];

--2-- количество кафедр на каждом факультете
go
CREATE VIEW [Количество кафедр]
as select FACULTY.FACULTY_NAME [Факультет], count(*) [Количество]
from FACULTY join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
group by FACULTY.FACULTY_NAME;
go
select * from [Количество кафедр]
drop view [Количество кафедр];

--3-- все лекционные аудитории
go
CREATE VIEW Аудитории (Наименование_аудитории, код_аудитории)
as select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE  
from AUDITORIUM
where  AUDITORIUM.AUDITORIUM_TYPE like '%ЛК%';        
go
select * from Аудитории

INSERT [Аудитории] values ('33333322', 'ЛК');
INSERT [Аудитории] values ('33999', 'ЛБ-К');

drop view [Аудитории]


--4-- п.3 with check option
go
CREATE VIEW Лекционные_аудитории (Наименование_аудитории, тип)
as select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE  
from AUDITORIUM
where  AUDITORIUM.AUDITORIUM_TYPE like '%ЛК%'        
WITH CHECK OPTION;
go
select * from Лекционные_аудитории

INSERT [Лекционные_аудитории] values ('3333314213', 'ЛБ');

drop view [Лекционные_аудитории]


--5-- дисциплины в алфавитном порядке
go
create view [Дисциплины] (Код, Наименование_дисциплины, Код_кафедры)
as select top 15 SUBJECT.SUBJECT, SUBJECT.SUBJECT_NAME, SUBJECT.PULPIT
from SUBJECT 
order by SUBJECT.SUBJECT_NAME
go
select * from Дисциплины

drop view [Дисциплины]


--6-- schemabinding
go
CREATE VIEW [Количество кафедр] WITH SCHEMABINDING
as select FACULTY.FACULTY_NAME [Факультет], count(*) [Количество]
from dbo.FACULTY join dbo.PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
group by FACULTY.FACULTY_NAME;
go

select * from [Количество кафедр]

alter table FACULTY -- не можем изменять, будет ошибка
alter column FACULTY char(50) not null;

drop view [Количество кафедр];