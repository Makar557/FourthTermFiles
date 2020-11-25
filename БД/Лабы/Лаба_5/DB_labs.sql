use master
go

use UNIVER


create table AUDITORIUM_TYPE
(    AUDITORIUM_TYPE  char(10) constraint AUDITORIUM_TYPE_PK  primary key,
      AUDITORIUM_TYPENAME  varchar(30)
 )
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )        values ('��',            '����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )         values ('��-�',          '������������ �����');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )         values ('��-�',          '���������� � ���. ����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )          values  ('��-X',          '���������� �����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )        values  ('��-��',   '����. ������������ �����');

create table AUDITORIUM
(   AUDITORIUM   char(20)  constraint AUDITORIUM_PK  primary key,
    AUDITORIUM_TYPE     char(10) constraint  AUDITORIUM_AUDITORIUM_TYPE_FK foreign key
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE),
   AUDITORIUM_CAPACITY  integer constraint  AUDITORIUM_CAPACITY_CHECK default 1  check (AUDITORIUM_CAPACITY between 1 and 300),  -- �����������
   AUDITORIUM_NAME      varchar(50)
)
go
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('206-1', '206-1',   '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('301-1',   '301-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('236-1',   '236-1', '��',   60);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('313-1',   '313-1', '��-�',   60);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('324-1',   '324-1', '��-�',   50);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('413-1',   '413-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('423-1',   '423-1', '��-�', 90);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('408-2',   '408-2', '��',  90);



create table FACULTY
(    FACULTY      char(10) primary key,
     FACULTY_NAME  varchar(50) default '???'
);

insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			('����', '���������� ���������� � �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			(N'���',     N'����������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			(N'���',		N'���������-������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			(N'����',	N'���������� � ������� ������ ��������������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			(N'���',		N'���������� ������������ �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			(N'��',		N'��������� �������������� ����������');

create table PROFESSION
(
	PROFESSION   char(20) constraint PROFESSION_PK  primary key,
	FACULTY    char(10) constraint PROFESSION_FACULTY_FK foreign key references FACULTY(FACULTY),
	PROFESSION_NAME varchar(100),    QUALIFICATION   varchar(50)
);
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
		values	('��',  '1-40 01 02',   '�������������� ������� � ���-�������', '�������-�����������-�������������' ),
				('���',  '1-47 01 01', '������������ ����', '��������-��������' ),
				('���',  '1-36 06 01',  '��������������� ������������ � ������� ��������� ����������', '�������-��������������' ),
				('����',  '1-36 01 08',    '��������������� � ������������ ������� �� �������������� ����������', '�������-�������' ),
 				('����',  '1-36 07 01',  '������ � �������� ���������� ����������� � ����������� ������������ ����������', '�������-�������' ),
				('���',  '1-75 01 01',      '������ ���������', '������� ���-���� ���������' ),
				('���',  '1-75 02 01',   '������-�������� �������������', '������� ������-��������� �������������' ),
				('���',  '1-89 02 02',     '������ � ���������������-���', '���������� � ����� �������' ),
				('���',  '1-25 01 07',  '��������� � ���������� �� ����-�������', '���������-��������' ),
				('���',  '1-25 01 08',    '������������� ����, ������ � �����', '���������' ),
				('����',  '1-36 05 01',   '������ � ������������ ������� ���������', '�������-�������' ),
				('����',  '1-46 01 01',      '�������������� ����', '�������-��������' ),
				('���',  '1-48 01 02',  '���������� ���������� ��-���������� �������, ���������� � �������', '�������-�����-��������' ),
				('���',  '1-48 01 05',    '���������� ���������� ��-��������� ���������', '�������-�����-��������' ),
				('���',  '1-54 01 03',   '������-���������� ������ � ������� �������� �������� ���������', '������� �� ������������' );


create table  PULPIT
(   PULPIT		 char(20)  constraint PULPIT_PK  primary key,
    PULPIT_NAME  varchar(100),
    FACULTY		 char(10)   constraint PULPIT_FACULTY_FK foreign key references FACULTY(FACULTY)
)
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY )
  values	('����', '�������������� ������ � ���������� ','��'  ),
			('������','���������������� ������������ � ������ ��������� ��-�������� ', '���'  ),
			('��', '����������� ���������','���'  ),
			('���', '�����������-������������ ���������', '���'  ),
			('��', '��������������� �����������','���'  ),
			('��', '�����������','���'),
			('��', '��������������','���'),
			('�����', '���������� � ����������������','���'),
			('����', '������ ������� � ������������','���'),
			('���', '������� � ������������������','���'),
			('������','������������ �������������� � ������-��������� �����-��������','���'),
			('��', '���������� ����', '����'),
			('�����','������ ����� � ���������� �������������','����'),
			('���','���������� �������������������� �����������', '����'),
			('�����','���������� � ������� ������� �� ���������','����'),
			('��', '������������ �����','���'),
			('���','���������� ����������� ���������','���'),
			('�������','���������� �������������� ������� � ����� ���������� ���������� ','����'),
			('�����','��������� � ��������� ���������� �����������','����'),
			('����',    '������������� ������ � ����������','���'),
			('����',   '����������� � ��������� ������������������','���'),
			('������', '����������, �������������� �����, ������� � ������', '���')

create table TEACHER
(
	TEACHER    char(10)  constraint TEACHER_PK  primary key,
	TEACHER_NAME  varchar(100),
	GENDER     char(1) CHECK (GENDER in ('�', '�')),
	PULPIT   char(20) constraint TEACHER_PULPIT_FK foreign key references PULPIT(PULPIT)
)
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('����',    '������ �������� �������������', '�',  '����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('�����',    '�������� ��������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('�����',    '���������� ������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('�����',    '�������� ������ ��������', '�', '����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('���',     '����� ��������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('���',     '��������� ����� ��������', '�', '����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('���',     '����� ������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('���',     '����� ������� �������������',  '�', '����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('���',     '����� ����� �������������',  '�',   '����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('������',   '���������� ��������� �������������', '�','������');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('���',     '��������� ������� �����������', '�', '������');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('������',   '����������� ��������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('����',   '������� ��������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('����',   '������ ������ ��������', '�', '��');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('����', '������� ������ ����������',  '�',  '������');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('���',     '���������� ������� ��������', '�', '������');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('���',   '������ ������ ���������� ', '�', '��');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('�����',   '��������� �������� ���������', '�', '�����');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('������',   '���������� �������� ����������', '�', '��');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('�����',   '�������� ������ ����������', '�', '��');

create table SUBJECT
(
	SUBJECT  char(10) constraint SUBJECT_PK  primary key,
	SUBJECT_NAME varchar(100) unique,
	PULPIT  char(20) constraint SUBJECT_PULPIT_FK foreign key references PULPIT(PULPIT)
)
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('����',   '������� ���������� ������ ������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('��',     '���� ������','����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('���',    '�������������� ����������','����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('����',  '������ �������������� � ����������������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('��',     '������������� ������ � ������������ ��������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('���',    '���������������� ������� ����������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('����',  '������������� ������ ��������� ����������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('���',     '�������������� �������������� ������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('��',      '������������ ��������� ','����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('�����',   '��������. ������, �������� � �������� �����', '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('���',     '������������ �������������� �������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('���',     '����������� ��������. ������������', '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('��',   '���������� ����������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('��',   '�������������� ����������������','����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('����', '���������� ������ ���',  '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('���',  '��������-��������������� ����������������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('��', '��������� ������������������','����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('��', '������������� ������','����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('������OO','�������� ������ ������ � ���� � ���. ������.','��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('�������','������ ������-��������� � ������������� �����-����',  '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('��', '���������� �������� ','��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('��',    '�����������', '�����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('��',    '������������ �����', '��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('���',    '���������� ��������� �������','�����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('���',    '������ ��������� ����','��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('����',   '���������� � ������������ �������������', '�����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('����',   '���������� ���������� �������� ���������� ','��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('���',    '���������� ������������','��');

create table GROUPS
(   IDGROUP  integer  identity(1,1) constraint GROUP_PK  primary key,
    FACULTY   char(10) constraint  GROUPS_FACULTY_FK foreign key references FACULTY(FACULTY),
    PROFESSION  char(20) constraint  GROUPS_PROFESSION_FK foreign key references PROFESSION(PROFESSION),
    YEAR_FIRST  smallint  check (YEAR_FIRST<=YEAR(GETDATE())),
)

insert into GROUPS   (FACULTY,  PROFESSION, YEAR_FIRST )
         values ('����','1-40 01 02', 2013), --1
                ('����','1-40 01 02', 2012),
                ('����','1-40 01 02', 2011),
                ('����','1-40 01 02', 2010),
                ('����','1-47 01 01', 2013),---5 ��
                ('����','1-47 01 01', 2012),
                ('����','1-47 01 01', 2011),
                ('����','1-36 06 01', 2010),-----8 ��
                ('����','1-36 06 01', 2013),
                ('����','1-36 06 01', 2012),
                ('����','1-36 06 01', 2011),
                ('����','1-36 01 08', 2013),---12 ��
                ('����','1-36 01 08', 2012),
                ('����','1-36 07 01', 2011),
                ('����','1-36 07 01', 2010),
                ('���','1-48 01 02', 2012), ---16 ��
                ('���','1-48 01 02', 2011),
                ('���','1-48 01 05', 2013),
                ('���','1-54 01 03', 2012),
                ('���','1-75 01 01', 2013),--20 ��
                ('���','1-75 02 01', 2012),
                ('���','1-75 02 01', 2011),
                ('���','1-89 02 02', 2012),
                ('���','1-89 02 02', 2011),
                ('����','1-36 05 01', 2013),
                ('����','1-36 05 01', 2012),
                ('����','1-46 01 01', 2012),--27 ��
                ('���','1-25 01 07', 2013),
                ('���','1-25 01 07', 2012),
                ('���','1-25 01 07', 2010),
                ('���','1-25 01 08', 2013),
                ('���','1-25 01 08', 2012) ---32 ��

create table STUDENT
(
	  IDSTUDENT   integer  identity(1000,1) constraint STUDENT_PK  primary key,
      IDGROUP   integer  constraint STUDENT_GROUP_FK foreign key references GROUPS(IDGROUP),
      NAME   nvarchar(100),
      BDAY   date,
      STAMP  timestamp,
      INFO     xml,
      FOTO     varbinary
)
insert into STUDENT (IDGROUP, NAME, BDAY)
        values
		   (1, '���������� ��������� �������������', '11.03.1995'),
           (1, '������ ��������� �������',    '07.12.1995'),
           (1, '������ �������� ����������',  '12.10.1995'),
           (1, '����� ��������� ���������',   '08.01.1995'),
           (1, '����� ����� ��������',  '02.08.1995'),
		   (2, '����� ������� ��������',         '12.07.1994'),
           (2, '������� �������� ����������',    '06.03.1994'),
           (2, '�������� ����� �����������',     '09.11.1994'),
           (2, '������� ����� ���������',        '04.10.1994'),
           (2, '��������� ��������� ����������', '08.01.1994'),
           (3, '������� ������ ���������',       '02.08.1993'),
           (3, '������� ��� ����������',         '07.12.1993'),
           (3, '������� ����� �����������',      '02.12.1993'),
           (4, '������� ������ �����������',     '08.03.1992'),
           (4, '������� ����� �������������',    '02.06.1992'),
           (4, '�������� ����� �����������',     '11.12.1992'),
           (4, '�������� ������� �������������', '11.05.1992'),
           (4, '����������� ������� ��������',   '09.11.1992'),
           (4, '�������� ������� ����������',    '01.11.1992'),
           (5, '�������� ����� ������������',    '08.07.1995'),
           (5, '������ ������� ����������',      '02.11.1995'),
           (5, '������ ��������� �����������',   '07.05.1995'),
           (5, '����� ��������� ���������',      '04.08.1995'),
           (6, '���������� ����� ����������',    '08.11.1994'),
           (6, '�������� ������ ��������',       '02.03.1994'),
           (6, '���������� ����� ����������',    '04.06.1994'),
           (6, '��������� ���������� ���������', '09.11.1994'),
           (6, '����� ��������� �������',        '04.07.1994'),
           (7, '����������� ����� ������������', '03.01.1993'),
           (7, '������� ���� ��������',          '12.09.1993'),
           (7, '��������� ������ ��������',      '12.06.1993'),
           (7, '���������� ��������� ����������','09.02.1993'),
           (7, '������� ������ ���������',       '04.07.1993'),
           (8, '������ ������� ���������',       '08.01.1992'),
           (8, '��������� ����� ����������',     '12.05.1992'),
           (8, '�������� ����� ����������',      '08.11.1992'),
           (8, '������� ������� ���������',      '12.03.1992'),
           (9, '�������� ����� �������������',   '10.08.1995'),
           (9, '���������� ������ ��������',     '02.05.1995'),
           (9, '������ ������� �������������',   '08.01.1995'),
           (9, '��������� ��������� ��������',   '11.09.1995'),
           (10, '������ ������� ������������',   '08.01.1994'),
           (10, '������ ������ ����������',      '11.09.1994'),
           (10, '����� ���� �������������',      '06.04.1994'),
           (10, '������� ������ ����������',     '12.08.1994'),
		   (11, '��������� ��������� ����������','07.11.1993'),
           (11, '������ ������� ����������',     '04.06.1993'),
           (11, '������� ����� ����������',      '10.12.1993'),
           (11, '������� ������ ����������',     '04.07.1993'),
           (11, '������� ����� ���������',       '08.01.1993'),
           (11, '����� ������� ����������',      '02.09.1993'),
           (12, '���� ������ �����������',       '11.12.1995'),
           (12, '������� ���� �������������',    '10.06.1995'),
           (12, '��������� ���� ���������',      '09.08.1995'),
           (12, '����� ����� ���������',         '04.07.1995'),
           (12, '��������� ������ ����������',   '08.03.1995'),
           (12, '����� ����� ��������',          '12.09.1995'),
           (13, '������ ����� ������������',     '08.10.1994'),
           (13, '���������� ����� ����������',   '10.02.1994'),
           (13, '�������� ������� �������������','11.11.1994'),
           (13, '���������� ����� ����������',   '10.02.1994'),
           (13, '����������� ����� ��������',    '12.01.1994'),
           (14, '�������� ������� �������������','11.09.1993'),
           (14, '������ �������� ����������',    '01.12.1993'),
           (14, '���� ������� ����������',       '09.06.1993'),
           (14, '�������� ���������� ����������','05.01.1993'),
           (14, '����������� ����� ����������',  '01.07.1993'),
           (15, '������� ��������� ���������',   '07.04.1992'),
           (15, '������ �������� ���������',     '10.12.1992'),
           (15, '��������� ����� ����������',    '05.05.1992'),
           (15, '���������� ����� ������������', '11.01.1992'),
           (15, '�������� ����� ����������',     '04.06.1992'),
           (16, '����� ����� ����������',        '08.01.1994'),
           (16, '��������� ��������� ���������', '07.02.1994'),
           (16, '������ ������ �����������',     '12.06.1994'),
           (16, '������� ����� ��������',        '03.07.1994'),
           (16, '������ ������ ���������',       '04.07.1994'),
           (17, '������� ��������� ����������',  '08.11.1993'),
           (17, '������ ����� ����������',       '02.04.1993'),
           (17, '������ ���� ��������',          '03.06.1993'),
           (17, '������� ������ ���������',      '05.11.1993'),
           (17, '������ ������ �������������',   '03.07.1993'),
           (18, '��������� ����� ��������',      '08.01.1995'),
           (18, '���������� ��������� ���������','06.09.1995'),
           (18, '�������� ��������� ����������', '08.03.1995'),
           (18, '��������� ����� ��������',      '07.08.1995');

create table PROGRESS
(
	SUBJECT   char(10) constraint PROGRESS_SUBJECT_FK foreign key references SUBJECT(SUBJECT),
	IDSTUDENT integer  constraint PROGRESS_IDSTUDENT_FK foreign key references STUDENT(IDSTUDENT),
	PDATE    date,
	NOTE     integer check (NOTE between 1 and 10)
)

insert into PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE)
    values ('����', 1000,  '01.10.2013',6),
           ('����', 1001,  '01.10.2013',8),
           ('����', 1002,  '01.10.2013',7),
           ('����', 1003,  '01.10.2013',5),
           ('����', 1005,  '01.10.2013',4),
		   ('����', 1014,  '01.12.2013',5),
           ('����', 1015,  '01.12.2013',9),
           ('����', 1016,  '01.12.2013',5),
           ('����', 1017,  '01.12.2013',4),
		   ('��',   1018,  '06.5.2013',4),
           ('��',   1019,  '06.05.2013',7),
           ('��',   1020,  '06.05.2013',7),
           ('��',   1021,  '06.05.2013',9),
           ('��',   1022,  '06.05.2013',5),
           ('��',   1023,  '06.05.2013',6);

create table STUDENT
(    IDSTUDENT   integer  identity(1000,1) constraint STUDENT_PK  primary key,
      IDGROUP   integer  constraint STUDENT_GROUP_FK foreign key references GROUPS(IDGROUP),
      NAME   nvarchar(100),
      BDAY   date,
      STAMP  timestamp,
      INFO     xml,
      FOTO     varbinary
 )

 go
insert into STUDENT (IDGROUP, NAME, BDAY)
        values (1, '���������� ��������� �������������', '11.03.1995'),
          (1, '������ ��������� �������',    '07.12.1995'),
           (1, '������ �������� ����������',  '12.10.1995'),
           (1, '����� ��������� ���������',   '08.01.1995'),
           (1, '����� ����� ��������',  '02.08.1995')
insert into STUDENT (IDGROUP,NAME, BDAY)
    values (2, '����� ������� ��������',         '12.07.1994'),
           (2, '������� �������� ����������',    '06.03.1994'),
           (2, '�������� ����� �����������',     '09.11.1994'),
           (2, '������� ����� ���������',        '04.10.1994'),
           (2, '��������� ��������� ����������', '08.01.1994'),
           (3, '������� ������ ���������',       '02.08.1993'),
           (3, '������� ��� ����������',         '07.12.1993'),
           (3, '������� ����� �����������',      '02.12.1993'),
           (4, '������� ������ �����������',     '08.03.1992'),
           (4, '������� ����� �������������',    '02.06.1992'),
           (4, '�������� ����� �����������',     '11.12.1992'),
           (4, '�������� ������� �������������', '11.05.1992'),
           (4, '����������� ������� ��������',   '09.11.1992'),
           (4, '�������� ������� ����������',    '01.11.1992'),
           (5, '�������� ����� ������������',    '08.07.1995'),
           (5, '������ ������� ����������',      '02.11.1995'),
           (5, '������ ��������� �����������',   '07.05.1995'),
           (5, '����� ��������� ���������',      '04.08.1995'),
           (6, '���������� ����� ����������',    '08.11.1994'),
           (6, '�������� ������ ��������',       '02.03.1994'),
           (6, '���������� ����� ����������',    '04.06.1994'),
           (6, '��������� ���������� ���������', '09.11.1994'),
           (6, '����� ��������� �������',        '04.07.1994'),
           (7, '����������� ����� ������������', '03.01.1993'),
           (7, '������� ���� ��������',          '12.09.1993'),
           (7, '��������� ������ ��������',      '12.06.1993'),
           (7, '���������� ��������� ����������','09.02.1993'),
           (7, '������� ������ ���������',       '04.07.1993'),
           (8, '������ ������� ���������',       '08.01.1992'),
           (8, '��������� ����� ����������',     '12.05.1992'),
           (8, '�������� ����� ����������',      '08.11.1992'),
           (8, '������� ������� ���������',      '12.03.1992'),
           (9, '�������� ����� �������������',   '10.08.1995'),
           (9, '���������� ������ ��������',     '02.05.1995'),
           (9, '������ ������� �������������',   '08.01.1995'),
           (9, '��������� ��������� ��������',   '11.09.1995'),
           (10, '������ ������� ������������',   '08.01.1994'),
           (10, '������ ������ ����������',      '11.09.1994'),
           (10, '����� ���� �������������',      '06.04.1994'),
           (10, '������� ������ ����������',     '12.08.1994')
insert into STUDENT (IDGROUP,NAME, BDAY)
    values (11, '��������� ��������� ����������','07.11.1993'),
           (11, '������ ������� ����������',     '04.06.1993'),
           (11, '������� ����� ����������',      '10.12.1993'),
           (11, '������� ������ ����������',     '04.07.1993'),
           (11, '������� ����� ���������',       '08.01.1993'),
           (11, '����� ������� ����������',      '02.09.1993'),
           (12, '���� ������ �����������',       '11.12.1995'),
           (12, '������� ���� �������������',    '10.06.1995'),
           (12, '��������� ���� ���������',      '09.08.1995'),
           (12, '����� ����� ���������',         '04.07.1995'),
           (12, '��������� ������ ����������',   '08.03.1995'),
           (12, '����� ����� ��������',          '12.09.1995'),
           (13, '������ ����� ������������',     '08.10.1994'),
           (13, '���������� ����� ����������',   '10.02.1994'),
           (13, '�������� ������� �������������','11.11.1994'),
           (13, '���������� ����� ����������',   '10.02.1994'),
           (13, '����������� ����� ��������',    '12.01.1994'),
           (14, '�������� ������� �������������','11.09.1993'),
           (14, '������ �������� ����������',    '01.12.1993'),
           (14, '���� ������� ����������',       '09.06.1993'),
           (14, '�������� ���������� ����������','05.01.1993'),
           (14, '����������� ����� ����������',  '01.07.1993'),
           (15, '������� ��������� ���������',   '07.04.1992'),
           (15, '������ �������� ���������',     '10.12.1992'),
           (15, '��������� ����� ����������',    '05.05.1992'),
           (15, '���������� ����� ������������', '11.01.1992'),
           (15, '�������� ����� ����������',     '04.06.1992'),
           (16, '����� ����� ����������',        '08.01.1994'),
           (16, '��������� ��������� ���������', '07.02.1994'),
           (16, '������ ������ �����������',     '12.06.1994'),
           (16, '������� ����� ��������',        '03.07.1994'),
           (16, '������ ������ ���������',       '04.07.1994'),
           (17, '������� ��������� ����������',  '08.11.1993'),
           (17, '������ ����� ����������',       '02.04.1993'),
           (17, '������ ���� ��������',          '03.06.1993'),
           (17, '������� ������ ���������',      '05.11.1993'),
           (17, '������ ������ �������������',   '03.07.1993'),
           (18, '��������� ����� ��������',      '08.01.1995'),
           (18, '���������� ��������� ���������','06.09.1995'),
           (18, '�������� ��������� ����������', '08.03.1995'),
           (18, '��������� ����� ��������',      '07.08.1995');


/*1. ������������ �������� ����� ��������� (������� AUDITORUM.AUDITORIUM) � ��������������� �� ������������
  ����� ��������� (������� AUDITORIUM_ TYPE.AUDITORIUM_ TYPENAME).*/
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM
join AUDITORIUM_TYPE on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;


/*2. ������������ �������� ����� ��������� (������� AUDITORIUM.AUDITORIUM) � ��������������� �� ������������
  ����� ��������� (������� AUDITORIUM_ TYPE.AUDITO-RIUM_TYPENAME).
  ����������: ������������ ���������� ������ INNER JOIN � �������� LIKE.*/
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM
join AUDITORIUM_TYPE
on   AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE and AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%���������%';


/*3. �������� ��� SELECT-�������, �����-������ �������������� ������ ��������-��� �������� �� ������� 1 � 2, �� ��� �����-����� INNER JOIN. */
select T1.AUDITORIUM, T2.AUDITORIUM_TYPENAME
from AUDITORIUM as T1, AUDITORIUM_TYPE as T2
where T1.AUDITORIUM_TYPE = T2.AUDITORIUM_TYPE;

select T1.AUDITORIUM, T2.AUDITORIUM_TYPENAME
from AUDITORIUM as T1, AUDITORIUM_TYPE as T2
where T1.AUDITORIUM_TYPE = T2.AUDITORIUM_TYPE and T2.AUDITORIUM_TYPENAME like '%���������%';

/*4. �� ������ ������ PROGRESS, STUDENT, GROUPS, SUBJECT, PULPIT � FACULTY ������������ �������� ���������,
���������� ��������������� ������ (������� PROGRESS.NOTE) �� 6 �� 8.
�������������� ����� ������ ��������� �������:
���������, �������, ��������-�����, ����������, ��� ��������, ����-��.
� ������� ������ ������ ���� ������-�� ��������������� ������ ��������: �����, ����, ������.*/


select FACULTY.FACULTY_NAME, PROFESSION.PROFESSION_NAME, STUDENT.NAME, PROGRESS.SUBJECT,
    case
    when PROGRESS.NOTE = 6 then '�����'
    when PROGRESS.NOTE = 7 then '����'
    when PROGRESS.NOTE = 8 then '������'
    end '������'
from STUDENT
join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
                     and PROGRESS.NOTE between 6 and 8
join GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP
join PROFESSION on GROUPS.PROFESSION = PROFESSION.PROFESSION
join FACULTY on PROFESSION.FACULTY = FACULTY.FACULTY;

/*5. ����������: ������������ ��������� CASE � ������ ORDER BY.*/

select FACULTY.FACULTY_NAME, PROFESSION.PROFESSION_NAME, STUDENT.NAME, PROGRESS.SUBJECT,
    case
    when PROGRESS.NOTE = 6 then '�����'
    when PROGRESS.NOTE = 7 then '����'
    when PROGRESS.NOTE = 8 then '������'
    end '������'
from STUDENT
join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
                     and PROGRESS.NOTE between 6 and 8
join GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP
join PROFESSION on GROUPS.PROFESSION = PROFESSION.PROFESSION
join FACULTY on PROFESSION.FACULTY = FACULTY.FACULTY
order by
(case
    when PROGRESS.NOTE = 6 then 3
    when PROGRESS.NOTE = 7 then 1
    when PROGRESS.NOTE = 8 then 2
    end
)


/*6. �� ������ ������ PULPIT � TEACHER �������� ������ �������� ������ (������� PULPIT.PULPIT_ NAME)
  � �������������� (������� TEACHER.TEA-CHER_NAME) �� ���� ��������. �������������� ����� ������ ���������
  ��� �������: ������� � �������������. ���� �� ������� ��� �����-���������, �� � ������� ������������� ������ ���� �������� ������ ***.
����������: ������������ ���������� ������ LEFT OUTER JOIN � ������� isnull.
*/
select PULPIT.PULPIT_NAME, isnull(TEACHER.TEACHER_NAME, '***')
from PULPIT
left outer join TEACHER on PULPIT.PULPIT = TEACHER.PULPIT


select PULPIT.PULPIT_NAME, isnull(TEACHER.TEACHER_NAME, '***')
from PULPIT
right outer join TEACHER on PULPIT.PULPIT = TEACHER.PULPIT


select PULPIT.PULPIT_NAME, isnull(TEACHER.TEACHER_NAME, '***')
from TEACHER
full outer join PULPIT on PULPIT.PULPIT = TEACHER.PULPIT


select PULPIT.PULPIT_NAME, isnull(TEACHER.TEACHER_NAME, '***')
from PULPIT
full outer join TEACHER on PULPIT.PULPIT = TEACHER.PULPIT
where TEACHER.PULPIT is null

/*9. ����������� SELECT-������ �� ������ CROSS JOIN-���������� ������ AUDITO-RIUM_TYPE
  � AUDITORIUM, �������-����� ���������, ����������� ����������, ����������� ���
  ���������� ������� � ��-����� 1.*/
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM
cross join AUDITORIUM_TYPE



/*���� 6*/

/*1. �� ������ ������ FACULTY, PUL-PIT � PROFESSION ������������ ���-��� ������������
  ������ (������� PUL-PIT_NAME), ������� ��������� �� ��-�������� (������� FACULTY),
  ��������-������ ���������� �� �������������, � ������������ (������� PROFESSION_ NAME)
  �������� ���������� ����� ���-������� ��� ����������. ����������: ������������
  � ������ WHERE �������� IN c ����������������� ����������� � ������� PROFESSION. */

select PULPIT_NAME, FACULTY_NAME
from PULPIT, FACULTY
where FACULTY.FACULTY in (select PROFESSION.FACULTY from PROFESSION where PROFESSION_NAME like '%���������[��]%')
  and PULPIT.FACULTY = FACULTY.FACULTY

/*2. ���������� ������ ������ 1 ����� �������, ����� ��� �� ��������� ��� ��-�����
  � ����������� INNER JOIN ������ FROM �������� �������. ��� ���� ��-������� ����������
  ������� ������ ���� ����������� ���������� ��������� �����-��. */

select distinct PULPIT_NAME, FACULTY_NAME
from PULPIT, FACULTY
join PROFESSION on FACULTY.FACULTY in (select PROFESSION.FACULTY from PROFESSION where PROFESSION_NAME like '%���������[��]%')
where PULPIT.FACULTY = FACULTY.FACULTY

/*3. ���������� ������, ����������� 1 ����� ��� ������������� ����������. ����������: ������������ ���������� INNER JOIN ���� ������. */

select distinct PULPIT_NAME, FACULTY_NAME
from PULPIT
join FACULTY on PULPIT.FACULTY = FACULTY.FACULTY
join PROFESSION on PROFESSION.FACULTY = FACULTY.FACULTY
where PROFESSION_NAME like '%���������[��]%'

/*4. �� ������ ������� AUDITORIUM ������������ ������ ��������� ����� ������� ������������
  (������� AUDI-TORIUM_CAPACITY) ��� ������� ���� ��������� (AUDITORIUM_TYPE). ��� ���� ���������
  ������� ������������� � ������� �������� �����������. �������-���: ������������ �������������
  �����-���� c �������� TOP � ORDER BY. */

select AUDITORIUM.AUDITORIUM_TYPE, AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM
from AUDITORIUM
where AUDITORIUM_CAPACITY = (select top(1) AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY  desc )

/*5. �� ������ ������ FACULTY � PUL-PIT ������������ ������ ������������ ����������� (������� FACULTY_NAME)
  �� ������� ��� �� ����� ������� (�����-�� PULPIT). ����������: ������������ �������� EXISTS � ��������������� ���-������. */

select FACULTY_NAME
from FACULTY  where not exists (select * from PULPIT where PULPIT.FACULTY = FACULTY.FACULTY  )

/*6. �� ������ ������� PROGRESS ������������ ������, ���������� ����-��� �������� ������ (������� NOTE)
  �� �����������, ������� ��������� ����: ����, �� � ����. ����������: ������-������ ��� �����������������
  ���������� � ������ SELECT; � ����������� �����-���� ���������� ������� AVG. */

select top(1)
(select avg(PROGRESS.NOTE ) from PROGRESS where PROGRESS.SUBJECT  = '����')[�� ���� ����],
(select avg(PROGRESS.NOTE ) from PROGRESS where PROGRESS.SUBJECT  = '��')[�� ���� ��],
(select avg(PROGRESS.NOTE ) from PROGRESS where PROGRESS.SUBJECT  = '����')[�� ���� ����]
from PROGRESS

-- 7. ����������� SELECT-������, �����-���������� ������� ���������� ALL ��������� � �����������.

select *
from PROGRESS
where PROGRESS.SUBJECT = '����' and
      PROGRESS.NOTE >=all (select PROGRESS.NOTE  from PROGRESS where PROGRESS.SUBJECT = '����')

-- 8. ����������� SELECT-������, �����-���������� ������� ���������� ANY ��������� � �����������.

select *
from PROGRESS
where PROGRESS.SUBJECT = '����' and
      PROGRESS.NOTE >any (select PROGRESS.NOTE from PROGRESS where PROGRESS.SUBJECT = '����')







-- ���� 7

/*1. �� ������ ������� AUDITORIUM ����������� SELECT-������, ����������� ������������,
  ����������� � ������� ����������� ���������, ��������� ���-�������� ���� ���������
  � ����� ������-���� ���������. */


select max(AUDITORIUM_CAPACITY) as [����. �����.],
       min(AUDITORIUM_CAPACITY) as [���. �����.],
       avg(AUDITORIUM_CAPACITY) as [��. �����.],
       sum(AUDITORIUM_CAPACITY) as [����� �����.],
       count(AUDITORIUM_CAPACITY) as [���-�� �����.]
from AUDITORIUM


/*2. �� ������ ������ AUDITORIUM � AUDITORIUM_TYPE ����������� ������, ����������� ��� ������� ����
  ��������� ������������, �����������, ������� ����������� ���������, ��������� ���-��������
  ���� ��������� � ����� ������-���� ��������� ������� ����.
  �������������� ����� ������ �����-���� ������� � ������������� ���� ����-�����
  (������� AUDITORIUM_TYPE.AU-DITORIUM_TYPENAME) � ������� � ������������ ����������.
  ������������ ���������� ���������� ������, ������ GROUP BY � ���������� �������.
*/
select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME as [��� �����.],
       max(AUDITORIUM_CAPACITY) as [����. �����.],
       min(AUDITORIUM_CAPACITY) as [���. �����.],
       avg(AUDITORIUM_CAPACITY) as [��. �����.],
       sum(AUDITORIUM_CAPACITY) as [����� �����.],
       count(AUDITORIUM_CAPACITY) as [���-�� �����.]
from AUDITORIUM inner join AUDITORIUM_TYPE on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
group by AUDITORIUM_TYPE.AUDITORIUM_TYPENAME

/*3. ����������� ������ �� ������ ������� PROGRESS, ������� �������� ���������� ��������������� ������
  � �������� �����-����. ��� ���� ������, ��� ���������� ����� ������ �������������� � �������, ��������
  �������� ������; ����� �������� � ������� ���������� ������ ���� ����� ���������� ����� � ������� PROGRESS.
������������ ��������� � ������ FROM, � ���������� ��������� GROUP BY, ���-������� ����������� �� ������� �������.
  � ������ GROUP BY, � SELECT-������ ���������� � � ORDER BY �������� �����-�� ��������� CASE.
 */

select *
from (select
          case
            when PROGRESS.NOTE = 10 then '10'
            when PROGRESS.NOTE between 8 and 9 then '8-9'
            when PROGRESS.NOTE between 6 and 7 then '6-7'
            when PROGRESS.NOTE between 4 and 5 then '4-5'
            else '<4'
          end [������], count(*) as ����������
      from PROGRESS
      group by
          case
            when PROGRESS.NOTE = 10 then '10'
            when PROGRESS.NOTE between 8 and 9 then '8-9'
            when PROGRESS.NOTE between 6 and 7 then '6-7'
            when PROGRESS.NOTE between 4 and 5 then '4-5'
            else '<4'
          end
    ) as T
order by
   case [������]
        when '10'  then 1
        when '8-9' then 2
        when '6-7' then 3
        when '4-5' then 4
        else 5
    end

/*4. ����������� SELECT-������� �� ����-�� ������ FACULTY, GROUPS, STU-DENT � PROGRESS, ������� �������� �������
  ��������������� ������ ��� ������ ������  ������ �������������. ������ ������������� � ������� �������� ������� ������.

��� ���� ������� ������, ��� ������� ������ ������ �������������� � ��������� �� ���� ������ ����� �������.
  ��������-���� ���������� ���������� ������, ����-������ ������� AVG � ���������� ����-��� CAST � ROUND.

���������� SELECT-������, ����������-��� � ������� 4 ���, ����� � ������� ����-���� �������� ������ ��������������
  ����-�� ������ �� ����������� � ������ �� � ����. ������������ WHERE.
*/

select  FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY join
     (PROGRESS inner join STUDENT on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT) on GROUPS.IDGROUP = STUDENT.IDGROUP
group by FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP

select  FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY join
     (PROGRESS inner join STUDENT on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT) on GROUPS.IDGROUP = STUDENT.IDGROUP
where PROGRESS.SUBJECT = '����' or PROGRESS.SUBJECT = '����'
group by FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP

/*5. �� ������ ������ FACULTY, GROUPS, STUDENT � PROGRESS �����-������ SELECT-������, � ������� �������-�� �������������,
  ���������� � ������� ������ ��� ����� ��������� �� ���������� ���. ������������ ����������� �� ����� FACULTY, PROFESSION, SUBJECT.
 �������� � ������ ����������� ROLLUP � ���������������� ���������.
*/

select  FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY join
     (PROGRESS inner join STUDENT on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT) on GROUPS.IDGROUP = STUDENT.IDGROUP
where FACULTY.FACULTY = '���'
group by FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP with ROLLUP --��������� ����������� ������ � �������������� �����

/*6. ��������� �������� SELECT-������ �.5 � �������������� CUBE-�����������. ���������������� ���������.*/

select  FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY join
     (PROGRESS inner join STUDENT on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT) on GROUPS.IDGROUP = STUDENT.IDGROUP
where FACULTY.FACULTY = '���'
group by FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP with CUBE --��� ������ ���������� �����

/*7-8-9. �� ������ ������ GROUPS, STU-DENT � PROGRESS ����������� SELECT-������, � ������� ������������ ���������� ����� ���������.
    � ������� ������ ���������� ��������-�����, ����������, ������� ������ ������-��� �� ���������� ���.
    �������� ����������� ������, � ������� ������������ ���������� ����� ��������� �� ���������� ����.
    ���������� ���������� ���� �������� � �������������� ���������� UNION � UN-ION ALL. ��������� ����������.
*/

select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from (PROGRESS inner join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT) join
     GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
--where GROUPS.FACULTY = '���'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT

--UNION ALL
INTERSECT
--EXCEPT

select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from (PROGRESS inner join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT) join
     GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
--where GROUPS.FACULTY = '����'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT

/*10. �� ������ ������� PROGRESS ���������� ��� ������ ���������� ����-������ ���������,
   ���������� ������ 8 � 9. ������������ �����������, ������ HAVING, ����������. */
select PROGRESS.SUBJECT, count(*) as [STUDENTS WITH 8 or 9]
from PROGRESS
group by PROGRESS.SUBJECT, PROGRESS.NOTE
HAVING PROGRESS.NOTE = '8' or PROGRESS.NOTE = '9'
order by [STUDENTS WITH 8 or 9] desc


-- ���� 8



/*1. 1. ����������� ������������� � ������ �������������. ������������� ������ ���� ��-�������
  �� ������ SELECT-������� � ������� TEACHER � ��������� ��������� �������: ��� (TEACHER),
  ��� ������������� (TEACHER_NAME), ��� (GENDER), ��� ������� (PULPIT). */

use UNIVER

drop view TEACHERS
create view TEACHERS as select * from TEACHER;

/*2. ����������� � ������� ������������� � ������ ���������� ������. ������������� ������ ����
  ��������� �� ������ SELECT-������� � �������� FACULTY � PULPIT.
  ������������� ������ ��������� ������-��� �������: ��������� (FACUL-TY.FACULTY_ NAME),
  ���������� ������ (����������� �� ������ ����� ������� PULPIT).
  ��������� ������������� ���������� ���-������� INSERT, UPDATE � DELETE ��� ������������� ���������� ������.
*/
drop view [PULPIT COUNT]

create view [PULPIT COUNT] as
    select PULPIT.FACULTY, count(*) as [PULPIT COUNT]
    from PULPIT join FACULTY on PULPIT.FACULTY = FACULTY.FACULTY
    GROUP BY PULPIT.FACULTY

/*3. ����������� � ������� ������������� � ������ ���������. ������������� ������ ���� ���������
     �� ������ ������� AUDITO-RIUM � ��������� �������: ��� (AUDITO-RIUM), ������������ ��������� (AUDITO-RIUM_NAME).
     ������������� ������ ���������� ������ ���������� ��������� (� ������� AUDITO-RIUM_ TYPE ������, ������������ � �����-�� ��)
     � ��������� ���������� ��������� IN-SERT, UPDATE � DELETE.
*/

Drop view AUDITORIUMS

create view [AUDITORIUMS] as
    select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE
    from AUDITORIUM
    where AUDITORIUM.AUDITORIUM_TYPE like '%��%' with check option

--  ����� ��������
  insert AUDITORIUMS(AUDITORIUM, AUDITORIUM_TYPE)
values('287-4', '��-�'),
      ('409-2', '��'),
      ('115-1', '��-�')

--������
insert AUDITORIUMS(AUDITORIUM, AUDITORIUM_TYPE) values('297-4', '��')


/*5. ����������� � ������� ������������� � ������ ����������. ������������� ������ ����
     ��������� �� ������ SELECT-������� � ������� SUBJECT, ���������� ��� ��������-�� � ����������
     ������� � ��������� �����-���� �������: ��� (SUBJECT), ���������-��� ���������� (SUBJECT_NAME)
     � ��� ������� (PULPIT).
     ������������ ������ TOP � ORDER BY.
*/

drop view SUBJECTS

create view [SUBJECTS] as
    select top(10) *
    from SUBJECT
    order by SUBJECT_NAME;

/*6. �������� ������������� ������-����_������, ��������� � ������� 2 ���, ����� ��� ���� ��������� � ������� ��������.
     ���-��������������� �������� ������������� ������������� � ������� ��������.
     �������-���: ������������ ����� SCHEMABINDING. */

create view [PULPIT COUNT with schemabinding] WITH SCHEMABINDING as
    select dbo.PULPIT.FACULTY, count(*) as [PULPIT COUNT]
    from dbo.PULPIT
    GROUP BY dbo.PULPIT.FACULTY

Alter table PULPIT DROP COLUMN FACULTY



/*     ���� 9          */

--Task 1
DECLARE @c CHAR = 'V',
	@vc NVARCHAR = 'A',
	@dt DATETIME,
	@time TIME,
	@i INT,
	@si SMALLINT,
	@ti TINYINT,
	@n NUMERIC(12,5)
SET @time = SYSDATETIME()
SET @dt = (SELECT GETDATE())
SELECT @ti = 3, @i = 1, @si = 2
SELECT @c, @vc, @time
PRINT CAST(@si AS VARCHAR) + CAST(@i AS VARCHAR) + CAST(@ti AS VARCHAR)

--Task 2
DECLARE @CAPACITY INT = (SELECT SUM(AUDITORIUM.AUDITORIUM_CAPACITY) FROM AUDITORIUM),
@AVERAGECAPACITY INT = (SELECT AVG(AUDITORIUM.AUDITORIUM_CAPACITY) FROM AUDITORIUM)
IF @CAPACITY > 200
	BEGIN
	    SELECT COUNT(AUD1.AUDITORIUM) [COUNT OF AUDITORIUMS], @AVERAGECAPACITY [AVERAGE CAPACITY],
        (SELECT COUNT(AUD2.AUDITORIUM) FROM  AUDITORIUM AUD2 WHERE AUD2.AUDITORIUM_CAPACITY < @AVERAGECAPACITY) [AUDS WITH LOWER CAPACITY],
        (SELECT (SELECT COUNT(AUD3.AUDITORIUM) FROM  AUDITORIUM AUD3 WHERE AUD3.AUDITORIUM_CAPACITY < @AVERAGECAPACITY)*100/COUNT(AUD4.AUDITORIUM) FROM AUDITORIUM AUD4) [% OF LOWER CAPACITIES]
        FROM AUDITORIUM AUD1
	END
ELSE
	BEGIN
	PRINT @CAPACITY
	END;

--Task 3
PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' ����� ������-������ �����; '
PRINT CAST(@@VERSION AS VARCHAR) + ' ������ SQL Server; '
PRINT CAST(@@SPID AS VARCHAR) + ' ���������� ��������� ������������� ��������, ��������-��� �������� �������� ��������-���;'
PRINT CAST(@@ERROR AS VARCHAR) + ' ��� ��������� ������; '
PRINT CAST(@@SERVERNAME AS VARCHAR) + ' ��� �������; '
PRINT CAST(@@TRANCOUNT AS VARCHAR) + ' ���������� ������� ����������� ����������; '
PRINT CAST(@@FETCH_STATUS AS VARCHAR) + ' �������� ��-�������� ���������� ����� ��������-������� ������; '
PRINT CAST(@@NESTLEVEL AS VARCHAR) + ' ������� ������-����� ������� ���������.';

--Task 4
DECLARE @z FLOAT, @t FLOAT, @x FLOAT
SET @z = 1
SET @t = 5
SET @x = 3
IF @t > @x
	SET @z = CONVERT(INT, SIN(@t))^2
ELSE IF @t < @x
	SET @z = 4*(@t + @x)
ELSE
	SET @t = 1 - EXP(@x - 2)
PRINT 'Answer ' + cast(@z as varchar)

SELECT substring(STUDENT.NAME, 1, charindex(' ', STUDENT.NAME))
+substring(STUDENT.NAME, charindex(' ', STUDENT.NAME)+1,1)+'.'
+substring(STUDENT.NAME, charindex(' ', STUDENT.NAME, charindex(' ', STUDENT.NAME)+1)+1,1)+'.' AS [STUDENT NAME]
FROM STUDENT;

SELECT STUDENT.NAME, DATEDIFF(year, STUDENT.BDAY, GETDATE()) [AGE] FROM STUDENT
WHERE MONTH(STUDENT.BDAY) = MONTH(DATEADD(m, 1, GETDATE()));

SELECT STUDENT.NAME, DATENAME(dw, PROGRESS.PDATE) [WEEKDAY]
FROM STUDENT INNER JOIN PROGRESS ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
WHERE PROGRESS.SUBJECT = '����';

--Task 6
SELECT STUDENT.NAME, AVG(PROGRESS.NOTE) [AVERAGE],
       CASE
	WHEN AVG(PROGRESS.NOTE) BETWEEN 1 AND 4 THEN 'BAD'
	WHEN AVG(PROGRESS.NOTE) BETWEEN 5 AND 7 THEN 'NORMAL'
	ELSE 'GOOD'
	END [RESULT]
FROM STUDENT INNER JOIN PROGRESS ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
GROUP BY STUDENT.NAME

--Task 7
CREATE TABLE #TASK1(
	ID INT,
	BDAY DATE,
	MESSAGE VARCHAR(MAX)
	)
GO
DECLARE @index INT = 0
WHILE @index < 10
	BEGIN
	INSERT #TASK1 VALUES (@index, GETDATE(), CAST(@index AS varchar))
	SET @index += 1
	END
SELECT * FROM #TASK1

--Task 8
DECLARE @x INT = 1
PRINT @x
RETURN
PRINT 'HELLO'


--TASK 9
BEGIN TRY
--UPDATE dbo.AUDITORIUM SET AUDITORIUM_CAPACITY = '�' where AUDITORIUM.AUDITORIUM_TYPE LIKE '%��%'
END TRY
BEGIN CATCH
PRINT ERROR_NUMBER()
PRINT ERROR_MESSAGE()
PRINT ERROR_LINE()
PRINT ERROR_PROCEDURE()
PRINT ERROR_SEVERITY()
PRINT ERROR_STATE()
END CATCH




---   ���� 10   ---

-- TASK 1
--SP_HELPINDEX ����� �������� �������� ��������, ��������� � �������� ��������

exec sp_helpindex 'AUDITORIUM';
exec sp_helpindex 'AUDITORIUM_TYPE';
exec sp_helpindex 'FACULTY';
exec sp_helpindex 'GROUPS';
exec sp_helpindex 'PROFESSION';
exec sp_helpindex 'PROGRESS';
exec sp_helpindex 'PULPIT';
exec sp_helpindex 'STUDENT';
exec sp_helpindex 'SUBJECT';
exec sp_helpindex 'TEACHER';

/*������� ��������� ��������� �������. ��������� �� ������� (�� ����� 1000 �����).
������� ���������������� ������, ����������� ��������� SELECT-�������.
*/
CREATE TABLE #TEMP1(
ID int IDENTITY(1,1),
VALUE varchar(10));

DROP TABLE #TEMP1;

DECLARE @i int = 1;
WHILE @i < 1001
BEGIN
INSERT INTO #TEMP1(VALUE) VALUES (10000*rand());
SET @i = @i + 1;
END

select * from #TEMP1
----
CREATE CLUSTERED INDEX indx1
ON #TEMP1(VALUE ASC);

DROP INDEX #TEMP1.indx1;
----
checkpoint; --�������� ��
DBCC DROPCLEANBUFFERS; --�������� �������� ���

SELECT * FROM #TEMP1 t WHERE t.ID BETWEEN 100 AND 200 ORDER BY t.VALUE;


---TASK 2

/*������� ��������� ��������� ���-����. ��������� �� ������� (10000 ����� ��� ������).
������� ������������������ ��-���������� ��������� ������.
*/
drop table #TEMP1

CREATE TABLE #TEMP(
ID int IDENTITY(1,1),
VALUE varchar(10));

DROP TABLE #TEMP;

DECLARE @i int = 1;
WHILE @i < 1001
BEGIN
INSERT INTO #TEMP(VALUE) VALUES (10000 * rand());
SET @i = @i + 1;
END

select * from #TEMP
---
CREATE INDEX indx ON #TEMP(ID,VALUE);
DROP INDEX #TEMP.indx;
SELECT * FROM #TEMP t WHERE t.ID > 200;

drop table #TEMP

SELECT * FROM #TEMP t WHERE t.ID BETWEEN 100 AND 200 ORDER BY t.VALUE;

---TASK3

/**/
CREATE TABLE #TEMP(
ID int,
VALUE1 nvarchar(100),
VALUE2 nvarchar(100));
DECLARE @k int = 1;
WHILE @k < 1000
BEGIN
INSERT #TEMP(ID, VALUE1,VALUE2) VALUES (FLOOR(100*RAND()),N'����������� ������' + CAST(FLOOR(RAND()*10) AS nvarchar(2)),N'�������');
SET @k = @k + 1;
END;

CREATE INDEX indx ON #TEMP(ID) INCLUDE(VALUE1,VALUE2);
DROP INDEX #TEMP.indx;

SELECT t.VALUE1,t.VALUE2 FROM #TEMP t WHERE t.ID = 50;

drop table #TEMP

---TASK 4

CREATE TABLE #TEMP(
ID int IDENTITY(1,1),
NAME nvarchar(100),
AGE int);

DECLARE @k int = 1,@y int;
WHILE @k < 1000
BEGIN
SET @y = @k%3;
INSERT #TEMP(NAME,AGE) VALUES (
CASE @y
WHEN 0 THEN N'����'
WHEN 1 THEN N'����'
WHEN 2 THEN N'����'
END,
FLOOR(RAND()*20));
SET @k = @k + 1;
END;

CREATE INDEX indx ON #TEMP(ID) WHERE(ID > 50 AND ID < 60);
DROP INDEX #TEMP.indx;

SELECT t.ID FROM #TEMP t WHERE t.ID > 50 AND t.ID < 60;
drop table #TEMP

---TASK 5

CREATE TABLE #TEMP(
ID int IDENTITY(1,1),
NAME nvarchar(100),
AGE int);

CREATE INDEX indx ON #TEMP(ID);

DECLARE @k int = 1,@y int;
WHILE @k < 10000
BEGIN
SET @y = @k%3;
INSERT #TEMP(NAME,AGE) VALUES (
CASE @y
WHEN 0 THEN N'����'
WHEN 1 THEN N'����'
WHEN 2 THEN N'����'
END,
FLOOR(RAND()*20));
SET @k = @k + 1;
END;

SELECT tab2.name [������], tab1.avg_fragmentation_in_percent [������������ (%)] FROM
sys.dm_db_index_physical_stats(DB_ID(N'UNIVER'),OBJECT_ID(N'#TEMP'),NULL,NULL,NULL) tab1
JOIN
sys.indexes tab2
ON tab1.object_id = tab2.object_id AND tab1.index_id = tab2.index_id
WHERE tab2.name IS NOT NULL;

ALTER INDEX indx ON #TEMP REORGANIZE;

ALTER INDEX indx ON #TEMP REBUILD WITH(ONLINE = OFF );

drop table #TEMP


---TASK 6

CREATE TABLE #TEMP(
ID int IDENTITY(1,1),
NAME nvarchar(100),
AGE int);

DROP TABLE #TEMP;
--�������� FILLFACTOR ��������� ������� ���������� ��������� ������� ������� ������.
CREATE INDEX indx ON #TEMP(ID) WITH(FILLFACTOR = 65);

DROP INDEX #TEMP.indx;

DECLARE @k int = 1,@y int;
WHILE @k < 10000
BEGIN
SET @y = @k%3;
INSERT #TEMP(NAME,AGE) VALUES (
CASE @y
WHEN 0 THEN N'����'
WHEN 1 THEN N'����'
WHEN 2 THEN N'����'
END,
FLOOR(RAND()*20));
SET @k = @k + 1;
END;

SELECT tab2.name [������], tab1.avg_fragmentation_in_percent [������������ (%)] FROM
sys.dm_db_index_physical_stats(DB_ID(N'UNIVER'),OBJECT_ID(N'#TEMP'),NULL,NULL,NULL) tab1
JOIN
sys.indexes tab2
ON tab1.object_id = tab2.object_id AND tab1.index_id = tab2.index_id
WHERE tab2.name IS NOT NULL;




---   ���� 11   ---

---TASK
DECLARE cursor1 CURSOR FOR
    SELECT  sub.[SUBJECT] FROM [SUBJECT] sub WHERE sub.PULPIT = N'����';

OPEN cursor1;
DECLARE
@s nvarchar(10),
@str nvarchar(300)=' ';
WHILE 0 = 0
BEGIN
FETCH cursor1 INTO @s;
IF (@@FETCH_STATUS != 0) BREAK;
SET @str = RTRIM(@str) + ',' + @s;
END;
CLOSE cursor1;
SET @str = SUBSTRING(@str,2,LEN(@str)-1)+'.';
PRINT @str;
GO
DEALLOCATE cursor1;

---TASK 2

DECLARE cur
CURSOR LOCAL FOR
    SELECT f.FACULTY FROM FACULTY f;

DECLARE @s nvarchar(10);
OPEN cur;
WHILE @@FETCH_STATUS = 0
BEGIN
FETCH cur INTO @s;
BREAK;
END;
PRINT @s;
GO
--OPEN cur;
CLOSE cur;

DECLARE cur
CURSOR GLOBAL FOR
    SELECT f.FACULTY FROM FACULTY f;

OPEN cur;
DECLARE @s nvarchar(10);
WHILE @@FETCH_STATUS = 0
BEGIN
FETCH cur INTO @s;
BREAK;
END;
PRINT @s;
GO
CLOSE cur;
DEALLOCATE cur;

---TASK 3

DECLARE cur CURSOR LOCAL STATIC FOR
    SELECT f.FACULTY, f.FACULTY_NAME FROM FACULTY f;

DECLARE
@str nvarchar(350) = N' ',
@s1 nvarchar(10),
@s2 nvarchar(50);

OPEN cur;
INSERT FACULTY(FACULTY,FACULTY_NAME) VALUES (N'FIT',N'��������� IT');
SET @str = @str + N'���������� ����������� : ' + CAST(@@CURSOR_ROWS AS nvarchar(10)) + CHAR(10);
WHILE @@FETCH_STATUS = 0
BEGIN
FETCH cur INTO @s1,@s2;
IF(@@FETCH_STATUS != 0) BREAK;
SET @str = @str + @s1 + N' '+ @s2 + CHAR(10);
END;
PRINT SUBSTRING(@str,2,LEN(@str)-1);
GO
DELETE f FROM FACULTY f WHERE f.FACULTY = N'FIT';
------
DECLARE cur CURSOR LOCAL DYNAMIC FOR
    SELECT f.FACULTY, f.FACULTY_NAME FROM FACULTY f;
DECLARE
@str nvarchar(350) = N' ',
@s1 nvarchar(10),
@s2 nvarchar(50);

OPEN cur;
INSERT FACULTY(FACULTY,FACULTY_NAME) VALUES (N'FIT',N'��������� IT');
SET @str = @str + N'���������� ����������� : ' + CAST(@@CURSOR_ROWS AS nvarchar(10)) + CHAR(10);
WHILE 0 = 0
BEGIN
FETCH cur INTO @s1,@s2;
IF(@@FETCH_STATUS != 0) BREAK;
SET @str = @str + @s1 + N' '+ @s2 + CHAR(10);
END;
PRINT SUBSTRING(@str,2,LEN(@str)-1);
GO

DELETE f FROM FACULTY f WHERE f.FACULTY = N'FIT';

---TASK 4

DECLARE cur CURSOR LOCAL SCROLL FOR
    SELECT ROW_NUMBER() OVER(ORDER BY f.FACULTY), f.FACULTY FROM FACULTY f;

DECLARE @str nvarchar(50) = N' ',@s1 nvarchar(2),@s2 nvarchar(10);

OPEN cur;
FETCH FIRST FROM cur INTO @s1,@s2;
SET @str = @str + @s1 +N'. '+@s2+ CHAR(10);
FETCH LAST FROM cur INTO @s1,@s2;
SET @str = @str + @s1 +N'. '+@s2+ CHAR(10);
PRINT SUBSTRING(@str,2,LEN(@str)-1);
GO


---TASK 5

INSERT FACULTY(FACULTY,FACULTY_NAME) VALUES (N'FIT',N'��������� IT');
SELECT * FROM FACULTY;

DECLARE cur CURSOR LOCAL SCROLL DYNAMIC FOR
    SELECT f.FACULTY FROM FACULTY f FOR UPDATE;

DECLARE @s nvarchar(5);
OPEN cur
FETCH FIRST FROM cur INTO @s;
UPDATE FACULTY SET FACULTY = N'myFIT' WHERE CURRENT OF cur;
FETCH FIRST FROM cur INTO @s;
DELETE FACULTY WHERE CURRENT OF cur;
GO
SELECT * FROM FACULTY;

---TASK 6

DECLARE cur CURSOR LOCAL DYNAMIC FOR
    SELECT stud.NAME FROM GROUPS gr
        JOIN STUDENT stud ON gr.IDGROUP = stud.IDGROUP
        JOIN PROGRESS prog ON prog.IDSTUDENT = stud.IDSTUDENT
    WHERE prog.NOTE < 4 FOR UPDATE;

OPEN cur;
DECLARE @s nvarchar(10);
WHILE @@FETCH_STATUS = 0
BEGIN
FETCH cur INTO @s;
IF (@@FETCH_STATUS != 0) BREAK;
DELETE FACULTY WHERE CURRENT OF cur;
END;
SELECT * FROM PROGRESS;
----
DECLARE cur CURSOR LOCAL DYNAMIC FOR
    SELECT NOTE FROM PROGRESS WHERE IDSTUDENT = 1001 FOR UPDATE;

OPEN cur;
DECLARE @p nvarchar(10);
FETCH cur INTO @p;
UPDATE PROGRESS SET PROGRESS.NOTE = @p -1 WHERE CURRENT OF cur;
SELECT * FROM PROGRESS;
GO















---   ����  13 ---

--Task 1
CREATE PROCEDURE PSUBJECT1 AS
BEGIN
	DECLARE @count INT = (SELECT COUNT(*) FROM SUBJECT)
	SELECT SUBJECT.SUBJECT[���], SUBJECT.SUBJECT_NAME[����������], SUBJECT.PULPIT[�������] FROM SUBJECT
	RETURN @count
END
GO
DROP PROCEDURE PSUBJECT1;
EXECUTE PSUBJECT1;

--Task 2
/*PSUBJECT ��������� ��� ��������� � ������� @p � @c.
  �������� @p �������� �������, ����� ��� VAR-CHAR(20) � �������� �� ��������� NULL.
  �������� @� �������� ��������, ����� ��� INT.
  ����� ����, ��������� ������ ����������� �������� ��������� ��������� @�,
  ������ ���������� ����� � �������������� ������*/

CREATE PROCEDURE PSUBJECT @p NVARCHAR(20) = NULL, @c INT = -1 OUTPUT
AS
BEGIN
	DECLARE @count INT = (SELECT COUNT(*) FROM SUBJECT)
	PRINT 'Parameters: @p = ' + @p + ', @c = ' + CAST(@c AS VARCHAR(3))
	SELECT SUBJECT.SUBJECT[���], SUBJECT.SUBJECT_NAME[����������], SUBJECT.PULPIT[�������] FROM SUBJECT
	WHERE SUBJECT.PULPIT = @p
	SET @c = @@ROWCOUNT
	RETURN @count
END
GO

DROP PROCEDURE PSUBJECT;

declare @c int = 1;

exec PSUBJECT '����', @c output
print @c


--Task 3
/*������� ��������� ��������� ������� � ������ #SUBJECT.
  �������� ��������� PSUBJECT ����� �������, ����� ��� �� ��������� ��������� ���������.*/

CREATE TABLE #SUBJECT (
	[SUBJECT] NVARCHAR(20) PRIMARY KEY,
	[SUBJECT_NAME] NVARCHAR(MAX),
	[PULPIT] NVARCHAR(MAX)
	)

CREATE PROCEDURE PSUBJECT @p NVARCHAR(20)
AS
BEGIN
	SELECT SUBJECT.SUBJECT[���], SUBJECT.SUBJECT_NAME[����������], SUBJECT.PULPIT[�������] FROM SUBJECT
	WHERE SUBJECT.PULPIT = @p
END
GO

DROP PROCEDURE PSUBJECT;

INSERT #SUBJECT EXEC PSUBJECT @p = '����'
select * from #SUBJECT

DROP table #SUBJECT


--Task 4

/*����������� ��������� � ������ PAUDITORI-UM_INSERT.
  ��������� ��������� ������ ������� ���������: @a, @n, @c � @t.
  ��������� ��������� ������ � ������� AUDITO-RIUM. �������� �������� AUDITORIUM, AUDI-TORIUM_NAME,
  AUDITORIUM_CAPACITY � AUDITORIUM_TYPE ����������� ������ �������� �������������� ����������� @a, @n, @c � @t.
  ��������� PAUDITORIUM_INSERT ������ ���-������ �������� TRY/CATCH ��� ��������� ������.
  ��������� ������ ���������� � ����� ������ ���-����� -1 � ��� ������, ���� ��������� ������ � 1, ��-�� ���������� �������. */

CREATE PROCEDURE PAUDITORIUM_INSERT @a NVARCHAR(20), @n NVARCHAR(50), @c INT, @t NVARCHAR (10)
AS
BEGIN TRY
	INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME)
		VALUES (@a, @n, @c, @t)
	RETURN 1
END TRY
BEGIN CATCH
	PRINT error_message()
	PRINT error_procedure()
	PRINT error_state()
    RETURN -1
END CATCH
GO

DROP PROCEDURE PAUDITORIUM_INSERT;


declare @result int = 0
exec @result = PAUDITORIUM_INSERT '8756-2', '��', 3500, '8756-2'
select @result

--Task 5

/*����������� ��������� � ������ SUBJECT_REPORT, ����������� � ����������� �������� ����� �����
  �� ������� ��������� �� ���-������� �������.
  ��������� ����� ������� �������� � ������ @p ���� CHAR(10), ������� ������������ ��� �������� ���� �������.*/

CREATE PROCEDURE PSUBJECT_REPORT @p NVARCHAR(MAX)
AS
DECLARE @rc INT = 0
BEGIN TRY
	DECLARE @sb NVARCHAR(20), @result NVARCHAR(MAX) = ''

	DECLARE SUBJECTS CURSOR FOR
	    SELECT SUBJECT.SUBJECT FROM SUBJECT WHERE SUBJECT.PULPIT = rtrim(@p)
	IF NOT EXISTS (SELECT SUBJECT.SUBJECT FROM SUBJECT WHERE SUBJECT.PULPIT = rtrim(@p))
		RAISERROR('ERROR', 11, 1)
	ELSE
		OPEN SUBJECTS
		FETCH SUBJECTS INTO @sb
		PRINT 'SUBJECTS:'
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @result = rtrim(@sb) + ', ' + rtrim(@result)
			SET @rc = @rc + 1
			FETCH SUBJECTS INTO @sb
		END
		PRINT @result
		CLOSE SUBJECTS
	    DEALLOCATE SUBJECTS
		RETURN @rc
END TRY
BEGIN CATCH
    PRINT error_message()
	PRINT 'PARAMETER ERROR'
    DEALLOCATE SUBJECTS
	IF ERROR_PROCEDURE() IS NOT NULL
		PRINT 'PROCEDURE: ' + ERROR_PROCEDURE()
	RETURN @rc
END CATCH
GO
DROP PROCEDURE  PSUBJECT_REPORT;

exec PSUBJECT_REPORT '����'

--Task 6

/*����������� ��������� � ������ PAUDITORI-UM_INSERTX.
  ��������� ��������� ���� ������� ����������: @a, @n, @c, @t � @tn.
  ���������� ������ � ������� AUDITORI-UM_TYPE � ����� ��������� PAUDITORI-UM_INSERT
  ������ ����������� � ������ ����� ����� ���������� � ������� ��������������� SERI-ALIZABLE.
  ��������� PAUDITORIUM_INSERTX ������ ���������� � ����� ������ �������� -1 � ��� ������, ���� ��������� ������ � 1,
  ���� ���������� �����-���� ����������� �������. */

CREATE PROCEDURE PAUDITORIUM_INSERTX @a NVARCHAR(20), @n NVARCHAR(50), @c INT, @t NVARCHAR (10), @tn NVARCHAR(50)
AS
DECLARE @rc INT = 1
BEGIN TRY
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
	BEGIN TRAN
	INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME) VALUES(@t, @tn)
	EXEC @rc = PAUDITORIUM_INSERT @a, @t, @c, @n
	COMMIT TRAN
	RETURN @rc
END TRY
BEGIN CATCH
	PRINT 'ERROR'
	IF ERROR_PROCEDURE() IS NOT NULL
		PRINT 'PROCEDURE: ' + ERROR_PROCEDURE()
	ROLLBACK TRAN
	RETURN -1
END CATCH
GO
DROP PROCEDURE  PAUDITORIUM_INSERTX;

exec PAUDITORIUM_INSERTX '781-1', '��_3.0', 100, '781-1', 'COOL ���������'


---   ���� 14   ---

--Task 1

/*����������� ��������� ������� � ������ COUNT_STUDENTS, ������� ��������� ���������� ���-������ �� ����������,
  ��� �������� �������� ���������� ���� VARCHAR(20) � ������ @faculty. */
create function COUNT_STUDENTS(@faculty nvarchar(20)) returns int
as begin
declare @rc int = 0;
set @rc = (
    SELECT count(IDSTUDENT) from STUDENT join GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP
	join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
	where FACULTY.FACULTY = @faculty);
return @rc;
end;
go

drop function COUNT_STUDENTS

declare @n int = dbo.COUNT_STUDENTS('����');
print '���������� ���������: ' + cast(@n as varchar(4));
go

/*������ ��������� � ����� ������� � ������� ��������� ALTER � ���, ����� ������� ���������
  ������ �������� @prof ���� VARCHAR(20), ������������ ������������� ���������.
  ��� ���������� ���������� �������� �� ������-��� NULL. */

alter function COUNT_STUDENTS(@faculty varchar(20) = null, @prof varchar(20) = null) returns int
as begin
declare @rc int = 0;
set @rc = (
SELECT count(IDSTUDENT) from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY
	inner join STUDENT on GROUPS.IDGROUP = STUDENT.IDGROUP
	where FACULTY.FACULTY = @faculty and GROUPS.PROFESSION = @prof);
return @rc;
end;
go

drop function COUNT_STUDENTS

declare @n int = dbo.COUNT_STUDENTS('����', '1-36 01 08');
print '���������� ���������: ' + cast(@n as varchar(4));

--Task 2
/*����������� ��������� ������� � ������ FSUBJECTS, ����������� �������� @p ���� VARCHAR(20),
  �������� �������� ������ ��� ������� (������� SUBJECT.PULPIT).
������� ������ ���������� ������ ���� VARCHAR(300) � �������� ��������� � ������.
*/

create function FSUBJECTS(@p varchar(20)) returns varchar(300)
as begin
declare @sb varchar(10), @s varchar(100) = '';
declare sbj cursor local static for select distinct SUBJECT from SUBJECTS where PULPIT like @p;
open sbj;
    fetch sbj into @sb;
    while @@FETCH_STATUS = 0
    begin
        set @s = @s + RTRIM(@sb) + ', ';
        fetch sbj into @sb;
    end;
close sbj;
return @s
end;

drop function FSUBJECTS

select distinct PULPIT, dbo.FSUBJECTS(PULPIT)[����������] from SUBJECTS;

--Task 3
/*������� ��������� ��� ���������, �������� ��� ��-�������� (������� FACULTY.FACULTY) �
  ��� ������� (������� PULPIT.PULPIT). ���������� SELECT-������ c ����� ������� �����������
  ����� ��������� FACULTY � PULPIT. */

create function FFACPUL(@f varchar(20), @p varchar(20)) returns TABLE
as return
select FACULTY.FACULTY, PULPIT.PULPIT from FACULTY left outer join PULPIT
  on FACULTY.FACULTY = PULPIT.FACULTY
   where FACULTY.FACULTY = ISNULL(@f, FACULTY.FACULTY) and
    PULPIT.PULPIT = ISNULL(@p, PULPIT.PULPIT);
go

drop function FFACPUL

select * from dbo.FFACPUL(null, null);      --��� ���������� �������������� �����, ���������� ������ ���� ������ �� ���� �����������.
select * from dbo.FFACPUL('��', null);      --���������� �������������� �����, ���������� ������ ���� ������ ��������� ����������.
select * from dbo.FFACPUL(null, '����');    --������� ���������� �������������� �����, ���������� ������, ��������������� �������� �������.
select * from dbo.FFACPUL('��', '����');    --������� ���������� �������������� �����, ���������� ������, ��������������� �������� ������� �� �������� ����������.

--Task 4
/*������� ��������� ���� ��������, �������� ��� �������. ������� ���������� ���������� ��������������
  �� �����-��� ���������� �������. ���� �������� ����� NULL, �� ������������ ����� ���������� ��������������. */

create function FCTEACHER(@p varchar(20)) returns int
as begin
declare @rc int = (select count(TEACHER) from TEACHER where PULPIT = ISNULL(@p, PULPIT));
return @rc;
end;

drop function FCTEACHER

select distinct PULPIT, dbo.FCTEACHER(PULPIT)[���������� ��������������] from TEACHER;
select distinct dbo.FCTEACHER(null)[����� ���������� ��������������];

--Task 6
/* �������� ��� ������� ���, ����� ���������� ������, ���������� �����,
   ���������� ��������� � ���������� ����������-���� ����������� ���������� ���������� ���������.*/

create function FACULTY_REPORT(@c int) returns @fr table
	                        ( [���������] varchar(50), [���������� ������] int, [���������� �����]  int,
	                          [���������� ���������] int, [���������� ��������������] int )
as begin
declare cc CURSOR static for
select FACULTY from FACULTY where dbo.COUNT_STUDENTS(FACULTY, default) > @c;
declare @f varchar(30);
open cc;
fetch cc into @f;
while @@fetch_status = 0
begin
insert @fr values( @f,  (select count(PULPIT) from PULPIT where FACULTY = @f),
(select count(IDGROUP) from GROUPS where FACULTY = @f),   dbo.COUNT_STUDENTS(@f, default),
(select count(PROFESSION) from PROFESSION where FACULTY = @f)   );
fetch cc into @f;
end;
return;
end;

drop function FACULTY_REPORT

select * from dbo.FACULTY_REPORT(0);


create function COUNT_PULPIT(@f varchar(20)) returns int
as begin
declare @rc int = 0;
set @rc = (select count(PULPIT) from PULPIT where FACULTY = @f);
return @rc;
end;

drop function COUNT_PULPIT

print dbo.COUNT_PULPIT('����');


create function COUNT_GROUP(@f varchar(20)) returns int
as begin
declare @rc int = 0;
set @rc = (select count(IDGROUP) from GROUPS where FACULTY like @f);
return @rc;
end;

drop function COUNT_GROUP

print dbo.COUNT_GROUP('����');


create function COUNT_PROFESSION(@f varchar(20)) returns int
as begin
declare @rc int = 0;
set @rc = (select count(PROFESSION) from PROFESSION where FACULTY like @f);
return @rc;
end;

drop function COUNT_PROFESSION

print dbo.COUNT_PROFESSION('1-36 01 08');





---   ���� 15   ---

-- 1

/*����������� AFTER-������� � ������ TR_TEACHER_INS ��� ������� TEACHER,
����������� �� ������� INSERT. ������� TR_TEACHER_INS ������ ���������� ����-�� ��������
������ � ������� TR_AUDIT. � ������� �� ���������� �������� �������� �������� ������.*/

create table TR_AUDIT
(
ID int identity,
STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')),
TRNAME varchar(50),
CC varchar(300)
)

create  trigger TR_TEACHER_INS on TEACHER after INSERT
as
declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
set @a1 = (select TEACHER from INSERTED);
set @a2= (select TEACHER_NAME from INSERTED);
set @a3= (select GENDER from INSERTED);
set @a4 = (select PULPIT from INSERTED);
set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
insert into TR_AUDIT(STMT, TRNAME, CC) values('INS', 'TR_TEACHER_INS', @in);
return;
go

insert into  TEACHER values('��1', '������', '�', '����');
insert into  TEACHER values('��f', '������f', '�', '����');
insert into  TEACHER values('��ffj', '������ffj', '�', '����');

select * from TR_AUDIT

drop table TR_AUDIT
drop trigger TR_TEACGER_INS


--2

/*������� AFTER-������� � ������ TR_TEACHER_DEL ��� ������� TEACHER, �����������
�� ������� DELETE. ������� TR_TEACHER_DEL ������ ���������� ����-�� ������ � ������� TR_AUDIT
��� ������ ��������� ������. � ������� �� ���������� �������� ������� TEACHER ��������� ����-��.*/

create  trigger TR_TEACHER_DEL on TEACHER after DELETE as
declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
set @a1 = (select TEACHER from DELETED);
set @a2= (select TEACHER_NAME from DELETED);
set @a3= (select GENDER from DELETED);
set @a4 = (select PULPIT from DELETED);
set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
insert into TR_AUDIT(STMT, TRNAME, CC) values('DEL', 'TR_TEACHER_DEL', @in);
return;
go

delete TEACHER where TEACHER='��1'
select * from TR_AUDIT

--3

/*������� AFTER-������� � ������ TR_TEACHER_UPD ��� ������� TEACHER, ����������� �� ������� UPDATE.
������� TR_TEACHER_UPD ������ ���������� ����-�� ������ � ������� TR_AUDIT ��� ������ ���������� ������.
� ������� �� ���������� �������� ���� �������� ���������� ������ �� � ����� ���������.*/

create  trigger TR_TEACHER_UPD on TEACHER after UPDATE as
declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
set @a1 = (select TEACHER from INSERTED);
set @a2= (select TEACHER_NAME from INSERTED);
set @a3= (select GENDER from INSERTED);
set @a4 = (select PULPIT from INSERTED);
set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
set @a1 = (select TEACHER from DELETED);
set @a2= (select TEACHER_NAME from DELETED);
set @a3= (select GENDER from DELETED);
set @a4 = (select PULPIT from DELETED);
set @in =@in + '' + @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
insert into TR_AUDIT(STMT, TRNAME, CC) values('UPD', 'TR_TEACHER_UPD', @in);
return;
go

update TEACHER set GENDER = '�' where TEACHER='��f'
select * from TR_AUDIT

delete from TR_AUDIT where STMT = 'UPD'

drop trigger TR_TEACHER_UPD
--4

/*������� AFTER-������� � ������ TR_TEACHER ��� ������� TEACHER, ���-�������� �� �������
INSERT, DELETE, UPDATE. ������� TR_TEACHER ������ ��-�������� ������ ������ � ������� TR_AUDIT
��� ������ ���������� ������. � ���� ������-�� ���������� �������, ���������������� ������� �
��������� � ������� �� �����������-���� ������� ����������. ����������� ���-�����, ���������������
����������������� ��������.*/

create trigger TR_TEACHER  on TEACHER after INSERT, DELETE, UPDATE as
declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
declare @ins int = (select count(*) from inserted), @del int = (select count(*) from deleted);
   if  @ins > 0 and  @del = 0
   begin
   print '�������: INSERT';
      set @a1 = (select TEACHER from INSERTED);
      set @a2= (select TEACHER_NAME from INSERTED);
      set @a3= (select GENDER from INSERTED);
	  set @a4 = (select PULPIT from INSERTED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRNAME, CC) values('INS', 'TR_TEACHER_INS', @in);
	end;
	else
    if @ins = 0 and  @del > 0
	begin
	print '�������: DELETE';
      set @a1 = (select TEACHER from DELETED);
      set @a2= (select TEACHER_NAME from DELETED);
      set @a3= (select GENDER from DELETED);
	  set @a4 = (select PULPIT from DELETED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRNAME, CC) values('DEL', 'TR_TEACHER_DEL', @in);
	  end;
	else
    if @ins > 0 and  @del > 0
	begin
	print '�������: UPDATE';
      set @a1 = (select TEACHER from INSERTED);
      set @a2= (select TEACHER_NAME from INSERTED);
      set @a3= (select GENDER from INSERTED);
	  set @a4 = (select PULPIT from INSERTED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      set @a1 = (select TEACHER from deleted);
      set @a2= (select TEACHER_NAME from DELETED);
      set @a3= (select GENDER from DELETED);
	  set @a4 = (select PULPIT from DELETED);
      set @in =@in + '' + @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRNAME, CC) values('UPD', 'TR_TEACHER_UPD', @in);
	  end;
	  return;

delete TEACHER where TEACHER='��'
insert into  TEACHER values('��', '������', '�', '����');
update TEACHER set GENDER = '�' where TEACHER='��'

select * from TR_AUDIT

create table TR_AUDIT
(
ID int identity,
STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')),
TRNAME varchar(50),
CC varchar(300)
)
drop table TR_AUDIT


--5

/*����������� ��������, ������� ������������� �� ������� ���� ������ X_BSTU, ��� ������-��
����������� ����������� ����������� �� ������������ AFTER-��������.*/

update TEACHER set GENDER = 'q' where TEACHER='��'
select * from TR_AUDIT

--6

/*������� ��� ������� TEACHER ��� AFTER-�������� � �������: TR_TEACHER_ DEL1, TR_TEACHER_DEL2 � TR_TEACHER_ DEL3.
�������� ������ ����������� �� ����-��� DELETE � ����������� ��������������� ������ � ������� TR_AUDIT.
�������� ������ ������ ���������, ������-��� � �������� TEACHER. ����������� ��-�������� ��������� ���
������� TEACHER, ����������� �� ������� DELETE ��������� �������: ������ ������ ����������� ������� �
������ TR_TEACHER_DEL3, ��������� � ������� TR_TEACHER_DEL2.
����������: ������������ ��������� ����-��������� SYS.TRIGGERS � SYS.TRIGGERS_ EVENTS,
� ����� ������-��� ��������� SP_SETTRIGGERORDERS.*/



Insert into FACULTY(FACULTY) values ('������')

create trigger AUD_AFTER_DEL1 on FACULTY after DELETE as
    print 'AUD_AFTER_DEL1';
return;
go
create trigger AUD_AFTER_DEL2 on FACULTY after DELETE as
    print 'AUD_AFTER_DEL2';
return;
go
create trigger AUD_AFTER_DEL3 on FACULTY after DELETE as
    print 'AUD_AFTER_DEL3';
return;
go

select t.name, e.type_desc
  from sys.triggers  t join  sys.trigger_events e  on t.object_id = e.object_id
  where OBJECT_NAME(t.parent_id)='FACULTY' and e.type_desc = 'DELETE' ;

exec  SP_SETTRIGGERORDER @triggername = 'AUD_AFTER_DEL3',
	                        @order='First', @stmttype = 'DELETE';
exec  SP_SETTRIGGERORDER @triggername = 'AUD_AFTER_DEL2',
	                        @order='Last', @stmttype = 'DELETE';

delete FACULTY where FACULTY='������'

--7

/*����������� ��������, ��������������� �� ������� ���� ������ �����������:
AFTER-������� �������� ������ ����������, � ������ �������� ����������� ��������, ����-������������ �������.*/

create trigger PTran
on PULPIT after INSERT, DELETE, UPDATE
as declare @c int = (select count (*) from PULPIT);
if (@c >20)
begin
    print '���-�� �������'
end;
return;

insert into PULPIT(PULPIT) values ('����')
delete PULPIT where PULPIT='����'

drop trigger PTran
--8

/*������� ��� ������� FACULTY INSTEAD OF-�������, ����������� �������� ����� � �������.
����������� ��������, ������� ���������-���� �� ������� ���� ������ X_BSTU,
��� �������� ����������� ����������� ���������, ���� ���� INSTEADOF-�������.

� ������� ��������� DROP ������� ��� DML-��������, ��������� � ���� ������������ ������.*/

create trigger F_INSTEAD_OF  on FACULTY instead of DELETE as
print '�������� ���������'
return;

delete FACULTY where FACULTY = '����'

drop trigger F_INSTEAD_OF
drop trigger PTran
drop trigger TR_TEACHER
drop trigger TR_TEACHER_DEL


--9
/*������� DDL-�������, ����������� �� ��� DDL-������� � �� UNIVER. */
use UNIVER

create table T1
(
ID int identity,
STMT varchar(20)
check (STMT in ('INS', 'DEL', 'UPD')),
TRNAME varchar(50),
CC varchar(300)
)

DROP table T1;

CREATE TRIGGER DDLTrigger1 ON DATABASE FOR DROP_TABLE AS
PRINT '������� ������� � ���� ���� ������ ���������!';
ROLLBACK;

DROP TRIGGER DDLTrigger1 ON DATABASE;
























