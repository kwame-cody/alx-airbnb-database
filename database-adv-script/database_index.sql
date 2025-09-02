-- database_index.sql

-- Index to quickly find users by email 
CREATE INDEX idx_users_email ON Users(email);

-- Index to speed up joining Bookings with Users
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);

-- Index to speed up joining Bookings with Properties
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- Index to quickly filter bookings by date
CREATE INDEX idx_bookings_date ON Bookings(date);

-- Index to quickly search properties by location
CREATE INDEX idx_properties_location ON Properties(location);
