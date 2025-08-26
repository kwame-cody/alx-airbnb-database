# Database Normalization Analysis- AirBnb Project

---

## Objective

The goal of this document is to review the database schema and apply normalization principles to ensure it is in the Third Normal Form (3NF). Normalization is a process used to organize a database into tables and columns to reduce data redundancy and improve data integrity.


---

## Understanding Normalization

Normalization is the process of structuring a relational database to reduce data redundancy and improve data integrity. It involves a series of forms, with 3NF being a common and practical goal that strikes a good balance between data integrity and performance.

* **First Normal Form (1NF)**: A table is in 1NF if each column contains a single, atomic value, and there are no repeating groups of columns.
* **Second Normal Form (2NF)**: A table is in 2NF if it's in 1NF and all non-key attributes are fully dependent on the primary key. This is most relevant for tables with composite primary keys.
* **Third Normal Form (3NF)**: A table is in 3NF if it's in 2NF and there are no transitive dependencies. This means no non-key attribute is dependent on another non-key attribute.

---

## Schema Analysis and 3NF Assessment

I have reviewed each table in the schema to assess its normalization status.

### USER Table
- **Attributes**: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`.
- **Primary Key**: `user_id`.
- **Analysis**: All attributes are directly dependent on the `user_id`. There are no transitive dependencies.
- **Conclusion**: This table is already in **3NF**. No adjustments needed.

### PROPERTIES Table
- **Attributes**: `property_id`, `host_id`, `name`, `description`, `location`, `price_per_night`, `created_at`, `updated_at`.
- **Primary Key**: `property_id`.
- **Analysis**: All attributes are directly dependent on the `property_id`. The `host_id` is a foreign key, and its presence does not violate 3NF.
- **Conclusion**: This table is in **3NF**. No adjustments needed.

### BOOKING Table
- **Attributes**: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`.
- **Primary Key**: `booking_id`.
- **Analysis**: All attributes are directly tied to the `booking_id`. `property_id` and `user_id` are foreign keys, which is correct database design.
- **Conclusion**: This table is in **3NF**. No adjustments needed.

### PAYMENT Table
- **Attributes**: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`.
- **Primary Key**: `payment_id`.
- **Analysis**: All attributes are dependent on the `payment_id`. The `booking_id` is a foreign key that correctly links to the `BOOKING` table.
- **Conclusion**: This table is in **3NF`. No adjustments needed.

### MESSAGE Table
- **Attributes**: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`.
- **Primary Key**: `message_id`.
- **Analysis**: The `sender_id` and `recipient_id` are foreign keys that reference the `USER` table. All other attributes are directly dependent on the `message_id`.
- **Conclusion**: This table is in **3NF**. No adjustments needed.

### REVIEW Table
- **Attributes**: `review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`.
- **Primary Key**: `review_id`.
- **Analysis**: The `property_id` and `user_id` are foreign keys. The remaining attributes are fully dependent on the `review_id`.
- **Conclusion**: This table is in **3NF**. No adjustments needed.


**No changes are necessary to achieve 3NF.** The schema is robust and ready for implementation.