--
-- PostgreSQL database dump
--

-- Dumped from database version 13.14
-- Dumped by pg_dump version 13.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: driving_routes; Type: TABLE; Schema: public; Owner: dylanbracken
--

CREATE TABLE public.driving_routes (
    driving_id integer NOT NULL,
    origin text NOT NULL,
    orig_lat numeric(9,6) NOT NULL,
    orig_long numeric(9,6) NOT NULL,
    destination_station_id integer NOT NULL,
    travel_time interval NOT NULL,
    distance integer NOT NULL
);


ALTER TABLE public.driving_routes OWNER TO dylanbracken;

--
-- Name: driving_routes_driving_id_seq; Type: SEQUENCE; Schema: public; Owner: dylanbracken
--

CREATE SEQUENCE public.driving_routes_driving_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driving_routes_driving_id_seq OWNER TO dylanbracken;

--
-- Name: driving_routes_driving_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dylanbracken
--

ALTER SEQUENCE public.driving_routes_driving_id_seq OWNED BY public.driving_routes.driving_id;


--
-- Name: efficiency_scores; Type: TABLE; Schema: public; Owner: dylanbracken
--

CREATE TABLE public.efficiency_scores (
    efficiency_id integer NOT NULL,
    subway_id integer NOT NULL,
    total_trip_time_minutes numeric(10,2),
    total_cost numeric(10,2),
    total_score numeric(10,3),
    normalized_score numeric(10,2)
);


ALTER TABLE public.efficiency_scores OWNER TO dylanbracken;

--
-- Name: efficiency_scores_efficiency_id_seq; Type: SEQUENCE; Schema: public; Owner: dylanbracken
--

CREATE SEQUENCE public.efficiency_scores_efficiency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.efficiency_scores_efficiency_id_seq OWNER TO dylanbracken;

--
-- Name: efficiency_scores_efficiency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dylanbracken
--

ALTER SEQUENCE public.efficiency_scores_efficiency_id_seq OWNED BY public.efficiency_scores.efficiency_id;


--
-- Name: stations; Type: TABLE; Schema: public; Owner: dylanbracken
--

CREATE TABLE public.stations (
    station_id integer NOT NULL,
    station_name text NOT NULL,
    rail_line text NOT NULL,
    station_lat numeric(9,6) NOT NULL,
    station_long numeric(9,6) NOT NULL,
    parking_fee numeric(5,2)
);


ALTER TABLE public.stations OWNER TO dylanbracken;

--
-- Name: stations_station_id_seq; Type: SEQUENCE; Schema: public; Owner: dylanbracken
--

CREATE SEQUENCE public.stations_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stations_station_id_seq OWNER TO dylanbracken;

--
-- Name: stations_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dylanbracken
--

ALTER SEQUENCE public.stations_station_id_seq OWNED BY public.stations.station_id;


--
-- Name: subway_rides; Type: TABLE; Schema: public; Owner: dylanbracken
--

CREATE TABLE public.subway_rides (
    subway_id integer NOT NULL,
    start_station_id integer NOT NULL,
    end_station_id integer NOT NULL,
    ride_time interval NOT NULL,
    ride_fare numeric(5,2) NOT NULL
);


ALTER TABLE public.subway_rides OWNER TO dylanbracken;

--
-- Name: subway_rides_subway_id_seq; Type: SEQUENCE; Schema: public; Owner: dylanbracken
--

CREATE SEQUENCE public.subway_rides_subway_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subway_rides_subway_id_seq OWNER TO dylanbracken;

--
-- Name: subway_rides_subway_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dylanbracken
--

ALTER SEQUENCE public.subway_rides_subway_id_seq OWNED BY public.subway_rides.subway_id;


--
-- Name: driving_routes driving_id; Type: DEFAULT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.driving_routes ALTER COLUMN driving_id SET DEFAULT nextval('public.driving_routes_driving_id_seq'::regclass);


--
-- Name: efficiency_scores efficiency_id; Type: DEFAULT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.efficiency_scores ALTER COLUMN efficiency_id SET DEFAULT nextval('public.efficiency_scores_efficiency_id_seq'::regclass);


--
-- Name: stations station_id; Type: DEFAULT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.stations ALTER COLUMN station_id SET DEFAULT nextval('public.stations_station_id_seq'::regclass);


--
-- Name: subway_rides subway_id; Type: DEFAULT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.subway_rides ALTER COLUMN subway_id SET DEFAULT nextval('public.subway_rides_subway_id_seq'::regclass);


--
-- Name: driving_routes driving_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.driving_routes
    ADD CONSTRAINT driving_routes_pkey PRIMARY KEY (driving_id);


--
-- Name: efficiency_scores efficiency_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.efficiency_scores
    ADD CONSTRAINT efficiency_scores_pkey PRIMARY KEY (efficiency_id);


--
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (station_id);


--
-- Name: subway_rides subway_rides_pkey; Type: CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.subway_rides
    ADD CONSTRAINT subway_rides_pkey PRIMARY KEY (subway_id);


--
-- Name: driving_routes fk_destination; Type: FK CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.driving_routes
    ADD CONSTRAINT fk_destination FOREIGN KEY (destination_station_id) REFERENCES public.stations(station_id);


--
-- Name: subway_rides fk_end_station; Type: FK CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.subway_rides
    ADD CONSTRAINT fk_end_station FOREIGN KEY (end_station_id) REFERENCES public.stations(station_id);


--
-- Name: subway_rides fk_start_station; Type: FK CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.subway_rides
    ADD CONSTRAINT fk_start_station FOREIGN KEY (start_station_id) REFERENCES public.stations(station_id);


--
-- PostgreSQL database dump complete
--

