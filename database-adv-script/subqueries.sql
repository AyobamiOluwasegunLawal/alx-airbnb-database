SELECT *
FROM Property AS p
WHERE (
	SELECT AVG(r.rating)
	FROM Review AS r
	WHERE r.property_id = p.property_id
) > 4


SELECT u.first_name, u.lASt_name, u.email
FROM Users AS u
WHERE (
	SELECT COUNT(*)
	FROM Booking AS b
	WHERE b.user_id = u.user_id
) > 1
