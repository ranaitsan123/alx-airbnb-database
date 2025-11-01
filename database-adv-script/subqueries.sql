-- Non-correlated subquery: Find properties with average rating > 4.0
SELECT p.property_id, p.name
FROM Property p
WHERE (
    SELECT AVG(r.rating)
    FROM Review r
    WHERE r.property_id = p.property_id
) > 4.0;

-- Correlated subquery: Find users who have made more than 3 bookings
SELECT u.user_id, u.first_name, u.last_name
FROM User u
WHERE (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.user_id = u.user_id
) > 3;
