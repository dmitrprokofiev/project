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
    comments varchar(255) comment 'Примечания',
    primary key(id_terminal),
    unique index terminal(id_terminal),
    foreign key (account_id) references accounts(id)
) comment = 'Список терминалов';


drop table if exists auto;
create table if not exists auto(
	id bigint unsigned not null,
    id_terminal bigint unsigned not null COLLATE 'utf8_unicode_ci' comment 'ID терминала',
    auto_name varchar(255) unique not null comment 'Название ТС',
    auto_number varchar(40) comment 'Гаражный номер',
    comments varchar(255) comment 'Примечания',
    index(auto_number),
    index(auto_name),
    primary key (id),
    foreign key (id_terminal) references terminals(id_terminal)
    )comment = 'Список техники'; 
    
  
    

drop table if exists geo;
create table if not exists geo(
	id serial primary key,
	geozone varchar(65)
) comment = 'Список геозон';


drop table if exists location;
create table if not exists location(
	id serial primary key,
	uchastok varchar(10)
) comment = 'Список участков';

drop table if exists data_ad;
create table if not exists data_ad(
	id serial primary key,
	new_data datetime,
    new_data_server enum('YES', 'NO'),
    foreign key (id) references auto(id)
)comment = 'Актуальность данных';

drop table if exists groups;
create table if not exists groups(
	id serial primary key,
    auto_type varchar(65)
) comment = 'Список типов ТС';

drop table if exists ab_um;
create table if not exists ab_um(
	id serial primary key,
    type_auto enum('MM', 'AB')
)comment = 'Управление механизацией или автобаза';

drop table if exists group_ab_um;
create table if not exists group_ab_um(
	id serial primary key,
    to_groups bigint unsigned not null,
    to_ab_um bigint unsigned not null,
    foreign key (to_groups) references groups(id),
    foreign key (to_ab_um) references ab_um(id),
    foreign key (id) references auto(id)
)comment = 'Промежуточная таблица АБ и УМ';

drop table if exists brand;
create table if not exists brand(
	id serial primary key,
    brands varchar(30)
)charset=utf8mb4;


drop table if exists us_auto;
create table if not exists us_auto(
	id serial primary key,
    location_id bigint unsigned not null,
    brand_id bigint unsigned not null,
    geo_id bigint unsigned not null,
    foreign key (id) references auto(id),
    foreign key (brand_id) references brand(id),
    foreign key (location_id) references location(id),
    foreign key (geo_id) references geo(id)
)comment = 'Промежуточная таблица всех характеристик ТС';

drop table if exists sim;
create table if not exists sim(
	id serial primary key,
    phone_number varchar(20),
    id_terminal bigint unsigned not null,
    foreign key (id_terminal) references terminals(id_terminal)
)comment = 'Номера симк-карт';


drop table if exists maz800;
create table if not exists maz800(
	datetimes varchar(32),
    z_key varchar(12),
    GPRS varchar(24),
    GPS varchar(24),
    volt decimal(3, 1) unsigned,
    sputnik tinyint(4),
    latitude float(10, 8) unsigned,
    longitud float(10, 8) unsigned,
    direction varchar(2),
    height float(8, 1) unsigned,
    probeg float(8, 1) unsigned,
    speed float(8, 1) unsigned,
    revs int(5) unsigned,
    LLS1 bigint(10) unsigned
)engine=archive charset=utf8;



-- SHOW CREATE TABLE brand; -- узнать кодировку таблицы

-- insert into ural850 values ('вапв');





SET FOREIGN_KEY_CHECKS=1;