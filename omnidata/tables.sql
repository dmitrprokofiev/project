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

drop table if exists terminals;
create table if not exists terminals(
	id bigint unsigned not null,
	id_terminal tinyint(12) not null comment 'ID терминала',
	terminal varchar(40) not null comment 'Тип терминала',
    factory_number tinyint(18) unique not null comment 'Заводской номер',
    phone_number tinyint(30) unique not null comment 'Телефон',
    comments varchar(255) comment 'Примечания',
    primary key(id_terminal),
    unique index terminal(id_terminal),
    foreign key (id) references accounts(id)
)comment = 'Список терминалов';

drop table if exists auto;
create table if not exists auto(
	id bigint unsigned not null,
	id_terminal tinyint(12) not null comment 'ID терминала',
    auto_name varchar(40) unique not null comment 'Название ТС',
    auto_number tinyint(30) not null comment 'Гаражный номер',
    brand varchar(30) comment 'Марка',
    model varchar(30) comment 'Модель',
    auto_type varchar(20) comment 'Тип',
    created_at datetime default now(),
    comments varchar(255) comment 'Примечания',
    unique index terminal(id_terminal),
    index(auto_number),
    index(auto_name),
    primary key(id_terminal),
    foreign key (id_terminal) references terminals(id_terminal),
    foreign key (id) references accounts(id)
    ) comment = 'Список техники';
    

drop table if exists groups;
create table if not exists groups(
	id_terminal tinyint(12) not null comment 'ID терминала',
	type_auto varchar(30) unicode comment 'Тип ТС',
    group_auto enum('AB', 'YM') comment 'Группа ТС',
    foreign key (id_terminal) references auto(id_terminal),
    foreign key (id_terminal) references geo(id_terminal),
    foreign key (id_terminal) references location(id_terminal),
    foreign key (id_terminal) references data_ad(id_terminal)
) comment = 'Список групп';


drop table if exists geo;
create table if not exists geo(
	id_terminal tinyint(12) not null comment 'ID терминала',
	geozone varchar(65),
	foreign key (id_terminal) references auto(id_terminal),
    foreign key (id_terminal) references groups(id_terminal),
    foreign key (id_terminal) references location(id_terminal),
    foreign key (id_terminal) references data_ad(id_terminal)
) comment = 'Список геозон';


drop table if exists location;
create table if not exists location(
	id_terminal tinyint(12) not null comment 'ID терминала',
	loc varchar(62),
	foreign key (id_terminal) references auto(id_terminal),
    foreign key (id_terminal) references groups(id_terminal),
    foreign key (id_terminal) references geo(id_terminal),
    foreign key (id_terminal) references data_ad(id_terminal)
) comment = 'Список участков';

drop table if exists data_ad;
create table if not exists data_ad(
	id_terminal tinyint(12) not null comment 'ID терминала',
	new_data datetime default current_timestamp on update current_timestamp,
    new_data_server enum('YES', 'NO'),
    foreign key (id_terminal) references auto(id_terminal),
    foreign key (id_terminal) references groups(id_terminal),
    foreign key (id_terminal) references geo(id_terminal),
    foreign key (id_terminal) references location(id_terminal)
)comment = 'Актуальность данных';


SET FOREIGN_KEY_CHECKS=1;