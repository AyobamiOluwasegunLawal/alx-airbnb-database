select Users.first_name, Users.last_name, Booking.price, Booking.status
from Users inner join Booking
on Users.user_id = Booking.user_id

select *
from Property left join Review
on Property.property_id = Review.property_id

select *
from Users left join Booking
on Users.user_id = Booking.user_id

union
-- if you want duplicates use 'union all'

select *
from Users right join Booking
on Users.user_id = booking.user_id
