-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы,
-- идентификатор первичного ключа и содержимое поля name.

use test;
drop table if exists log;
create table if not exists log(
	date_log datetime not null,
    table_names varchar(40) not null,
    id_prim_key bigint unsigned not null,
    value_name varchar(40) not null
) ENGINE = ARCHIVE;

delimiter //

drop trigger if exists log_products//
create trigger log_products after insert on products
for each row
begin
	insert into log values (now(), 'users', new.id, new.name);
end//

drop trigger if exists log_catalogs//
create trigger log_catalogs after insert on catalogs
for each row
begin
	insert into log values (now(), 'users', new.id, new.name);
end//

drop trigger if exists log_users//
create trigger log_users after insert on users
for each row
begin
	insert into log values (now(), 'users', new.id, new.name);
end//

delimiter ;

-- проверяем
insert into users (`name`, `birthday_at`) values ('gggd', '1900-01-01');
select * from log;



-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
use test;

drop table if exists exp;
create table exp (
	r varchar(2)
);

-- количество строк в csv файле 1048576, займет 18сек. Файл csv прикреплен во вложении к дз

load data infile 'c:/ProgramData/MySQL/MySQL Server 5.7/Uploads/export.csv'
into table exp
fields terminated by ';'
enclosed by '"'
lines terminated by '\n';

select * from exp;

-- можно сделать тоже самое через цикл в процедуре, но займет час, что не эффективно

delimiter //
drop procedure million//
create procedure million() 
begin
declare i int default 1;
while i<1000 do
insert into exp (r) values ('1');
set i=i+1;
end while;
end//

call million();


-- 1 . В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.
 -- добавим адреса ip
 
 sadd ip 1.121.2141 1212.5542.1521. 1.1.215.51.5 54.215.11223
 -- посчитаем кол-во уникальны ip которые посещали сервис
 
 scard ip



-- 2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса 
-- по ео имени.

set gesg@gmail.ru dasha 
set dasha esg@gmail.ru

get gesg@gmail.ru
get dasha

-- 3. Организуйте хранение категорий и оварных позиций учебной базы данных shop в СУБД MongoDB

use products
db.products.insert({"name": "Intel Core i3-8100", "description": "Процессор для настольных ПК", "price": "8000.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()}) 

db.products.insertMany([
	{"name": "AMD FX-8320", "description": "Процессор для настольных ПК", "price": "4000.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
	{"name": "AMD FX-8320E", "description": "Процессор для настольных ПК", "price": "4500.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()}])

db.products.find().pretty()
db.products.find({name: "AMD FX-8320"}).pretty()

use catalogs
db.catalogs.insertMany([{"name": "Процессоры"}, {"name": "Мат.платы"}, {"name": "Видеокарты"}])