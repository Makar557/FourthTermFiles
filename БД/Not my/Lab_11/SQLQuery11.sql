use ТМРKarle_UNIVER
--1 получить перечень индексов, связанных с заданной таблицей
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

--Некластеризованные индексы не влияют на физический порядок строк в таблице
--2 
---— Создать временную локальную таб-лицу. Заполнить ее данными (не ме-нее 1000 строк). 
CREATE TABLE #TEMP( 
ID int IDENTITY(1,1), 
VALUE varchar(10)); 

DROP TABLE #TEMP; 

DECLARE @i int = 1, 
@j int = 0, 
@x char = '*', 
@str varchar(10) = ' ', 
@rand int; 

WHILE @i < 1001
BEGIN 
SET @j = 0; 
SET @str = ' '; 
SET @rand = RAND()*10 
WHILE @j < @rand 
BEGIN 
SET @str = @str + @x; 
SET @j = @j + 1; 
END 
INSERT INTO #TEMP(VALUE) VALUES (@str); 
SET @i = @i + 1; 
END 

select * from #TEMP
---— 
CREATE CLUSTERED INDEX indx1 
ON #TEMP(VALUE ASC); 

DROP INDEX #TEMP.indx1; 
---— 
checkpoint; --фиксация БД
DBCC DROPCLEANBUFFERS; --очистить буферный кэш

SELECT 
t.ID, 
t.VALUE 
FROM #TEMP t 
WHERE t.VALUE LIKE '***'; 

SELECT * FROM #TEMP t WHERE t.ID BETWEEN 100 AND 200 ORDER BY t.VALUE; 

--3 Создать временную локальную таб-лицу. Заполнить ее данными (не ме-нее 10000 строк).
--Некластеризованные индексы не влияют на физический порядок строк в таблице.
CREATE TABLE #TEMP( 
ID int IDENTITY(1,2), 
VALUE nvarchar(100)); 

drop table #TEMP

DECLARE @k int = 1; 
WHILE @k < 1000 
BEGIN 
INSERT #TEMP(VALUE) VALUES (REPLICATE(N'ФИТ',5*RAND())); 
SET @k = @k + 1; 
END; 
--Создать некластеризованный неуни-кальный составной индекс (состоя-щий из двух столбцов). 
CREATE INDEX indx ON #TEMP(ID,VALUE); 
DROP INDEX #TEMP.indx;
SELECT * FROM #TEMP t WHERE t.VALUE = N'ФИТФИТ' AND t.ID > 200; 

drop table #TEMP
--4 
--Создать временную локальную таб-лицу. Заполнить ее данными (не ме-нее 10000 строк). 
--Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость. 
--Создать некластеризованный ин-декс покрытия, уменьшающий сто-имость SELECT-запроса. 

CREATE TABLE #TEMP( 
ID int, 
VALUE1 nvarchar(100), 
VALUE2 nvarchar(100)); 
--Индекс покрытия запроса позволяет включить в состав индексной строки значения одного или нескольких неиндексируемых столбцов.
DECLARE @k int = 1; 
WHILE @k < 1000 
BEGIN 
INSERT #TEMP(ID,VALUE1,VALUE2) VALUES (FLOOR(100*RAND()),N'покрывающий индекс' + CAST(FLOOR(RAND()*10) AS nvarchar(2)),N'индексы'); 
SET @k = @k + 1; 
END; 

CREATE INDEX indx ON #TEMP(ID) INCLUDE(VALUE1,VALUE2); 
DROP INDEX #TEMP.indx; 

SELECT t.VALUE1,t.VALUE2 FROM #TEMP t WHERE t.ID = 50; 

drop table #TEMP
--5 . Создать временную локальную таблицу. Заполнить ее данными (не менее 10000 строк). Разработать SELECT-запрос, получить план за-проса и определить его стоимость. Создать некластеризованный филь-труемый индекс, уменьшающий стоимость SELECT-запроса. 

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
--6 Создать временную локальную таб-лицу. Заполнить ее данными (не ме-нее 1000 строк). Создать некласте-ризованный индекс. Оценить уро-вень фрагментации индекса. 
--Разработать сценарий на T-SQL, выполнение которого приводит к уровню фрагментации индекса выше 90%.

CREATE TABLE TEMP( 
ID int IDENTITY(1,1), 
NAME nvarchar(100), 
AGE int); 

CREATE INDEX indx ON TEMP(ID); 

DECLARE @k int = 1,@y int; 
WHILE @k < 10000
BEGIN 
SET @y = @k%3; 
INSERT TEMP(NAME,AGE) VALUES ( 
CASE @y 
WHEN 0 THEN N'ПАША' 
WHEN 1 THEN N'ВАСЯ' 
WHEN 2 THEN N'ПЕТЯ' 
END, 
FLOOR(RAND()*20)); 
SET @k = @k + 1; 
END; 
--Процесс образования неиспользуемых фрагментов памяти называют фрагментацией. 
SELECT tab2.name [Индекс], tab1.avg_fragmentation_in_percent [Фрагментация (%)] FROM 
sys.dm_db_index_physical_stats(DB_ID(N'ТМРKarle_UNIVER'),OBJECT_ID(N'TEMP'),NULL,NULL,NULL) tab1 
JOIN 
sys.indexes tab2 
ON tab1.object_id = tab2.object_id AND tab1.index_id = tab2.index_id 
WHERE tab2.name IS NOT NULL; 

--Реорганизация (REORGANIZE) выполняется быстро, но после нее фрагментация бу-дет убрана только на самом нижнем уровне.
ALTER INDEX indx ON TEMP REORGANIZE; 
--перестройки (REBUILD) затрагивает все узлы дерева, поэтому  после ее выполнения степень фрагментации равна нулю
ALTER INDEX indx ON TEMP REBUILD WITH(ONLINE = OFF ); 

drop table TEMP
--7 
--Разработать пример, демонстриру-ющий применение параметра FILL-FACTOR при создании некластери-зованного индекса
CREATE TABLE TEMP( 
ID int IDENTITY(1,1), 
NAME nvarchar(100), 
AGE int); 

DROP TABLE TEMP; 
--Параметр FILLFACTOR указывает процент заполнения индексных страниц нижнего уровня.
CREATE INDEX indx ON TEMP(ID) WITH(FILLFACTOR = 65); 

DROP INDEX TEMP.indx; 

DECLARE @k int = 1,@y int; 
WHILE @k < 10000 
BEGIN 
SET @y = @k%3; 
INSERT TEMP(NAME,AGE) VALUES ( 
CASE @y 
WHEN 0 THEN N'ПАША' 
WHEN 1 THEN N'ВАСЯ' 
WHEN 2 THEN N'ПЕТЯ' 
END, 
FLOOR(RAND()*20)); 
SET @k = @k + 1; 
END; 

SELECT tab2.name [Индекс], tab1.avg_fragmentation_in_percent [Фрагментация (%)] FROM 
sys.dm_db_index_physical_stats(DB_ID(N'ТМРKarle_UNIVER'),OBJECT_ID(N'TEMP'),NULL,NULL,NULL) tab1 
JOIN 
sys.indexes tab2 
ON tab1.object_id = tab2.object_id AND tab1.index_id = tab2.index_id 
WHERE tab2.name IS NOT NULL; 
