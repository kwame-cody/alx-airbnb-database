SELECT b.booking_id,b.property_id,b.start_date,b.end_date, u.first_name,u.last_name, u.email
FROM BOOKINGS b
INNER JOIN USER u ON b.user_id = u.user_id;


SELECT p.property_id, 
       p.property_name, 
       r.review_id, 
       r.rating, 
       r.comment
FROM PROPERTIES p
LEFT JOIN REVIEWS r 
  ON p.property_id = r.property_id;



SELECT first_name,last_name,email, booking_id,start_date, end_date
FROM USER
FULL OUTER JOIN BOOKING ON USER.user_id = BOOKING.user_id