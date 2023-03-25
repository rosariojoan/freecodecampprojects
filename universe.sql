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
    name character varying(30) NOT NULL,
    distance_from_earth_in_light_years numeric(4,1) NOT NULL,
    shape character varying(20) NOT NULL,
    age integer,
    description text,
    galaxy_name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: glue; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.glue (
    galaxy_name character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    glue_id integer NOT NULL,
    description text
);


ALTER TABLE public.glue OWNER TO freecodecamp;

--
-- Name: glue_glue_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.glue_glue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.glue_glue_id_seq OWNER TO freecodecamp;

--
-- Name: glue_glue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.glue_glue_id_seq OWNED BY public.glue.glue_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20) NOT NULL,
    color character(20),
    age integer,
    size integer,
    description text,
    planet_name character varying(20) NOT NULL,
    moon_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    size integer,
    distance_from_earth numeric(4,1),
    habitable boolean NOT NULL,
    description text,
    star_name character varying(20) NOT NULL,
    planet_name character varying(20) NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    distance_from_earth_in_light_years numeric(4,1) NOT NULL,
    description text,
    is_baby boolean NOT NULL,
    galaxy_name character varying(20) NOT NULL,
    star_name character varying(20) NOT NULL,
    star_id integer NOT NULL
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
-- Name: glue glue_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.glue ALTER COLUMN glue_id SET DEFAULT nextval('public.glue_glue_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way Galaxy', 0.0, 'spiral', 10, 'This is our own galaxy', 'milky way', 1);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 2.5, 'spiral', 10, 'Andromeda is the closest galaxy from earth and contains at least one supermassive black hole', 'andromeda', 2);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 2.3, 'spiral', 10, 'It is sometimes said to be the farthest object visible with the unaided eye', 'triangulum', 3);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 23.0, 'spiral', 10, 'It was first discovered by Charles Messier in 1773', 'whirlpool', 4);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 29.0, 'elliptic', 10, 'It can only been seen with a telescope most easily during May', 'sombrero', 5);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 200.0, 'irregular', 10, 'It is a dwarf, third closest galaxy to the Milky Way', 'magellanic', 6);


