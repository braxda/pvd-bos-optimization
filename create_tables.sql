CREATE TABLE stations (
    station_id SERIAL PRIMARY KEY,
    station_name TEXT NOT NULL,
    rail_line TEXT NOT NULL,
    station_lat DECIMAL(9,6) NOT NULL,
    station_long DECIMAL(9,6) NOT NULL,
    parking_fee DECIMAL(5,2)
);

CREATE TABLE driving_routes (
    driving_id SERIAL PRIMARY KEY,
    origin TEXT NOT NULL,
    orig_lat DECIMAL(9,6) NOT NULL,
    orig_long DECIMAL(9,6) NOT NULL,
    destination_station_id INT NOT NULL,
    travel_time INTERVAL NOT NULL,
    distance INT NOT NULL,
    CONSTRAINT fk_destination FOREIGN KEY (destination_station_id) REFERENCES stations(station_id)
);

CREATE TABLE subway_rides (
    subway_id SERIAL PRIMARY KEY,
    start_station_id INT NOT NULL,
    end_station_id INT NOT NULL,
    ride_time INTERVAL NOT NULL,
    ride_fare DECIMAL(5,2) NOT NULL,
    CONSTRAINT fk_start_station FOREIGN KEY (start_station_id) REFERENCES stations(station_id),
    CONSTRAINT fk_end_station FOREIGN KEY (end_station_id) REFERENCES stations(station_id)
);

CREATE TABLE efficiency_scores (
    efficiency_id SERIAL PRIMARY KEY,
    subway_id INT NOT NULL,
    total_trip_time_minutes NUMERIC(10,2),
    total_cost NUMERIC(10,2),
    total_score NUMERIC(10,3),
    normalized_score NUMERIC(10,2)
);