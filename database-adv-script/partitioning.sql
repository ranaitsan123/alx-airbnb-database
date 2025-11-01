-- Task 5: Partition the Booking table by start_date (range partitioning example)

-- 1. Create the main parent table
CREATE TABLE Booking_Partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 2. Create partitions for each year
CREATE TABLE Booking_2023 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 3. Insert example data from the old Booking table (optional)
-- INSERT INTO Booking_Partitioned (booking_id, user_id, property_id, start_date, end_date, created_at)
-- SELECT booking_id, user_id, property_id, start_date, end_date, created_at FROM Booking;
