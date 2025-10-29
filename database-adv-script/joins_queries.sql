SELECT Users.first_name, Users.last_name, Booking.price, Booking.status
FROM Users INNER JOIN Booking
ON Users.user_id = Booking.user_id

SELECT *
FROM Property LEFT JOIN Review
ON Property.property_id = Review.property_id;

SELECT *
FROM Users FULL OUTER JOIN Booking
ON Users.user_id = Booking.user_id;

SELECT *
FROM Users LEFT JOIN Booking
ON Users.user_id = Booking.user_id
ORDER BY Users.first_name ASC, Booking.price DESC;

UNION
-- if you want duplicates use 'union all'

SELECT *
FROM Users RIGHT JOIN Booking
ON Users.user_id = booking.user_id;
