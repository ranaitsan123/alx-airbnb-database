-- Task 1: Retrieve all bookings with user, property, and payment details
SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.city AS property_city,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM Booking b
JOIN "User" u
    ON b.user_id = u.user_id
JOIN Property p
    ON b.property_id = p.property_id
LEFT JOIN Payment pay
    ON b.booking_id = pay.booking_id
WHERE p.city = 'New York'  -- example filter
  AND b.booking_date >= '2023-01-01'
ORDER BY b.booking_date DESC;


-- Task 2: Analyze the query performance
EXPLAIN
SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.city AS property_city,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM Booking b
JOIN "User" u
    ON b.user_id = u.user_id
JOIN Property p
    ON b.property_id = p.property_id
LEFT JOIN Payment pay
    ON b.booking_id = pay.booking_id
WHERE p.city = 'New York'
  AND b.booking_date >= '2023-01-01';
