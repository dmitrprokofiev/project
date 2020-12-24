insert into accounts values 
('1', 'nova', 'bkfg9593gnd', 'fdnjdge@mail.ru', '793553255'),
('2', 'novatek', 'bkfg95sg93gnd', 'ghdgh@mail.ru', '793543345'),
('3', 'genlion', '34bkfg9593gnd', 'ggggg@mail.ru', '79354322492'),
('4', 'velesStroy', 'gdbkfg9593gndgj78', 'xcvcbngj@mail.ru', '79354356382'),
('5', 'gidravlick', '23rbhkfg959367gndghte', 'qscvgyuk@mail.ru', '79356890');


-- вставим данные из csv-файла в таблицу terminals
load data infile 'c:/ProgramData/MySQL/MySQL Server 5.7/Uploads/terminals.csv'
into table terminals
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'; 


-- вставим данные из csv-файла в таблицу auto
load data infile 'c:/ProgramData/MySQL/MySQL Server 5.7/Uploads/autobase.csv'
into table auto
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'; 

-- загрузим номера сим карт
load data infile 'c:/ProgramData/MySQL/MySQL Server 5.7/Uploads/sim.csv'
into table sim
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'; 

-- зарузим группы техники
load data infile 'c:/ProgramData/MySQL/MySQL Server 5.7/Uploads/group.csv'
into table groups
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'; 

-- зарузим геозоны
load data infile 'c:/ProgramData/MySQL/MySQL Server 5.7/Uploads/geo.csv'
into table geo
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'; 

-- загрузим участки
load data infile 'c:/ProgramData/MySQL/MySQL Server 5.7/Uploads/location.csv'
into table location
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'; 

-- зарузим марки ТС
load data infile 'c:/ProgramData/MySQL/MySQL Server 5.7/Uploads/brand.csv'
into table brand
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'; 

-- доюавим данные в таблицу ab_um
insert into ab_um values 
('1', 'AB'),
('2', 'MM');

-- загрузим данные в таблицу group_ab_um
load data infile 'c:/ProgramData/MySQL/MySQL Server 5.7/Uploads/ab_um.csv'
into table group_ab_um
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'; 


-- зарузим даннеы в промежуточную таблицу us_auto
load data infile 'c:/ProgramData/MySQL/MySQL Server 5.7/Uploads/us_auto.csv'
into table us_auto
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'; 


-- зарузим данные бортовой системы мониторинга транспорта по одному из ТС
load data infile 'c:/ProgramData/MySQL/MySQL Server 5.7/Uploads/800.csv'
into table maz800
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'; 

