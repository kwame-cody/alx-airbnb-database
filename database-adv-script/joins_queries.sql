SELECT booking_id,property_id,start_date,end_date, first_name,last_name, email
FROM BOOKING
INNER JOIN USER ON BOOKING.user_id = USER.user_id;


SELECT property_id, host_id, name, review_id, rating
FROM PROPERTIES
LEFT JOIN REVIEW ON PROPERTIES.property_id = REVIEW.property_id
ORDER BY rating


SELECT first_name,last_name,email, booking_id,start_date, end_date
FROM USER
FULL OUTER JOIN BOOKING ON USER.user_id = BOOKING.user_id