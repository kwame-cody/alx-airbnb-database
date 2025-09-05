
-- 1. Initial Query: Retrieve all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status AS payment_status
FROM BOOKINGS b
JOIN USERS u ON b.user_id = u.user_id
JOIN PROPERTIES p ON b.property_id = p.property_id
LEFT JOIN PAYMENTS pay ON b.booking_id = pay.booking_id;

-- 2. Analyze Query Performance
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status AS payment_status
FROM BOOKINGS b
JOIN USERS u ON b.user_id = u.user_id
JOIN PROPERTIES p ON b.property_id = p.property_id
LEFT JOIN PAYMENTS pay ON b.booking_id = pay.booking_id;


-- 3. Refactored Query (with optimizations)
-- Add appropriate indexes before re-running
-- e.g., idx_bookings_user_id, idx_bookings_property_id, idx_payments_booking_id

CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON BOOKINGS(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON BOOKINGS(property_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON PAYMENTS(booking_id);

-- Optimized query: only fetch relevant columns instead of SELECT *
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.status,
    u.first_name,
    u.email,
    p.name AS property_name,
    pay.amount,
    pay.status AS payment_status
FROM BOOKINGS b
JOIN USERS u ON b.user_id = u.user_id
JOIN PROPERTIES p ON b.property_id = p.property_id
LEFT JOIN PAYMENTS pay ON b.booking_id = pay.booking_id;
