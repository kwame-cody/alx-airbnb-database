-- -----------------------------------------------------
-- Sample Data for USERS Table
-- -----------------------------------------------------
INSERT INTO USER (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('b1a0e8c0-1c9f-4d43-98f5-9b2f2d9e6f21', 'Alice', 'Smith', 'alice.s@example.com', 'hashed_password_1', '555-123-4567', 'guest', '2023-10-26 10:00:00'),
('e8b0a9c1-4a1d-4d64-9f2b-7c1f2d5e3a89', 'Bob', 'Johnson', 'bob.j@example.com', 'hashed_password_2', '555-987-6543', 'host', '2023-10-26 10:05:00'),
('f3d2c1b0-9a8b-4c7d-8e9f-1a2b3c4d5e6f', 'Charlie', 'Brown', 'charlie.b@example.com', 'hashed_password_3', NULL, 'guest', '2023-10-26 10:10:00'),
('a1b2c3d4-e5f6-7890-a1b2-c3d4e5f67890', 'Diana', 'Prince', 'diana.p@example.com', 'hashed_password_4', '555-111-2222', 'host', '2023-10-26 10:15:00');


-- -----------------------------------------------------
-- Sample Data for PROPERTIES Table
-- -----------------------------------------------------
INSERT INTO PROPERTIES (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
('d4e3f2g1-h2i3-j4k5-l6m7-n8o9p0q1r2s3', 'e8b0a9c1-4a1d-4d64-9f2b-7c1f2d5e3a89', 'Cozy Downtown Apartment', 'A charming one-bedroom apartment in the heart of the city.', 'New York, NY', 150.00, '2023-10-27 09:00:00', '2023-10-27 09:00:00'),
('f8e7d6c5-b4a3-9210-cba9-876543210fed', 'a1b2c3d4-e5f6-7890-a1b2-c3d4e5f67890', 'Secluded Mountain Cabin', 'A rustic cabin with breathtaking views and a fireplace.', 'Asheville, NC', 250.00, '2023-10-27 09:30:00', '2023-10-27 09:30:00'),
('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'e8b0a9c1-4a1d-4d64-9f2b-7c1f2d5e3a89', 'Beachfront Villa', 'Luxury villa with private access to the beach.', 'Malibu, CA', 800.00, '2023-10-27 10:00:00', '2023-10-27 10:00:00');


-- -----------------------------------------------------
-- Sample Data for BOOKING Table
-- -----------------------------------------------------
INSERT INTO BOOKING (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('b2c1d0e9-f8a7-6543-21b0-9876543210ab', 'd4e3f2g1-h2i3-j4k5-l6m7-n8o9p0q1r2s3', 'b1a0e8c0-1c9f-4d43-98f5-9b2f2d9e6f21', '2026-01-10', '2026-01-15', 750.00, 'confirmed', '2023-10-28 12:00:00'),
('b3d2c1a0-e9f8-7a65-4321-0b9a8c7d6e5f', 'f8e7d6c5-b4a3-9210-cba9-876543210fed', 'f3d2c1b0-9a8b-4c7d-8e9f-1a2b3c4d5e6f', '2026-02-20', '2026-02-25', 1250.00, 'pending', '2023-10-28 12:05:00'),
('c1a0b9c8-d7e6-f5a4-b3c2-d1e0f9a8b7c6', '1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'b1a0e8c0-1c9f-4d43-98f5-9b2f2d9e6f21', '2026-03-01', '2026-03-03', 1600.00, 'canceled', '2023-10-28 12:10:00');


-- -----------------------------------------------------
-- Sample Data for PAYMENT Table
-- -----------------------------------------------------
INSERT INTO PAYMENT (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('b8c7a6d5-e4f3-21c0-d9e8-f7a6b5c4d3e2', 'b2c1d0e9-f8a7-6543-21b0-9876543210ab', 750.00, '2023-10-28 12:15:00', 'credit_card');


-- -----------------------------------------------------
-- Sample Data for MESSAGE Table
-- -----------------------------------------------------
INSERT INTO MESSAGE (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('d1f2e3c4-b5a6-9876-5432-10a9b8c7d6e5', 'b1a0e8c0-1c9f-4d43-98f5-9b2f2d9e6f21', 'e8b0a9c1-4a1d-4d64-9f2b-7c1f2d5e3a89', 'Hi, is the apartment available for a longer stay?', '2023-10-29 09:00:00'),
('e3d2c1b0-a9f8-7d65-4b32-1c0a9b8c7d6e', 'e8b0a9c1-4a1d-4d64-9f2b-7c1f2d5e3a89', 'b1a0e8c0-1c9f-4d43-98f5-9b2f2d9e6f21', 'Yes, it is. Let me know the dates you are interested in.', '2023-10-29 09:05:00');


-- -----------------------------------------------------
-- Sample Data for REVIEW Table
-- -----------------------------------------------------
INSERT INTO REVIEW (review_id, property_id, user_id, rating, comment, created_at) VALUES
('f1e2d3c4-a5b6-78c9-0d1e-2f3a4b5c6d7e', 'd4e3f2g1-h2i3-j4k5-l6m7-n8o9p0q1r2s3', 'b1a0e8c0-1c9f-4d43-98f5-9b2f2d9e6f21', 5, 'Great location and very clean. The host was very responsive!', '2026-01-16 10:00:00');
