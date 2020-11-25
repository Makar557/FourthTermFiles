use ТМРKarle_UNIVER
--1 Разработать сценарий, формирующий список дисциплин на кафедре ИСиТ. В отчет выводятся краткие названия (по-ле SUBJECT) из таблицы SUBJECT в одну строку через запятую. Использо-вать встроенную функцию RTRIM.
DECLARE cursor1 
CURSOR FOR SELECT 
sub.[SUBJECT] 
FROM [SUBJECT] sub 
WHERE sub.PULPIT = N'ИСиТ'; 

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

--2 Разработать сценарий, демонстрирую-щий отличие глобального курсора от локального 
DECLARE cur 
CURSOR LOCAL FOR 
SELECT 
f.FACULTY 
FROM FACULTY f; 

DECLARE @s nvarchar(10); 
OPEN cur; 
WHILE 0 = 0 
BEGIN 
FETCH cur INTO @s; 
BREAK; 
END; 
PRINT @s; 
GO 
CLOSE cur; 

DEALLOCATE cur;

DECLARE cur 
CURSOR GLOBAL FOR 
SELECT 
f.FACULTY 
FROM FACULTY f; 

OPEN cur; 

DECLARE @s nvarchar(10); 
WHILE 0 = 0 
BEGIN 
FETCH cur INTO @s; 
BREAK; 
END; 
PRINT @s; 
GO 

CLOSE cur; 

DEALLOCATE cur; 

--3 Разработать сценарий, демонстрирую-щий отличие статических курсоров от динамических 
DECLARE cur CURSOR LOCAL STATIC FOR 
SELECT 
f.FACULTY, 
f.FACULTY_NAME 
FROM FACULTY f; 

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
--
DECLARE cur CURSOR LOCAL DYNAMIC FOR 
SELECT 
f.FACULTY, 
f.FACULTY_NAME 
FROM FACULTY f; 

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

DELETE f FROM FACULTY f 
WHERE f.FACULTY = N'FIT'; 

--4 Разработать сценарий, демонстрирую-щий свойства навигации в результиру-ющем наборе курсора с атрибутом SCROLL 
DECLARE cur CURSOR LOCAL SCROLL FOR 
SELECT 
ROW_NUMBER() OVER(ORDER BY f.FACULTY), 
f.FACULTY 
FROM FACULTY f; 

DECLARE @str nvarchar(50) = N' ',@s1 nvarchar(2),@s2 nvarchar(10); 

OPEN cur; 
FETCH FIRST FROM cur INTO @s1,@s2; 
SET @str = @str + @s1 +N'. '+@s2+ CHAR(10); 
FETCH LAST FROM cur INTO @s1,@s2; 
SET @str = @str + @s1 +N'. '+@s2+ CHAR(10); 
PRINT SUBSTRING(@str,2,LEN(@str)-1); 
GO 

--5 Создать курсор, демонстрирующий применение конструкции CURRENT OF в секции WHERE с использованием операторов UPDATE и DELETE.
INSERT FACULTY(FACULTY,FACULTY_NAME) VALUES (N'FIT',N'Факультет IT'); 
SELECT * FROM FACULTY;

DECLARE cur CURSOR LOCAL SCROLL DYNAMIC FOR 
SELECT 
f.FACULTY 
FROM FACULTY f 
FOR UPDATE; 

DECLARE @s nvarchar(5); 
OPEN cur 
FETCH FIRST FROM cur INTO @s; 
UPDATE FACULTY SET FACULTY = N'myFIT' WHERE CURRENT OF cur; 
FETCH FIRST FROM cur INTO @s; 
DELETE FACULTY WHERE CURRENT OF cur; 
GO 
SELECT * FROM FACULTY;

--6 
DECLARE cur CURSOR LOCAL DYNAMIC FOR 
SELECT 
stud.NAME 
FROM 
GROUPS gr JOIN STUDENT stud ON gr.IDGROUP = stud.IDGROUP 
JOIN PROGRESS prog ON prog.IDSTUDENT = stud.IDSTUDENT 
WHERE prog.NOTE < 4 
FOR UPDATE; 

OPEN cur; 
DECLARE @s nvarchar(10); 
WHILE 0 = 0 
BEGIN 
FETCH cur INTO @s; 
IF (@@FETCH_STATUS != 0) BREAK; 
DELETE FACULTY WHERE CURRENT OF cur; 
END; 
SELECT * FROM PROGRESS;

DECLARE cur CURSOR LOCAL DYNAMIC FOR 
SELECT 
prog.NOTE 
FROM PROGRESS prog 
WHERE prog.IDSTUDENT = 1001 
FOR UPDATE; 

OPEN cur; 
DECLARE @p nvarchar(10); 

FETCH cur INTO @p; 
UPDATE dbo.PROGRESS SET dbo.PROGRESS.NOTE = @p + 1 WHERE CURRENT OF cur; 
SELECT * FROM PROGRESS;
GO