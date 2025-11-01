### Partition Performance Summary

**Before:** Full-table scan on Booking (~500k rows).  
**After:** Query limited to yearly partitions.  
**Result:** ~60% faster query execution for date filters.
