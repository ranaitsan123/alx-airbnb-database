-- Task 1: Total number of bookings per user
SELECT
    u.user_id,
    u.name AS user_name,
    COUNT(b.booking_id) AS total_bookings
FROM "User" u
LEFT JOIN Booking b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;


-- Task 2: Rank properties by total bookings using RANK()
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank
FROM Property p
LEFT JOIN Booking b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY rank;
