SELECT property_id, name,location
FROM PROPERTIES
WHERE property_id IN(
    SELECT property_id
    FROM REVIEW
    GROUP BY property_id
    HAVING AVERAGE(rating) > 4
)


SELECT u.user_id, first_name, last_name
FROM USER u
WHERE (
    SELECT COUNT (*)
    FROM BOOKING b
    WHERE u.user_id = b.user_id
) > 3