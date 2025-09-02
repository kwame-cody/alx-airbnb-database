SELECT u.user_id, u.name, COUNT(b.booking_id) AS total_bookings
FROM Users u
JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.name;


SELECT p.property_id,
       p.property_name,
       COUNT(b.booking_id) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Properties p
JOIN Bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name;
