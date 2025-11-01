-- Original unoptimized query
SELECT *
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON pay.booking_id = b.booking_id;

-- Optimized query
SELECT 
    b.booking_id,
    u.first_name || ' ' || u.last_name AS guest_name,
    p.name AS property_name,
    pay.amount,
    pay.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id;
