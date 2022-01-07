--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: project1_city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project1_city (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.project1_city OWNER TO postgres;

--
-- Name: project1_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project1_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project1_city_id_seq OWNER TO postgres;

--
-- Name: project1_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project1_city_id_seq OWNED BY public.project1_city.id;


--
-- Name: project1_usercity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project1_usercity (
    id bigint NOT NULL,
    city_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.project1_usercity OWNER TO postgres;

--
-- Name: project1_usersity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project1_usersity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project1_usersity_id_seq OWNER TO postgres;

--
-- Name: project1_usersity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project1_usersity_id_seq OWNED BY public.project1_usercity.id;


--
-- Name: project1_weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project1_weather (
    id bigint NOT NULL,
    updated timestamp with time zone NOT NULL,
    temp double precision NOT NULL,
    city_id bigint
);


ALTER TABLE public.project1_weather OWNER TO postgres;

--
-- Name: project1_weather_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project1_weather_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project1_weather_id_seq OWNER TO postgres;

--
-- Name: project1_weather_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project1_weather_id_seq OWNED BY public.project1_weather.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: project1_city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project1_city ALTER COLUMN id SET DEFAULT nextval('public.project1_city_id_seq'::regclass);


--
-- Name: project1_usercity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project1_usercity ALTER COLUMN id SET DEFAULT nextval('public.project1_usersity_id_seq'::regclass);


--
-- Name: project1_weather id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project1_weather ALTER COLUMN id SET DEFAULT nextval('public.project1_weather_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add weather	1	add_weather
2	Can change weather	1	change_weather
3	Can delete weather	1	delete_weather
4	Can view weather	1	view_weather
5	Can add city	2	add_city
6	Can change city	2	change_city
7	Can delete city	2	delete_city
8	Can view city	2	view_city
9	Can add user sity	3	add_usersity
10	Can change user sity	3	change_usersity
11	Can delete user sity	3	delete_usersity
12	Can view user sity	3	view_usersity
13	Can add log entry	4	add_logentry
14	Can change log entry	4	change_logentry
15	Can delete log entry	4	delete_logentry
16	Can view log entry	4	view_logentry
17	Can add permission	5	add_permission
18	Can change permission	5	change_permission
19	Can delete permission	5	delete_permission
20	Can view permission	5	view_permission
21	Can add group	6	add_group
22	Can change group	6	change_group
23	Can delete group	6	delete_group
24	Can view group	6	view_group
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add content type	8	add_contenttype
30	Can change content type	8	change_contenttype
31	Can delete content type	8	delete_contenttype
32	Can view content type	8	view_contenttype
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
37	Can add user city	3	add_usercity
38	Can change user city	3	change_usercity
39	Can delete user city	3	delete_usercity
40	Can view user city	3	view_usercity
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$QRkJe7afh9AQGRQfnSXxYL$TnfDlKb/wVi/viQcQNPNxTtUr1NpHindG/6qtyqaw/A=	2022-01-07 11:20:23.971526+00	t	wolper			prox@i.ua	t	t	2022-01-05 10:39:51.340828+00
2	pbkdf2_sha256$320000$6DoTs9txhsSTjSDvOPPvpm$hlOe3CPh6HLeXRBinNjRKQ+DLEUxy4U1WFcNFbxXe/c=	2022-01-07 15:09:04.98599+00	f	deda				f	t	2022-01-07 11:20:39.386908+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-01-07 11:20:39.677529+00	2	deda	1	[{"added": {}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	project1	weather
2	project1	city
4	admin	logentry
5	auth	permission
6	auth	group
7	auth	user
8	contenttypes	contenttype
9	sessions	session
3	project1	usercity
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-01-02 16:56:19.829051+00
2	auth	0001_initial	2022-01-02 16:56:19.881758+00
3	admin	0001_initial	2022-01-02 16:56:19.897972+00
4	admin	0002_logentry_remove_auto_add	2022-01-02 16:56:19.906115+00
5	admin	0003_logentry_add_action_flag_choices	2022-01-02 16:56:19.913987+00
6	contenttypes	0002_remove_content_type_name	2022-01-02 16:56:19.929237+00
7	auth	0002_alter_permission_name_max_length	2022-01-02 16:56:19.936062+00
8	auth	0003_alter_user_email_max_length	2022-01-02 16:56:19.944254+00
9	auth	0004_alter_user_username_opts	2022-01-02 16:56:19.951712+00
10	auth	0005_alter_user_last_login_null	2022-01-02 16:56:19.960133+00
11	auth	0006_require_contenttypes_0002	2022-01-02 16:56:19.961643+00
12	auth	0007_alter_validators_add_error_messages	2022-01-02 16:56:19.967833+00
13	auth	0008_alter_user_username_max_length	2022-01-02 16:56:19.978311+00
14	auth	0009_alter_user_last_name_max_length	2022-01-02 16:56:19.986743+00
15	auth	0010_alter_group_name_max_length	2022-01-02 16:56:19.994716+00
16	auth	0011_update_proxy_permissions	2022-01-02 16:56:20.000785+00
17	auth	0012_alter_user_first_name_max_length	2022-01-02 16:56:20.007358+00
18	project1	0001_initial	2022-01-02 16:56:20.011184+00
19	project1	0002_alter_weather_temp	2022-01-02 16:56:20.015183+00
20	project1	0003_city_usersity	2022-01-02 16:56:20.031596+00
21	sessions	0001_initial	2022-01-02 16:56:20.03955+00
22	project1	0004_auto_20220102_2016	2022-01-02 18:16:45.443391+00
23	project1	0005_alter_weather_city	2022-01-02 18:31:39.595642+00
24	project1	0006_alter_usercity_city	2022-01-02 18:47:12.618986+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: project1_city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project1_city (id, name) FROM stdin;
1	Kiev
2	Moscow
3	Brusyliv
4	Alicante
\.


--
-- Data for Name: project1_usercity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project1_usercity (id, city_id, user_id) FROM stdin;
\.


--
-- Data for Name: project1_weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project1_weather (id, updated, temp, city_id) FROM stdin;
207	2022-01-07 14:00:01.58378+00	-1.31	1
208	2022-01-07 14:00:01.588502+00	-5.6	2
209	2022-01-07 14:00:01.58908+00	-1.15	3
210	2022-01-07 14:00:01.589471+00	15.41	4
171	2022-01-04 22:00:00.399211+00	4.19	1
172	2022-01-04 22:00:00.403887+00	-6.45	2
173	2022-01-05 02:00:03.096835+00	5.03	1
174	2022-01-05 02:00:03.10072+00	-6.44	2
170	2022-01-04 18:00:00.299084+00	3.41	1
166	2022-01-04 02:00:00.358255+00	5.89	1
169	2022-01-04 14:00:01.59034+00	5.93	1
167	2022-01-04 06:00:00.21557+00	5.24	1
165	2022-01-03 22:00:00.383552+00	5.91	1
2	2021-12-04 19:30:03.019+00	-1.58	1
3	2021-12-05 03:00:00.609+00	-2.82	1
4	2021-12-05 09:00:02.23+00	-0.45	1
6	2021-12-05 15:00:02.639+00	-1.71	1
7	2021-12-06 03:00:02.962+00	-0.6	1
8	2021-12-06 09:00:00.591+00	0.04	1
9	2021-12-06 15:00:00.501+00	0.85	1
10	2021-12-06 21:00:00.478+00	1.14	1
11	2021-12-07 03:00:00.305+00	2.16	1
12	2021-12-07 09:00:01.358+00	1.39	1
13	2021-12-07 15:00:01.098+00	0.43	1
14	2021-12-07 21:00:00.389+00	0.18	1
15	2021-12-08 03:00:00.323+00	-0.58	1
16	2021-12-08 09:00:06.596+00	0.02	1
17	2021-12-08 17:00:00.539+00	0.01	1
18	2021-12-08 23:00:00.574+00	0.43	1
19	2021-12-09 05:00:01.409+00	0.54	1
20	2021-12-09 11:00:00.348+00	0.49	1
21	2021-12-09 18:00:03.008+00	1.27	1
22	2021-12-09 20:00:00.568+00	1.4	1
23	2021-12-09 22:00:00.776+00	2.13	1
24	2021-12-10 02:00:00.393+00	3.09	1
25	2021-12-10 06:00:00.421+00	4.21	1
26	2021-12-10 08:00:00+00	4.21	1
27	2021-12-10 12:00:00+00	5.76	1
28	2021-12-10 16:00:00+00	6.23	1
29	2021-12-10 20:00:02+00	7.05	1
30	2021-12-11 00:00:00+00	7.69	1
31	2021-12-11 04:00:00+00	7.33	1
32	2021-12-11 08:00:00+00	7.11	1
33	2021-12-11 12:00:00+00	6.57	1
34	2021-12-11 16:00:03+00	5.86	1
35	2021-12-11 20:00:04+00	6.91	1
36	2021-12-12 00:00:00+00	7.11	1
37	2021-12-12 04:00:00+00	6.63	1
38	2021-12-12 08:00:00+00	5.91	1
39	2021-12-12 12:00:00+00	4.25	1
40	2021-12-12 16:00:00+00	2.71	1
41	2021-12-12 19:08:22+00	1.72	1
47	2021-12-12 22:00:00.9969+00	1.12	1
48	2021-12-13 02:00:00.509101+00	1.15	1
49	2021-12-13 06:00:00.65558+00	1.29	1
50	2021-12-13 10:00:05.995606+00	0.91	1
51	2021-12-13 18:00:00.717441+00	1.01	1
52	2021-12-13 22:00:01.398949+00	0.98	1
53	2021-12-14 02:00:00.911499+00	0.83	1
54	2021-12-14 06:00:00.460056+00	0.43	1
55	2021-12-14 10:00:00.658643+00	0.99	1
56	2021-12-14 18:00:00.41923+00	1.02	1
57	2021-12-14 22:00:00.421319+00	0.91	1
58	2021-12-15 02:00:00.549642+00	0.32	1
59	2021-12-15 06:00:00.379938+00	0.25	1
60	2021-12-15 10:00:00.346075+00	0.19	1
61	2021-12-15 14:00:00.407785+00	-0.77	1
62	2021-12-15 18:00:00.619202+00	-0.45	1
63	2021-12-15 22:00:00.404323+00	0.22	1
64	2021-12-16 02:00:00.400843+00	0.28	1
65	2021-12-16 06:00:00.310741+00	0.25	1
66	2021-12-16 10:00:00.351679+00	1.27	1
67	2021-12-16 14:00:00.380325+00	2.95	1
68	2021-12-16 18:00:04.504074+00	3.84	1
69	2021-12-16 22:00:00.379039+00	3.86	1
70	2021-12-17 02:00:03.48887+00	3.73	1
71	2021-12-17 06:00:00.282589+00	2.95	1
72	2021-12-17 10:00:03.601633+00	3.3	1
73	2021-12-17 14:00:02.289787+00	2.86	1
74	2021-12-17 18:00:00.428454+00	2.16	1
75	2021-12-17 22:00:00.359734+00	1.16	1
76	2021-12-18 02:00:00.327558+00	1.07	1
77	2021-12-18 06:00:00.444546+00	0.42	1
78	2021-12-18 10:00:00.384112+00	-0.01	1
79	2021-12-18 14:00:01.366327+00	-0.01	1
80	2021-12-18 18:00:01.651534+00	-0.46	1
81	2021-12-18 22:00:02.134508+00	0.2	1
82	2021-12-19 02:00:00.399562+00	1.02	1
83	2021-12-19 06:00:01.360776+00	1.21	1
84	2021-12-19 10:00:00.659701+00	1.27	1
85	2021-12-19 14:00:00.53421+00	3.06	1
86	2021-12-19 18:00:00.73773+00	2.16	1
87	2021-12-19 22:00:00.732878+00	1.15	1
88	2021-12-20 02:00:00.827288+00	0.5	1
89	2021-12-20 06:00:00.433275+00	0.2	1
90	2021-12-20 10:00:01.079569+00	1.15	1
91	2021-12-20 18:00:00.668948+00	-2.33	1
92	2021-12-20 22:00:00.384933+00	-2.76	1
93	2021-12-21 02:00:00.425323+00	-4.8	1
94	2021-12-21 06:00:00.359539+00	-6.51	1
95	2021-12-21 10:00:00.383471+00	-9.24	1
96	2021-12-21 14:00:04.591242+00	-9.5	1
97	2021-12-21 18:00:03.429253+00	-9.64	1
98	2021-12-21 22:00:00.391553+00	-10.53	1
99	2021-12-22 02:00:00.382158+00	-11.3	1
100	2021-12-22 06:00:00.390906+00	-11.51	1
101	2021-12-22 10:00:03.691784+00	-9.69	1
102	2021-12-23 12:00:00+00	-10.5	1
103	2021-12-23 14:00:00.190414+00	-10.32	1
104	2021-12-23 18:00:00.207816+00	-11.84	1
105	2021-12-23 22:00:00.224676+00	-11.84	1
106	2021-12-24 02:00:00.191007+00	-10.77	1
107	2021-12-24 06:00:00.191053+00	-10.46	1
108	2021-12-24 10:00:00.187877+00	-6.24	1
109	2021-12-24 14:00:01.190331+00	-4.8	1
110	2021-12-24 18:00:02.67273+00	-4.01	1
111	2021-12-24 22:00:00.207502+00	-0.91	1
112	2021-12-25 02:00:01.803896+00	2.51	1
113	2021-12-25 06:00:00.358807+00	1.18	1
114	2021-12-25 10:00:03.273635+00	0.63	1
115	2021-12-25 14:00:00.215217+00	-1.96	1
116	2021-12-25 18:00:16.911098+00	-4.69	1
117	2021-12-25 22:00:00.183048+00	-5.29	1
118	2021-12-26 02:00:00.33647+00	-7.32	1
119	2021-12-26 06:00:00.457632+00	-8.69	1
120	2021-12-26 10:00:02.019145+00	-4.5	1
121	2021-12-26 14:00:00.181061+00	-3.43	1
122	2021-12-26 22:00:00.329625+00	-6.46	1
123	2021-12-27 02:00:00.724708+00	-6.6	1
124	2021-12-27 06:00:00.171141+00	-6.38	1
125	2021-12-27 10:00:01.394589+00	-6.28	1
126	2021-12-27 14:00:00.170408+00	-5.64	1
127	2021-12-27 18:00:00.183302+00	-6.24	1
128	2021-12-27 22:00:00.214077+00	-6.76	1
129	2021-12-28 02:00:00.270311+00	-6.37	1
130	2021-12-28 06:00:00.322403+00	-6.7	1
131	2021-12-28 10:00:00.387766+00	-5.9	1
132	2021-12-28 14:00:00.440558+00	-5.62	1
133	2021-12-28 18:00:00.203375+00	-6.64	1
134	2021-12-28 22:00:00.197012+00	-6.96	1
135	2021-12-29 02:00:00.273486+00	-6.52	1
136	2021-12-29 06:00:00.477596+00	-6.13	1
137	2021-12-29 10:00:00.185744+00	-5.1	1
138	2021-12-29 14:00:09.082603+00	-4.74	1
139	2021-12-29 18:00:00.199653+00	-5.1	1
140	2021-12-29 22:00:00.225577+00	-4.93	1
141	2021-12-30 02:00:00.093834+00	-5.08	1
142	2021-12-30 06:00:00.178023+00	-5.08	1
143	2021-12-30 10:00:01.635248+00	-4.09	1
144	2021-12-30 14:00:03.701084+00	-4.09	1
145	2021-12-30 18:00:00.171643+00	-4.09	1
146	2021-12-30 22:00:01.231359+00	-4.09	1
147	2021-12-31 02:00:00.182379+00	-3.03	1
148	2021-12-31 06:00:00.196757+00	-1.67	1
149	2021-12-31 10:00:00.177519+00	0.99	1
150	2021-12-31 14:00:00.179937+00	2.09	1
151	2021-12-31 18:00:00.194705+00	2.28	1
152	2021-12-31 22:00:00.227553+00	3.18	1
153	2022-01-01 02:00:00.286739+00	4.53	1
154	2022-01-01 06:00:01.858329+00	6.67	1
155	2022-01-01 10:00:00.664646+00	5.91	1
156	2022-01-01 14:00:01.080459+00	6.08	1
157	2022-01-01 18:00:00.240286+00	4.99	1
158	2022-01-01 22:00:00.191945+00	3.36	1
159	2022-01-02 06:00:02.291113+00	-2.09	1
160	2022-01-02 22:00:02.396921+00	-0.75	1
161	2022-01-03 02:00:01.028093+00	1.59	1
162	2022-01-03 06:00:08.274268+00	4.09	1
163	2022-01-03 10:00:01.206988+00	7.24	1
164	2022-01-03 14:00:00.182471+00	7.97	1
168	2022-01-04 10:00:00.218589+00	6.2	1
175	2022-01-05 06:00:00.308803+00	7.04	1
176	2022-01-05 06:00:00.311836+00	-5.62	2
177	2022-01-05 22:00:05.072006+00	4.7	1
178	2022-01-05 22:00:05.077665+00	-2.55	2
179	2022-01-05 22:00:05.078008+00	3.89	3
180	2022-01-06 02:00:00.604016+00	4.27	1
181	2022-01-06 02:00:00.607879+00	-0.19	2
182	2022-01-06 02:00:00.60818+00	3.89	3
183	2022-01-06 06:00:44.535077+00	4.15	1
185	2022-01-06 06:00:44.543399+00	3.89	3
186	2022-01-06 10:00:00.7293+00	3.24	1
187	2022-01-06 10:00:00.734174+00	0.06	2
188	2022-01-06 10:00:00.734501+00	1.82	3
184	2022-01-06 06:00:44.542434+00	-1.5	2
189	2022-01-06 14:00:00.42243+00	2.99	1
190	2022-01-06 14:00:00.42535+00	0.19	2
191	2022-01-06 14:00:00.425619+00	2.84	3
192	2022-01-06 18:00:00.37738+00	2.07	1
193	2022-01-06 18:00:00.380163+00	-0.51	2
194	2022-01-06 18:00:00.380596+00	1.78	3
195	2022-01-06 22:00:00.665622+00	1.45	1
196	2022-01-06 22:00:00.668942+00	0.25	2
197	2022-01-06 22:00:00.669262+00	0.73	3
198	2022-01-07 02:00:01.497477+00	1.39	1
199	2022-01-07 02:00:01.500334+00	-1.43	2
200	2022-01-07 02:00:01.500631+00	0.73	3
201	2022-01-07 06:00:02.476113+00	-0.38	1
202	2022-01-07 06:00:02.480924+00	-2.43	2
203	2022-01-07 06:00:02.48132+00	-1.11	3
204	2022-01-07 10:00:00.794743+00	-0.56	1
205	2022-01-07 10:00:00.797695+00	-5.64	2
206	2022-01-07 10:00:00.798008+00	-1.11	3
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: project1_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project1_city_id_seq', 4, true);


--
-- Name: project1_usersity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project1_usersity_id_seq', 1, false);


--
-- Name: project1_weather_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project1_weather_id_seq', 210, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: project1_city project1_city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project1_city
    ADD CONSTRAINT project1_city_pkey PRIMARY KEY (id);


--
-- Name: project1_usercity project1_usersity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project1_usercity
    ADD CONSTRAINT project1_usersity_pkey PRIMARY KEY (id);


--
-- Name: project1_usercity project1_usersity_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project1_usercity
    ADD CONSTRAINT project1_usersity_user_id_key UNIQUE (user_id);


--
-- Name: project1_weather project1_weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project1_weather
    ADD CONSTRAINT project1_weather_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: project1_usercity_city_id_8a1eaf7f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX project1_usercity_city_id_8a1eaf7f ON public.project1_usercity USING btree (city_id);


--
-- Name: project1_weather_city_id_506540ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX project1_weather_city_id_506540ed ON public.project1_weather USING btree (city_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project1_usercity project1_usercity_city_id_8a1eaf7f_fk_project1_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project1_usercity
    ADD CONSTRAINT project1_usercity_city_id_8a1eaf7f_fk_project1_city_id FOREIGN KEY (city_id) REFERENCES public.project1_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project1_usercity project1_usersity_user_id_3cf5bd45_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project1_usercity
    ADD CONSTRAINT project1_usersity_user_id_3cf5bd45_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project1_weather project1_weather_city_id_506540ed_fk_project1_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project1_weather
    ADD CONSTRAINT project1_weather_city_id_506540ed_fk_project1_city_id FOREIGN KEY (city_id) REFERENCES public.project1_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

