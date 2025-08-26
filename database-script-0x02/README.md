# Sample Data Script - AirBnb Clone

This document provides a guide to the `seed.sql` file, which contains a series of SQL `INSERT` statements used to populate the database with sample data. This script is essential for setting up a development or testing environment with realistic, pre-populated data.

---

## Purpose

The primary goal of the `seed.sql` script is to create a functional dataset that mirrors real-world usage of the application. By executing this script, you can:

* **Quickly set up a development environment**: Get the database ready for testing new features without manually entering data.

* **Demonstrate relationships**: The data is carefully structured to show how different tables are linked via foreign keys (e.g., how a `BOOKING` connects to a `USER` and a `PROPERTIES` record).

* **Test queries and logic**: Use the provided data to run various SQL queries and test application logic.

---

## Data Structure

The script is organized to insert data into each table in the correct order to respect foreign key constraints. Data is inserted into the tables in the following sequence:

1. **USER**: Initial user accounts are created first, as they are referenced by other tables.

2. **PROPERTIES**: Property listings are added, linking them to a `host` from the `USER` table.

3. **BOOKING**: Bookings are created, referencing both a `user` and a `property`.

4. **PAYMENT**: A payment is linked to a specific `booking`.

5. **MESSAGE**: Sample messages are added, showing communication between two `user` accounts.

6. **REVIEW**: A review is added for a property, linked to a specific `user`.

---

## How to Use

To use this script, simply execute the `seed.sql` file in your database management tool. For most systems, this can be done via a command-line tool or a graphical interface.

**Example (using `psql` for PostgreSQL):**# Sample Data Script (`seed.sql`)

This document provides a guide to the `seed.sql` file, which contains a series of SQL `INSERT` statements used to populate the database with sample data. This script is essential for quickly setting up a development or testing environment.

