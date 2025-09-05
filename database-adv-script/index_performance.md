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
