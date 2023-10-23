--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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

--
-- Name: TicketStatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."TicketStatus" AS ENUM (
    'RESERVED',
    'PAID'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Address" (
    id integer NOT NULL,
    cep character varying(255) NOT NULL,
    street character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    number character varying(255) NOT NULL,
    neighborhood character varying(255) NOT NULL,
    "addressDetail" character varying(255),
    "enrollmentId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Address_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Address_id_seq" OWNED BY public."Address".id;


--
-- Name: Booking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Booking" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "roomId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Booking_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Booking_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Booking_id_seq" OWNED BY public."Booking".id;


--
-- Name: Enrollment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Enrollment" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    cpf character varying(255) NOT NULL,
    birthday timestamp(3) without time zone NOT NULL,
    phone character varying(255) NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Enrollment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Enrollment_id_seq" OWNED BY public."Enrollment".id;


--
-- Name: Event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Event" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    "backgroundImageUrl" character varying(255) NOT NULL,
    "logoImageUrl" character varying(255) NOT NULL,
    "startsAt" timestamp(3) without time zone NOT NULL,
    "endsAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Event_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Event_id_seq" OWNED BY public."Event".id;


--
-- Name: Hotel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Hotel" (
    id integer NOT NULL,
    name text NOT NULL,
    image text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Hotel_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Hotel_id_seq" OWNED BY public."Hotel".id;


--
-- Name: Payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Payment" (
    id integer NOT NULL,
    "ticketId" integer NOT NULL,
    value integer NOT NULL,
    "cardIssuer" text NOT NULL,
    "cardLastDigits" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Payment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Payment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Payment_id_seq" OWNED BY public."Payment".id;


--
-- Name: Room; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Room" (
    id integer NOT NULL,
    name text NOT NULL,
    capacity integer NOT NULL,
    "hotelId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Room_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Room_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Room_id_seq" OWNED BY public."Room".id;


--
-- Name: Session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Session" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Session_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Session_id_seq" OWNED BY public."Session".id;


--
-- Name: Ticket; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Ticket" (
    id integer NOT NULL,
    "ticketTypeId" integer NOT NULL,
    "enrollmentId" integer NOT NULL,
    status public."TicketStatus" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: TicketType; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TicketType" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    "isRemote" boolean NOT NULL,
    "includesHotel" boolean NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: TicketType_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."TicketType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: TicketType_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."TicketType_id_seq" OWNED BY public."TicketType".id;


--
-- Name: Ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Ticket_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Ticket_id_seq" OWNED BY public."Ticket".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


--
-- Name: Address id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Address" ALTER COLUMN id SET DEFAULT nextval('public."Address_id_seq"'::regclass);


--
-- Name: Booking id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Booking" ALTER COLUMN id SET DEFAULT nextval('public."Booking_id_seq"'::regclass);


--
-- Name: Enrollment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Enrollment" ALTER COLUMN id SET DEFAULT nextval('public."Enrollment_id_seq"'::regclass);


--
-- Name: Event id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Event" ALTER COLUMN id SET DEFAULT nextval('public."Event_id_seq"'::regclass);


--
-- Name: Hotel id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Hotel" ALTER COLUMN id SET DEFAULT nextval('public."Hotel_id_seq"'::regclass);


--
-- Name: Payment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Payment" ALTER COLUMN id SET DEFAULT nextval('public."Payment_id_seq"'::regclass);


--
-- Name: Room id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Room" ALTER COLUMN id SET DEFAULT nextval('public."Room_id_seq"'::regclass);


--
-- Name: Session id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Session" ALTER COLUMN id SET DEFAULT nextval('public."Session_id_seq"'::regclass);


--
-- Name: Ticket id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Ticket" ALTER COLUMN id SET DEFAULT nextval('public."Ticket_id_seq"'::regclass);


--
-- Name: TicketType id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketType" ALTER COLUMN id SET DEFAULT nextval('public."TicketType_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Address; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Address" VALUES (1, '13506-555', 'Rua 11 A', 'Rio Claro', 'SP', '12', 'Vila Nova', '', 1, '2023-10-18 14:04:43.463', '2023-10-20 14:31:41.322');
INSERT INTO public."Address" VALUES (2, '13451-130', 'Rua Roraima', 'Santa Bárbara D''Oeste', 'SP', '13', 'Vila Grego II', '', 2, '2023-10-22 03:35:47.934', '2023-10-22 03:35:47.935');
INSERT INTO public."Address" VALUES (3, '13506-492', 'Avenida 58 A', 'Rio Claro', 'SP', '23', 'Vila Cristina', '', 3, '2023-10-23 16:34:58.451', '2023-10-23 16:34:58.451');


--
-- Data for Name: Booking; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Booking" VALUES (2, 1, 2, '2023-10-21 17:57:32.236', '2023-10-21 22:01:23.666');
INSERT INTO public."Booking" VALUES (3, 4, 3, '2023-10-23 16:41:26.958', '2023-10-23 16:41:09.617');


--
-- Data for Name: Enrollment; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Enrollment" VALUES (3, 'Usuário Teste-2', '10169227014', '1991-10-23 02:00:00', '(19) 99999-9999', 4, '2023-10-23 16:34:58.439', '2023-10-23 16:34:58.439');
INSERT INTO public."Enrollment" VALUES (1, 'Usuário Teste', '58173430292', '2002-10-18 03:00:00', '(19) 99999-9999', 1, '2023-10-18 14:04:43.448', '2023-10-23 16:47:45.009');
INSERT INTO public."Enrollment" VALUES (2, 'Usuário Teste 2', '11122227663', '1964-10-22 03:00:00', '(19) 99999-9999', 3, '2023-10-22 03:35:47.91', '2023-10-23 16:48:00.972');


--
-- Data for Name: Event; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Event" VALUES (1, 'Driven.t', 'linear-gradient(to right, #FA4098, #FFD77F)', 'https://files.driven.com.br/images/logo-rounded.png', '2023-10-18 13:15:54.263', '2023-11-08 13:15:54.263', '2023-10-18 13:15:54.265', '2023-10-18 13:15:54.266');


--
-- Data for Name: Hotel; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Hotel" VALUES (1, 'Hotel1', 'https://www.ahstatic.com/photos/8279_ho_00_p_1024x768.jpg', '2023-10-18 15:12:04.444', '2023-10-18 15:12:09.64');
INSERT INTO public."Hotel" VALUES (2, 'Hotel2', 'data:image/jpeg;base64,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', '2023-10-19 17:44:33.003', '2023-10-19 17:46:40.536');
INSERT INTO public."Hotel" VALUES (3, 'Hotel3', 'https://www.ahstatic.com/photos/1276_ho_00_p_1024x768.jpg', '2023-10-20 18:32:52.669', '2023-10-20 18:32:40.951');


--
-- Data for Name: Payment; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Payment" VALUES (1, 1, 50, '654156456', '132', '2023-10-18 15:32:10.358', '2023-10-18 15:31:45.408');


--
-- Data for Name: Room; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Room" VALUES (3, '102', 2, 1, '2023-10-19 15:00:20.779', '2023-10-21 17:53:55.79');
INSERT INTO public."Room" VALUES (4, '103', 3, 1, '2023-10-19 17:26:58.94', '2023-10-21 17:53:55.79');
INSERT INTO public."Room" VALUES (2, '101', 1, 1, '2023-10-18 15:22:24.517', '2023-10-23 16:38:14.418');
INSERT INTO public."Room" VALUES (1, '104', 2, 1, '2023-10-18 15:12:58.186', '2023-10-23 16:38:14.418');
INSERT INTO public."Room" VALUES (5, '101', 2, 2, '2023-10-20 14:33:33.892', '2023-10-23 16:40:20.709');
INSERT INTO public."Room" VALUES (6, '102', 3, 2, '2023-10-20 14:34:00.507', '2023-10-23 16:40:20.709');
INSERT INTO public."Room" VALUES (7, '101', 2, 3, '2023-10-20 18:33:16.472', '2023-10-23 16:40:20.709');


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Session" VALUES (1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5NzYzNzYwMH0.edGZmIO9DIGXNkAiDn79T3lxVWKR5xfr-OGfvvsTVkg', '2023-10-18 14:00:00.05', '2023-10-18 14:00:00.051');
INSERT INTO public."Session" VALUES (2, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5NzY0MTc1N30.rV0vzG30hKlTMCWHXRKEZjX-b0uJ3deUYwC1s_j8AIs', '2023-10-18 15:09:17.665', '2023-10-18 15:09:17.666');
INSERT INTO public."Session" VALUES (3, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5NzY0MjQzNX0.jhK2ugra43A245pvxs2RpfB1dQp5nBFBOY3zOPUhJE0', '2023-10-18 15:20:35.069', '2023-10-18 15:20:35.069');
INSERT INTO public."Session" VALUES (4, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5NzY2ODE3N30.90ryHIOederhs1WsRb1V0j4OOIiUvd4kD8veywooJcA', '2023-10-18 22:29:37.72', '2023-10-18 22:29:37.721');
INSERT INTO public."Session" VALUES (5, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5NzcxOTUzNH0.smHJluhkr4Cnji9bEsY7LSORBuYKfI3YSLjYINyAkdU', '2023-10-19 12:45:34.174', '2023-10-19 12:45:34.175');
INSERT INTO public."Session" VALUES (6, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5NzgxMjI4NX0.sjYCbwFwXvN8nVVCfzVf9bk4ic23H-NBqvDcdmfKnQM', '2023-10-20 14:31:25.977', '2023-10-20 14:31:25.978');
INSERT INTO public."Session" VALUES (7, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5NzgyNjI5NH0.yGECJXN75fzssF-0tNPhN8hWpYMU01C3AeA0URyOrBo', '2023-10-20 18:24:54.694', '2023-10-20 18:24:54.694');
INSERT INTO public."Session" VALUES (8, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5NzkwNzk0NH0.r3i4O7g1cztdfKDw-57ifXFm5WV5lcfvFhmScGp0PUs', '2023-10-21 17:05:44.342', '2023-10-21 17:05:44.342');
INSERT INTO public."Session" VALUES (9, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5Nzk0MzczNH0.ynVbg_e1H8UOhbtfXto3T50wwXBIu6lO4wJiBzxgQyg', '2023-10-22 03:02:14.233', '2023-10-22 03:02:14.234');
INSERT INTO public."Session" VALUES (10, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5Nzk0NDg5OX0.8vCb8vENWSG3ln5cUoORyZe2atd2j7jRnwzE0GAm1rY', '2023-10-22 03:21:39.734', '2023-10-22 03:21:39.734');
INSERT INTO public."Session" VALUES (11, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlhdCI6MTY5Nzk0NTY4OX0.8VDJn6DmP4HMR7Oo9T2oDFTxJJ4YQYieTOhi5DcJ5MM', '2023-10-22 03:34:49.385', '2023-10-22 03:34:49.385');
INSERT INTO public."Session" VALUES (12, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5Nzk0NTgwM30.CO6kIDdE9GzsacoSO9z-Rq3hZt4crlnXPFj4DJwQuSo', '2023-10-22 03:36:43.147', '2023-10-22 03:36:43.148');
INSERT INTO public."Session" VALUES (13, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5Nzk0Nzg0NH0.dIEk3l31cP5tiaadPQ3aVGx7HvblCe_voAJQIITjOfU', '2023-10-22 04:10:44.661', '2023-10-22 04:10:44.661');
INSERT INTO public."Session" VALUES (14, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5Nzk0ODE4OH0.DgLuneGrjWYhzUG7c2GJnArD1yGsfhRgaOQNcDjeGVs', '2023-10-22 04:16:28.843', '2023-10-22 04:16:28.843');
INSERT INTO public."Session" VALUES (15, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5Nzk0ODM5MH0.gt5L1xZuIGQZH_eMpIweMfkxsHztZIQ4TqJtI_Y7I8Y', '2023-10-22 04:19:50.942', '2023-10-22 04:19:50.943');
INSERT INTO public."Session" VALUES (16, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5Nzk0OTUyMn0.53uO8nqfLT1fG0OVeE0NvAtQXMcpromyjBv8ex0L42k', '2023-10-22 04:38:42.706', '2023-10-22 04:38:42.706');
INSERT INTO public."Session" VALUES (17, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5Nzk4Mzg2OX0.MhmcYt0FVrEfjdQYKiPYJW4uPYC_DoU-VSa9hJTA-IE', '2023-10-22 14:11:09.316', '2023-10-22 14:11:09.317');
INSERT INTO public."Session" VALUES (18, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5Nzk4NDQ3Mn0.pbaj9oktV3Za1x3CbpgP9HoZs1cf8L9vt3aViy2o9WA', '2023-10-22 14:21:12.44', '2023-10-22 14:21:12.441');
INSERT INTO public."Session" VALUES (19, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5Nzk5NzE2MH0.S4YRjW1bPFv3NMvjESMKQtbccpI0QUzT9PipRgm5hnA', '2023-10-22 17:52:40.706', '2023-10-22 17:52:40.707');
INSERT INTO public."Session" VALUES (20, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5ODAwNTgxOH0.BSSc4VleExnxE_IKSqhm1mdVg9RJWxXCxhT1YLpku4A', '2023-10-22 20:16:58.961', '2023-10-22 20:16:58.961');
INSERT INTO public."Session" VALUES (21, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5ODAwNzg1OX0.Diu3h1HJAwYb2UYhIEvZo3aCst_7ltSUxmP6Uxh6uU8', '2023-10-22 20:50:59.722', '2023-10-22 20:50:59.723');
INSERT INTO public."Session" VALUES (22, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsImlhdCI6MTY5ODA3ODc3MH0.78o7KHPxEJTL8gl3vBsuFEfeLpePwgSBYLwIUqHjW4E', '2023-10-23 16:32:50.397', '2023-10-23 16:32:50.398');
INSERT INTO public."Session" VALUES (23, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY5ODA3OTk4OX0.BGu2ZfjxMewTW_CPYEIjrKRJqJVhmBAb1Up_JYb8X5E', '2023-10-23 16:53:09.929', '2023-10-23 16:53:09.929');


--
-- Data for Name: Ticket; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Ticket" VALUES (1, 1, 1, 'PAID', '2023-10-18 15:31:11.796', '2023-10-20 14:41:34.989');
INSERT INTO public."Ticket" VALUES (2, 1, 3, 'PAID', '2023-10-23 16:36:02.961', '2023-10-23 16:37:15.764');


--
-- Data for Name: TicketType; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."TicketType" VALUES (1, 'tipo 1', 50, false, true, '2023-10-18 15:31:00.016', '2023-10-20 14:42:00.31');


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."User" VALUES (1, 'teste@teste.com', '$2b$12$TmiH9stNeYio5r1PT1ds2O.kdxXPsrhR94MmrRxqUwAFEk0Kqriw6', '2023-10-18 13:59:53.297', '2023-10-18 13:59:53.297');
INSERT INTO public."User" VALUES (2, 'teste2@teste.com', '$2b$12$NWo7bWqnbObZqZBbhK7noOzqS3r1xbvARJuDz32xWuMm0xRXJAvaa', '2023-10-22 03:33:37.546', '2023-10-22 03:33:37.547');
INSERT INTO public."User" VALUES (3, 'a@a.com', '$2b$12$hmeGEPbJCUaibbqx9HGRquwA9NGN41.yWzvjFHeCipRXRM/6wfVU2', '2023-10-22 03:34:40.908', '2023-10-22 03:34:40.908');
INSERT INTO public."User" VALUES (4, 'teste2@teste2.com', '$2b$12$k3MyBbQBi1ZZVmeH4LStdulsrPCyCszkg5gc3Or4tRJt3TnzbgoD6', '2023-10-23 16:32:36.55', '2023-10-23 16:32:36.551');


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public._prisma_migrations VALUES ('3a249c29-6e43-4e0c-b590-2b50037c7d98', '33aae9404e976450f09d32c6fc67583bb1a8089e4e8d3ffcec2a31ccce8585ff', '2023-10-18 10:14:37.975631-03', '20220519200857_init', NULL, NULL, '2023-10-18 10:14:37.967226-03', 1);
INSERT INTO public._prisma_migrations VALUES ('6548f65d-9233-47dd-be7d-e3647406f38a', '3f4020684504a59157f94d0d4eb827203f08c31281709131b03953a204aaaf94', '2023-10-18 10:14:38.075712-03', '20231004174502_one_booking_per_user', NULL, NULL, '2023-10-18 10:14:38.070871-03', 1);
INSERT INTO public._prisma_migrations VALUES ('c1f7860f-c1a4-4c40-93fd-12680b04f996', 'ba7c8810f0df555b56962c3041e14416cd17d65de471d78bf21b8b018bb49a42', '2023-10-18 10:14:37.981598-03', '20220521144316_create_session_table', NULL, NULL, '2023-10-18 10:14:37.97641-03', 1);
INSERT INTO public._prisma_migrations VALUES ('0bee836a-7ce0-4a72-bbe7-b3708a4e915a', 'ed1e5e8af722430f2786f7fbe89abebbad98939e43ba4c78628fbf8d076fa793', '2023-10-18 10:14:37.987261-03', '20220521144521_change_token_collumn_to_text_type_for_session_table', NULL, NULL, '2023-10-18 10:14:37.983057-03', 1);
INSERT INTO public._prisma_migrations VALUES ('9e3a4673-79d6-486c-81eb-db6d98add42b', 'dfe62bfeddd8ab53b2e50e36708deeb340d36f5ad32cbf9d59932b82a696e3ac', '2023-10-18 10:14:37.995907-03', '20220521170313_create_settings_table', NULL, NULL, '2023-10-18 10:14:37.98826-03', 1);
INSERT INTO public._prisma_migrations VALUES ('4325fa3e-fadd-48ec-9038-dce3da69b576', 'c14ccd3fb6c78d024941ecd61b4835ba1cb21b94dbb95abc4956009a794375cf', '2023-10-18 10:14:38.005981-03', '20220521172530_create_events_table', NULL, NULL, '2023-10-18 10:14:37.996696-03', 1);
INSERT INTO public._prisma_migrations VALUES ('1b9798ea-0127-401b-bea6-b0696e6bbb7d', '65a9f2d4602ec7b7b1fd2eaeb169ca528cfbe59b2f4d51e3b0344056c956c756', '2023-10-18 10:14:38.018359-03', '20220521191854_create_enrollment_and_adress_tables', NULL, NULL, '2023-10-18 10:14:38.007068-03', 1);
INSERT INTO public._prisma_migrations VALUES ('c86169d9-adb3-44e6-85c0-d9a2d10c084f', '1b637140d19eadd7ec8189e3339ec6350847ef801bd11d8d91968b9f80bd2f6a', '2023-10-18 10:14:38.027669-03', '20220521192104_rename_address_table', NULL, NULL, '2023-10-18 10:14:38.019312-03', 1);
INSERT INTO public._prisma_migrations VALUES ('1d23943e-0d83-4a25-b02d-32ae25509336', '4eb3418748144d88b6ac75bcdcf91027282833c012f735f4a91edd6e6ac07ec9', '2023-10-18 10:14:38.03116-03', '20220521192311_change_address_detail_column_type_to_not_requerired_for_address_table', NULL, NULL, '2023-10-18 10:14:38.028571-03', 1);
INSERT INTO public._prisma_migrations VALUES ('9138261c-2790-4105-a9d7-1d9390405f25', '3e0c34445b4f7f94fe19a01c512154b8f34472d49516ae6b02367d712acdaef6', '2023-10-18 10:14:38.036379-03', '20220522143837_change_user_id_collumn_in_enrollments_table_to_unique', NULL, NULL, '2023-10-18 10:14:38.031875-03', 1);
INSERT INTO public._prisma_migrations VALUES ('b089a773-37d4-4f9b-9b73-52559da5d1f4', '6620ae7b3d99518f4fe80a866e0a0d61c6d5187a178fe1ed11b5cbed277f9691', '2023-10-18 10:14:38.041999-03', '20220525152602_change_enrollmentid_on_address_to_unique', NULL, NULL, '2023-10-18 10:14:38.037462-03', 1);
INSERT INTO public._prisma_migrations VALUES ('189061b4-c002-40c1-9f66-f827d8cd01be', '4aa355b3606e1a4ec3d0eb1a8d22fc3ecccbefcd82a608145c27b26f88f3a303', '2023-10-18 10:14:38.056654-03', '20230918125850_tickets', NULL, NULL, '2023-10-18 10:14:38.042904-03', 1);
INSERT INTO public._prisma_migrations VALUES ('6567a288-672f-40ec-b03d-2f8e99f9f5d5', '0c37fd5dd680bb428544370252cb1739b590659b9c5102aafeaa10ea75a5df58', '2023-10-18 10:14:38.069785-03', '20230926194805_create_hotel', NULL, NULL, '2023-10-18 10:14:38.05757-03', 1);


--
-- Name: Address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Address_id_seq"', 3, true);


--
-- Name: Booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Booking_id_seq"', 3, true);


--
-- Name: Enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Enrollment_id_seq"', 3, true);


--
-- Name: Event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Event_id_seq"', 1, true);


--
-- Name: Hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Hotel_id_seq"', 3, true);


--
-- Name: Payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Payment_id_seq"', 1, true);


--
-- Name: Room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Room_id_seq"', 7, true);


--
-- Name: Session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Session_id_seq"', 23, true);


--
-- Name: TicketType_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."TicketType_id_seq"', 1, true);


--
-- Name: Ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Ticket_id_seq"', 2, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."User_id_seq"', 4, true);


--
-- Name: Address Address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_pkey" PRIMARY KEY (id);


--
-- Name: Booking Booking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Booking"
    ADD CONSTRAINT "Booking_pkey" PRIMARY KEY (id);


--
-- Name: Enrollment Enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Enrollment"
    ADD CONSTRAINT "Enrollment_pkey" PRIMARY KEY (id);


--
-- Name: Event Event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (id);


--
-- Name: Hotel Hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Hotel"
    ADD CONSTRAINT "Hotel_pkey" PRIMARY KEY (id);


--
-- Name: Payment Payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_pkey" PRIMARY KEY (id);


--
-- Name: Room Room_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT "Room_pkey" PRIMARY KEY (id);


--
-- Name: Session Session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);


--
-- Name: TicketType TicketType_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketType"
    ADD CONSTRAINT "TicketType_pkey" PRIMARY KEY (id);


--
-- Name: Ticket Ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Ticket"
    ADD CONSTRAINT "Ticket_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Address_enrollmentId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Address_enrollmentId_key" ON public."Address" USING btree ("enrollmentId");


--
-- Name: Booking_userId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Booking_userId_key" ON public."Booking" USING btree ("userId");


--
-- Name: Enrollment_userId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Enrollment_userId_key" ON public."Enrollment" USING btree ("userId");


--
-- Name: Payment_ticketId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Payment_ticketId_key" ON public."Payment" USING btree ("ticketId");


--
-- Name: Ticket_enrollmentId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Ticket_enrollmentId_key" ON public."Ticket" USING btree ("enrollmentId");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: Address Address_enrollmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_enrollmentId_fkey" FOREIGN KEY ("enrollmentId") REFERENCES public."Enrollment"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Booking Booking_roomId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Booking"
    ADD CONSTRAINT "Booking_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES public."Room"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Booking Booking_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Booking"
    ADD CONSTRAINT "Booking_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Enrollment Enrollment_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Enrollment"
    ADD CONSTRAINT "Enrollment_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Payment Payment_ticketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES public."Ticket"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Room Room_hotelId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT "Room_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES public."Hotel"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Session Session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Ticket Ticket_enrollmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Ticket"
    ADD CONSTRAINT "Ticket_enrollmentId_fkey" FOREIGN KEY ("enrollmentId") REFERENCES public."Enrollment"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Ticket Ticket_ticketTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Ticket"
    ADD CONSTRAINT "Ticket_ticketTypeId_fkey" FOREIGN KEY ("ticketTypeId") REFERENCES public."TicketType"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

