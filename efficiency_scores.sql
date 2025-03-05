INSERT INTO efficiency_scores (efficiency_id, subway_id, total_trip_time_minutes, total_cost, total_score, normalized_score)
WITH route_scores AS (
    SELECT 
        s.subway_id,
        EXTRACT(EPOCH FROM d.travel_time)/60 + EXTRACT(EPOCH FROM s.ride_time)/60 AS total_trip_time_minutes,
        COALESCE(st.parking_fee, 0) + s.ride_fare AS total_cost,
        EXTRACT(EPOCH FROM d.travel_time)/60 + EXTRACT(EPOCH FROM s.ride_time)/60 + COALESCE(st.parking_fee, 0) + s.ride_fare AS total_score
    FROM driving_routes d
    JOIN subway_rides s ON d.destination_station_id = s.start_station_id
    JOIN stations st ON d.destination_station_id = st.station_id
)
SELECT 
    ROW_NUMBER() OVER () AS efficiency_id, -- Generate a unique efficiency_id
    subway_id,
    total_trip_time_minutes,
    total_cost,
    ROUND((total_score)::NUMERIC, 3) AS total_score,
    ROUND((100.0 * (
        (SELECT MAX(total_score) FROM route_scores) - total_score
    ) / (
        (SELECT MAX(total_score) FROM route_scores) - 
        (SELECT MIN(total_score) FROM route_scores)
    ))::NUMERIC, 2) AS normalized_score
FROM route_scores
ORDER BY normalized_score DESC;
