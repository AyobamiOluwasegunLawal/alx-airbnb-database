SELECT * FROM Users AS u INNER JOIN Booking AS b ON u.user_id = b.user_id;
SELECT * FROM Property  AS p LEFT JOIN Review AS r ON p.property_id = r.property_id;
SELECT * FROM Users AS u FULL OUTER JOIN Booking AS b ON u.user_id = b.user_id;

SELECT * FROM Users AS u
LEFT JOIN Booking AS b ON u.user_id = b.user_id

UNION

SELECT * FROM Users AS u
RIGHT JOIN Booking AS b ON u.user_id = b.user_id;
