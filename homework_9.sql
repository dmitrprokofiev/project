
-- 1.	В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

start transaction;
insert into shop.users select * from snet0611.users where id = 93;
commit;

-- можно добавить в транзакцию команду delete from shop.users where id = 93 limit 1;

-- 2.	Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

DROP view IF EXISTS prod_cat;
create view prod_cat
	(products, catalogs) as select products.name1, catalogs.name1
from products, catalogs
where products.id = catalogs.id;

-- 3.	Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

SET SQL_SAFE_UPDATES = 0; -- убираем ограничение на изменение записей в воркбенч
-- вариант 1. через транзакцию
use test;
start transaction;
delete from users where created_at not in (select * from (select created_at from users order by created_at desc limit 5) as `rt`);
commit;

-- вариант 2. Через представление
drop view if exists new_create;
create view new_create as select * from users where created_at order by created_at desc limit 5;


-- 1.	Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
delimiter //
drop procedure if exists hello//
create procedure hello()
begin
	if 6 <= hour(now()) and hour(now()) <= 12  then
		select 'Доброе утро';
	elseif 12 <= hour(now()) and hour(now()) <= 18  then
		select 'Добрый вечер';
	else
		select 'Доброй ночи';
	end if;
end//

call hello()//

-- 2.	В таблице products есть два текстовых поля: name с названием товара и description с его описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.


drop trigger if exists not_null_insert//
create trigger not_null before insert on products
for each row
begin
	if new.name1 is null and new.description is null then
    signal sqlstate '45000' set message_text = 'Insert Canceled. Fill in the field name1 and description';
	end if;
end//

-- тот же самый триггер можно сделать на update 
drop trigger if exists not_null_update//
create trigger not_null before update on products
for each row
begin
	if new.name1 is null and new.description is null then
    signal sqlstate '45000' set message_text = 'Insert Canceled. Fill in the field name1 and description';
	end if;
end//


