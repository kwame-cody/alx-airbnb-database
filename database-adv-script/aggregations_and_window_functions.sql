-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT 
    u.user_id,
    u.first_name,
    COUNT(b.booking_id) AS total_bookings,
FROM USERS u
LEFT JOIN BOOKINGS b ON (b.user_id = u.user_id)
GROUP BY u.user_id,u.first_name;


-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received

SELECT
    p.property_id,
    p.name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_num,
    RANK() OVER (ORDER BY total_bookings DESC)
FROM(
    SELECT
        p.property_id,
        p.name,
        COUNT(b.booking_id) AS total_bookings
    FROM PROPERTIES p
    LEFT JOIN BOOKINGS b ON (p.property_id = b.property_id)
    GROUP BY p.name,p.property_id
);
