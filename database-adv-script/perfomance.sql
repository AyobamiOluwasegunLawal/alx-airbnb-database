EXPLAIN ANALYZE
SELECT * FROM Booking AS b
JOIN Users AS u
ON u.user_id = b.user_id
JOIN Property AS p
ON b.property_id = p.property_id
WHERE p.location = 'New York' AND b.start_date >= '2023-01-01';
