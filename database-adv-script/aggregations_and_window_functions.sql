SELECT COUNT(*) AS bookings, user_id 
FROM Booking
	GROUP BY user_id;

	SELECT p.property_id,
COUNT(b.booking_id) AS total_bookings,
RANK() OVER(ORDER BY COUNT(b.booking_id) DESC) AS booking_rank,
DENSE_RANK() OVER(ORDER BY COUNT(b.booking_id) DESC) AS dense_booking_rank,
ROW_NUMBER() OVER(ORDER BY COUNT(b.booking_id) DESC) AS row_number_rank
FROM Booking AS b JOIN Property AS p
ON b.property_id = p.property_id
GROUP BY p.property_id
