use ���Karle_UNIVER;
select * from FACULTY;
select TEACHER, PULPIT from TEACHER;
select TEACHER, TEACHER_NAME from TEACHER where PULPIT like '����';
select TEACHER_NAME from TEACHER where PULPIT like '����' and PULPIT like '������';
select TEACHER_NAME from TEACHER where GENDER like '�' and PULPIT like '����';
select TEACHER_NAME from TEACHER where GENDER not like '�' and PULPIT not like '����';
select distinct PULPIT from TEACHER;
select AUDITORIUM, AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY desc;
select distinct top(5) AUDITORIUM_TYPE, AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY desc;
select distinct SUBJECT, NOTE from PROGRESS where NOTE between 8 and 10;
select distinct SUBJECT, SUBJECT_NAME, PULPIT from SUBJECT where PULPIT in ('�����', '������', '��');
select distinct PROFESSION_NAME [�������� �������������], QUALIFICATION [������������]  from PROFESSION where QUALIFICATION like '%�����%';
create table #TEMPORARY (
NAME nvarchar(100),
BDAY date
);
insert into #TEMPORARY (NAME, BDAY) select NAME, BDAY from STUDENT
select * from #TEMPORARY
drop table #TEMPORARY