--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-02-21 21:14:20

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
-- TOC entry 217 (class 1259 OID 24707)
-- Name: matches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matches (
    id_match smallint NOT NULL,
    id_home smallint NOT NULL,
    id_away smallint NOT NULL,
    id_stadium smallint NOT NULL,
    date_time timestamp without time zone NOT NULL,
    attendance integer NOT NULL
);


ALTER TABLE public.matches OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24695)
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id_player smallint NOT NULL,
    id_team smallint NOT NULL,
    kit_name character varying(15) NOT NULL,
    age smallint NOT NULL,
    "position" character varying(10) NOT NULL,
    country character varying(32) NOT NULL,
    CONSTRAINT players_kit_check CHECK (((age >= 1) AND (age <= 99))),
    CONSTRAINT players_position_check CHECK (((("position")::text = 'Goalkeeper'::text) OR (("position")::text = 'Defender'::text) OR (("position")::text = 'Midfielder'::text) OR (("position")::text = 'Forward'::text)))
);


ALTER TABLE public.players OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24727)
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.results (
    id_match smallint NOT NULL,
    home smallint NOT NULL,
    away smallint NOT NULL,
    CONSTRAINT results_away_check CHECK ((away >= 0)),
    CONSTRAINT results_home_check CHECK ((home >= 0))
);


ALTER TABLE public.results OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24739)
-- Name: scores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scores (
    id_score smallint NOT NULL,
    id_match smallint NOT NULL,
    id_team smallint NOT NULL,
    id_player smallint NOT NULL,
    goals smallint NOT NULL,
    assists smallint NOT NULL,
    CONSTRAINT scores_assists_check CHECK ((assists >= 0)),
    CONSTRAINT scores_goals_check CHECK ((goals >= 0))
);


ALTER TABLE public.scores OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24677)
-- Name: stadiums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stadiums (
    id_stadium smallint NOT NULL,
    full_name character varying(32) NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.stadiums OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24682)
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id_team smallint NOT NULL,
    id_stadium smallint,
    club character varying(25) NOT NULL,
    shorthand character varying(3) NOT NULL,
    CONSTRAINT teams_shorthand_check CHECK ((length((shorthand)::text) = 3))
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- TOC entry 3367 (class 0 OID 24707)
-- Dependencies: 217
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matches (id_match, id_home, id_away, id_stadium, date_time, attendance) FROM stdin;
1	1	2	1	2018-11-03 16:30:00	69454
2	3	4	3	2018-11-03 18:00:00	59470
3	5	6	5	2018-11-03 20:30:00	13126
4	7	8	7	2018-11-04 16:30:00	32804
5	9	10	9	2018-11-04 18:00:00	38592
6	11	12	11	2018-11-04 20:30:00	30800
7	2	4	2	2018-11-10 16:30:00	85623
8	3	1	3	2018-11-10 18:00:00	40087
9	6	8	6	2018-11-10 20:30:00	28975
10	7	5	7	2018-11-11 16:30:00	31047
11	10	12	10	2018-11-11 18:00:00	44144
12	11	9	11	2018-11-11 20:30:00	26789
13	4	1	4	2018-11-17 16:30:00	25639
14	2	3	2	2018-11-17 18:00:00	77548
15	8	5	8	2018-11-17 20:30:00	40065
16	6	7	6	2018-11-18 16:30:00	27895
17	12	9	12	2018-11-18 18:00:00	42369
18	10	11	10	2018-11-18 20:30:00	21085
19	1	6	1	2018-11-24 16:30:00	78502
20	4	11	4	2018-11-24 18:00:00	52104
21	5	10	5	2018-11-24 20:30:00	13126
22	8	3	8	2018-11-25 16:30:00	44987
23	9	7	9	2018-11-25 18:00:00	40071
24	12	2	12	2018-11-25 20:30:00	38565
\.


