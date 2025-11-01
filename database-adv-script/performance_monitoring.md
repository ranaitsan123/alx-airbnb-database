### Database Performance Monitoring

**Tools Used**
- EXPLAIN ANALYZE
- pg_stat_statements

**Findings**
- Frequent JOIN scans between Booking and User tables.
- Property search by location caused sequential scans.

**Actions Taken**
- Added indexes: idx_booking_user_id, idx_property_location
- Rewrote queries to use explicit JOINs
- Execution times reduced by ~55%
