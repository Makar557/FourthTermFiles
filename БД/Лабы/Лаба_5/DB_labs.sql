use master
go

use UNIVER


create table AUDITORIUM_TYPE
(    AUDITORIUM_TYPE  char(10) constraint AUDITORIUM_TYPE_PK  primary key,
      AUDITORIUM_TYPENAME  varchar(30)
 )
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )        values ('ЛК',            'Лекционная');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )         values ('ЛБ-К',          'Компьютерный класс');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )         values ('ЛК-К',          'Лекционная с уст. проектором');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )          values  ('ЛБ-X',          'Химическая лаборатория');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )        values  ('ЛБ-СК',   'Спец. компьютерный класс');

create table AUDITORIUM
(   AUDITORIUM   char(20)  constraint AUDITORIUM_PK  primary key,
    AUDITORIUM_TYPE     char(10) constraint  AUDITORIUM_AUDITORIUM_TYPE_FK foreign key
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE),
   AUDITORIUM_CAPACITY  integer constraint  AUDITORIUM_CAPACITY_CHECK default 1  check (AUDITORIUM_CAPACITY between 1 and 300),  -- вместимость
   AUDITORIUM_NAME      varchar(50)
)
go
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('206-1', '206-1',   'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('301-1',   '301-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('236-1',   '236-1', 'ЛК',   60);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('313-1',   '313-1', 'ЛК-К',   60);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('324-1',   '324-1', 'ЛК-К',   50);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('413-1',   '413-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('423-1',   '423-1', 'ЛБ-К', 90);
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) values  ('408-2',   '408-2', 'ЛК',  90);



create table FACULTY
(    FACULTY      char(10) primary key,
     FACULTY_NAME  varchar(50) default '???'
);

insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			('ХТиТ', 'Химическая технология и техника');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			(N'ЛХФ',     N'Лесохозяйственный факультет');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			(N'ИЭФ',		N'Инженерно-экономический факультет');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			(N'ТТЛП',	N'Технология и техника лесной промышленности');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			(N'ТОВ',		N'Технология органических веществ');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values
			(N'ИТ',		N'Факультет информационных технологий');

create table PROFESSION
(
	PROFESSION   char(20) constraint PROFESSION_PK  primary key,
	FACULTY    char(10) constraint PROFESSION_FACULTY_FK foreign key references FACULTY(FACULTY),
	PROFESSION_NAME varchar(100),    QUALIFICATION   varchar(50)
);
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
		values	('ИТ',  '1-40 01 02',   'Информационные системы и тех-нологии', 'инженер-программист-системотехник' ),
				('ИЭФ',  '1-47 01 01', 'Издательское дело', 'редактор-технолог' ),
				('ИЭФ',  '1-36 06 01',  'Полиграфическое оборудование и системы обработки информации', 'инженер-электромеханик' ),
				('ХТиТ',  '1-36 01 08',    'Конструирование и производство изделий из композиционных материалов', 'инженер-механик' ),
 				('ХТиТ',  '1-36 07 01',  'Машины и аппараты химических производств и предприятий строительных материалов', 'инженер-механик' ),
				('ЛХФ',  '1-75 01 01',      'Лесное хозяйство', 'инженер лес-ного хозяйства' ),
				('ЛХФ',  '1-75 02 01',   'Садово-парковое строительство', 'инженер садово-паркового строительства' ),
				('ЛХФ',  '1-89 02 02',     'Туризм и природопользова-ние', 'специалист в сфере туризма' ),
				('ИЭФ',  '1-25 01 07',  'Экономика и управление на пред-приятии', 'экономист-менеджер' ),
				('ИЭФ',  '1-25 01 08',    'Бухгалтерский учет, анализ и аудит', 'экономист' ),
				('ТТЛП',  '1-36 05 01',   'Машины и оборудование лесного комплекса', 'инженер-механик' ),
				('ТТЛП',  '1-46 01 01',      'Лесоинженерное дело', 'инженер-технолог' ),
				('ТОВ',  '1-48 01 02',  'Химическая технология ор-ганических веществ, материалов и изделий', 'инженер-химик-технолог' ),
				('ТОВ',  '1-48 01 05',    'Химическая технология пе-реработки древесины', 'инженер-химик-технолог' ),
				('ТОВ',  '1-54 01 03',   'Физико-химические методы и приборы контроля качества продукции', 'инженер по сертификации' );


create table  PULPIT
(   PULPIT		 char(20)  constraint PULPIT_PK  primary key,
    PULPIT_NAME  varchar(100),
    FACULTY		 char(10)   constraint PULPIT_FACULTY_FK foreign key references FACULTY(FACULTY)
)
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY )
  values	('ИСиТ', 'Информационных систем и технологий ','ИТ'  ),
			('ПОиСОИ','Полиграфического оборудования и систем обработки ин-формации ', 'ИЭФ'  ),
			('БФ', 'Белорусской филологии','ИЭФ'  ),
			('РИТ', 'Редакционно-издательских тенологий', 'ИЭФ'  ),
			('ПП', 'Полиграфических производств','ИЭФ'  ),
			('ЛВ', 'Лесоводства','ЛХФ'),
			('ЛУ', 'Лесоустройства','ЛХФ'),
			('ЛЗиДВ', 'Лесозащиты и древесиноведения','ЛХФ'),
			('ЛКиП', 'Лесных культур и почвоведения','ЛХФ'),
			('ТиП', 'Туризма и природопользования','ЛХФ'),
			('ЛПиСПС','Ландшафтного проектирования и садово-паркового строи-тельства','ЛХФ'),
			('ТЛ', 'Транспорта леса', 'ТТЛП'),
			('ЛМиЛЗ','Лесных машин и технологии лесозаготовок','ТТЛП'),
			('ТДП','Технологий деревообрабатывающих производств', 'ТТЛП'),
			('ТиДИД','Технологии и дизайна изделий из древесины','ТТЛП'),
			('ОХ', 'Органической химии','ТОВ'),
			('ХПД','Химической переработки древесины','ТОВ'),
			('ТНВиОХТ','Технологии неорганических веществ и общей химической технологии ','ХТиТ'),
			('ПиАХП','Процессов и аппаратов химических производств','ХТиТ'),
			('ЭТиМ',    'Экономической теории и маркетинга','ИЭФ'),
			('МиЭП',   'Менеджмента и экономики природопользования','ИЭФ'),
			('СБУАиА', 'Статистики, бухгалтерского учета, анализа и аудита', 'ИЭФ')

