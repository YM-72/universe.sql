--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(72) NOT NULL,
    size numeric(10,2) NOT NULL,
    black_hole_present boolean NOT NULL,
    in_universe boolean DEFAULT true
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(72) NOT NULL,
    civilization boolean NOT NULL,
    planet_id integer,
    visited boolean DEFAULT true
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(72) NOT NULL,
    type_of_planet text NOT NULL,
    diameter integer NOT NULL,
    has_moons boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(72) NOT NULL,
    nr_of_planets integer NOT NULL,
    has_moons boolean NOT NULL,
    discovery_date date
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(72) NOT NULL,
    brightness integer NOT NULL,
    mass_size integer NOT NULL,
    has_planets boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000.50, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 900000.75, false, true);
INSERT INTO public.galaxy VALUES (3, 'Leo I', 30000.20, false, true);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 600000.25, true, true);
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 2500000.40, false, true);
INSERT INTO public.galaxy VALUES (6, 'Whirpool', 200000.45, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 1, true);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 2, true);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 2, true);
INSERT INTO public.moon VALUES (4, 'Titan', true, 2, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', false, 4, true);
INSERT INTO public.moon VALUES (6, 'Callisto', true, 3, true);
INSERT INTO public.moon VALUES (7, 'Io', false, 5, true);
INSERT INTO public.moon VALUES (8, 'Europa', true, 5, true);
INSERT INTO public.moon VALUES (9, 'Charon', true, 6, true);
INSERT INTO public.moon VALUES (10, 'Titan II', true, 4, true);
INSERT INTO public.moon VALUES (11, 'Moon II', true, 1, true);
INSERT INTO public.moon VALUES (12, 'Phobos II', false, 2, true);
INSERT INTO public.moon VALUES (13, 'Deimos III', false, 2, true);
INSERT INTO public.moon VALUES (14, 'Titan Thanos', true, 2, true);
INSERT INTO public.moon VALUES (15, 'Ganymede II', false, 4, true);
INSERT INTO public.moon VALUES (16, 'Reggae & Callisto', true, 3, true);
INSERT INTO public.moon VALUES (17, 'Ion', false, 5, true);
INSERT INTO public.moon VALUES (18, 'New Europe', true, 5, true);
INSERT INTO public.moon VALUES (19, 'Old Charon', true, 6, true);
INSERT INTO public.moon VALUES (20, 'Titan Maximus', true, 4, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 6371, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 3389, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', 6051, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gas Giant', 69911, true, 5);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas Giant', 58232, true, 5);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice Giant', 24622, true, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 25362, true, 6);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Terrestrial', 2439, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf Planet', 1188, true, 5);
INSERT INTO public.planet VALUES (10, 'Eris', 'Dwarf Planet', 1163, false, 5);
INSERT INTO public.planet VALUES (11, 'Nibiru', 'Annunaki', 3600, true, 6);
INSERT INTO public.planet VALUES (12, 'BlaBla', 'Pagga', 7236, true, 3);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'Sol', 8, true, '0001-01-01');
INSERT INTO public.solar_system VALUES (2, 'Alpha Centauri', 3, true, '2020-01-15');
INSERT INTO public.solar_system VALUES (3, 'Trappist-1', 7, true, '2017-02-22');
INSERT INTO public.solar_system VALUES (4, 'Kepler-90', 8, false, '2014-12-14');
INSERT INTO public.solar_system VALUES (5, 'Gliese 581', 6, true, '2007-09-29');
INSERT INTO public.solar_system VALUES (6, 'Epsilon Eridani', 2, false, '1900-07-15');
INSERT INTO public.solar_system VALUES (7, 'HD 10180', 9, true, '2007-08-24');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 25, 2, true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 3, 2, true, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0, 0, false, 1);
INSERT INTO public.star VALUES (5, 'Vega', 50, 3, true, 3);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 100000, 20, false, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 43, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