--
-- TOC entry 3366 (class 0 OID 24695)
-- Dependencies: 216
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id_player, id_team, kit_name, age, "position", country) FROM stdin;
101	1	Ramsdale	24	Goalkeeper	England
102	1	Saliba	21	Defender	France
103	1	Magalhaes	25	Defender	Brazil
104	1	White	25	Defender	England
105	1	Zinchenko	26	Defender	Ukraine
106	1	Partey	29	Midfielder	Ghana
107	1	Xhaka	30	Midfielder	Switzerland
108	1	Odegaard	24	Midfielder	Norway
109	1	Martinelli	21	Midfielder	Brazil
110	1	Jesus	25	Forward	Brazil
111	1	Nketiah	23	Forward	England
201	2	Martinez	30	Goalkeeper	Argentina
202	2	Konsa	25	Defender	England
203	2	Mings	29	Defender	England
204	2	Moreno	29	Defender	Spain
205	2	Cash	25	Defender	Poland
206	2	Camara	23	Midfielder	France
207	2	Coutinho	30	Midfielder	Brazil
208	2	McGinn	28	Midfielder	Scotland
209	2	Luiz	24	Midfielder	Brazil
210	2	Buendia	26	Forward	Argentina
211	2	Watkins	27	Forward	England
301	3	Neto	33	Goalkeeper	Brazil
302	3	Senesi	25	Defender	Argentina
303	3	Stephens	29	Defender	England
304	3	Smith	31	Defender	England
305	3	Zemura	23	Defender	Zimbabwe
306	3	Billing	26	Midfielder	Switzerland
307	3	Lerma	28	Midfielder	Colombia
308	3	Traore	23	Midfielder	Pantai Gading
309	3	Tavernier	23	Midfielder	England
310	3	Ouattara	21	Forward	Burkina Faso
311	3	Solanke	25	Forward	England
401	4	Raya	27	Goalkeeper	Spain
402	4	Mee	33	Defender	England
403	4	Pinnock	29	Defender	Jamaica
404	4	Hickey	20	Defender	Scotland
405	4	Henry	25	Defender	England
406	4	Norgaard	28	Midfielder	Switzerland
407	4	Jensen	27	Midfielder	Switzerland
408	4	Dasilva	24	Midfielder	England
409	4	Mbeumo	23	Midfielder	Cameroon
410	4	Toney	26	Forward	England
411	4	Wissa	26	Forward	DR Congo
501	5	Sanchez	25	Goalkeeper	Spain
502	5	Webtster	28	Defender	England
503	5	Dunk	31	Defender	England
504	5	Estupinan	25	Defender	Ecuador
505	5	Veltman	31	Defender	Netherlands
506	5	Grob	31	Midfielder	Germany
507	5	Caicedo	21	Midfielder	Ecuador
508	5	Mac Allister	24	Midfielder	Argentina
509	5	March	28	Midfielder	England
510	5	Mitoma	25	Forward	Japan
511	5	Ferguson	18	Forward	Ireland
601	6	Arrizabalaga	28	Goalkeeper	Spain
602	6	Koulibaly	31	Defender	Senegal
603	6	Badiashile	21	Defender	France
604	6	Chilwell	26	Defender	England
605	6	Azpilicueta	33	Defender	Spain
606	6	Fernandez	22	Midfielder	Argentina
607	6	Kovacic	28	Midfielder	Kroasia
608	6	Joao Felix	23	Midfielder	Portugal
609	6	Madueke	20	Midfielder	England
610	6	Mount	24	Forward	England
611	6	Fofana	20	Forward	Pantai Gading
701	7	Guaita	36	Goalkeeper	Spain
702	7	Andersen	26	Defender	Switzerland
703	7	Guehi	22	Defender	England
704	7	Mitchell	23	Defender	England
705	7	Clyne	31	Defender	England
706	7	Doucoure	23	Midfielder	Mali
707	7	Lokonga	23	Midfielder	Belgium
708	7	Olise	21	Midfielder	France
709	7	Schlupp	30	Midfielder	Ghana
710	7	Ayew	31	Forward	Ghana
711	7	Mateta	25	Forward	France
801	8	Pickford	28	Goalkeeper	England
802	8	Coady	29	Defender	England
803	8	Tarkowski	30	Defender	England
804	8	Mykolenko	23	Defender	Ukraine
805	8	Coleman	34	Defender	Ireland
806	8	Doucoure	30	Midfielder	Mali
807	8	Onana	21	Midfielder	Belgium
808	8	Gueye	33	Midfielder	Senegal
809	8	McNeil	23	Midfielder	England
810	8	Iwobi	26	Forward	Nigeria
811	8	Maupay	26	Forward	France
901	9	Leno	30	Goalkeeper	Germany
902	9	Diop	26	Defender	France
903	9	Ream	35	Defender	US
904	9	Robinson	25	Defender	US
905	9	Tete	27	Defender	Netherlands
906	9	Palinha	27	Midfielder	Portugal
907	9	Reed	28	Midfielder	England
908	9	Pereira	27	Midfielder	Brazil
909	9	Wilson	25	Midfielder	Wales
910	9	Willian	34	Forward	Brazil
911	9	De Cordova	30	Forward	Jamaica
1001	10	Meslier	22	Goalkeeper	France
1002	10	Wober	25	Defender	Denmark
1003	10	Koch	26	Defender	Germany
1004	10	Ayling	31	Defender	England
1005	10	Firpo	26	Defender	England
1006	10	McKennie	24	Midfielder	US
1007	10	Adams	24	Midfielder	US
1008	10	Harrison	26	Midfielder	England
1009	10	Summerville	21	Midfielder	Netherlands
1010	10	Gnonto	19	Forward	Italy
1011	10	Bamford	29	Forward	England
1101	11	Ward	29	Goalkeeper	Wales
1102	11	Faes	24	Defender	Belgium
1103	11	Souttar	24	Defender	Australia
1104	11	Castagne	27	Defender	Belgium
1105	11	Kristiansen	20	Defender	Denmark
1106	11	Mendy	30	Midfielder	Senegal
1107	11	Maddison	26	Midfielder	England
1108	11	Dewsbury	24	Midfielder	England
1109	11	Barnes	25	Midfielder	England
1110	11	Tete	23	Forward	Brazil
1111	11	Iheanacho	26	Forward	Nigeria
1301	13	Ederson	29	Goalkeeper	Brazil
1302	13	Laporte	28	Defender	Spain
1303	13	Dias	25	Defender	Portugal
1304	13	Walker	32	Defender	England
1305	13	Rodri	26	Defender	Spain
1306	13	Silva	28	Midfielder	Portugal
1307	13	Grealish	27	Midfielder	England
1308	13	Foden	22	Midfielder	England
1309	13	De Bruyne	31	Midfielder	Belgium
1310	13	Gundogan	32	Forward	Germany
1311	13	Haaland	22	Forward	Norway
1401	14	De Gead	32	Goalkeeper	Spain
1402	14	Martinez	25	Defender	Argentina
1403	14	Varane	29	Defender	France
1404	14	Shaw	27	Defender	England
1405	14	Dalot	23	Defender	Portugal
1406	14	Sabitzer	28	Midfielder	Austria
1407	14	Casemiro	30	Midfielder	Brazil
1408	14	Fernandes	28	Midfielder	Portugal
1409	14	Garnacho	18	Midfielder	Argentina
1410	14	Weghorst	30	Forward	Netherlands
1411	14	Rashford	25	Forward	England
1501	15	Pope	30	Goalkeeper	England
1502	15	Botman	23	Defender	Netherlands
1503	15	Schar	31	Defender	Switzerland
1504	15	Burn	30	Defender	England
1505	15	Trippier	32	Defender	England
1506	15	Joelinton	26	Midfielder	Brazil
1507	15	Longstaff	22	Midfielder	England
1508	15	Anderson	20	Midfielder	Scotland
1509	15	Almiron	29	Midfielder	Paraguay
1510	15	Saint-Maxima	25	Forward	France
1511	15	Isak	23	Forward	Swedia
1601	16	Navas	36	Goalkeeper	Costa Rica
1602	16	Felipe	33	Defender	Brazil
1603	16	Worrall	26	Defender	England
1604	16	Aurier	30	Defender	Pantai Gading
1605	16	Lodi	24	Defender	Brazil
1606	16	Shelvey	30	Midfielder	England
1607	16	Freuler	30	Midfielder	Switzerland
1608	16	Colback	33	Midfielder	England
1609	16	Danilo	21	Midfielder	Brazil
1610	16	Gibbs-White	23	Forward	England
1611	16	Johnson	21	Forward	Wales
1701	17	Bazunu	21	Goalkeeper	Ireland
1702	17	Bella-Kotchap	21	Defender	Germany
1703	17	Bednarek	26	Defender	Poland
1704	17	Maitland-Niles	25	Defender	England
1705	17	Perraud	25	Defender	France
1706	17	Ward-Prowse	28	Midfielder	England
1707	17	Lavia	19	Midfielder	Belgium
1708	17	Armstrong	26	Midfielder	England
1709	17	Elyounoussi	28	Midfielder	Denmark
1710	17	Onuachu	28	Forward	Nigeria
1711	17	Sulemana	21	Forward	Ghana
1801	18	Forster	34	Goalkeeper	England
1802	18	Lenglet	27	Defender	France
1803	18	Romero	24	Defender	Argentina
1804	18	Dier	29	Defender	England
1805	18	Hojbjerg	27	Defender	Denmark
1806	18	Skipp	22	Midfielder	England
1807	18	Emerson	24	Midfielder	Brazil
1808	18	Son	30	Midfielder	South Korea
1809	18	Kulusevski	22	Midfielder	Swedia
1810	18	Richalison	25	Forward	Brazil
1811	18	Kane	29	Forward	England
1901	19	Fabianski	37	Goalkeeper	Poland
1902	19	Aguerd	26	Defender	Morocco
1903	19	Ogbonna	34	Defender	Italy
1904	19	Kehrer	26	Defender	Germany
1905	19	Soucek	27	Defender	Czech Republic
1906	19	Rice	24	Midfielder	England
1907	19	Emerson	28	Midfielder	Italy
1908	19	Coufal	30	Midfielder	Czech Republic
1909	19	Downes	24	Midfielder	England
1910	19	Bowen	26	Forward	England
1911	19	Antonio	32	Forward	Jamaica
2001	20	Sa	30	Goalkeeper	Portugal
2002	20	Kilman	25	Defender	England
2003	20	Dawson	32	Defender	England
2004	20	Semedo	29	Defender	Portugal
2005	20	Bueno	20	Defender	Spain
2006	20	Matheus Nunes	24	Midfielder	Portugal
2007	20	Neves	25	Midfielder	Portugal
2008	20	Moutinho	36	Midfielder	Portugal
2009	20	Traore	27	Midfielder	Spain
2010	20	Sarabia	30	Forward	Spain
2011	20	Cunha	23	Forward	Brazil
1201	12	Alisson	30	Goalkeeper	Brazil
1202	12	Gomez	25	Defender	England
1203	12	Van Dijk	31	Defender	Netherlands
1204	12	A. Arnold	24	Defender	England
1205	12	Robertson	28	Defender	Scotland
1206	12	Fabinho	29	Midfielder	Brazil
1207	12	Henderson	32	Midfielder	England
1208	12	Bajcetic	18	Midfielder	Spain
1209	12	Nunez	23	Midfielder	Uruguay
1210	12	Mohamed Salah	30	Forward	Egypt
1211	12	Gakpo	23	Forward	Netherlands
\.