create table TEACHER
(
	TEACHER    char(10)  constraint TEACHER_PK  primary key,
	TEACHER_NAME  varchar(100),
	GENDER     char(1) CHECK (GENDER in ('м', 'ж')),
	PULPIT   char(20) constraint TEACHER_PULPIT_FK foreign key references PULPIT(PULPIT)
)
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('СМЛВ',    'Смелов Владимир Владиславович', 'м',  'ИСиТ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('АКНВЧ',    'Акунович Станислав Иванович', 'м', 'ИСиТ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('КЛСНВ',    'Колесников Виталий Леонидович', 'м', 'ИСиТ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('БРКВЧ',    'Бракович Андрей Игоревич', 'м', 'ИСиТ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('ДТК',     'Дятко Александр Аркадьевич', 'м', 'ИСиТ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('УРБ',     'Урбанович Павел Павлович', 'м', 'ИСиТ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('ГРН',     'Гурин Николай Иванович', 'м', 'ИСиТ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('ЖЛК',     'Жиляк Надежда Александровна',  'ж', 'ИСиТ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('МРЗ',     'Мороз Елена Станиславовна',  'ж',   'ИСиТ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('БРТШВЧ',   'Барташевич Святослав Александрович', 'м','ПОиСОИ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('АРС',     'Арсентьев Виталий Арсентьевич', 'м', 'ПОиСОИ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('БРНВСК',   'Барановский Станислав Иванович', 'м', 'ЭТиМ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('НВРВ',   'Неверов Александр Васильевич', 'м', 'МиЭП');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('РВКЧ',   'Ровкач Андрей Иванович', 'м', 'ЛВ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('ДМДК', 'Демидко Марина Николаевна',  'ж',  'ЛПиСПС');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('БРГ',     'Бурганская Татьяна Минаевна', 'ж', 'ЛПиСПС');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('РЖК',   'Рожков Леонид Николаевич ', 'м', 'ЛВ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('ЗВГЦВ',   'Звягинцев Вячеслав Борисович', 'м', 'ЛЗиДВ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('БЗБРДВ',   'Безбородов Владимир Степанович', 'м', 'ОХ');
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT ) values	('НСКВЦ',   'Насковец Михаил Трофимович', 'м', 'ТЛ');

create table SUBJECT
(
	SUBJECT  char(10) constraint SUBJECT_PK  primary key,
	SUBJECT_NAME varchar(100) unique,
	PULPIT  char(20) constraint SUBJECT_PULPIT_FK foreign key references PULPIT(PULPIT)
)
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('СУБД',   'Системы управления базами данных', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('БД',     'Базы данных','ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ИНФ',    'Информационные технологии','ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ОАиП',  'Основы алгоритмизации и программирования', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ПЗ',     'Представление знаний в компьютерных системах', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ПСП',    'Программирование сетевых приложений', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('МСОИ',  'Моделирование систем обработки информации', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ПИС',     'Проектирование информационных систем', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('КГ',      'Компьютерная геометрия ','ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ПМАПЛ',   'Полиграф. машины, автоматы и поточные линии', 'ПОиСОИ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('КМС',     'Компьютерные мультимедийные системы', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ОПП',     'Организация полиграф. производства', 'ПОиСОИ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ДМ',   'Дискретная математика', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('МП',   'Математическое программирование','ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ЛЭВМ', 'Логические основы ЭВМ',  'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ООП',  'Объектно-ориентированное программирование', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ЭП', 'Экономика природопользования','МиЭП');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ЭТ', 'Экономическая теория','ЭТиМ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('БЛЗиПсOO','Биология лесных зверей и птиц с осн. охотов.','ЛВ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ОСПиЛПХ','Основы садово-паркового и лесопаркового хозяй-ства',  'ЛПиСПС');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ИГ', 'Инженерная геодезия ','ЛВ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ЛВ',    'Лесоводство', 'ЛЗиДВ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ОХ',    'Органическая химия', 'ОХ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ТРИ',    'Технология резиновых изделий','ЛЗиДВ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ВТЛ',    'Водный транспорт леса','ТЛ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ТиОЛ',   'Технология и оборудование лесозаготовок', 'ЛЗиДВ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ТОПИ',   'Технология обогащения полезных ископаемых ','ОХ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME, PULPIT ) values ('ПЭХ',    'Прикладная электрохимия','ОХ');

create table GROUPS
(   IDGROUP  integer  identity(1,1) constraint GROUP_PK  primary key,
    FACULTY   char(10) constraint  GROUPS_FACULTY_FK foreign key references FACULTY(FACULTY),
    PROFESSION  char(20) constraint  GROUPS_PROFESSION_FK foreign key references PROFESSION(PROFESSION),
    YEAR_FIRST  smallint  check (YEAR_FIRST<=YEAR(GETDATE())),
)

insert into GROUPS   (FACULTY,  PROFESSION, YEAR_FIRST )
         values ('ТТЛП','1-40 01 02', 2013), --1
                ('ТТЛП','1-40 01 02', 2012),
                ('ТТЛП','1-40 01 02', 2011),
                ('ТТЛП','1-40 01 02', 2010),
                ('ТТЛП','1-47 01 01', 2013),---5 гр
                ('ТТЛП','1-47 01 01', 2012),
                ('ТТЛП','1-47 01 01', 2011),
                ('ТТЛП','1-36 06 01', 2010),-----8 гр
                ('ТТЛП','1-36 06 01', 2013),
                ('ТТЛП','1-36 06 01', 2012),
                ('ТТЛП','1-36 06 01', 2011),
                ('ХТиТ','1-36 01 08', 2013),---12 гр
                ('ХТиТ','1-36 01 08', 2012),
                ('ХТиТ','1-36 07 01', 2011),
                ('ХТиТ','1-36 07 01', 2010),
                ('ТОВ','1-48 01 02', 2012), ---16 гр
                ('ТОВ','1-48 01 02', 2011),
                ('ТОВ','1-48 01 05', 2013),
                ('ТОВ','1-54 01 03', 2012),
                ('ЛХФ','1-75 01 01', 2013),--20 гр
                ('ЛХФ','1-75 02 01', 2012),
                ('ЛХФ','1-75 02 01', 2011),
                ('ЛХФ','1-89 02 02', 2012),
                ('ЛХФ','1-89 02 02', 2011),
                ('ТТЛП','1-36 05 01', 2013),
                ('ТТЛП','1-36 05 01', 2012),
                ('ТТЛП','1-46 01 01', 2012),--27 гр
                ('ИЭФ','1-25 01 07', 2013),
                ('ИЭФ','1-25 01 07', 2012),
                ('ИЭФ','1-25 01 07', 2010),
                ('ИЭФ','1-25 01 08', 2013),
                ('ИЭФ','1-25 01 08', 2012) ---32 гр

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
		   (1, 'Хартанович Екатерина Александровна', '11.03.1995'),
           (1, 'Горбач Елизавета Юрьевна',    '07.12.1995'),
           (1, 'Зыкова Кристина Дмитриевна',  '12.10.1995'),
           (1, 'Шенец Екатерина Сергеевна',   '08.01.1995'),
           (1, 'Шитик Алина Игоревна',  '02.08.1995'),
		   (2, 'Силюк Валерия Ивановна',         '12.07.1994'),
           (2, 'Сергель Виолетта Николаевна',    '06.03.1994'),
           (2, 'Добродей Ольга Анатольевна',     '09.11.1994'),
           (2, 'Подоляк Мария Сергеевна',        '04.10.1994'),
           (2, 'Никитенко Екатерина Дмитриевна', '08.01.1994'),
           (3, 'Яцкевич Галина Иосифовна',       '02.08.1993'),
           (3, 'Осадчая Эла Васильевна',         '07.12.1993'),
           (3, 'Акулова Елена Геннадьевна',      '02.12.1993'),
           (4, 'Плешкун Милана Анатольевна',     '08.03.1992'),
           (4, 'Буянова Мария Александровна',    '02.06.1992'),
           (4, 'Харченко Елена Геннадьевна',     '11.12.1992'),
           (4, 'Крученок Евгений Александрович', '11.05.1992'),
           (4, 'Бороховский Виталий Петрович',   '09.11.1992'),
           (4, 'Мацкевич Надежда Валерьевна',    '01.11.1992'),
           (5, 'Логинова Мария Вячеславовна',    '08.07.1995'),
           (5, 'Белько Наталья Николаевна',      '02.11.1995'),
           (5, 'Селило Екатерина Геннадьевна',   '07.05.1995'),
           (5, 'Дрозд Анастасия Андреевна',      '04.08.1995'),
           (6, 'Козловская Елена Евгеньевна',    '08.11.1994'),
           (6, 'Потапнин Кирилл Олегович',       '02.03.1994'),
           (6, 'Равковская Ольга Николаевна',    '04.06.1994'),
           (6, 'Ходоронок Александра Вадимовна', '09.11.1994'),
           (6, 'Рамук Владислав Юрьевич',        '04.07.1994'),
           (7, 'Неруганенок Мария Владимировна', '03.01.1993'),
           (7, 'Цыганок Анна Петровна',          '12.09.1993'),
           (7, 'Масилевич Оксана Игоревна',      '12.06.1993'),
           (7, 'Алексиевич Елизавета Викторовна','09.02.1993'),
           (7, 'Ватолин Максим Андреевич',       '04.07.1993'),
           (8, 'Синица Валерия Андреевна',       '08.01.1992'),
           (8, 'Кудряшова Алина Николаевна',     '12.05.1992'),
           (8, 'Мигулина Елена Леонидовна',      '08.11.1992'),
           (8, 'Шпиленя Алексей Сергеевич',      '12.03.1992'),
           (9, 'Астафьев Игорь Александрович',   '10.08.1995'),
           (9, 'Гайтюкевич Андрей Игоревич',     '02.05.1995'),
           (9, 'Рученя Наталья Александровна',   '08.01.1995'),
           (9, 'Тарасевич Анастасия Ивановна',   '11.09.1995'),
           (10, 'Жоглин Николай Владимирович',   '08.01.1994'),
           (10, 'Санько Андрей Дмитриевич',      '11.09.1994'),
           (10, 'Пещур Анна Александровна',      '06.04.1994'),
           (10, 'Бучалис Никита Леонидович',     '12.08.1994'),
		   (11, 'Лавренчук Владислав Николаевич','07.11.1993'),
           (11, 'Власик Евгения Викторовна',     '04.06.1993'),
           (11, 'Абрамов Денис Дмитриевич',      '10.12.1993'),
           (11, 'Оленчик Сергей Николаевич',     '04.07.1993'),
           (11, 'Савинко Павел Андреевич',       '08.01.1993'),
           (11, 'Бакун Алексей Викторович',      '02.09.1993'),
           (12, 'Бань Сергей Анатольевич',       '11.12.1995'),
           (12, 'Сечейко Илья Александрович',    '10.06.1995'),
           (12, 'Кузмичева Анна Андреевна',      '09.08.1995'),
           (12, 'Бурко Диана Францевна',         '04.07.1995'),
           (12, 'Даниленко Максим Васильевич',   '08.03.1995'),
           (12, 'Зизюк Ольга Олеговна',          '12.09.1995'),
           (13, 'Шарапо Мария Владимировна',     '08.10.1994'),
           (13, 'Касперович Вадим Викторович',   '10.02.1994'),
           (13, 'Чупрыгин Арсений Александрович','11.11.1994'),
           (13, 'Воеводская Ольга Леонидовна',   '10.02.1994'),
           (13, 'Метушевский Денис Игоревич',    '12.01.1994'),
           (14, 'Ловецкая Валерия Александровна','11.09.1993'),
           (14, 'Дворак Антонина Николаевна',    '01.12.1993'),
           (14, 'Щука Татьяна Николаевна',       '09.06.1993'),
           (14, 'Коблинец Александра Евгеньевна','05.01.1993'),
           (14, 'Фомичевская Елена Эрнестовна',  '01.07.1993'),
           (15, 'Бесараб Маргарита Вадимовна',   '07.04.1992'),
           (15, 'Бадуро Виктория Сергеевна',     '10.12.1992'),
           (15, 'Тарасенко Ольга Викторовна',    '05.05.1992'),
           (15, 'Афанасенко Ольга Владимировна', '11.01.1992'),
           (15, 'Чуйкевич Ирина Дмитриевна',     '04.06.1992'),
           (16, 'Брель Алеся Алексеевна',        '08.01.1994'),
           (16, 'Кузнецова Анастасия Андреевна', '07.02.1994'),
           (16, 'Томина Карина Геннадьевна',     '12.06.1994'),
           (16, 'Дуброва Павел Игоревич',        '03.07.1994'),
           (16, 'Шпаков Виктор Андреевич',       '04.07.1994'),
           (17, 'Шнейдер Анастасия Дмитриевна',  '08.11.1993'),
           (17, 'Шыгина Елена Викторовна',       '02.04.1993'),
           (17, 'Клюева Анна Ивановна',          '03.06.1993'),
           (17, 'Доморад Марина Андреевна',      '05.11.1993'),
           (17, 'Линчук Михаил Александрович',   '03.07.1993'),
           (18, 'Васильева Дарья Олеговна',      '08.01.1995'),
           (18, 'Щигельская Екатерина Андреевна','06.09.1995'),
           (18, 'Сазонова Екатерина Дмитриевна', '08.03.1995'),
           (18, 'Бакунович Алина Олеговна',      '07.08.1995');

create table PROGRESS
(
	SUBJECT   char(10) constraint PROGRESS_SUBJECT_FK foreign key references SUBJECT(SUBJECT),
	IDSTUDENT integer  constraint PROGRESS_IDSTUDENT_FK foreign key references STUDENT(IDSTUDENT),
	PDATE    date,
	NOTE     integer check (NOTE between 1 and 10)
)

insert into PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE)
    values ('ОАиП', 1000,  '01.10.2013',6),
           ('ОАиП', 1001,  '01.10.2013',8),
           ('ОАиП', 1002,  '01.10.2013',7),
           ('ОАиП', 1003,  '01.10.2013',5),
           ('ОАиП', 1005,  '01.10.2013',4),
		   ('СУБД', 1014,  '01.12.2013',5),
           ('СУБД', 1015,  '01.12.2013',9),
           ('СУБД', 1016,  '01.12.2013',5),
           ('СУБД', 1017,  '01.12.2013',4),
		   ('КГ',   1018,  '06.5.2013',4),
           ('КГ',   1019,  '06.05.2013',7),
           ('КГ',   1020,  '06.05.2013',7),
           ('КГ',   1021,  '06.05.2013',9),
           ('КГ',   1022,  '06.05.2013',5),
           ('КГ',   1023,  '06.05.2013',6);

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
        values (1, 'Хартанович Екатерина Александровна', '11.03.1995'),
          (1, 'Горбач Елизавета Юрьевна',    '07.12.1995'),
           (1, 'Зыкова Кристина Дмитриевна',  '12.10.1995'),
           (1, 'Шенец Екатерина Сергеевна',   '08.01.1995'),
           (1, 'Шитик Алина Игоревна',  '02.08.1995')
insert into STUDENT (IDGROUP,NAME, BDAY)
    values (2, 'Силюк Валерия Ивановна',         '12.07.1994'),
           (2, 'Сергель Виолетта Николаевна',    '06.03.1994'),
           (2, 'Добродей Ольга Анатольевна',     '09.11.1994'),
           (2, 'Подоляк Мария Сергеевна',        '04.10.1994'),
           (2, 'Никитенко Екатерина Дмитриевна', '08.01.1994'),
           (3, 'Яцкевич Галина Иосифовна',       '02.08.1993'),
           (3, 'Осадчая Эла Васильевна',         '07.12.1993'),
           (3, 'Акулова Елена Геннадьевна',      '02.12.1993'),
           (4, 'Плешкун Милана Анатольевна',     '08.03.1992'),
           (4, 'Буянова Мария Александровна',    '02.06.1992'),
           (4, 'Харченко Елена Геннадьевна',     '11.12.1992'),
           (4, 'Крученок Евгений Александрович', '11.05.1992'),
           (4, 'Бороховский Виталий Петрович',   '09.11.1992'),
           (4, 'Мацкевич Надежда Валерьевна',    '01.11.1992'),
           (5, 'Логинова Мария Вячеславовна',    '08.07.1995'),
           (5, 'Белько Наталья Николаевна',      '02.11.1995'),
           (5, 'Селило Екатерина Геннадьевна',   '07.05.1995'),
           (5, 'Дрозд Анастасия Андреевна',      '04.08.1995'),
           (6, 'Козловская Елена Евгеньевна',    '08.11.1994'),
           (6, 'Потапнин Кирилл Олегович',       '02.03.1994'),
           (6, 'Равковская Ольга Николаевна',    '04.06.1994'),
           (6, 'Ходоронок Александра Вадимовна', '09.11.1994'),
           (6, 'Рамук Владислав Юрьевич',        '04.07.1994'),
           (7, 'Неруганенок Мария Владимировна', '03.01.1993'),
           (7, 'Цыганок Анна Петровна',          '12.09.1993'),
           (7, 'Масилевич Оксана Игоревна',      '12.06.1993'),
           (7, 'Алексиевич Елизавета Викторовна','09.02.1993'),
           (7, 'Ватолин Максим Андреевич',       '04.07.1993'),
           (8, 'Синица Валерия Андреевна',       '08.01.1992'),
           (8, 'Кудряшова Алина Николаевна',     '12.05.1992'),
           (8, 'Мигулина Елена Леонидовна',      '08.11.1992'),
           (8, 'Шпиленя Алексей Сергеевич',      '12.03.1992'),
           (9, 'Астафьев Игорь Александрович',   '10.08.1995'),
           (9, 'Гайтюкевич Андрей Игоревич',     '02.05.1995'),
           (9, 'Рученя Наталья Александровна',   '08.01.1995'),
           (9, 'Тарасевич Анастасия Ивановна',   '11.09.1995'),
           (10, 'Жоглин Николай Владимирович',   '08.01.1994'),
           (10, 'Санько Андрей Дмитриевич',      '11.09.1994'),
           (10, 'Пещур Анна Александровна',      '06.04.1994'),
           (10, 'Бучалис Никита Леонидович',     '12.08.1994')
insert into STUDENT (IDGROUP,NAME, BDAY)
    values (11, 'Лавренчук Владислав Николаевич','07.11.1993'),
           (11, 'Власик Евгения Викторовна',     '04.06.1993'),
           (11, 'Абрамов Денис Дмитриевич',      '10.12.1993'),
           (11, 'Оленчик Сергей Николаевич',     '04.07.1993'),
           (11, 'Савинко Павел Андреевич',       '08.01.1993'),
           (11, 'Бакун Алексей Викторович',      '02.09.1993'),
           (12, 'Бань Сергей Анатольевич',       '11.12.1995'),
           (12, 'Сечейко Илья Александрович',    '10.06.1995'),
           (12, 'Кузмичева Анна Андреевна',      '09.08.1995'),
           (12, 'Бурко Диана Францевна',         '04.07.1995'),
           (12, 'Даниленко Максим Васильевич',   '08.03.1995'),
           (12, 'Зизюк Ольга Олеговна',          '12.09.1995'),
           (13, 'Шарапо Мария Владимировна',     '08.10.1994'),
           (13, 'Касперович Вадим Викторович',   '10.02.1994'),
           (13, 'Чупрыгин Арсений Александрович','11.11.1994'),
           (13, 'Воеводская Ольга Леонидовна',   '10.02.1994'),
           (13, 'Метушевский Денис Игоревич',    '12.01.1994'),
           (14, 'Ловецкая Валерия Александровна','11.09.1993'),
           (14, 'Дворак Антонина Николаевна',    '01.12.1993'),
           (14, 'Щука Татьяна Николаевна',       '09.06.1993'),
           (14, 'Коблинец Александра Евгеньевна','05.01.1993'),
           (14, 'Фомичевская Елена Эрнестовна',  '01.07.1993'),
           (15, 'Бесараб Маргарита Вадимовна',   '07.04.1992'),
           (15, 'Бадуро Виктория Сергеевна',     '10.12.1992'),
           (15, 'Тарасенко Ольга Викторовна',    '05.05.1992'),
           (15, 'Афанасенко Ольга Владимировна', '11.01.1992'),
           (15, 'Чуйкевич Ирина Дмитриевна',     '04.06.1992'),
           (16, 'Брель Алеся Алексеевна',        '08.01.1994'),
           (16, 'Кузнецова Анастасия Андреевна', '07.02.1994'),
           (16, 'Томина Карина Геннадьевна',     '12.06.1994'),
           (16, 'Дуброва Павел Игоревич',        '03.07.1994'),
           (16, 'Шпаков Виктор Андреевич',       '04.07.1994'),
           (17, 'Шнейдер Анастасия Дмитриевна',  '08.11.1993'),
           (17, 'Шыгина Елена Викторовна',       '02.04.1993'),
           (17, 'Клюева Анна Ивановна',          '03.06.1993'),
           (17, 'Доморад Марина Андреевна',      '05.11.1993'),
           (17, 'Линчук Михаил Александрович',   '03.07.1993'),
           (18, 'Васильева Дарья Олеговна',      '08.01.1995'),
           (18, 'Щигельская Екатерина Андреевна','06.09.1995'),
           (18, 'Сазонова Екатерина Дмитриевна', '08.03.1995'),
           (18, 'Бакунович Алина Олеговна',      '07.08.1995');


/*1. сформировать перечень кодов аудиторий (столбец AUDITORUM.AUDITORIUM) и соответствующих им наименований
  типов аудиторий (столбец AUDITORIUM_ TYPE.AUDITORIUM_ TYPENAME).*/
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM
join AUDITORIUM_TYPE on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;


/*2. сформировать перечень кодов аудиторий (столбец AUDITORIUM.AUDITORIUM) и соответствующих им наименований
  типов аудиторий (столбец AUDITORIUM_ TYPE.AUDITO-RIUM_TYPENAME).
  Примечание: использовать соединение таблиц INNER JOIN и предикат LIKE.*/
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM
join AUDITORIUM_TYPE
on   AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE and AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%компьютер%';


/*3. Написать два SELECT-запроса, форми-рующих результирующие наборы аналогич-ные запросам из заданий 1 и 2, но без приме-нения INNER JOIN. */
select T1.AUDITORIUM, T2.AUDITORIUM_TYPENAME
from AUDITORIUM as T1, AUDITORIUM_TYPE as T2
where T1.AUDITORIUM_TYPE = T2.AUDITORIUM_TYPE;

select T1.AUDITORIUM, T2.AUDITORIUM_TYPENAME
from AUDITORIUM as T1, AUDITORIUM_TYPE as T2
where T1.AUDITORIUM_TYPE = T2.AUDITORIUM_TYPE and T2.AUDITORIUM_TYPENAME like '%компьютер%';

/*4. На основе таблиц PROGRESS, STUDENT, GROUPS, SUBJECT, PULPIT и FACULTY сформировать перечень студентов,
получивших экзаменационные оценки (столбец PROGRESS.NOTE) от 6 до 8.
Результирующий набор должен содержать столбцы:
Факультет, Кафедра, Специаль-ность, Дисциплина, Имя Студента, Оцен-ка.
В столбце Оценка должны быть записа-ны экзаменационные оценки прописью: шесть, семь, восемь.*/


select FACULTY.FACULTY_NAME, PROFESSION.PROFESSION_NAME, STUDENT.NAME, PROGRESS.SUBJECT,
    case
    when PROGRESS.NOTE = 6 then 'шесть'
    when PROGRESS.NOTE = 7 then 'семь'
    when PROGRESS.NOTE = 8 then 'восемь'
    end 'Оценка'
from STUDENT
join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
                     and PROGRESS.NOTE between 6 and 8
join GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP
join PROFESSION on GROUPS.PROFESSION = PROFESSION.PROFESSION
join FACULTY on PROFESSION.FACULTY = FACULTY.FACULTY;

/*5. Примечание: использовать выражение CASE в секции ORDER BY.*/

select FACULTY.FACULTY_NAME, PROFESSION.PROFESSION_NAME, STUDENT.NAME, PROGRESS.SUBJECT,
    case
    when PROGRESS.NOTE = 6 then 'шесть'
    when PROGRESS.NOTE = 7 then 'семь'
    when PROGRESS.NOTE = 8 then 'восемь'
    end 'Оценка'
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


/*6. На основе таблиц PULPIT и TEACHER получить полный перечень кафедр (столбец PULPIT.PULPIT_ NAME)
  и преподавателей (столбец TEACHER.TEA-CHER_NAME) на этих кафедрах. Результирующий набор должен содержать
  два столбца: Кафедра и Преподаватель. Если на кафедре нет препо-давателей, то в столбце Преподаватель должна быть выведена строка ***.
Примечание: использовать соединение таблиц LEFT OUTER JOIN и функцию isnull.
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

/*9. Разработать SELECT-запрос на основе CROSS JOIN-соединения таблиц AUDITO-RIUM_TYPE
  и AUDITORIUM, формиру-ющего результат, аналогичный результату, полученному при
  выполнении запроса в за-дании 1.*/
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM
cross join AUDITORIUM_TYPE



/*Лаба 6*/

/*1. На основе таблиц FACULTY, PUL-PIT и PROFESSION сформировать спи-сок наименований
  кафедр (столбец PUL-PIT_NAME), которые находятся на фа-культете (таблица FACULTY),
  обеспечи-вающем подготовку по специальности, в наименовании (столбец PROFESSION_ NAME)
  которого содержится слово тех-нология или технологии. Примечание: использовать
  в секции WHERE предикат IN c некоррелированным подзапросом к таблице PROFESSION. */

select PULPIT_NAME, FACULTY_NAME
from PULPIT, FACULTY
where FACULTY.FACULTY in (select PROFESSION.FACULTY from PROFESSION where PROFESSION_NAME like '%технологи[ия]%')
  and PULPIT.FACULTY = FACULTY.FACULTY

/*2. Переписать запрос пункта 1 таким образом, чтобы тот же подзапрос был за-писан
  в конструкции INNER JOIN секции FROM внешнего запроса. При этом ре-зультат выполнения
  запроса должен быть аналогичным результату исходного запро-са. */

select distinct PULPIT_NAME, FACULTY_NAME
from PULPIT, FACULTY
join PROFESSION on FACULTY.FACULTY in (select PROFESSION.FACULTY from PROFESSION where PROFESSION_NAME like '%технологи[ия]%')
where PULPIT.FACULTY = FACULTY.FACULTY

/*3. Переписать запрос, реализующий 1 пункт без использования подзапроса. Примечание: использовать соединение INNER JOIN трех таблиц. */

select distinct PULPIT_NAME, FACULTY_NAME
from PULPIT
join FACULTY on PULPIT.FACULTY = FACULTY.FACULTY
join PROFESSION on PROFESSION.FACULTY = FACULTY.FACULTY
where PROFESSION_NAME like '%технологи[ия]%'

/*4. На основе таблицы AUDITORIUM сформировать список аудиторий самых больших вместимостей
  (столбец AUDI-TORIUM_CAPACITY) для каждого типа аудитории (AUDITORIUM_TYPE). При этом результат
  следует отсортировать в порядке убывания вместимости. Примеча-ние: использовать коррелируемый
  подза-прос c секциями TOP и ORDER BY. */

select AUDITORIUM.AUDITORIUM_TYPE, AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM
from AUDITORIUM
where AUDITORIUM_CAPACITY = (select top(1) AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY  desc )

/*5. На основе таблиц FACULTY и PUL-PIT сформировать список наименований факультетов (столбец FACULTY_NAME)
  на котором нет ни одной кафедры (табли-ца PULPIT). Примечание: использовать предикат EXISTS и коррелированный под-запрос. */

select FACULTY_NAME
from FACULTY  where not exists (select * from PULPIT where PULPIT.FACULTY = FACULTY.FACULTY  )

/*6. На основе таблицы PROGRESS сформировать строку, содержащую сред-ние значения оценок (столбец NOTE)
  по дисциплинам, имеющим следующие коды: ОАиП, БД и СУБД. Примечание: исполь-зовать три некоррелированных
  подзапроса в списке SELECT; в подзапросах приме-нить агрегатные функции AVG. */

select top(1)
(select avg(PROGRESS.NOTE ) from PROGRESS where PROGRESS.SUBJECT  = 'ОАиП')[ср знач ОАиП],
(select avg(PROGRESS.NOTE ) from PROGRESS where PROGRESS.SUBJECT  = 'КГ')[ср знач КГ],
(select avg(PROGRESS.NOTE ) from PROGRESS where PROGRESS.SUBJECT  = 'СУБД')[ср знач СУБД]
from PROGRESS

-- 7. Разработать SELECT-запрос, демон-стрирующий принцип применения ALL совместно с подзапросом.

select *
from PROGRESS
where PROGRESS.SUBJECT = 'СУБД' and
      PROGRESS.NOTE >=all (select PROGRESS.NOTE  from PROGRESS where PROGRESS.SUBJECT = 'СУБД')

-- 8. Разработать SELECT-запрос, демон-стрирующий принцип применения ANY совместно с подзапросом.

select *
from PROGRESS
where PROGRESS.SUBJECT = 'ОАиП' and
      PROGRESS.NOTE >any (select PROGRESS.NOTE from PROGRESS where PROGRESS.SUBJECT = 'ОАиП')







-- ЛАБА 7

/*1. На основе таблицы AUDITORIUM разработать SELECT-запрос, вычисляющий максимальную,
  минимальную и среднюю вместимость аудиторий, суммарную вме-стимость всех аудиторий
  и общее количе-ство аудиторий. */


select max(AUDITORIUM_CAPACITY) as [Макс. вмест.],
       min(AUDITORIUM_CAPACITY) as [Мин. вмест.],
       avg(AUDITORIUM_CAPACITY) as [Ср. вмест.],
       sum(AUDITORIUM_CAPACITY) as [Общая вмест.],
       count(AUDITORIUM_CAPACITY) as [Кол-во аудит.]
from AUDITORIUM


/*2. На основе таблиц AUDITORIUM и AUDITORIUM_TYPE разработать запрос, вычисляющий для каждого типа
  аудиторий максимальную, минимальную, среднюю вместимость аудиторий, суммарную вме-стимость
  всех аудиторий и общее количе-ство аудиторий данного типа.
  Результирующий набор должен содер-жать столбец с наименованием типа ауди-торий
  (столбец AUDITORIUM_TYPE.AU-DITORIUM_TYPENAME) и столбцы с вычисленными величинами.
  Использовать внутреннее соединение таблиц, секцию GROUP BY и агрегатные функции.
*/
select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME as [Тип аудит.],
       max(AUDITORIUM_CAPACITY) as [Макс. вмест.],
       min(AUDITORIUM_CAPACITY) as [Мин. вмест.],
       avg(AUDITORIUM_CAPACITY) as [Ср. вмест.],
       sum(AUDITORIUM_CAPACITY) as [Общая вмест.],
       count(AUDITORIUM_CAPACITY) as [Кол-во аудит.]
from AUDITORIUM inner join AUDITORIUM_TYPE on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
group by AUDITORIUM_TYPE.AUDITORIUM_TYPENAME

/*3. Разработать запрос на основе таблицы PROGRESS, который содержит количество экзаменационных оценок
  в заданном интер-вале. При этом учесть, что сортировка строк должна осуществляться в порядке, обратном
  величине оценки; сумма значений в столбце количество должна быть равна количеству строк в таблице PROGRESS.
Использовать подзапрос в секции FROM, в подзапросе применить GROUP BY, сор-тировку осуществить во внешнем запросе.
  В секции GROUP BY, в SELECT-списке подзапроса и в ORDER BY внешнего запро-са применить CASE.
 */

select *
from (select
          case
            when PROGRESS.NOTE = 10 then '10'
            when PROGRESS.NOTE between 8 and 9 then '8-9'
            when PROGRESS.NOTE between 6 and 7 then '6-7'
            when PROGRESS.NOTE between 4 and 5 then '4-5'
            else '<4'
          end [Оценка], count(*) as Количество
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
   case [Оценка]
        when '10'  then 1
        when '8-9' then 2
        when '6-7' then 3
        when '4-5' then 4
        else 5
    end

/*4. Разработать SELECT-запроса на осно-ве таблиц FACULTY, GROUPS, STU-DENT и PROGRESS, который содержит среднюю
  экзаменационную оценку для каждой группы  каждой специальности. Строки отсортированы в порядке убывания средней оценки.

При этом следует учесть, что средняя оценка должна рассчитываться с точностью до двух знаков после запятой.
  Использо-вать внутреннее соединение таблиц, агре-гатную функцию AVG и встроенные функ-ции CAST и ROUND.

Переписать SELECT-запрос, разработан-ный в задании 4 так, чтобы в расчете сред-него значения оценок использовались
  оцен-ки только по дисциплинам с кодами БД и ОАиП. Использовать WHERE.
*/

select  FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY join
     (PROGRESS inner join STUDENT on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT) on GROUPS.IDGROUP = STUDENT.IDGROUP
group by FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP

select  FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY join
     (PROGRESS inner join STUDENT on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT) on GROUPS.IDGROUP = STUDENT.IDGROUP
where PROGRESS.SUBJECT = 'ОАиП' or PROGRESS.SUBJECT = 'СУБД'
group by FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP

/*5. На основе таблиц FACULTY, GROUPS, STUDENT и PROGRESS разра-ботать SELECT-запрос, в котором выводят-ся специальность,
  дисциплины и средние оценки при сдаче экзаменов на факультете ТОВ. Использовать группировку по полям FACULTY, PROFESSION, SUBJECT.
 Добавить в запрос конструкцию ROLLUP и проанализировать результат.
*/

select  FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY join
     (PROGRESS inner join STUDENT on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT) on GROUPS.IDGROUP = STUDENT.IDGROUP
where FACULTY.FACULTY = 'ТОВ'
group by FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP with ROLLUP --добавляет суммирующую строку в результирующий набор

/*6. Выполнить исходный SELECT-запрос п.5 с использованием CUBE-группировки. Проанализировать результат.*/

select  FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY join
     (PROGRESS inner join STUDENT on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT) on GROUPS.IDGROUP = STUDENT.IDGROUP
where FACULTY.FACULTY = 'ТОВ'
group by FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.IDGROUP with CUBE --для каждой комбинации групп

/*7-8-9. На основе таблиц GROUPS, STU-DENT и PROGRESS разработать SELECT-запрос, в котором определяются результаты сдачи экзаменов.
    В запросе должны отражаться специаль-ности, дисциплины, средние оценки студен-тов на факультете ТОВ.
    Отдельно разработать запрос, в котором определяются результаты сдачи экзаменов на факультете ХТиТ.
    Объединить результаты двух запросов с использованием операторов UNION и UN-ION ALL. Объяснить результаты.
*/

select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from (PROGRESS inner join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT) join
     GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
--where GROUPS.FACULTY = 'ТОВ'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT

--UNION ALL
INTERSECT
--EXCEPT

select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) as AVERAGE_MARK
from (PROGRESS inner join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT) join
     GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
--where GROUPS.FACULTY = 'ХТиТ'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT

/*10. На основе таблицы PROGRESS определить для каждой дисциплины коли-чество студентов,
   получивших оценки 8 и 9. Использовать группировку, секцию HAVING, сортировку. */
select PROGRESS.SUBJECT, count(*) as [STUDENTS WITH 8 or 9]
from PROGRESS
group by PROGRESS.SUBJECT, PROGRESS.NOTE
HAVING PROGRESS.NOTE = '8' or PROGRESS.NOTE = '9'
order by [STUDENTS WITH 8 or 9] desc


-- Лаба 8



/*1. 1. Разработать представление с именем Преподаватель. Представление должно быть по-строено
  на основе SELECT-запроса к таблице TEACHER и содержать следующие столбцы: код (TEACHER),
  имя преподавателя (TEACHER_NAME), пол (GENDER), код кафедры (PULPIT). */

use UNIVER

drop view TEACHERS
create view TEACHERS as select * from TEACHER;

/*2. Разработать и создать представление с именем Количество кафедр. Представление должно быть
  построено на основе SELECT-запроса к таблицам FACULTY и PULPIT.
  Представление должно содержать следую-щие столбцы: факультет (FACUL-TY.FACULTY_ NAME),
  количество кафедр (вычисляется на основе строк таблицы PULPIT).
  Объяснить невозможность выполнения опе-раторов INSERT, UPDATE и DELETE для представления Количество кафедр.
*/
drop view [PULPIT COUNT]

create view [PULPIT COUNT] as
    select PULPIT.FACULTY, count(*) as [PULPIT COUNT]
    from PULPIT join FACULTY on PULPIT.FACULTY = FACULTY.FACULTY
    GROUP BY PULPIT.FACULTY

/*3. Разработать и создать представление с именем Аудитории. Представление должно быть построено
     на основе таблицы AUDITO-RIUM и содержать столбцы: код (AUDITO-RIUM), наименование аудитории (AUDITO-RIUM_NAME).
     Представление должно отображать только лекционные аудитории (в столбце AUDITO-RIUM_ TYPE строка, начинающаяся с симво-ла ЛК)
     и допускать выполнение оператора IN-SERT, UPDATE и DELETE.
*/

Drop view AUDITORIUMS

create view [AUDITORIUMS] as
    select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE
    from AUDITORIUM
    where AUDITORIUM.AUDITORIUM_TYPE like '%лк%' with check option

--  новые значения
  insert AUDITORIUMS(AUDITORIUM, AUDITORIUM_TYPE)
values('287-4', 'ЛК-К'),
      ('409-2', 'ЛК'),
      ('115-1', 'ЛК-К')

--ошибка
insert AUDITORIUMS(AUDITORIUM, AUDITORIUM_TYPE) values('297-4', 'ЛР')


/*5. Разработать и создать представление с именем Дисциплины. Представление должно быть
     построено на основе SELECT-запроса к таблице SUBJECT, отображать все дисципли-ны в алфавитном
     порядке и содержать следу-ющие столбцы: код (SUBJECT), наименова-ние дисциплины (SUBJECT_NAME)
     и код кафедры (PULPIT).
     Использовать секции TOP и ORDER BY.
*/

drop view SUBJECTS

create view [SUBJECTS] as
    select top(10) *
    from SUBJECT
    order by SUBJECT_NAME;

/*6. Изменить представление Количе-ство_кафедр, созданное в задании 2 так, чтобы оно было привязано к базовым таблицам.
     Про-демонстрировать свойство привязанности представления к базовым таблицам.
     Примеча-ние: использовать опцию SCHEMABINDING. */

create view [PULPIT COUNT with schemabinding] WITH SCHEMABINDING as
    select dbo.PULPIT.FACULTY, count(*) as [PULPIT COUNT]
    from dbo.PULPIT
    GROUP BY dbo.PULPIT.FACULTY

Alter table PULPIT DROP COLUMN FACULTY



/*     ЛАБА 9          */

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
PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' число обрабо-танных строк; '
PRINT CAST(@@VERSION AS VARCHAR) + ' версия SQL Server; '
PRINT CAST(@@SPID AS VARCHAR) + ' возвращает системный идентификатор процесса, назначен-ный сервером текущему подключе-нию;'
PRINT CAST(@@ERROR AS VARCHAR) + ' код последней ошибки; '
PRINT CAST(@@SERVERNAME AS VARCHAR) + ' имя сервера; '
PRINT CAST(@@TRANCOUNT AS VARCHAR) + ' возвращает уровень вложенности транзакции; '
PRINT CAST(@@FETCH_STATUS AS VARCHAR) + ' проверка ре-зультата считывания строк результи-рующего набора; '
PRINT CAST(@@NESTLEVEL AS VARCHAR) + ' уровень вложен-ности текущей процедуры.';

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
WHERE PROGRESS.SUBJECT = 'СУБД';

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
--UPDATE dbo.AUDITORIUM SET AUDITORIUM_CAPACITY = 'А' where AUDITORIUM.AUDITORIUM_TYPE LIKE '%ЛК%'
END TRY
BEGIN CATCH
PRINT ERROR_NUMBER()
PRINT ERROR_MESSAGE()
PRINT ERROR_LINE()
PRINT ERROR_PROCEDURE()
PRINT ERROR_SEVERITY()
PRINT ERROR_STATE()
END CATCH




---   ЛАБА 10   ---

-- TASK 1
--SP_HELPINDEX можно получить перечень индексов, связанных с заданной таблицей

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

/*Создать временную локальную таблицу. Заполнить ее данными (не менее 1000 строк).
Создать кластеризованный индекс, уменьшающий стоимость SELECT-запроса.
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
checkpoint; --фиксация БД
DBCC DROPCLEANBUFFERS; --очистить буферный кэш

SELECT * FROM #TEMP1 t WHERE t.ID BETWEEN 100 AND 200 ORDER BY t.VALUE;


---TASK 2

/*Создать временную локальную таб-лицу. Заполнить ее данными (10000 строк или больше).
Создать некластеризованный не-уникальный составной индекс.
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
INSERT #TEMP(ID, VALUE1,VALUE2) VALUES (FLOOR(100*RAND()),N'покрывающий индекс' + CAST(FLOOR(RAND()*10) AS nvarchar(2)),N'индексы');
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
WHEN 0 THEN N'ПАША'
WHEN 1 THEN N'ВАСЯ'
WHEN 2 THEN N'ПЕТЯ'
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
WHEN 0 THEN N'ПАША'
WHEN 1 THEN N'ВАСЯ'
WHEN 2 THEN N'ПЕТЯ'
END,
FLOOR(RAND()*20));
SET @k = @k + 1;
END;

SELECT tab2.name [Индекс], tab1.avg_fragmentation_in_percent [Фрагментация (%)] FROM
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
--Параметр FILLFACTOR указывает процент заполнения индексных страниц нижнего уровня.
CREATE INDEX indx ON #TEMP(ID) WITH(FILLFACTOR = 65);

DROP INDEX #TEMP.indx;

DECLARE @k int = 1,@y int;
WHILE @k < 10000
BEGIN
SET @y = @k%3;
INSERT #TEMP(NAME,AGE) VALUES (
CASE @y
WHEN 0 THEN N'ПАША'
WHEN 1 THEN N'ВАСЯ'
WHEN 2 THEN N'ПЕТЯ'
END,
FLOOR(RAND()*20));
SET @k = @k + 1;
END;

SELECT tab2.name [Индекс], tab1.avg_fragmentation_in_percent [Фрагментация (%)] FROM
sys.dm_db_index_physical_stats(DB_ID(N'UNIVER'),OBJECT_ID(N'#TEMP'),NULL,NULL,NULL) tab1
JOIN
sys.indexes tab2
ON tab1.object_id = tab2.object_id AND tab1.index_id = tab2.index_id
WHERE tab2.name IS NOT NULL;




---   Лаба 11   ---

---TASK
DECLARE cursor1 CURSOR FOR
    SELECT  sub.[SUBJECT] FROM [SUBJECT] sub WHERE sub.PULPIT = N'ИСиТ';

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
INSERT FACULTY(FACULTY,FACULTY_NAME) VALUES (N'FIT',N'Факультет IT');
SET @str = @str + N'Количество факультетов : ' + CAST(@@CURSOR_ROWS AS nvarchar(10)) + CHAR(10);
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
INSERT FACULTY(FACULTY,FACULTY_NAME) VALUES (N'FIT',N'Факультет IT');
SET @str = @str + N'Количество факультетов : ' + CAST(@@CURSOR_ROWS AS nvarchar(10)) + CHAR(10);
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

INSERT FACULTY(FACULTY,FACULTY_NAME) VALUES (N'FIT',N'Факультет IT');
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















---   ЛАБА  13 ---

--Task 1
CREATE PROCEDURE PSUBJECT1 AS
BEGIN
	DECLARE @count INT = (SELECT COUNT(*) FROM SUBJECT)
	SELECT SUBJECT.SUBJECT[КОД], SUBJECT.SUBJECT_NAME[ДИСЦИПЛИНА], SUBJECT.PULPIT[КАФЕДРА] FROM SUBJECT
	RETURN @count
END
GO
DROP PROCEDURE PSUBJECT1;
EXECUTE PSUBJECT1;

--Task 2
/*PSUBJECT принимает два параметра с именами @p и @c.
  Параметр @p является входным, имеет тип VAR-CHAR(20) и значение по умолчанию NULL.
  Параметр @с является выходным, имеет тип INT.
  Кроме того, процедура должна формировать значение выходного параметра @с,
  равное количеству строк в результирующем наборе*/

CREATE PROCEDURE PSUBJECT @p NVARCHAR(20) = NULL, @c INT = -1 OUTPUT
AS
BEGIN
	DECLARE @count INT = (SELECT COUNT(*) FROM SUBJECT)
	PRINT 'Parameters: @p = ' + @p + ', @c = ' + CAST(@c AS VARCHAR(3))
	SELECT SUBJECT.SUBJECT[КОД], SUBJECT.SUBJECT_NAME[ДИСЦИПЛИНА], SUBJECT.PULPIT[КАФЕДРА] FROM SUBJECT
	WHERE SUBJECT.PULPIT = @p
	SET @c = @@ROWCOUNT
	RETURN @count
END
GO

DROP PROCEDURE PSUBJECT;

declare @c int = 1;

exec PSUBJECT 'ИСиТ', @c output
print @c


--Task 3
/*Создать временную локальную таблицу с именем #SUBJECT.
  Изменить процедуру PSUBJECT таким образом, чтобы она не содержала выходного параметра.*/

CREATE TABLE #SUBJECT (
	[SUBJECT] NVARCHAR(20) PRIMARY KEY,
	[SUBJECT_NAME] NVARCHAR(MAX),
	[PULPIT] NVARCHAR(MAX)
	)

CREATE PROCEDURE PSUBJECT @p NVARCHAR(20)
AS
BEGIN
	SELECT SUBJECT.SUBJECT[КОД], SUBJECT.SUBJECT_NAME[ДИСЦИПЛИНА], SUBJECT.PULPIT[КАФЕДРА] FROM SUBJECT
	WHERE SUBJECT.PULPIT = @p
END
GO

DROP PROCEDURE PSUBJECT;

INSERT #SUBJECT EXEC PSUBJECT @p = 'ИСиТ'
select * from #SUBJECT

DROP table #SUBJECT


--Task 4

/*Разработать процедуру с именем PAUDITORI-UM_INSERT.
  Процедура принимает четыре входных параметра: @a, @n, @c и @t.
  Процедура добавляет строку в таблицу AUDITO-RIUM. Значения столбцов AUDITORIUM, AUDI-TORIUM_NAME,
  AUDITORIUM_CAPACITY и AUDITORIUM_TYPE добавляемой строки задаются соответственно параметрами @a, @n, @c и @t.
  Процедура PAUDITORIUM_INSERT должна при-менять механизм TRY/CATCH для обработки ошибок.
  Процедура должна возвращать к точке вызова зна-чение -1 в том случае, если произошла ошибка и 1, ес-ли выполнение успешно. */

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
exec @result = PAUDITORIUM_INSERT '8756-2', 'ЛК', 3500, '8756-2'
select @result

--Task 5

/*Разработать процедуру с именем SUBJECT_REPORT, формирующую в стандартный выходной поток отчет
  со списком дисциплин на кон-кретной кафедре.
  Процедура имеет входной параметр с именем @p типа CHAR(10), который предназначен для указания кода кафедры.*/

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

exec PSUBJECT_REPORT 'ИСиТ'

--Task 6

/*Разработать процедуру с именем PAUDITORI-UM_INSERTX.
  Процедура принимает пять входных параметров: @a, @n, @c, @t и @tn.
  Добавление строки в таблицу AUDITORI-UM_TYPE и вызов процедуры PAUDITORI-UM_INSERT
  должны выполняться в рамках одной явной транзакции с уровнем изолированности SERI-ALIZABLE.
  Процедура PAUDITORIUM_INSERTX должна возвращать к точке вызова значение -1 в том случае, если произошла ошибка и 1,
  если выполнения проце-дуры завершилось успешно. */

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

exec PAUDITORIUM_INSERTX '781-1', 'ЛК_3.0', 100, '781-1', 'COOL аудитория'


---   ЛАБА 14   ---

--Task 1

/*Разработать скалярную функцию с именем COUNT_STUDENTS, которая вычисляет количество сту-дентов на факультете,
  код которого задается параметром типа VARCHAR(20) с именем @faculty. */
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

declare @n int = dbo.COUNT_STUDENTS('ХТиТ');
print 'Количество студентов: ' + cast(@n as varchar(4));
go

/*Внести изменения в текст функции с помощью оператора ALTER с тем, чтобы функция принимала
  второй параметр @prof типа VARCHAR(20), обозначающий специальность студентов.
  Для параметров определить значения по умолча-нию NULL. */

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

declare @n int = dbo.COUNT_STUDENTS('ХТИТ', '1-36 01 08');
print 'Количество студентов: ' + cast(@n as varchar(4));

--Task 2
/*Разработать скалярную функцию с именем FSUBJECTS, принимающую параметр @p типа VARCHAR(20),
  значение которого задает код кафедры (столбец SUBJECT.PULPIT).
Функция должна возвращать строку типа VARCHAR(300) с перечнем дисциплин в отчете.
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

select distinct PULPIT, dbo.FSUBJECTS(PULPIT)[Дисциплины] from SUBJECTS;

--Task 3
/*Функция принимает два параметра, задающих код фа-культета (столбец FACULTY.FACULTY) и
  код кафедры (столбец PULPIT.PULPIT). Использует SELECT-запрос c левым внешним соединением
  между таблицами FACULTY и PULPIT. */

create function FFACPUL(@f varchar(20), @p varchar(20)) returns TABLE
as return
select FACULTY.FACULTY, PULPIT.PULPIT from FACULTY left outer join PULPIT
  on FACULTY.FACULTY = PULPIT.FACULTY
   where FACULTY.FACULTY = ISNULL(@f, FACULTY.FACULTY) and
    PULPIT.PULPIT = ISNULL(@p, PULPIT.PULPIT);
go

drop function FFACPUL

select * from dbo.FFACPUL(null, null);      --она возвращает результирующий набор, содержащий список всех кафедр на всех факультетах.
select * from dbo.FFACPUL('ИТ', null);      --возвращает результирующий набор, содержащий список всех кафедр заданного факультета.
select * from dbo.FFACPUL(null, 'ИСиТ');    --функция возвращает результирующий набор, содержащий строку, соответствующую заданной кафедре.
select * from dbo.FFACPUL('ИТ', 'ИСиТ');    --функция возвращает результирующий набор, содержащий строку, соответствующую заданной кафедре на заданном факультете.

--Task 4
/*Функция принимает один параметр, задающий код кафедры. Функция возвращает количество преподавателей
  на задан-ной параметром кафедре. Если параметр равен NULL, то возвращается общее количество преподавателей. */

create function FCTEACHER(@p varchar(20)) returns int
as begin
declare @rc int = (select count(TEACHER) from TEACHER where PULPIT = ISNULL(@p, PULPIT));
return @rc;
end;

drop function FCTEACHER

select distinct PULPIT, dbo.FCTEACHER(PULPIT)[Количество преподавателей] from TEACHER;
select distinct dbo.FCTEACHER(null)[Общее количество преподавателей];

--Task 6
/* Изменить эту функцию так, чтобы количество кафедр, количество групп,
   количество студентов и количество специально-стей вычислялось отдельными скалярными функциями.*/

create function FACULTY_REPORT(@c int) returns @fr table
	                        ( [Факультет] varchar(50), [Количество кафедр] int, [Количество групп]  int,
	                          [Количество студентов] int, [Количество специальностей] int )
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

print dbo.COUNT_PULPIT('ХТиТ');


create function COUNT_GROUP(@f varchar(20)) returns int
as begin
declare @rc int = 0;
set @rc = (select count(IDGROUP) from GROUPS where FACULTY like @f);
return @rc;
end;

drop function COUNT_GROUP

print dbo.COUNT_GROUP('ХТиТ');


create function COUNT_PROFESSION(@f varchar(20)) returns int
as begin
declare @rc int = 0;
set @rc = (select count(PROFESSION) from PROFESSION where FACULTY like @f);
return @rc;
end;

drop function COUNT_PROFESSION

print dbo.COUNT_PROFESSION('1-36 01 08');





---   ЛАБА 15   ---

-- 1

/*Разработать AFTER-триггер с именем TR_TEACHER_INS для таблицы TEACHER,
реагирующий на событие INSERT. Триггер TR_TEACHER_INS должен записывать стро-ки вводимых
данных в таблицу TR_AUDIT. В столбец СС помещаются значения столбцов вводимой строки.*/

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

insert into  TEACHER values('Ив1', 'Иванов', 'м', 'ИСиТ');
insert into  TEACHER values('Ивf', 'Ивановf', 'м', 'ИСиТ');
insert into  TEACHER values('Ивffj', 'Ивановffj', 'м', 'ИСиТ');

select * from TR_AUDIT

drop table TR_AUDIT
drop trigger TR_TEACGER_INS


--2

/*Создать AFTER-триггер с именем TR_TEACHER_DEL для таблицы TEACHER, реагирующий
на событие DELETE. Триггер TR_TEACHER_DEL должен записывать стро-ку данных в таблицу TR_AUDIT
для каждой удаляемой строки. В столбец СС помещаются значения столбца TEACHER удаляемой стро-ки.*/

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

delete TEACHER where TEACHER='Ив1'
select * from TR_AUDIT

--3

/*Создать AFTER-триггер с именем TR_TEACHER_UPD для таблицы TEACHER, реагирующий на событие UPDATE.
Триггер TR_TEACHER_UPD должен записывать стро-ку данных в таблицу TR_AUDIT для каждой изменяемой строки.
В столбец СС помещаются значения всех столбцов изменяемой строки до и после изменения.*/

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

update TEACHER set GENDER = 'ж' where TEACHER='Ивf'
select * from TR_AUDIT

delete from TR_AUDIT where STMT = 'UPD'

drop trigger TR_TEACHER_UPD
--4

/*Создать AFTER-триггер с именем TR_TEACHER для таблицы TEACHER, реа-гирующий на события
INSERT, DELETE, UPDATE. Триггер TR_TEACHER должен за-писывать строку данных в таблицу TR_AUDIT
для каждой изменяемой строки. В коде тригге-ра определить событие, активизировавшее триггер и
поместить в столбец СС соответству-ющую событию информацию. Разработать сце-нарий, демонстрирующий
работоспособность триггера.*/

create trigger TR_TEACHER  on TEACHER after INSERT, DELETE, UPDATE as
declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
declare @ins int = (select count(*) from inserted), @del int = (select count(*) from deleted);
   if  @ins > 0 and  @del = 0
   begin
   print 'Событие: INSERT';
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
	print 'Событие: DELETE';
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
	print 'Событие: UPDATE';
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

delete TEACHER where TEACHER='Ив'
insert into  TEACHER values('Ив', 'Иванов', 'м', 'ИСиТ');
update TEACHER set GENDER = 'ж' where TEACHER='Ив'

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

/*Разработать сценарий, который демонстрирует на примере базы данных X_BSTU, что провер-ка
ограничения целостности выполняется до срабатывания AFTER-триггера.*/

update TEACHER set GENDER = 'q' where TEACHER='Ив'
select * from TR_AUDIT

--6

/*Создать для таблицы TEACHER три AFTER-триггера с именами: TR_TEACHER_ DEL1, TR_TEACHER_DEL2 и TR_TEACHER_ DEL3.
Триггеры должны реагировать на собы-тие DELETE и формировать соответствующие строки в таблицу TR_AUDIT.
Получить полный список триггеров, связан-ных с таблицей TEACHER. Упорядочить вы-полнение триггеров для
таблицы TEACHER, реагирующих на событие DELETE следующим образом: первым должен выполняться триггер с
именем TR_TEACHER_DEL3, последним – триггер TR_TEACHER_DEL2.
Примечание: использовать системные пред-ставления SYS.TRIGGERS и SYS.TRIGGERS_ EVENTS,
а также систем-ную процедуру SP_SETTRIGGERORDERS.*/



Insert into FACULTY(FACULTY) values ('Кирдун')

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

delete FACULTY where FACULTY='Кирдун'

--7

/*Разработать сценарий, демонстрирующий на примере базы данных утверждение:
AFTER-триггер является частью транзакции, в рамках которого выполняется оператор, акти-визировавший триггер.*/

create trigger PTran
on PULPIT after INSERT, DELETE, UPDATE
as declare @c int = (select count (*) from PULPIT);
if (@c >20)
begin
    print 'что-то выводит'
end;
return;

insert into PULPIT(PULPIT) values ('ТТПЛ')
delete PULPIT where PULPIT='ТТПЛ'

drop trigger PTran
--8

/*Создать для таблицы FACULTY INSTEAD OF-триггер, запрещающий удаление строк в таблице.
Разработать сценарий, который демонстри-рует на примере базы данных X_BSTU,
что проверка ограничения целостности выполнена, если есть INSTEADOF-триггер.

С помощью оператора DROP удалить все DML-триггеры, созданные в этой лабораторной работе.*/

create trigger F_INSTEAD_OF  on FACULTY instead of DELETE as
print 'Удаление запрещено'
return;

delete FACULTY where FACULTY = 'ИДиП'

drop trigger F_INSTEAD_OF
drop trigger PTran
drop trigger TR_TEACHER
drop trigger TR_TEACHER_DEL


--9
/*Создать DDL-триггер, реагирующий на все DDL-события в БД UNIVER. */
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
PRINT 'Удалять таблицы в этой базе данных запрещено!';
ROLLBACK;

DROP TRIGGER DDLTrigger1 ON DATABASE;
























