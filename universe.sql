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
    name character varying(30) NOT NULL,
    galaxy_types text NOT NULL,
    distance_from_earth_in_light_years integer,
    diameter_in_kiloparsecs numeric(6,2),
    mass_in_billion_sun_masses integer
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
-- Name: interstellar_movie_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.interstellar_movie_planets (
    name character varying(10) NOT NULL,
    interstellar_movie_planets_id integer NOT NULL,
    named_after character varying(20) NOT NULL
);


ALTER TABLE public.interstellar_movie_planets OWNER TO freecodecamp;

--
-- Name: interstellar_movie_planets_interstellar_movie_planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.interstellar_movie_planets_interstellar_movie_planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interstellar_movie_planets_interstellar_movie_planets_id_seq OWNER TO freecodecamp;

--
-- Name: interstellar_movie_planets_interstellar_movie_planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.interstellar_movie_planets_interstellar_movie_planets_id_seq OWNED BY public.interstellar_movie_planets.interstellar_movie_planets_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    orbits character varying(15) NOT NULL,
    orbit_distance_in_kms integer,
    diameter_in_kms numeric(6,1)
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    diameter_in_kms integer,
    has_moons boolean,
    has_rings boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_earth_in_light_years numeric(10,7),
    constellation character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_moon_id_seq OWNER TO freecodecamp;

--
-- Name: star_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_moon_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: interstellar_movie_planets interstellar_movie_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.interstellar_movie_planets ALTER COLUMN interstellar_movie_planets_id SET DEFAULT nextval('public.interstellar_movie_planets_interstellar_movie_planets_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_moon_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', 53000000, 36.79, 2400);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 'Spiral', 21000000, 52.12, 1000);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', NULL, 55.18, 1500);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2540000, 67.45, 1230);
INSERT INTO public.galaxy VALUES (5, 'Antennae', 'Interacting Spirals', 45000000, 150.00, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 23000000, 18.39, 160);


--
-- Data for Name: interstellar_movie_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.interstellar_movie_planets VALUES ('Edmunds', 1, 'Dr. Wolf Edmunds');
INSERT INTO public.interstellar_movie_planets VALUES ('Mann', 2, 'Dr. Hugh Mann');
INSERT INTO public.interstellar_movie_planets VALUES ('Miller', 3, 'Dr. Laura Miller');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1, 'Earth', 384400, 3475.0);
INSERT INTO public.moon VALUES (2, 'Phobos', 5, 'Mars', 9376, 22.2);
INSERT INTO public.moon VALUES (3, 'Diemos', 5, 'Mars', 23458, 12.4);
INSERT INTO public.moon VALUES (4, 'Io', 2, 'Jupiter', 421800, 3643.2);
INSERT INTO public.moon VALUES (5, 'Europa', 2, 'Jupiter', 671100, 3121.6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2, 'Jupiter', 1070400, 5262.4);
INSERT INTO public.moon VALUES (7, 'Callisto', 2, 'Jupiter', 1882700, 4820.6);
INSERT INTO public.moon VALUES (8, 'Enceladus', 9, 'Saturn', 238037, 504.2);
INSERT INTO public.moon VALUES (9, 'Rhea', 9, 'Saturn', 527068, 1528.6);
INSERT INTO public.moon VALUES (11, 'Iapetus', 9, 'Saturn', 3560851, 1471.2);
INSERT INTO public.moon VALUES (12, 'Miranda', 6, 'Uranus', 129900, 471.6);
INSERT INTO public.moon VALUES (13, 'Titania', 6, 'Uranus', 436300, 1577.8);
INSERT INTO public.moon VALUES (14, 'Triton', 7, 'Neptune', 354759, 2706.8);
INSERT INTO public.moon VALUES (15, 'Charon', 8, 'Pluto', 17536, 1207.2);
INSERT INTO public.moon VALUES (16, 'Metis', 2, 'Jupiter', 128000, 40.0);
INSERT INTO public.moon VALUES (17, 'Adrastea', 2, 'Jupiter', 129000, 20.0);
INSERT INTO public.moon VALUES (18, 'Leda', 2, 'Jupiter', 11094000, 16.0);
INSERT INTO public.moon VALUES (19, 'Himalia', 2, 'Jupiter', 11480000, 170.0);
INSERT INTO public.moon VALUES (20, 'Lysithea', 2, 'Jupiter', 11720000, 24.0);
INSERT INTO public.moon VALUES (10, 'Titan', 9, 'Saturn', 1221865, 5149.4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Jupiter', 5, 142984, true, true);
INSERT INTO public.planet VALUES (3, 'Mercury', 5, 4879, false, false);
INSERT INTO public.planet VALUES (4, 'Venus', 5, 12104, false, false);
INSERT INTO public.planet VALUES (5, 'Mars', 5, 6792, true, false);
INSERT INTO public.planet VALUES (6, 'Uranus', 5, 51118, true, true);
INSERT INTO public.planet VALUES (7, 'Neptune', 5, 49528, true, true);
INSERT INTO public.planet VALUES (8, 'Pluto', 5, 2372, true, false);
INSERT INTO public.planet VALUES (9, 'Saturn', 5, 120536, true, true);
INSERT INTO public.planet VALUES (10, 'Makemake', 5, 1434, true, false);
INSERT INTO public.planet VALUES (11, 'Ceres', 5, 950, false, false);
INSERT INTO public.planet VALUES (12, 'Eris', 5, 2326, true, false);
INSERT INTO public.planet VALUES (1, 'Earth', 5, 12756, true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Antares', 1, 550.0000000, 'Scorpius');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 643.0000000, 'Orion');
INSERT INTO public.star VALUES (3, 'Alpheratz', 2, 97.0000000, 'Andromeda');
INSERT INTO public.star VALUES (4, 'Mirach', 2, 199.0000000, 'Andromeda');
INSERT INTO public.star VALUES (6, 'Canopus', 1, 310.0000000, 'Carina');
INSERT INTO public.star VALUES (5, 'Sun', 1, 0.0000158, NULL);
INSERT INTO public.star VALUES (7, 'Sirius', 1, 8.0000000, 'Canis Major');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: interstellar_movie_planets_interstellar_movie_planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.interstellar_movie_planets_interstellar_movie_planets_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_moon_id_seq', 7, true);


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
-- Name: interstellar_movie_planets interstellar_movie_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.interstellar_movie_planets
    ADD CONSTRAINT interstellar_movie_planets_name_key UNIQUE (name);


--
-- Name: interstellar_movie_planets interstellar_movie_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.interstellar_movie_planets
    ADD CONSTRAINT interstellar_movie_planets_pkey PRIMARY KEY (interstellar_movie_planets_id);


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
-- Name: moon moon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

