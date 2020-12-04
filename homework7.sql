-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
use test;

select * from orders;
select * from users;

select
	id,
	name
from users where id in (select user_id from orders);


-- Выведите список товаров products и разделов catalogs, который соответствует товару

select
	id,
	name,
	(select name from catalogs where id = catalog_id) as 'catalog'
from products;

-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

DROP TABLE IF EXISTS flights;
create table flights (
	id serial primary key,
    from_city varchar(12),
    to_city varchar(12));
    
    DROP TABLE IF EXISTS cities;
    create table cities (
		label varchar(12),
        rusname varchar(12));
        
	insert into `flights` (`from_city`, `to_city`) values
		('mosсow', 'omsk'),
		('novgorod', 'kazan'),
		('irkutsk', 'moscow'),
		('omsk', 'irkutsk'),
		('moscow', 'kazan');
        
	insert into `cities` (`label`, `rusname`) value
		('moscow', 'Москва'),
        ('irkutsk', 'Иркутск'),
        ('novgorod', 'Новгород'),
        ('kazan', 'Казань'),
        ('omsk', 'Омск');
        
        
	select * from flights;
    select * from cities;

-- вывести столбцы отдельно
select *
from flights f
left join 
cities c
on f.from_city = c.label
left join 
cities c1
on f.to_city = c1.label;

select 
	c.rusname as from_city,
    c1.rusname as to_city
from flights f
left join 
cities c
on f.from_city = c.label
left join 
cities c1
on f.to_city = c1.label;
