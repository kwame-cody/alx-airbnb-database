-- USERS indexes
CREATE INDEX idx_users_email ON USERS(email);
CREATE INDEX idx_users_role ON USERS(role);

-- BOOKINGS indexes
CREATE INDEX idx_bookings_user_id ON BOOKINGS(user_id);
CREATE INDEX idx_bookings_property_id ON BOOKINGS(property_id);
CREATE INDEX idx_bookings_status ON BOOKINGS(status);
CREATE INDEX idx_bookings_start_date ON BOOKINGS(start_date);

-- PROPERTIES indexes
CREATE INDEX idx_properties_host_id ON PROPERTIES(host_id);
CREATE INDEX idx_properties_location ON PROPERTIES(location);

-- ==================================
-- Performance Check
-- ==================================
EXPLAIN ANALYZE
SELECT u.first_name, p.name, b.start_date, b.status
FROM BOOKINGS b
JOIN USERS u ON b.user_id = u.user_id
JOIN PROPERTIES p ON b.property_id = p.property_id
WHERE b.status = 'confirmed'
ORDER BY b.start_date DESC;
