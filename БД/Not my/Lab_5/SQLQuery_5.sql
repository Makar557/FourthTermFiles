use ТМРKarle_UNIVER;
select * from FACULTY;
select TEACHER, PULPIT from TEACHER;
select TEACHER, TEACHER_NAME from TEACHER where PULPIT like 'ИСиТ';
select TEACHER_NAME from TEACHER where PULPIT like 'ИСиТ' and PULPIT like 'ПОиСОИ';
select TEACHER_NAME from TEACHER where GENDER like 'ж' and PULPIT like 'ИСиТ';
select TEACHER_NAME from TEACHER where GENDER not like 'ж' and PULPIT not like 'ИСиТ';
select distinct PULPIT from TEACHER;
select AUDITORIUM, AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY desc;
select distinct top(5) AUDITORIUM_TYPE, AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY desc;
select distinct SUBJECT, NOTE from PROGRESS where NOTE between 8 and 10;
select distinct SUBJECT, SUBJECT_NAME, PULPIT from SUBJECT where PULPIT in ('ЛЗиДВ', 'ПОиСОИ', 'ОВ');
select distinct PROFESSION_NAME [Название специальности], QUALIFICATION [Квалификация]  from PROFESSION where QUALIFICATION like '%химик%';
create table #TEMPORARY (
NAME nvarchar(100),
BDAY date
);
insert into #TEMPORARY (NAME, BDAY) select NAME, BDAY from STUDENT
select * from #TEMPORARY
drop table #TEMPORARY