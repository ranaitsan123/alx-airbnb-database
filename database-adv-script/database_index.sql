-- Additional indexes to enhance performance
CREATE INDEX idx_user_role ON User(role);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_review_rating ON Review(rating);