--
-- TOC entry 3368 (class 0 OID 24727)
-- Dependencies: 218
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.results (id_match, home, away) FROM stdin;
1	4	1
2	1	2
3	1	1
4	3	3
5	2	0
6	1	1
7	2	0
8	0	3
9	0	3
10	4	0
11	1	1
12	2	2
13	0	3
14	2	0
15	3	1
16	0	5
17	0	0
18	0	1
19	3	0
20	0	2
21	0	0
22	3	0
23	2	5
24	0	1
\.


--
-- TOC entry 3369 (class 0 OID 24739)
-- Dependencies: 219
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scores (id_score, id_match, id_team, id_player, goals, assists) FROM stdin;
1	1	1	109	0	1
2	1	1	108	1	2
3	1	1	110	1	0
4	1	1	111	2	1
5	1	2	209	0	1
6	1	2	208	1	0
7	2	3	309	0	1
8	2	3	310	1	0
9	2	4	411	0	1
10	2	4	410	0	1
11	2	4	409	1	0
12	2	4	410	1	0
13	3	5	509	0	1
14	3	5	510	1	0
15	3	6	611	0	1
16	3	6	611	1	0
17	4	7	709	0	1
18	4	7	708	0	1
19	4	7	710	1	1
20	4	7	711	2	0
21	4	8	811	0	1
22	4	8	810	0	1
23	4	8	806	0	1
24	4	8	808	1	0
25	4	8	809	1	0
26	4	8	810	1	0
27	5	9	907	0	1
28	5	9	910	0	1
29	5	9	911	2	0
30	6	11	1108	0	1
31	6	11	1109	1	0
32	6	12	1210	1	0
33	7	2	209	0	1
34	7	2	210	0	1
35	7	2	211	2	0
36	8	1	109	0	1
37	8	1	111	0	2
38	8	1	108	1	0
39	8	1	107	1	0
40	8	1	111	1	0
41	9	8	805	0	1
42	9	8	806	1	1
43	9	8	809	2	1
44	10	7	710	0	2
45	10	7	711	0	1
46	10	7	708	2	1
47	10	7	709	2	0
48	11	10	1009	1	0
49	11	10	1010	0	1
50	11	12	1207	1	0
51	12	11	1011	1	0
52	12	11	1109	0	2
53	12	11	1108	1	0
54	12	9	909	0	2
55	12	9	910	1	0
56	12	9	911	1	0
57	13	1	109	0	1
58	13	1	108	0	1
59	13	1	111	0	1
60	13	1	107	3	0
61	14	2	209	0	1
62	14	2	208	1	0
63	14	2	211	0	1
64	14	2	211	1	0
65	15	5	508	1	0
66	15	8	807	0	1
67	15	8	804	0	1
68	15	8	805	1	0
69	15	8	807	1	1
70	15	8	810	1	0
71	16	7	709	0	1
72	16	7	708	0	1
73	16	7	710	0	1
74	16	7	710	1	0
75	16	7	709	1	1
76	16	7	710	3	1
77	18	11	1111	1	0
78	19	1	109	0	1
79	19	1	108	1	1
80	19	1	110	1	1
81	19	1	111	1	0
82	20	11	1111	0	1
83	20	11	1110	0	1
84	20	11	1108	1	0
85	20	11	1109	1	0
86	22	8	805	0	1
87	22	8	806	0	1
88	22	8	807	2	0
89	22	8	809	1	1
90	23	7	709	0	1
91	23	7	710	0	1
92	23	7	711	2	0
93	23	9	909	1	1
94	23	9	908	1	1
95	23	9	910	1	1
96	23	9	908	1	0
97	23	9	909	1	1
98	24	2	210	1	0
\.


