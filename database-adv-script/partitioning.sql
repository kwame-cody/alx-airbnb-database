-- Drop old table if necessary
DROP TABLE IF EXISTS BOOKINGS CASCADE;

-- Create partitioned parent table
CREATE TABLE BOOKINGS (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20),
    amount NUMERIC(10,2)
) PARTITION BY RANGE (start_date);

-- Partition for 2023
CREATE TABLE BOOKINGS_2023 PARTITION OF BOOKINGS
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

-- Partition for 2024
CREATE TABLE BOOKINGS_2024 PARTITION OF BOOKINGS
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Default partition for future years
CREATE TABLE BOOKINGS_future PARTITION OF BOOKINGS
FOR VALUES FROM ('2025-01-01') TO (MAXVALUE);