--
-- Data for Name: glue; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.glue VALUES ('milky way', 'Moon', 1, NULL);
INSERT INTO public.glue VALUES ('milky way', 'Europa', 2, NULL);
INSERT INTO public.glue VALUES ('milky way', 'Callisto', 3, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 'silver              ', 10, 1, 'Earths natural satellite', 'earth', 1);
INSERT INTO public.moon VALUES ('Europa', 'gray                ', 10, 3, 'This moon has a thin oxygen atmosphere', 'jupyter', 4);
INSERT INTO public.moon VALUES ('Ganyme', 'gray                ', 10, 5, 'It is made of water ice', 'jupyter', 5);
INSERT INTO public.moon VALUES ('Callisto', 'brown               ', 10, 5, 'It may have liquid ocean under its icy surface', 'jupyter', 6);
INSERT INTO public.moon VALUES ('Metis', 'gray                ', 10, 1, '', 'jupyter', 7);
INSERT INTO public.moon VALUES ('Adrastea', 'gray                ', 10, 1, 'It was discovered in 1979 and is also called Jupiter XV', 'jupyter', 8);
INSERT INTO public.moon VALUES ('Thebe', 'silver              ', 10, 1, 'It has only 49 km of diameter', 'jupyter', 9);
INSERT INTO public.moon VALUES ('Themisto', 'gray                ', 10, 1, 'Also known as Jupiter XVIII, it is a small prograde non-spherical moon of Jupiter', 'jupyter', 10);
INSERT INTO public.moon VALUES ('Leda', 'gray                ', 10, 1, 'It is rather irregular in shape and was discvered in 1975', 'jupyter', 11);
INSERT INTO public.moon VALUES ('Lysithea', 'brown               ', 10, 1, 'It was discovered in 1938 and has only 18 km of radius', 'jupyter', 12);
INSERT INTO public.moon VALUES ('Carpo', 'gray                ', 10, 1, 'It is named after the Greek mythological Carpo the goddess of autumn/fall', 'jupyter', 13);
INSERT INTO public.moon VALUES ('Megaclite', 'gray                ', 10, 1, 'It is also known as jupyter XIX', 'jupyter', 14);
INSERT INTO public.moon VALUES ('S/2003 J 2', 'gray                ', 10, 1, '', 'jupyter', 16);
INSERT INTO public.moon VALUES ('Pasiphae', 'gray                ', 10, 1, 'It was discovered in 1908 by Philibert Melotte', 'jupyter', 17);
INSERT INTO public.moon VALUES ('S/2019 J 2', 'gray                ', 10, 1, '', 'jupyter', 18);
INSERT INTO public.moon VALUES ('Callirrhoe', 'gray                ', 10, 1, '', 'jupyter', 19);
INSERT INTO public.moon VALUES ('Praxidike', 'gray                ', 10, 1, '', 'jupyter', 20);
INSERT INTO public.moon VALUES ('Thyone', 'gray                ', 10, 1, '', 'jupyter', 22);
INSERT INTO public.moon VALUES ('Euporie', 'brown               ', 10, 1, '', 'jupyter', 15);
INSERT INTO public.moon VALUES ('Enanke', 'gray                ', 10, 1, '', 'jupyter', 21);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 13, 0.0, true, 'It is the only habitable planet known so far', 'sun', 'earth', 1);
INSERT INTO public.planet VALUES ('Mars', 3, 0.1, false, 'Mars is also called the red planet', 'sun', 'mars', 10);
INSERT INTO public.planet VALUES ('PA-99-N2', NULL, 2.5, false, 'It is not known whether this is a planet or not', 'mirach', 'pa-99-n2', 11);
INSERT INTO public.planet VALUES ('Jupyter', 1500, 0.1, false, 'Its magnetic field is 14 times stronger than that of the earth', 'sun', 'jupyter', 12);
INSERT INTO public.planet VALUES ('Venus', 12, 0.1, false, 'It is the second planet from the Sun', 'sun', 'venus', 13);
INSERT INTO public.planet VALUES ('Saturn', 120, 0.1, false, 'It is the 6th planet form the Sun and has rings', 'sun', 'saturn', 14);
INSERT INTO public.planet VALUES ('Mercury', 3, 0.1, false, 'It is the closest planet from the Sun', 'sun', 'mercury', 15);
INSERT INTO public.planet VALUES ('Uranus', 25, 0.1, false, 'It is visible as a blue-green point of light', 'sun', 'uranus', 16);
INSERT INTO public.planet VALUES ('Neptune', 26, 0.1, false, 'It has the strongest surface winds in the solar system', 'sun', 'neptune', 17);
INSERT INTO public.planet VALUES ('Ceres', 1, 0.1, false, 'It is the most water rich body in the inner solar system', 'sun', 'ceres', 18);
INSERT INTO public.planet VALUES ('Pluto', 2, 0.1, false, 'It is not considered a planet', 'sun', 'pluto', 19);
INSERT INTO public.planet VALUES ('Eris', 2, 0.1, false, 'It is the largest and most distant planet in the Solar System', 'sun', 'eris', 20);
INSERT INTO public.planet VALUES ('90377 Sedna', 3, 0.1, false, 'It was discovered in 2003 and is the outmost planet in the Solar System', 'sun', 'sedna', 21);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 0.1, 'About one million earths could fit inside the sun', false, 'milky way', 'sun', 6);
INSERT INTO public.star VALUES ('Mirach', 2.5, 'It is larger and more massive than our sun', false, 'andromeda', 'mirach', 7);
INSERT INTO public.star VALUES ('Beta Trianguli', 2.3, 'It is one of the three brightest starts in the Triangulum Galaxy', false, 'triangulum', 'beta trianguli', 8);
INSERT INTO public.star VALUES ('Tarantula Nebula', 200.0, 'It is a region in the galaxy were stars are formed', true, 'magellanic', 'tarantula', 9);
INSERT INTO public.star VALUES ('Siriu', 0.1, 'It is the brightest star in the night sky', false, 'milky way', 'sirius', 10);
INSERT INTO public.star VALUES ('Alpha Centauru A', 0.1, 'It is the brightest star in the Alpha Centauri star system', false, 'milky way', 'alpha centauri', 11);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: glue_glue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.glue_glue_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: glue glue_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.glue
    ADD CONSTRAINT glue_description_key UNIQUE (description);


--
-- Name: glue glue_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.glue
    ADD CONSTRAINT glue_pkey PRIMARY KEY (glue_id);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (planet_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (star_name);


--
-- Name: moon moon_planet_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_name_fkey FOREIGN KEY (planet_name) REFERENCES public.planet(planet_name);


--
-- Name: planet planet_star_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_name_fkey FOREIGN KEY (star_name) REFERENCES public.star(star_name);


--
-- Name: star star_galaxy_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_name_fkey FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- PostgreSQL database dump complete
--

