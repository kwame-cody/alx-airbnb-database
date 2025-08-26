# Database Schema

This document outlines the database schema, including the design and structure of all tables. The schema is designed with an emphasis on data integrity and reduced redundancy, adhering to the principles of database normalization, specifically the Third Normal Form (3NF).

***

## Normalization and Design Principles

The schema is built on the following core principles to ensure a robust and maintainable database:

* **Third Normal Form (3NF)**: All tables are structured to be in 3NF. This means that each table has a single primary key, and all other attributes are directly dependent on that key. This design eliminates transitive dependencies, reducing data redundancy and preventing update anomalies.
* **Primary Keys**: Each table has a unique primary key to ensure every row can be uniquely identified. In this schema, `UUID` (`VARCHAR(36)`) is used for primary keys to provide a universally unique identifier across all records.
* **Foreign Keys**: Relationships between tables are established using foreign keys. This maintains referential integrity, ensuring that data links between tables are valid. For example, the `host_id` in the `PROPERTIES` table is a foreign key that references the `user_id` in the `USER` table.
* **Data Types**: Appropriate data types are used for each attribute to ensure data is stored efficiently and correctly. Examples include `VARCHAR` for strings, `TEXT` for longer descriptions, `DECIMAL` for currency, and `TIMESTAMP` for date and time values.
* **Constraints**: Constraints like `UNIQUE` (for the `email` field) and `NOT NULL` are applied to enforce data integrity rules. `CHECK` constraints are used to ensure `ENUM`-like behavior for fields like `role` and `status`, which improves data consistency.

***

## Table Structure

Below is a detailed breakdown of each table, including its attributes and relationships.

### USER

* **Description**: Stores user account information.
* **Primary Key**: `user_id`
* **Attributes**: `user_id`, `first_name`, `last_name`, `email` (unique), `password_hash`, `phone_number`, `role` (guest, host, admin), `created_at`.

### PROPERTIES

* **Description**: Stores details about a property listing.
* **Primary Key**: `property_id`
* **Foreign Key**: `host_id` (references `USER.user_id`)
* **Attributes**: `property_id`, `host_id`, `name`, `description`, `location`, `price_per_night`, `created_at`, `updated_at`.

### BOOKING

* **Description**: Records a booking for a specific property by a user.
* **Primary Key**: `booking_id`
* **Foreign Keys**: `property_id` (references `PROPERTIES.property_id`), `user_id` (references `USER.user_id`)
* **Attributes**: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status` (pending, confirmed, canceled), `created_at`.

### PAYMENT

* **Description**: Records payment information for a booking.
* **Primary Key**: `payment_id`
* **Foreign Key**: `booking_id` (references `BOOKING.booking_id`)
* **Attributes**: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method` (credit_card, paypal, stripe).

### MESSAGE

* **Description**: Stores messages between users.
* **Primary Key**: `message_id`
* **Foreign Keys**: `sender_id` (references `USER.user_id`), `recipient_id` (references `USER.user_id`)
* **Attributes**: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`.

### REVIEW

* **Description**: Records reviews and ratings for properties.
* **Primary Key**: `review_id`
* **Foreign Keys**: `property_id` (references `PROPERTIES.property_id`), `user_id` (references `USER.user_id`)
* **Attributes**: `review_id`, `property_id`, `user_id`, `rating` (1-5), `comment`, `created_at`.