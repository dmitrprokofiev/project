drop database if exists omnidata;
create database omnidata;
SET FOREIGN_KEY_CHECKS=0;
use omnidata;

drop table if exists accounts;
create table if not exists accounts(
	id serial primary key,
    login varchar(40),
    passwords varchar(40),
    email varchar(120) unique,
	phone varchar(20) unique
);

drop table if exists terminals; -- поменять порядок столбцов для всех таблиц
create table if not exists terminals(
	id_terminal bigint unsigned not null comment 'ID терминала',
	account_id bigint unsigned not null,
    terminal varchar(120) not null comment 'Тип терминала',
    factory_number bigint unsigned not null comment 'Заводской номер',
    phone_number varchar(20) comment 'Телефон',
    comments varchar(255) comment 'Примечания',
    primary key(id_terminal),
    unique index terminal(id_terminal),
    foreign key (account_id) references accounts(id)
)comment = 'Список терминалов';


drop table if exists auto;
create table if not exists auto(
	id_terminal bigint unsigned not null comment 'ID терминала',
    auto_name varchar(40) unique not null comment 'Название ТС',
    auto_number tinyint(30) not null comment 'Гаражный номер',
    brand varchar(30) comment 'Марка',
    model varchar(30) comment 'Модель',
	auto_type bigint unsigned not null comment 'Тип ТС',
    geozone bigint unsigned not null comment 'Геозона',
    location bigint unsigned not null comment 'Локация',
    created_at datetime default now(),
    data_add bigint unsigned not null comment 'Актуальность данных',
    comments varchar(255) comment 'Примечания',
    unique index terminal(id_terminal),
    index(auto_number),
    index(auto_name),
    primary key(id_terminal),
    foreign key (id_terminal) references terminals(id_terminal),
    foreign key (auto_type) references groups(id),
    foreign key (geozone) references geo(id),
    foreign key (location) references location(id),
    foreign key (data_add) references data_ad(id)
    ) comment = 'Список техники'; -- у данной таблицы в теории должен быть внешний ключ на табоцы групп, гео и тд
    

drop table if exists groups; 
create table if not exists groups(
	id serial primary key,
	type_auto varchar(30) unicode comment 'Тип ТС',
    group_auto enum('AB', 'YM') comment 'Группа ТС'
) comment = 'Список групп';


drop table if exists geo;
create table if not exists geo(
	id serial primary key,
	geozone varchar(65)
) comment = 'Список геозон';


drop table if exists location;
create table if not exists location(
	id serial primary key,
	loc varchar(62)
) comment = 'Список участков';

drop table if exists data_ad;
create table if not exists data_ad(
	id serial primary key,
	new_data datetime default current_timestamp on update current_timestamp,
    new_data_server enum('YES', 'NO')
)comment = 'Актуальность данных';


SET FOREIGN_KEY_CHECKS=1;