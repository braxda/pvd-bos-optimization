# PVD to BOS Route Efficiency Analysis

## Project Overview
For a weekend visit to a friend's apartment in Boston, I conducted an analysis to determine the most time- and cost-efficient travel routes from Providence.

Using SQL and QGIS, I sourced data on:
- Driving routes from Providence to MBTA train stations (Google Maps API)
- Subway travel times from MBTA stations to the destination (MassGIS/MBTA data)
- Parking fees and subway fares at transit stations

Since overnight parking was not available at my destination station, I needed to find alternative parking solutions. To tackle this, I designed SQL tables to store and analyze travel data, linking datasets and using aggregate functions to rank routes based on efficiency.
The efficiency score is calculated as the sum of total travel time (driving + subway) and total cost (parking + fare), with lower scores indicating more efficient routes. See efficiency_scores.sql for the full query.

Once I identified the top-scoring routes, I imported the data into QGIS to visualize the results. Routes were color-coded by efficiency score, with the most optimal routes highlighted in green.

## Data Processing
Driving Routes: Geolocated paths from Providence to MBTA stations using the Google Maps API for travel times and distances.
Train/Subway Routes: Mapped MBTA commuter rail and subway lines from MassGIS/MBTA datasets.
Joining Data for Visualization: Combined driving paths with train lines in QGIS to create a single mapped route.
Ranking Routes: Used SQL queries to compute efficiency scores based on time + cost trade-offs.

## Database Schema
The database consists of four core tables:

- `driving_routes` → Drive times and distances from Providence to transit stations  
- `stations` → MBTA stations with parking fee information  
- `subway_rides` → Subway ride durations and fares  
- `efficiency_scores` → Final calculated rankings of route efficiency  

## Files in This Repo
- `README.md` → Project documentation 
- `schema.sql` → PostgreSQL schema  
- `csvs/` → Folder containing CSV data for all tables  
- `create_tables.sql` → Create table structures
- `insert_data.sql` → Script to load CSVs into PostgreSQL  
- `efficiency_scores.sql` → SQL queries used to analyze the efficiency of each route  
- `qgis/` → Folder with QGIS layers and the full project
- `final_maps/` → Folder containing .jpgs of the final maps
 
## Sources
Google Maps API → Driving routes, times, distances
MassGIS/MBTA Data → Subway and commuter rail routes
MBTA ArcGIS & Route Data → Station locations, fares, and schedules
Google Maps → Base map in QGIS