use snet0611;

-- ����� ����� ��������� ������������. �� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� �������������.

select 
to_user_id,
from_user_id,
count(*) as summ
from message 
where to_user_id = 23
group by from_user_id
order by summ desc limit 1;



-- ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.

select id, firstname, lastname, birthday from users order by birthday limit 10;

select from_like_user_id, to_like_user_id from users_likes;

select from_like_user_id, to_like_user_id from users_likes where to_like_user_id in (select id, firstname, lastname from users order by birthday limit 10);

select from_like_user_id, to_like_user_id from users_likes where to_like_user_id in (select * from (select id from users order by birthday limit 10) as v);

select 
	from_like_user_id, 
	to_like_user_id,
	count(*) as sum_likes
from users_likes 
where to_like_user_id in (select * from (select id from users order by birthday limit 10) as v);




-- ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?

select * from photo_likes;
select * from posts_likes;
select * from users_likes;
select * from users;

select 
	id,
	gender,
	(select count(*) from photo_likes where user_id = u.id) as 'photolikes',
	(select count(*) from posts_likes where user_id = u.id) as 'postlikes',
	(select count(*) from users_likes where to_like_user_id = u.id) as 'user_like'
from users as u
where gender = 'm' or gender = 'f' group by gender;	

