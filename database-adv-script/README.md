
# SQL Join Queries – Booking Database

This document contains example SQL queries that demonstrate different types of **JOIN operations** using a sample database schema for a booking platform.

## Database Schema Overview

The main tables used in these queries are:

* **USER** → stores user information (guests, hosts, admins).
* **PROPERTIES** → stores properties listed by hosts.
* **BOOKING** → stores booking information for properties.
* **REVIEW** → stores reviews that users leave for properties.

---

## Queries

### 1. INNER JOIN – Retrieve all bookings and the respective users who made them

```sql
SELECT booking_id, property_id, start_date, end_date, first_name, last_name, email
FROM BOOKING
INNER JOIN USER ON BOOKING.user_id = USER.user_id;
```

* Returns only the bookings that are linked to a user.
* Shows both booking details and the user who made the booking.

---

### 2. LEFT JOIN – Retrieve all properties and their reviews (including properties without reviews)

```sql
SELECT property_id, host_id, name, review_id, rating
FROM PROPERTIES
LEFT JOIN REVIEW ON PROPERTIES.property_id = REVIEW.property_id;
```

* Returns every property.
* If a property has no reviews, its review columns will show as `NULL`.

---

### 3. FULL OUTER JOIN – Retrieve all users and all bookings

```sql
SELECT first_name, last_name, email, booking_id, start_date, end_date
FROM USER
FULL OUTER JOIN BOOKING ON USER.user_id = BOOKING.user_id;
```

* Returns all users (even those who never booked).
* Returns all bookings (even those not linked to a user).
* ⚠️ Note: Some databases (like MySQL) don’t support `FULL OUTER JOIN` directly. A workaround is required using `UNION`.

---

## Notes

* Prefixing column names with their table is recommended when tables share similar column names.
* These queries are meant for **learning JOIN concepts** and can be expanded (e.g., adding filters with `WHERE`, grouping with `GROUP BY`, etc.).


