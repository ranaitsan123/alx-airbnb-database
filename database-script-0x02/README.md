# Airbnb Database Seeding – Task 3

## 🎯 Objective
Populate the Airbnb database with realistic sample data representing users, properties, bookings, payments, reviews, and messages.

---

## 🧩 Tables Populated

| Table | Description | Sample Count |
|--------|--------------|--------------|
| **User** | Stores hosts, guests, and admins | 5 users |
| **Property** | Listings by hosts | 3 properties |
| **Booking** | Reservations made by guests | 3 bookings |
| **Payment** | Payments linked to bookings | 3 payments |
| **Review** | User feedback on properties | 3 reviews |
| **Message** | User-to-user communication | 3 messages |

---

## 🧠 Sample Data Highlights

- **Hosts:** Alice and Carol
- **Guests:** Bob and David
- **Admin:** Emma
- **Properties:** New York Apartment, Mountain Cabin, Beachfront Villa
- **Bookings:** Multiple guests booking different properties
- **Payments:** Each booking has a matching payment
- **Reviews:** Realistic feedback messages
- **Messages:** Conversations between hosts and guests

---

## ⚙️ Relationships Maintained

- Each **property** belongs to a valid **host (User)**.
- Each **booking** links to an existing **property** and **user**.
- Each **payment** corresponds to exactly one **booking**.
- Each **review** connects to an existing **user** and **property**.
- Each **message** connects two valid **users** (sender and recipient).

---

## 🧾 How to Run

Run the script after creating the schema:

```bash
psql -d airbnb_db -f database-script-0x02/seed.sql
```