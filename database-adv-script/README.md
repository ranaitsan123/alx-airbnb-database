-- INNER JOIN: Retrieve all bookings with the user who made them
SELECT 
    b.booking_id,
    u.first_name,
    u.last_name,
    b.start_date,
    b.end_date,
    b.status
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;

-- LEFT JOIN: Retrieve all properties with their reviews (include properties without reviews)
SELECT 
    p.property_id,
    p.name AS property_name,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;

-- FULL OUTER JOIN: Retrieve all users and bookings (even if they have none)
SELECT 
    u.user_id,
    u.first_name,
    b.booking_id,
    b.status
FROM User u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
