use ���Karle_UNIVER

--1-- ������������� ������� TEACHER
go
CREATE VIEW [�������������] 
as select TEACHER [���], TEACHER_NAME [��� �������������], GENDER [���], PULPIT [��� �������] 
from  TEACHER;
go
select * from �������������
drop view [�������������];

--2-- ���������� ������ �� ������ ����������
go
CREATE VIEW [���������� ������]
as select FACULTY.FACULTY_NAME [���������], count(*) [����������]
from FACULTY join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
group by FACULTY.FACULTY_NAME;
go
select * from [���������� ������]
drop view [���������� ������];

--3-- ��� ���������� ���������
go
CREATE VIEW ��������� (������������_���������, ���_���������)
as select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE  
from AUDITORIUM
where  AUDITORIUM.AUDITORIUM_TYPE like '%��%';        
go
select * from ���������

INSERT [���������] values ('33333322', '��');
INSERT [���������] values ('33999', '��-�');

drop view [���������]


--4-- �.3 with check option
go
CREATE VIEW ����������_��������� (������������_���������, ���)
as select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE  
from AUDITORIUM
where  AUDITORIUM.AUDITORIUM_TYPE like '%��%'        
WITH CHECK OPTION;
go
select * from ����������_���������

INSERT [����������_���������] values ('3333314213', '��');

drop view [����������_���������]


--5-- ���������� � ���������� �������
go
create view [����������] (���, ������������_����������, ���_�������)
as select top 15 SUBJECT.SUBJECT, SUBJECT.SUBJECT_NAME, SUBJECT.PULPIT
from SUBJECT 
order by SUBJECT.SUBJECT_NAME
go
select * from ����������

drop view [����������]


--6-- schemabinding
go
CREATE VIEW [���������� ������] WITH SCHEMABINDING
as select FACULTY.FACULTY_NAME [���������], count(*) [����������]
from dbo.FACULTY join dbo.PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
group by FACULTY.FACULTY_NAME;
go

select * from [���������� ������]

alter table FACULTY -- �� ����� ��������, ����� ������
alter column FACULTY char(50) not null;

drop view [���������� ������];