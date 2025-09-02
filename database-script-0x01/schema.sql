

CREATE TABLE USERS (
    user_id VARCHAR(36) PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL, 
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(50) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP NOT NULL
);


CREATE TABLE PROPERTIES (
    property_id VARCHAR(36) PRIMARY KEY, 
    host_id VARCHAR(36) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    FOREIGN KEY (host_id) REFERENCES USER(user_id)
);

CREATE TABLE BOOKINGS (
    booking_id VARCHAR(36) PRIMARY KEY, 
    property_id VARCHAR(36) NOT NULL,
    user_id VARCHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP NOT NULL,
    FOREIGN KEY (property_id) REFERENCES PROPERTIES(property_id),
    FOREIGN KEY (user_id) REFERENCES USER(user_id)
);


CREATE TABLE PAYMENTS (
    payment_id VARCHAR(36) PRIMARY KEY, 
    booking_id VARCHAR(36) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    payment_method VARCHAR(50) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),
    FOREIGN KEY (booking_id) REFERENCES BOOKING(booking_id)
);

CREATE TABLE MESSAGES(
    message_id VARCHAR(36) PRIMARY KEY,
    sender_id VARCHAR(36)  NOT NULL,
    recipient_id VARCHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP NOT NULL,
    FOREIGN KEY (sender_id) REFERENCES USER(user_id),
    FOREIGN KEY (recipient_id) REFERENCES USER(user_id)
)

CREATE TABLE REVIEWS(
    review_id VARCHAR(36) PRIMARY KEY,
    property_id VARCHAR(36) NOT NULL,
    user_id VARCHAR(36) NOT NULL,
    rating INTEGER CHECK (rating >=1 AND rating <=5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    FOREIGN KEY (property_id) REFERENCES PROPERTIES(property_id),
    FOREIGN KEY (user_id)  REFERENCES USER(user_id)
)

