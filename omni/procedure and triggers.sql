delimiter //

drop trigger if exists create_up//
create trigger create_up after insert on maz800
for each row
begin
	if data_ad.id != 382 then
    insert into data_ad values ('382', now(), null);
    else 
    update data_ad set new_data=now() where id=382;
    end if;
end//

insert into maz800 (`volt`)values ('27')//


drop trigger if exists create_up2// -- рабочий триггер
create trigger create_up2 after insert on maz800
for each row
begin
    update data_ad set new_data=now() where id=382;
end//


drop trigger if exists create_up// -- рабочий тиггер
create trigger create_up after insert on maz800
for each row
begin
    insert into data_ad values ('382', now(), null);
end//


delimiter ;

insert into maz800 (`volt`)values ('27');

