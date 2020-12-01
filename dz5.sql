use test;
-- Задание 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

update users set created_at = now(); 

-- Задание 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

alter table users change column created_at created_at datetime;
alter table users change column updated_at updated_at datetime;

-- Задание 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей

-- для начала нужно заполнить таблицу storehouses_products данными, т.к. она пустая. Для этого сгенерируем данные через сервис.
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('1', 708429079, 85, 6, '2009-12-29 22:29:12', '1971-05-22 10:13:25');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('2', 0, 45926, 9, '2000-03-31 04:16:40', '1998-01-06 21:39:24');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('3', 276047321, 40995, 9, '1988-03-03 16:40:27', '2018-12-26 17:56:02');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('4', 2362437, 174688852, 1, '1980-09-04 10:10:59', '1974-11-02 04:45:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('5', 156, 1, 4, '2011-10-30 06:56:54', '1975-09-03 23:11:01');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('6', 58905212, 84779877, 7, '1973-02-03 09:57:28', '2013-09-11 07:32:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('7', 978696298, 9889157, 9, '1974-12-07 08:06:34', '2019-11-07 22:14:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('8', 539812321, 68013, 7, '1982-06-20 05:33:01', '1977-01-03 06:03:48');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('9', 43793033, 174, 6, '2012-06-16 21:39:51', '1999-12-17 11:44:25');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('10', 251, 4520, 5, '1971-08-16 08:02:19', '2018-02-28 19:32:44');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('11', 933344, 828829, 7, '2011-02-02 05:57:01', '1997-10-30 23:06:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('12', 845, 58, 7, '1970-12-08 22:00:15', '2009-06-20 22:59:07');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('13', 24174579, 383, 0, '2004-08-16 18:28:53', '1981-06-13 00:10:41');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('14', 40, 756, 6, '2005-06-10 03:14:42', '1991-09-29 14:08:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('15', 7630, 8218094, 2, '1980-05-20 10:40:53', '1971-10-08 02:50:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('16', 57, 583047811, 0, '1976-05-20 13:50:33', '1999-02-06 02:22:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('17', 12432, 15412429, 9, '1971-08-09 06:30:04', '1998-07-31 23:59:08');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('18', 650, 56490134, 1, '2014-07-13 10:04:15', '2003-12-08 16:32:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('19', 940716051, 5176398, 2, '2011-12-17 11:07:33', '2012-08-22 06:27:06');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('20', 55164869, 483485, 6, '2008-09-14 13:02:00', '1998-01-26 10:06:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('21', 313689, 296, 7, '2015-06-18 17:11:35', '2008-01-19 22:18:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('22', 5406, 840307, 8, '2001-03-30 12:38:13', '1981-05-19 21:41:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('23', 83, 3079, 3, '1989-03-23 17:22:20', '1977-12-08 16:15:18');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('24', 5485525, 260960726, 9, '1970-01-25 21:40:34', '1998-06-08 15:07:28');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('25', 850, 24575044, 3, '2002-05-05 06:05:32', '2000-11-19 05:42:47');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('26', 96871296, 9785069, 0, '2018-04-27 23:22:28', '1996-03-30 01:06:25');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('27', 582795624, 4035026, 0, '2007-06-01 20:10:23', '1983-02-25 00:17:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('28', 35, 51293322, 5, '1984-06-11 09:43:50', '1995-05-01 15:09:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('29', 634312, 92093582, 2, '1995-02-20 04:02:05', '1999-05-20 00:28:56');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('30', 60764446, 17492438, 0, '2017-04-26 02:26:40', '2018-03-20 19:06:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('31', 73377, 32361, 5, '1994-08-02 14:03:50', '2002-08-04 17:54:39');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('32', 542130364, 2, 4, '1984-02-06 23:59:05', '1970-02-25 17:09:15');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('33', 654, 3074683, 4, '2019-11-05 00:20:22', '2005-04-09 01:12:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('34', 610, 1497, 1, '2000-05-04 18:03:08', '1995-12-09 18:25:13');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('35', 272, 6488395, 5, '1971-08-31 03:32:03', '2011-12-25 13:39:58');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('36', 701130177, 4693903, 6, '1975-04-22 14:10:50', '2011-12-29 06:43:21');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('37', 776, 4630, 9, '2003-08-11 19:19:54', '1998-09-30 12:55:33');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('38', 4, 377296, 5, '2013-04-04 20:57:37', '1983-02-13 19:54:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('39', 425, 427848906, 4, '1994-04-13 22:09:41', '1995-08-02 04:44:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('40', 407216, 3550502, 2, '1986-02-02 05:45:59', '2000-02-23 20:34:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('41', 3, 757, 7, '2002-06-01 01:25:00', '1975-11-26 18:58:12');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('42', 483028179, 33791397, 8, '1980-03-17 22:38:25', '1996-06-03 01:33:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('43', 9372, 5448724, 8, '2003-11-11 16:15:51', '1978-04-12 06:00:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('44', 98, 997199, 6, '1986-08-15 08:36:39', '1974-02-09 08:54:05');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('45', 4443, 1492, 1, '1992-04-02 22:07:19', '2012-06-16 17:12:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('46', 90497735, 695547, 3, '1971-06-10 10:35:36', '2001-03-13 09:37:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('47', 323428, 66599533, 6, '1988-02-28 14:26:24', '1997-04-24 23:57:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('48', 12713, 369, 5, '1997-03-15 15:54:15', '1975-02-04 09:52:31');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('49', 20, 774345, 6, '1987-05-06 10:46:59', '1991-08-21 17:37:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('50', 74691338, 5523296, 9, '2014-08-28 15:06:29', '2019-12-28 20:45:20');

select * from storehouses_products order by if(value > 0, 0, 1), value;

-- Задание 4. Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august)

select * from users where birthday_at like '19%-05-%' or birthday_at like '19%-08-%';

-- Задание 5. Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

select * from catalogs where id in (5, 1, 2) order by field(id, 5, 1, 2);

-- Задание 6. Подсчитайте средний возраст пользователей в таблице users.

select avg(floor((to_days(now())-to_days(birthday_at)) / 365.25)) as age from users;

-- Задание 7. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.


-- Задание 8. Подсчитайте произведение чисел в столбце таблицы.
select round(exp(sum(ln(value)))) from catalogs;