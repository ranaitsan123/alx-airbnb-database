### Index Performance Analysis

| Table | Indexed Columns | Reason | Observed Improvement |
|--------|------------------|---------|----------------------|
| User | role | Faster filtering by user role | ~30% faster queries |
| Booking | start_date, end_date | Improves date range searches | ~45% faster |
| Property | location | Speeds up property search by location | Significant |
| Review | rating | Optimizes aggregate rating calculations | Moderate |
