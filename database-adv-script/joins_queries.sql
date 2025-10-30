SELECT * FROM Users AS u INNER JOIN Booking AS b ON u.user_id = b.user_id;
SELECT * FROM Property  AS p LEFT JOIN  Reviews AS r ON p.user_id = r.user_id;
SELECT * FROM Users AS u FULL OUTER JOIN Booking AS b ON u.user_id = b.user_id;