--
-- TOC entry 3364 (class 0 OID 24677)
-- Dependencies: 214
-- Data for Name: stadiums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stadiums (id_stadium, full_name, capacity) FROM stdin;
1	Emirates Stadium	80018
2	Villa Park	42657
3	Dean Court	11307
4	Qtech Community Stadium	17250
5	Falmer Stadium	31780
6	Stamford Bridge	40343
7	Selhurst Park	25486
8	Goodison Park	39414
9	Craven Cottage	22384
10	Elland Road	37608
11	Filbert Street	22000
12	Anfield	53394
13	Etihad Stadium	53400
14	Old Trafford	74310
15	St James Park	52305
16	City Ground	30332
17	St Marry Stadium	32334
18	White Hart Lane	36284
19	Upton Park	35345
20	Molineux Stadium	31750
\.


--
-- TOC entry 3365 (class 0 OID 24682)
-- Dependencies: 215
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id_team, id_stadium, club, shorthand) FROM stdin;
1	1	Arsenal	ARS
2	2	Aston Villa	AST
3	3	Bournemouth	BOR
4	4	Brenford	BRE
5	5	Brighton	BRT
6	6	Chelsea	CHE
7	7	Crystal Palace	CRY
8	8	Everton	EVE
9	9	Fulham	FUL
10	10	Leeds United	LEE
11	11	Leicester City	LEI
12	12	Liverpool	LIV
13	13	Manchester City	MCT
14	14	Mancheter United	MUN
15	15	Newcastle United	NEW
16	16	Nottingham Forest	NOT
17	17	Southampton	SOT
18	18	Tottenham Hotspur	TOT
19	19	West Ham United	WES
20	20	Wolverhampthon	WOL
\.


