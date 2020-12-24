-- создадим представление которе будет показывать название авто, его гос номер, терминал установленный в нем, сим-карту
-- для определенноо аккаунта
-- напимер для аккауна под номером 3

drop view if exists view_maz800;
create view view_maz800 as
select 
	auto_name,
    auto_number,
    terminal,
    terminals.id_terminal,
    phone
from accounts join terminals
on accounts.id=terminals.account_id
join auto on terminals.id_terminal=auto.id_terminal
join sim on terminals.id_terminal=sim.id_terminal
where accounts.id=3;


-- создадим представление где будут показаны координаты ТС в данный момент времени
drop view if exists GPS_maz800;
create view GPS_maz800 as
select datetimes, GPS, latitude, longitud
from maz800
where latitude > 0
order by id desc limit 1;

