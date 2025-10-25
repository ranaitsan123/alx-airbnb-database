# Airbnb Database Schema – Task 2

## 🎯 Objective
Define the database schema for the Airbnb project, ensuring proper constraints, keys, and indexing for performance.

---

## 🧩 Tables Overview

### 1. **User**
Stores user data including guests, hosts, and admins.
- **Primary Key:** `user_id`
- **Unique:** `email`
- **Constraints:** `role` must be one of ('guest', 'host', 'admin').

### 2. **Property**
Represents Airbnb listings created by hosts.
- **Primary Key:** `property_id`
- **Foreign Key:** `host_id` → `User(user_id)`
- **Notes:** Each property belongs to one host.

### 3. **Booking**
Represents reservations made by users for properties.
- **Primary Key:** `booking_id`
- **Foreign Keys:**  
  - `property_id` → `Property(property_id)`  
  - `user_id` → `User(user_id)`
- **Constraint:** `status` must be ('pending', 'confirmed', 'canceled').

### 4. **Payment**
Handles payments for bookings.
- **Primary Key:** `payment_id`
- **Foreign Key:** `booking_id` → `Booking(booking_id)`
- **Constraint:** `payment_method` must be ('credit_card', 'paypal', 'stripe').

### 5. **Review**
Stores feedback from users about properties.
- **Primary Key:** `review_id`
- **Foreign Keys:**  
  - `property_id` → `Property(property_id)`  
  - `user_id` → `User(user_id)`
- **Constraint:** `rating` between 1–5.

### 6. **Message**
Handles communication between users.
- **Primary Key:** `message_id`
- **Foreign Keys:**  
  - `sender_id` → `User(user_id)`  
  - `recipient_id` → `User(user_id)`

---

## ⚙️ Relationships Summary

| Parent Table | Child Table | Relationship | Description |
|---------------|--------------|---------------|--------------|
| User | Property | 1-to-Many | A host can have multiple properties |
| User | Booking | 1-to-Many | A user can make multiple bookings |
| Property | Booking | 1-to-Many | A property can have multiple bookings |
| Booking | Payment | 1-to-1 | Each booking has one payment |
| Property | Review | 1-to-Many | A property can have multiple reviews |
| User | Message | 1-to-Many (sender) | A user can send multiple messages |

---

## 🧱 Indexing

- **Users:** Index on `email` for quick lookups.
- **Property:** Index on `host_id` for host-based searches.
- **Booking:** Index on `property_id`, `user_id` for joins.
- **Review:** Index on `property_id`, `user_id` for analytics.
- **Message:** Index on `sender_id`, `recipient_id` for inbox queries.

---

## ✅ Conclusion

The Airbnb database schema is fully normalized (up to 3NF) with enforced referential integrity, constraints for data validation, and indexes for optimized performance.
