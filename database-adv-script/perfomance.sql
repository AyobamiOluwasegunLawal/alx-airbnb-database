SET STATISTICS IO ON;
SET STATISTICS TIME ON;
SELECT * FROM Booking AS b
JOIN Users AS u
ON u.user_id = b.user_id
JOIN Property AS p
ON b.property_id = p.property_id
