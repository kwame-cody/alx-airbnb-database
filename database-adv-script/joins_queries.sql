-- Inner Join
SELECT u.user_id, u.first_name,b.book_id
FROM USERS u
INNER JOIN BOOKINGS b ON (b.user_id = u.user_id)


-- Left queries
SELECT p.property_id,p.name,p.location, r.rating, r.comment
FROM PROPERTIES p
LEFT JOIN REVIEWS r ON (r.property_id = p.property_id)


-- Full Outer Join
SELECT u.user_id, u.email, u.first_name, b.property_id, b.start_date, b.end_date
FROM USERS u
FULL OUTER JOIN BOOKINGS b ON (b.user_id = u.user_id)