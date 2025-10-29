select *
from Property as p
where (
	select avg(r.rating)
	from Review as r
	where r.property_id = p.property_id
) > 4


select u.first_name, u.last_name, u.email
from Users as u
where (
	select count(*)
	from Booking as b
	where b.user_id = u.user_id
) > 1
