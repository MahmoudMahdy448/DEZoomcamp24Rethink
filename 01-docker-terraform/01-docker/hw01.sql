-- Q3. Count records
-- How many taxi trips were totally made on September 18th 2019?
-- Tip: started and finished on 2019-09-18.
-- Remember that lpep_pickup_datetime and lpep_dropoff_datetime columns are in the format timestamp (date and hour+min+sec) and not in date.

SELECT COUNT(*) AS total_trips
FROM 
    green_tripdata
WHERE 
    CAST(lpep_pickup_datetime AS DATE) = '2019-09-18' AND 
    CAST(lpep_dropoff_datetime AS DATE) = '2019-09-18';

-- A3: 15612

-- Q4. Largest trip for each day
-- Which was the pick up day with the largest trip distance Use the pick up time for your calculations.

SELECT 
    CAST(lpep_pickup_datetime AS DATE) as "day", 
    trip_distance as max_distance
FROM 
    green_tripdata
WHERE
    CAST(lpep_pickup_datetime AS DATE) IN ('2019-09-18', '2019-09-16', '2019-09-26', '2019-09-21') AND 
    trip_distance = (
        SELECT MAX(trip_distance)
        FROM green_tripdata
        WHERE CAST(lpep_pickup_datetime AS DATE) IN ('2019-09-18', '2019-09-16', '2019-09-26', '2019-09-21')
    );

-- A4: 2019-09-26

-- Q5. Three biggest pick up Boroughs
-- Consider lpep_pickup_datetime in '2019-09-18' and ignoring Borough has Unknown
-- Which were the 3 pick up Boroughs that had a sum of total_amount superior to 50000?

SELECT
    CAST(t."lpep_pickup_datetime" AS DATE) as "day",
    z."Borough",
    SUM(t."total_amount") AS total_amount
FROM
    green_tripdata t
    LEFT JOIN zone_lut z ON t."PULocationID" = z."LocationID"
WHERE
    CAST(t."lpep_pickup_datetime" AS DATE) = '2019-09-18' AND
    z."Borough" != 'Unknown'
GROUP BY
    z."Borough", CAST(t."lpep_pickup_datetime" AS DATE)
HAVING
    SUM(t."total_amount") > 50000
ORDER BY
    total_amount DESC;

-- A5: "Brooklyn" "Manhattan" "Queens"

-- Q6. Largest tip
-- For the passengers picked up in September 2019 in the zone name Astoria which was the drop off zone that had the largest tip? We want the name of the zone, not the id.
-- Note: it's not a typo, it's tip , not trip

SELECT
    CAST(t."lpep_pickup_datetime" AS DATE) as "day",
    zpu."Zone" as "pickup_zone",
    zdo."Zone" as "dropoff_zone",
    t."tip_amount"
FROM
    green_tripdata t
    JOIN zone_lut zpu ON t."PULocationID" = zpu."LocationID"
    JOIN zone_lut zdo ON t."DOLocationID" = zdo."LocationID"
WHERE
    zpu."Zone" = 'Astoria'
ORDER BY
    t."tip_amount" DESC
LIMIT 1;

-- A6: JFK Airport