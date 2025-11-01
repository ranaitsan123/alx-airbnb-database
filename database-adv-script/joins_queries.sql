-- joins_queries.sql

-- Task 1: INNER JOIN
-- Retrieve all bookings and the respective users who made those bookings
SELECT
    b.booking_id,
    b.property_id,
    b.booking_date,
    b.user_id,
    u.name AS user_name,
    u.email AS user_email
FROM Booking b
INNER JOIN "User" u
    ON b.user_id = u.user_id
ORDER BY b.booking_id;

-- Task 2: LEFT JOIN
-- Retrieve all properties and their reviews, including properties that have no reviews
SELECT
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment,
    r.user_id AS reviewer_id
FROM Property p
LEFT JOIN Review r
    ON p.property_id = r.property_id
ORDER BY p.property_id, r.review_id;

-- Task 3: FULL OUTER JOIN
-- Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    b.booking_id,
    b.property_id,
    b.booking_date
FROM "User" u
FULL OUTER JOIN Booking b
    ON u.user_id = b.user_id
ORDER BY u.user_id, b.booking_id;
