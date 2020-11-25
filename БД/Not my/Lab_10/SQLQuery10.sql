use  ТМРKarle_UNIVER; 
DECLARE 
@a char = 'J', 
@b varchar = N'Д', 
@c datetime = getdate(), 
@time time , 
@nomber int, 
@v smallint, 
@x tinyint, 
@z numeric(12,5); 
SET @nomber = (SELECT 2*2); 
SET @time = '00:00:00'; 
SELECT @v = 1,@x = 2,@z = 1.2; 
--SELECT @a,@b,@c,@time; 
PRINT CAST(@nomber AS varchar(10)) + ' ' + CAST(@v AS varchar(10)) + ' ' + CAST(@x AS varchar(10)) + ' ' + CAST(@z AS varchar(10)); 
GO 

--2 
ALTER TABLE AUDITORIUM ADD ID int IDENTITY(1,1); 

DECLARE 
@i int = 1,-- —счётчик аудиторий 
@sum int = 0,-- —сумма вместимости аудиторий 
@avg int = 0,-- —средняя вместимость 
@k int = 0,-- —количество аудиторий,у которых вместимость меньше средней 
@length int = (SELECT COUNT(*) FROM AUDITORIUM); --—16 общее количество аудиторий 

WHILE (@i <= @length) --1<=16
BEGIN 
SET @sum = @sum + (SELECT a.AUDITORIUM_CAPACITY FROM AUDITORIUM a WHERE a.ID = @i); 
SET @avg = @sum / @i; 
SET @k = (SELECT COUNT(*) FROM AUDITORIUM a WHERE a.AUDITORIUM_CAPACITY < @avg); 
IF (@sum > 200) 
BEGIN 
SELECT 
@i [Количество аудиторий], 
@avg [Средняя вместимость аудиторий], 
@k [Количество аудиторий,вместимость которых меньше средней],
CAST(CAST(@k AS float)/CAST(@length AS float)*100 AS int) [Процент аудиторый] 
END; 
ELSE 
PRINT 'Общая вместимость : '+CAST(@sum AS varchar(10)); 
SET @i = @i + 1; 
END; 

--3 
PRINT 'Число обработанных строк : '+CAST(@@ROWCOUNT AS varchar(50)); 
PRINT 'Версия SQL : '+CAST(@@VERSION AS varchar(150)); 
PRINT 'Системный индефикатор процесса : '+CAST(@@SPID AS varchar(50)); 
PRINT 'Последняя ошибка : '+CAST(@@ERROR AS varchar(50)); 

SELECT @@SERVERNAME [Имя сервера], 
@@TRANCOUNT [Уровень вложенности транзакции], 
@@FETCH_STATUS [Проверка результата считывания строк], 
@@NESTLEVEL [Уровень вложенности процедуры]; 

--4 
DECLARE @z int,@t int=2,@x int=3; 
IF (@t > @x) SET @z = POWER(SIN(@t),2) 
ELSE IF (@t < @x) SET @z = 4*(@t+@x) 
ELSE IF(@t = @x) SET @z = 1-EXP(@x - 2) 
PRINT 'z= : '+CAST(@z AS varchar(10)); 

--преобразование полного ФИО студента в сокращенное 
DECLARE 
@name nvarchar(100) = (SELECT stud.NAME FROM STUDENT stud WHERE stud.IDSTUDENT = 1010), 
@fist_name nvarchar(50), 
@midle_name nvarchar(50), 
@last_name nvarchar(50), 
@position_one int, 
@position_two int; 

SET @position_one = CHARINDEX(' ',@name); 
SET @position_two = LEN(@name) - CHARINDEX(' ',REVERSE(@name)); 
SET @fist_name = SUBSTRING(@name,0,@position_one) 
SET @midle_name = SUBSTRING(@name,@position_one + 1,1); 
SET @last_name = SUBSTRING(@name,@position_two + 2,1); 

PRINT @fist_name+' '+@midle_name+'.'+@last_name+'.'; 

--6 Разработать сценарий, в котором с по-мощью CASE анализируются оценки, полученные студентами некоторого фа-культета при сдаче экзаменов
SELECT 
x.NOTE [оценка], 
CASE 
WHEN x.NOTE < 6 THEN 'плохая' 
WHEN x.NOTE = 6 OR x.NOTE = 7 THEN 'удовлетворительная' 
WHEN x.NOTE >= 8 THEN 'хорошая' 
END [анализ] 
FROM (SELECT pr.NOTE FROM PROGRESS pr) x; 

--7 Создать временную локальную таблицу  вывести содержимое. 
CREATE TABLE #TEMP( 
ID int, 
VALUE int); 

DECLARE @i int = 0; 
WHILE (@i < 10) 
BEGIN 
INSERT #TEMP(ID,VALUE) VALUES (@i + 1,CAST(RAND()*10 AS int)); 
SET @i = @i + 1; 
END; 

SELECT 
t.ID [позиция], 
t.VALUE [значение] 
FROM #TEMP t; 

DROP TABLE #TEMP; 

--8 Разработать скрипт, демонстрирующий использование оператора RETURN. 
DECLARE @i int = 10; 

WHILE @i < 100 
BEGIN 
PRINT @i; 
SET @i = @i +1; 
IF (@i = 20) RETURN; 
ELSE CONTINUE; 
END; 

--9 Разработать сценарий с ошибками, в котором используются для обработки ошибок блоки TRY и CATCH. 
BEGIN TRY 
INSERT
FACULTY(FACULTY,FACULTY_NAME) VALUES (NULL,NULL); 
END TRY
BEGIN CATCH 
PRINT ERROR_NUMBER() 
PRINT ERROR_MESSAGE() 
PRINT ERROR_LINE() 
PRINT ERROR_PROCEDURE() 
PRINT ERROR_SEVERITY() 
PRINT ERROR_STATE() 
END CATCH 