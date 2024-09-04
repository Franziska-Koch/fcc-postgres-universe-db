--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(100) NOT NULL,
    radius_in_km double precision,
    type character varying(50),
    description text
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(100),
    distance double precision,
    num_of_star_mil integer,
    discovery_year integer,
    discovered_by character varying(100)
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
    name character varying(100) NOT NULL,
    has_atmosphere boolean,
    discovery text,
    discovered_by character varying(100),
    planet_id integer
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
    name character varying(100) NOT NULL,
    type character varying(100),
    mass_rel_earth numeric(10,6),
    has_atmosphere boolean,
    discovery text,
    discovered_by character varying(100),
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_billions_years double precision,
    luminosity double precision,
    type character varying(100),
    discovery text,
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 44000, 'Supermassive', 'The supermassive black hole at the center of the Milky Way galaxy.');
INSERT INTO public.black_hole VALUES (2, 'M87*', 120000, 'Supermassive', 'A supermassive black hole in the center of the galaxy M87, famously imaged by the Event Horizon Telescope.');
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-1', 20, 'Stellar-mass', 'A stellar-mass black hole in the Cygnus constellation, one of the first black holes discovered.');
INSERT INTO public.black_hole VALUES (4, 'V404 Cygni', 30, 'Stellar-mass', 'A stellar-mass black hole in the constellation Cygnus, known for its X-ray variability.');
INSERT INTO public.black_hole VALUES (5, 'LIGO-VIRGO Black Hole', 40, 'Stellar-mass', 'A black hole detected by gravitational waves from the LIGO-VIRGO collaboration.');
INSERT INTO public.black_hole VALUES (6, 'GW190521', 70, 'Intermediate-mass', 'An intermediate-mass black hole detected through gravitational wave observations, part of a merger event.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 100000, 0, 'Various');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3, 40000, 1877, 'William Herschel');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 53.5, 100000, 1781, 'Charles Messier');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Spiral', 23.2, 50000, 1773, 'Pierre Méchain');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 0.05, 10000, 1960, 'Sir William Herschel');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.537, 1000000, NULL, 'Abu Rayhan al-Biruni');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 'Known since ancient times', 'Various', 1);
INSERT INTO public.moon VALUES (2, 'Io', false, 'Discovered by Galileo Galilei in 1610', 'Galileo Galilei', 2);
INSERT INTO public.moon VALUES (3, 'Europa', false, 'Discovered by Galileo Galilei in 1610', 'Galileo Galilei', 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', false, 'Discovered by Galileo Galilei in 1610', 'Galileo Galilei', 2);
INSERT INTO public.moon VALUES (5, 'Callisto', false, 'Discovered by Galileo Galilei in 1610', 'Galileo Galilei', 2);
INSERT INTO public.moon VALUES (6, 'Titan', true, 'Discovered by Christiaan Huygens in 1655', 'Christiaan Huygens', 3);
INSERT INTO public.moon VALUES (7, 'Rhea', false, 'Discovered by Giovanni Domenico Cassini in 1672', 'Giovanni Domenico Cassini', 3);
INSERT INTO public.moon VALUES (8, 'Iapetus', false, 'Discovered by Giovanni Domenico Cassini in 1671', 'Giovanni Domenico Cassini', 3);
INSERT INTO public.moon VALUES (9, 'Dione', false, 'Discovered by Giovanni Domenico Cassini in 1684', 'Giovanni Domenico Cassini', 3);
INSERT INTO public.moon VALUES (10, 'Tethys', false, 'Discovered by Giovanni Domenico Cassini in 1684', 'Giovanni Domenico Cassini', 3);
INSERT INTO public.moon VALUES (11, 'Enceladus', false, 'Discovered by William Herschel in 1789', 'William Herschel', 3);
INSERT INTO public.moon VALUES (12, 'Miranda', false, 'Discovered by George William Hunter in 1948', 'George William Hunter', 4);
INSERT INTO public.moon VALUES (13, 'Ariel', false, 'Discovered by William Lassell in 1851', 'William Lassell', 4);
INSERT INTO public.moon VALUES (14, 'Umbriel', false, 'Discovered by William Lassell in 1851', 'William Lassell', 4);
INSERT INTO public.moon VALUES (15, 'Titania', false, 'Discovered by William Lassell in 1851', 'William Lassell', 4);
INSERT INTO public.moon VALUES (16, 'Oberon', false, 'Discovered by William Lassell in 1851', 'William Lassell', 4);
INSERT INTO public.moon VALUES (17, 'Triton', true, 'Discovered by William Lassell in 1846', 'William Lassell', 5);
INSERT INTO public.moon VALUES (18, 'Nereid', false, 'Discovered by Gerard Kuiper in 1949', 'Gerard Kuiper', 5);
INSERT INTO public.moon VALUES (19, 'Proteus', false, 'Discovered by Voyager 2 in 1989', 'NASA', 5);
INSERT INTO public.moon VALUES (20, 'Charon', false, 'Discovered by James Christy in 1978', 'James Christy', 6);
INSERT INTO public.moon VALUES (21, 'Styx', false, 'Discovered by the Hubble Space Telescope in 2012', 'NASA', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 1.000000, true, 'Known since ancient times', 'Various', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 0.107600, true, 'Observed through telescopes', 'Various', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 317.830000, true, 'Known since ancient times', 'Various', 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 95.160000, true, 'Known since ancient times', 'Various', 1);
INSERT INTO public.planet VALUES (5, 'Uranus', 'Ice Giant', 14.540000, true, 'Discovered by William Herschel in 1781', 'William Herschel', 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice Giant', 17.150000, true, 'Discovered in 1846 by Johann Galle', 'Johann Galle', 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Terrestrial', 0.055300, false, 'Known since ancient times', 'Various', 2);
INSERT INTO public.planet VALUES (8, 'Venus', 'Terrestrial', 0.815000, true, 'Known since ancient times', 'Various', 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf Planet', 0.002200, false, 'Discovered on February 18, 1930 by Clyde Tombaugh', 'Clyde Tombaugh', 3);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Dwarf Planet', 0.000150, true, 'Discovered on January 1, 1801 by Giuseppe Piazzi', 'Giuseppe Piazzi', 3);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf Planet', 0.000180, true, 'Discovered on March 28, 2008 by Michael E. Brown and team', 'Michael E. Brown and team', 4);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Dwarf Planet', 0.000170, true, 'Discovered on March 31, 2005 by Michael E. Brown and team', 'Michael E. Brown and team', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.6, 1, 'G-type main-sequence star', 'Known since ancient times', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 0.2, 25.4, 'A-type main-sequence star', 'Discovered by Bessel in 1839', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 10, 120000, 'Red supergiant', 'Known since ancient times', 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 5, 1.5, 'G-type main-sequence star', 'Discovered by Bessel in 1839', 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 4.3, 0.5, 'K-type main-sequence star', 'Discovered by Bessel in 1839', 2);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 4.8, 0.0015, 'Red dwarf', 'Discovered by Innes in 1915', 2);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

