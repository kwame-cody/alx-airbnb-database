-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT 
     p.name,
     p.property_id,
     AVG(r.rating) AS avg_rating,
FROM PROPERTIES p
LEFT JOIN REVIEWS r ON (r.property_id = p.property_id)
GROUP BY p.property_id, p.name
WHERE r.rating > 4.1


-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT user_id, first_name
FROM USERS u
WHERE (
    SELECT COUNT(b.booking_id)
    FROM BOOKINGS b
    WHERE b.user_id = u.user_id
) > 3
