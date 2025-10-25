# 🏡 AirBnB Database Specification


## 📖 Overview

This project defines the **database schema** for an AirBnB-style platform that connects **guests**, **hosts**, and **administrators**. It covers user management, property listings, bookings, payments, reviews, and messaging between users.

The database is designed for scalability, referential integrity, and clear separation of responsibilities across entities.

---

## 🗄️ Entities and Attributes

### **User**

| Field           | Type                      | Constraints               | Description                     |
| --------------- | ------------------------- | ------------------------- | ------------------------------- |
| `user_id`       | UUID                      | Primary Key, Indexed      | Unique identifier for each user |
| `first_name`    | VARCHAR                   | NOT NULL                  | User’s first name               |
| `last_name`     | VARCHAR                   | NOT NULL                  | User’s last name                |
| `email`         | VARCHAR                   | UNIQUE, NOT NULL          | User’s email address            |
| `password_hash` | VARCHAR                   | NOT NULL                  | Hashed user password            |
| `phone_number`  | VARCHAR                   | NULL                      | Optional phone number           |
| `role`          | ENUM (guest, host, admin) | NOT NULL                  | Defines user type               |
| `created_at`    | TIMESTAMP                 | DEFAULT CURRENT_TIMESTAMP | Account creation timestamp      |

---

### **Property**

| Field           | Type      | Constraints                 | Description                         |
| --------------- | --------- | --------------------------- | ----------------------------------- |
| `property_id`   | UUID      | Primary Key, Indexed        | Unique identifier for each property |
| `host_id`       | UUID      | FK → User(user_id)          | Property owner                      |
| `name`          | VARCHAR   | NOT NULL                    | Property name                       |
| `description`   | TEXT      | NOT NULL                    | Description of the property         |
| `location`      | VARCHAR   | NOT NULL                    | Property address or area            |
| `pricepernight` | DECIMAL   | NOT NULL                    | Cost per night                      |
| `created_at`    | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP   | Record creation time                |
| `updated_at`    | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP | Record modification time            |

---

### **Booking**

| Field         | Type                                | Constraints                | Description                |
| ------------- | ----------------------------------- | -------------------------- | -------------------------- |
| `booking_id`  | UUID                                | Primary Key, Indexed       | Unique booking ID          |
| `property_id` | UUID                                | FK → Property(property_id) | Booked property            |
| `user_id`     | UUID                                | FK → User(user_id)         | Guest making the booking   |
| `start_date`  | DATE                                | NOT NULL                   | Booking start date         |
| `end_date`    | DATE                                | NOT NULL                   | Booking end date           |
| `total_price` | DECIMAL                             | NOT NULL                   | Calculated total cost      |
| `status`      | ENUM (pending, confirmed, canceled) | NOT NULL                   | Booking status             |
| `created_at`  | TIMESTAMP                           | DEFAULT CURRENT_TIMESTAMP  | Booking creation timestamp |

---

### **Payment**

| Field            | Type                               | Constraints               | Description         |
| ---------------- | ---------------------------------- | ------------------------- | ------------------- |
| `payment_id`     | UUID                               | Primary Key, Indexed      | Unique payment ID   |
| `booking_id`     | UUID                               | FK → Booking(booking_id)  | Associated booking  |
| `amount`         | DECIMAL                            | NOT NULL                  | Amount paid         |
| `payment_date`   | TIMESTAMP                          | DEFAULT CURRENT_TIMESTAMP | Payment timestamp   |
| `payment_method` | ENUM (credit_card, paypal, stripe) | NOT NULL                  | Payment method used |

---

### **Review**

| Field         | Type      | Constraints                      | Description          |
| ------------- | --------- | -------------------------------- | -------------------- |
| `review_id`   | UUID      | Primary Key, Indexed             | Unique review ID     |
| `property_id` | UUID      | FK → Property(property_id)       | Reviewed property    |
| `user_id`     | UUID      | FK → User(user_id)               | Reviewer             |
| `rating`      | INTEGER   | CHECK (1 ≤ rating ≤ 5), NOT NULL | Rating score         |
| `comment`     | TEXT      | NOT NULL                         | Review comment       |
| `created_at`  | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP        | Review creation time |

---

### **Message**

| Field          | Type      | Constraints               | Description           |
| -------------- | --------- | ------------------------- | --------------------- |
| `message_id`   | UUID      | Primary Key, Indexed      | Unique message ID     |
| `sender_id`    | UUID      | FK → User(user_id)        | Sender                |
| `recipient_id` | UUID      | FK → User(user_id)        | Receiver              |
| `message_body` | TEXT      | NOT NULL                  | Message content       |
| `sent_at`      | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Time message was sent |

---

## 🔒 Constraints

### **User Table**

* Unique constraint on `email`
* Non-null constraints on all required fields

### **Property Table**

* Foreign key constraint on `host_id`
* Non-null constraints on `name`, `description`, `location`, `pricepernight`

### **Booking Table**

* Foreign key constraints on `property_id` and `user_id`
* `status` must be one of `pending`, `confirmed`, `canceled`

### **Payment Table**

* Foreign key constraint on `booking_id`
* Ensures payment is linked to a valid booking

### **Review Table**

* Rating must be between 1 and 5
* Foreign key constraints on `property_id` and `user_id`

### **Message Table**

* Foreign key constraints on `sender_id` and `recipient_id`

---

## ⚡ Indexing

| Table        | Indexed Columns                           |
| ------------ | ----------------------------------------- |
| **User**     | `user_id`, `email`                        |
| **Property** | `property_id`, `host_id`                  |
| **Booking**  | `booking_id`, `property_id`, `user_id`    |
| **Payment**  | `payment_id`, `booking_id`                |
| **Review**   | `review_id`, `property_id`                |
| **Message**  | `message_id`, `sender_id`, `recipient_id` |

---

## 🧱 Design Principles

* **Normalization:** Reduces redundancy and maintains data integrity.
* **Referential Integrity:** Enforced via foreign keys.
* **Scalability:** UUIDs allow distributed system compatibility.
* **Auditability:** Timestamps track all record changes.

---

## 📜 Copyright

© 2025 **ALX**, All rights reserved.

