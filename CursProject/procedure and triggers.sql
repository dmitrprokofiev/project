-- Тригер 1. тригер которая при добавлении новых данных в таблицу maz800 будет показывать время и дату самых свежих записей поступивших  с ТС

delimiter //

drop trigger if exists create_up//
create trigger create_up after insert on maz800
for each row
begin
  if !exists(select 1 from data_ad where id = 382) then
      insert into data_ad values ('382', now(), null);
  else 
      update data_ad set new_data=now() where id=382;
  end if;
end//

delimiter ;

-- проверим триггер. добавляем новые записи в таблицу maz800
insert into maz800 (`volt`)values ('27');

-- Процедура 1
-- создадим процедуру которая будет показывать превышение скорости у ТС и координаты нарушения

delimiter //
drop procedure if exists speed//
create procedure speed(in speedometer bigint)
begin
	select datetimes, GPS, latitude, longitud, speed
	from maz800
	where speed > speedometer;	
end//

-- зададим превышение скорости в 95 км/час
call speed(95)//

delimiter ;
-- Процедура 2
-- Одно из предприятий планирует обновить терминалы и нужно знать какие виды терминалов установлены на ТС и по сколько штук.

delimiter //

drop procedure if exists terminal_sklad//
create procedure terminal_sklad(in company bigint)
begin
	select 
	terminal, 
    count(terminal) as sum 
from terminals 
where account_id=company
group by terminal;
end//

-- добавим id предприятия
call terminal_sklad(4)//

-- Процедура 3
-- создадим процедуру которая позволит увидеть количество техники определенного бренда для отдельного аккаунта

delimiter //
drop procedure if exists brand//
create procedure brand(in admin bigint, brand_id bigint)
begin
	select 
	us_auto.brand_id as `Марка ТС`,
    count(us_auto.brand_id) as `Количество техники`
from accounts join terminals
on accounts.id=terminals.account_id
join auto on terminals.id_terminal=auto.id_terminal
left join us_auto on auto.id=us_auto.id
where accounts.id=admin and us_auto.brand_id=brand_id;
end//

call brand(5, 5)//

delimiter ;