--
-- TOC entry 3208 (class 2606 OID 24711)
-- Name: matches matches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id_match);


--
-- TOC entry 3206 (class 2606 OID 24701)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id_player);


--
-- TOC entry 3210 (class 2606 OID 24733)
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id_match);


--
-- TOC entry 3212 (class 2606 OID 24745)
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id_score);


--
-- TOC entry 3200 (class 2606 OID 24681)
-- Name: stadiums stadiums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stadiums
    ADD CONSTRAINT stadiums_pkey PRIMARY KEY (id_stadium);


--
-- TOC entry 3202 (class 2606 OID 24687)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id_team);


--
-- TOC entry 3204 (class 2606 OID 24689)
-- Name: teams teams_shorthand_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_shorthand_key UNIQUE (shorthand);


--
-- TOC entry 3215 (class 2606 OID 24717)
-- Name: matches matches_id_away_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_id_away_fkey FOREIGN KEY (id_away) REFERENCES public.teams(id_team);


--
-- TOC entry 3216 (class 2606 OID 24712)
-- Name: matches matches_id_home_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_id_home_fkey FOREIGN KEY (id_home) REFERENCES public.teams(id_team);


--
-- TOC entry 3217 (class 2606 OID 24722)
-- Name: matches matches_id_stadium_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_id_stadium_fkey FOREIGN KEY (id_stadium) REFERENCES public.stadiums(id_stadium);


