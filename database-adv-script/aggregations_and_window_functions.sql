SELECT COUNT(*) AS bookings, user_id 
FROM Booking
	GROUP BY user_id;
