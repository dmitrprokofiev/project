use snet0611;

-- Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

select 
to_user_id,
from_user_id,
count(*) as summ
from message 
where to_user_id = 23
group by from_user_id
order by summ desc limit 1;



-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

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




-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

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

