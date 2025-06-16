--View a few records
SELECT * FROM cyclistic_alldata
LIMIT 10;

-- Check schema and column types
DESCRIBE cyclistic_alldata;
-- cleaning 
-- Remove NULLs in essential columns
DELETE FROM cyclistic_alldata
WHERE started_at IS NULL
   OR ended_at IS NULL
   OR member_casual IS NULL;

-- Add ride_length in minutes
ALTER TABLE cyclistic_alldata
ADD COLUMN ride_length DOUBLE;

UPDATE cyclistic_alldata
SET ride_length = TIMESTAMPDIFF(MINUTE, started_at, ended_at);

-- Remove invalid rides
DELETE FROM cyclistic_alldata
WHERE ride_length <= 0 OR ride_length > 1440;

-- Add day_of_week, month, hour columns
ALTER TABLE cyclistic_alldata
ADD COLUMN day_of_week VARCHAR(10),
ADD COLUMN ride_month VARCHAR(10),
ADD COLUMN start_hour INT;

UPDATE cyclistic_alldata
SET day_of_week = DAYNAME(started_at),
    ride_month = MONTHNAME(started_at),
    start_hour = HOUR(started_at);
    
-- Average ride length by user type
SELECT member_casual, 
   ROUND(AVG(ride_length), 2) AS avg_ride_length
FROM cyclistic_alldata
GROUP BY member_casual;

-- Ride counts by day and user type
SELECT day_of_week, member_casual, COUNT(*) AS total_rides
FROM cyclistic_alldata
GROUP BY day_of_week, member_casual
ORDER BY FIELD(day_of_week, 'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');

-- Average ride duration by day and user type
SELECT day_of_week, member_casual, ROUND(AVG(ride_length), 2) AS avg_duration
FROM cyclistic_alldata
GROUP BY day_of_week, member_casual
ORDER BY FIELD(day_of_week, 'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');

-- Top 10 start stations by casual riders
SELECT start_station_name, COUNT(*) AS ride_count
FROM cyclistic_alldata
WHERE member_casual = 'casual'
GROUP BY start_station_name
ORDER BY ride_count DESC
LIMIT 10;

-- Peak riding hours by user type
SELECT start_hour, member_casual, COUNT(*) AS total_rides
FROM cyclistic_alldata
GROUP BY start_hour, member_casual
ORDER BY start_hour;