--
-- TOC entry 3214 (class 2606 OID 24702)
-- Name: players players_id_team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_id_team_fkey FOREIGN KEY (id_team) REFERENCES public.teams(id_team);


--
-- TOC entry 3218 (class 2606 OID 24734)
-- Name: results results_id_match_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_id_match_fkey FOREIGN KEY (id_match) REFERENCES public.matches(id_match);


--
-- TOC entry 3219 (class 2606 OID 24746)
-- Name: scores scores_id_match_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_id_match_fkey FOREIGN KEY (id_match) REFERENCES public.matches(id_match);


--
-- TOC entry 3220 (class 2606 OID 24756)
-- Name: scores scores_id_player_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_id_player_fkey FOREIGN KEY (id_player) REFERENCES public.players(id_player);


--
-- TOC entry 3221 (class 2606 OID 24751)
-- Name: scores scores_id_team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_id_team_fkey FOREIGN KEY (id_team) REFERENCES public.teams(id_team);


--
-- TOC entry 3213 (class 2606 OID 24690)
-- Name: teams teams_id_stadium_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_id_stadium_fkey FOREIGN KEY (id_stadium) REFERENCES public.stadiums(id_stadium);


-- Completed on 2023-02-21 21:14:20

--
-- PostgreSQL database dump complete
--

