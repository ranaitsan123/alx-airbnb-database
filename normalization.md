# Database Normalization – Airbnb Database Design

## 🧠 Overview

Database normalization is the process of organizing data to reduce redundancy and improve data integrity.  
For the Airbnb database, we applied normalization up to **Third Normal Form (3NF)** to ensure an efficient, consistent schema.

---

## **1️⃣ First Normal Form (1NF)**

### **Definition**
A table is in 1NF when:
- Each cell contains atomic (indivisible) values.
- Each record is unique (has a primary key).
- There are no repeating groups or arrays.

### **Application**
All tables (`User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`) have:
- A **unique primary key** (UUID).
- **Atomic columns** (e.g., no list of phone numbers or multiple emails in one field).
- No repeating groups.

✅ **Example:**
In the `User` table, instead of storing multiple roles or phone numbers in a single field, each user has a single `role` and one `phone_number`.

Therefore, all tables satisfy **1NF**.

---

## **2️⃣ Second Normal Form (2NF)**

### **Definition**
A table is in 2NF when:
- It is already in 1NF.
- All non-key attributes depend on the **whole primary key**, not just part of it.

### **Application**
- All tables have **single-column primary keys (UUIDs)**, so **no partial dependencies** exist.
- Every non-key attribute (like `email`, `pricepernight`, `rating`) depends entirely on its table’s primary key.

✅ **Example:**
In the `Booking` table:
- The primary key is `booking_id`.
- Attributes like `start_date`, `end_date`, and `status` depend only on `booking_id`.

Hence, the Airbnb schema satisfies **2NF**.

---

## **3️⃣ Third Normal Form (3NF)**

### **Definition**
A table is in 3NF when:
- It is in 2NF.
- There are no **transitive dependencies** (non-key columns depending on other non-key columns).

### **Application**
We checked all tables for transitive dependencies:
- In the `Property` table, `pricepernight`, `location`, and `name` depend only on `property_id`.
- In the `Booking` table, `total_price` depends on the booking itself, not indirectly through another column.
- In the `Payment` table, attributes like `amount` and `payment_method` depend only on `payment_id`.

No attributes depend on non-key attributes.

✅ **Example Fix:**
Originally, `User` role-related permissions could have been mixed into the same table, but we kept only the `role` (ENUM) in `User` and avoided storing permissions directly to maintain 3NF.

Therefore, all tables are in **Third Normal Form (3NF)**.

---

## **💡 Summary**

| Normal Form | Condition | Status | Notes |
|--------------|------------|---------|--------|
| **1NF** | Atomic values, unique rows | ✅ Passed | All attributes are atomic |
| **2NF** | No partial dependency | ✅ Passed | All tables have single-column PKs |
| **3NF** | No transitive dependency | ✅ Passed | No non-key → non-key dependencies |

---

## **🎯 Conclusion**

The Airbnb database design follows **Third Normal Form (3NF)**.  
This ensures:
- **Minimal redundancy**
- **Improved consistency**
- **Easier maintenance and scalability**

No further normalization is required for this system.
