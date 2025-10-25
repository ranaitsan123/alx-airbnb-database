-- Airbnb Database Seeding Script
-- Author: Aicha Lahnite
-- Date: 25/10/2025
-- Description: Inserts realistic sample data into all tables.

-- 1. USERS
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashedpassword123', '555-1010', 'host'),
(gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashedpassword123', '555-2020', 'guest'),
(gen_random_uuid(), 'Carol', 'White', 'carol@example.com', 'hashedpassword123', '555-3030', 'host'),
(gen_random_uuid(), 'David', 'Green', 'david@example.com', 'hashedpassword123', '555-4040', 'guest'),
(gen_random_uuid(), 'Emma', 'Brown', 'emma@example.com', 'hashedpassword123', '555-5050', 'admin');

-- 2. PROPERTIES
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
SELECT gen_random_uuid(), user_id, name, description, location, price
FROM (
  VALUES
    ((SELECT user_id FROM User WHERE email='alice@example.com'),
     'Cozy Downtown Apartment',
     'A modern apartment located in the heart of the city.',
     'New York',
     120.00),
    ((SELECT user_id FROM User WHERE email='carol@example.com'),
     'Mountain Cabin Retreat',
     'A quiet cabin near scenic hiking trails.',
     'Colorado',
     150.00),
    ((SELECT user_id FROM User WHERE email='alice@example.com'),
     'Beachfront Villa',
     'Luxury villa with a stunning ocean view.',
     'Miami',
     350.00)
) AS data(host_id, name, description, location, price);

-- 3. BOOKINGS
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
SELECT gen_random_uuid(), property_id, user_id, start_date, end_date, total_price, status
FROM (
  VALUES
    ((SELECT property_id FROM Property WHERE name='Cozy Downtown Apartment'),
     (SELECT user_id FROM User WHERE email='bob@example.com'),
     '2025-11-01', '2025-11-05', 480.00, 'confirmed'),
    ((SELECT property_id FROM Property WHERE name='Mountain Cabin Retreat'),
     (SELECT user_id FROM User WHERE email='david@example.com'),
     '2025-12-10', '2025-12-15', 750.00, 'confirmed'),
    ((SELECT property_id FROM Property WHERE name='Beachfront Villa'),
     (SELECT user_id FROM User WHERE email='bob@example.com'),
     '2025-12-20', '2025-12-25', 1750.00, 'pending')
) AS data(property_id, user_id, start_date, end_date, total_price, status);

-- 4. PAYMENTS
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
SELECT gen_random_uuid(), booking_id, amount, method
FROM (
  VALUES
    ((SELECT booking_id FROM Booking WHERE total_price=480.00), 480.00, 'credit_card'),
    ((SELECT booking_id FROM Booking WHERE total_price=750.00), 750.00, 'paypal'),
    ((SELECT booking_id FROM Booking WHERE total_price=1750.00), 1750.00, 'stripe')
) AS data(booking_id, amount, method);

-- 5. REVIEWS
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
SELECT gen_random_uuid(), property_id, user_id, rating, comment
FROM (
  VALUES
    ((SELECT property_id FROM Property WHERE name='Cozy Downtown Apartment'),
     (SELECT user_id FROM User WHERE email='bob@example.com'),
     5, 'Amazing location and super clean apartment!'),
    ((SELECT property_id FROM Property WHERE name='Mountain Cabin Retreat'),
     (SELECT user_id FROM User WHERE email='david@example.com'),
     4, 'Beautiful views, cozy interior, would stay again.'),
    ((SELECT property_id FROM Property WHERE name='Beachfront Villa'),
     (SELECT user_id FROM User WHERE email='bob@example.com'),
     5, 'Absolutely loved the ocean view!')
) AS data(property_id, user_id, rating, comment);

-- 6. MESSAGES
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
SELECT gen_random_uuid(), sender_id, recipient_id, message
FROM (
  VALUES
    ((SELECT user_id FROM User WHERE email='bob@example.com'),
     (SELECT user_id FROM User WHERE email='alice@example.com'),
     'Hi Alice, is your downtown apartment available next month?'),
    ((SELECT user_id FROM User WHERE email='alice@example.com'),
     (SELECT user_id FROM User WHERE email='bob@example.com'),
     'Hi Bob, yes it is available! You can book directly.'),
    ((SELECT user_id FROM User WHERE email='david@example.com'),
     (SELECT user_id FROM User WHERE email='carol@example.com'),
     'Hi Carol, your mountain cabin looks great! Is it pet-friendly?')
) AS data(sender_id, recipient_id, message);
