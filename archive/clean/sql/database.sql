--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: clean; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA clean;


ALTER SCHEMA clean OWNER TO postgres;

SET search_path = clean, pg_catalog;

--
-- Name: sex_type; Type: TYPE; Schema: clean; Owner: postgres
--

CREATE TYPE sex_type AS ENUM (
    'male',
    'female'
);


ALTER TYPE sex_type OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: condition; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE condition (
    id integer NOT NULL,
    meddra text,
    who_icd_10 text,
    description text
);


ALTER TABLE condition OWNER TO postgres;

--
-- Name: condition_id_seq; Type: SEQUENCE; Schema: clean; Owner: postgres
--

CREATE SEQUENCE condition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE condition_id_seq OWNER TO postgres;

--
-- Name: condition_id_seq; Type: SEQUENCE OWNED BY; Schema: clean; Owner: postgres
--

ALTER SEQUENCE condition_id_seq OWNED BY condition.id;


--
-- Name: document; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE document (
    id integer NOT NULL,
    label text,
    type text
);


ALTER TABLE document OWNER TO postgres;

--
-- Name: document_id_seq; Type: SEQUENCE; Schema: clean; Owner: postgres
--

CREATE SEQUENCE document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_id_seq OWNER TO postgres;

--
-- Name: document_id_seq; Type: SEQUENCE OWNED BY; Schema: clean; Owner: postgres
--

ALTER SEQUENCE document_id_seq OWNED BY document.id;


--
-- Name: drug; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE drug (
    id integer NOT NULL,
    technical_name text,
    trade_name text,
    who_dde text,
    category text,
    description text
);


ALTER TABLE drug OWNER TO postgres;

--
-- Name: drug_id_seq; Type: SEQUENCE; Schema: clean; Owner: postgres
--

CREATE SEQUENCE drug_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE drug_id_seq OWNER TO postgres;

--
-- Name: drug_id_seq; Type: SEQUENCE OWNED BY; Schema: clean; Owner: postgres
--

ALTER SEQUENCE drug_id_seq OWNED BY drug.id;


--
-- Name: method; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE method (
    id integer NOT NULL,
    description text
);


ALTER TABLE method OWNER TO postgres;

--
-- Name: method_id_seq; Type: SEQUENCE; Schema: clean; Owner: postgres
--

CREATE SEQUENCE method_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE method_id_seq OWNER TO postgres;

--
-- Name: method_id_seq; Type: SEQUENCE OWNED BY; Schema: clean; Owner: postgres
--

ALTER SEQUENCE method_id_seq OWNED BY method.id;


--
-- Name: provenance; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE provenance (
    id integer NOT NULL,
    "timestamp" timestamp without time zone
);


ALTER TABLE provenance OWNER TO postgres;

--
-- Name: provenance_id_seq; Type: SEQUENCE; Schema: clean; Owner: postgres
--

CREATE SEQUENCE provenance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE provenance_id_seq OWNER TO postgres;

--
-- Name: provenance_id_seq; Type: SEQUENCE OWNED BY; Schema: clean; Owner: postgres
--

ALTER SEQUENCE provenance_id_seq OWNED BY provenance.id;


--
-- Name: register_entry; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE register_entry (
    id integer NOT NULL,
    source_id integer,
    register_info jsonb
);


ALTER TABLE register_entry OWNER TO postgres;

--
-- Name: register_entry_id_seq; Type: SEQUENCE; Schema: clean; Owner: postgres
--

CREATE SEQUENCE register_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE register_entry_id_seq OWNER TO postgres;

--
-- Name: register_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: clean; Owner: postgres
--

ALTER SEQUENCE register_entry_id_seq OWNED BY register_entry.id;


--
-- Name: results_doc; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE results_doc (
    id integer NOT NULL,
    title text,
    type text,
    structured_data text,
    document_id text,
    link text,
    free_text text,
    authors text,
    source text
);


ALTER TABLE results_doc OWNER TO postgres;

--
-- Name: results_doc_id_seq; Type: SEQUENCE; Schema: clean; Owner: postgres
--

CREATE SEQUENCE results_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE results_doc_id_seq OWNER TO postgres;

--
-- Name: results_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: clean; Owner: postgres
--

ALTER SEQUENCE results_doc_id_seq OWNED BY results_doc.id;


--
-- Name: source; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE source (
    id integer NOT NULL,
    title text,
    descrition text,
    category text,
    cochrane boolean
);


ALTER TABLE source OWNER TO postgres;

--
-- Name: source_id_seq; Type: SEQUENCE; Schema: clean; Owner: postgres
--

CREATE SEQUENCE source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE source_id_seq OWNER TO postgres;

--
-- Name: source_id_seq; Type: SEQUENCE OWNED BY; Schema: clean; Owner: postgres
--

ALTER SEQUENCE source_id_seq OWNED BY source.id;


--
-- Name: trial; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE trial (
    id integer NOT NULL,
    public_title text,
    scientific_title text,
    condition_or_problem text,
    source_of_funding text,
    date_from date,
    date_to date,
    exclusion_criteria text,
    sample_size integer,
    age_from smallint,
    age_to smallint,
    sex sex_type,
    interventions text[],
    outcomes text[]
);


ALTER TABLE trial OWNER TO postgres;

--
-- Name: trial2condition; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE trial2condition (
    trial_id integer NOT NULL,
    condition_id integer NOT NULL
);


ALTER TABLE trial2condition OWNER TO postgres;

--
-- Name: trial2drug; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE trial2drug (
    trial_id integer NOT NULL,
    drug_id integer NOT NULL
);


ALTER TABLE trial2drug OWNER TO postgres;

--
-- Name: trial2method; Type: TABLE; Schema: clean; Owner: postgres; Tablespace: 
--

CREATE TABLE trial2method (
    trial_id integer NOT NULL,
    method_id integer NOT NULL
);


ALTER TABLE trial2method OWNER TO postgres;

--
-- Name: trial_id_seq; Type: SEQUENCE; Schema: clean; Owner: postgres
--

CREATE SEQUENCE trial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trial_id_seq OWNER TO postgres;

--
-- Name: trial_id_seq; Type: SEQUENCE OWNED BY; Schema: clean; Owner: postgres
--

ALTER SEQUENCE trial_id_seq OWNED BY trial.id;


--
-- Name: id; Type: DEFAULT; Schema: clean; Owner: postgres
--

ALTER TABLE ONLY condition ALTER COLUMN id SET DEFAULT nextval('condition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: clean; Owner: postgres
--

ALTER TABLE ONLY document ALTER COLUMN id SET DEFAULT nextval('document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: clean; Owner: postgres
--

ALTER TABLE ONLY drug ALTER COLUMN id SET DEFAULT nextval('drug_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: clean; Owner: postgres
--

ALTER TABLE ONLY method ALTER COLUMN id SET DEFAULT nextval('method_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: clean; Owner: postgres
--

ALTER TABLE ONLY provenance ALTER COLUMN id SET DEFAULT nextval('provenance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: clean; Owner: postgres
--

ALTER TABLE ONLY register_entry ALTER COLUMN id SET DEFAULT nextval('register_entry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: clean; Owner: postgres
--

ALTER TABLE ONLY results_doc ALTER COLUMN id SET DEFAULT nextval('results_doc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: clean; Owner: postgres
--

ALTER TABLE ONLY source ALTER COLUMN id SET DEFAULT nextval('source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: clean; Owner: postgres
--

ALTER TABLE ONLY trial ALTER COLUMN id SET DEFAULT nextval('trial_id_seq'::regclass);


--
-- Data for Name: condition; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY condition (id, meddra, who_icd_10, description) FROM stdin;
1177	\N	\N	A - Delusional Disorder
1178	\N	\N	A - Health Care Professionals
1179	\N	\N	A - Healthy volunteers
1180	\N	\N	A - Lay carers/family
1182	\N	\N	A - Schizoaffective disorders
1183	\N	\N	A - Schizophrenia
1188	\N	\N	B - No Minority
1189	\N	\N	B - Delusional disorder
1190	\N	\N	B - Health care professionals
1191	\N	\N	B - Healthy volunteers
1192	\N	\N	B - Lay carers/family
1193	\N	\N	B - Psychotic
1194	\N	\N	B - Schizoaffective disorders
1195	\N	\N	B - Schizophrenia
1196	\N	\N	B - Serious mental illness
1197	\N	\N	C - Not applicable
1198	\N	\N	C - Acute
1199	\N	\N	C - Early post-acute
1200	\N	\N	C - Remission
1201	\N	\N	D - Not applicable
1203	\N	\N	D - Prodromal illness
1204	\N	\N	D - First Episode
1205	\N	\N	D - Early illness
1206	\N	\N	D - Persistent / chronic
1207	\N	\N	D - Late onset
1209	\N	\N	E - Aggression (RE Aggression)
1210	\N	\N	E - Agitation (RE Aggression)
1211	\N	\N	E - Akathisia
1213	\N	\N	E - Depression
1216	\N	\N	E - Movement disorders
1217	\N	\N	E - Negative symptoms
1218	\N	\N	E - Not Applicable
1219	\N	\N	E - Parkinsonism
1220	\N	\N	E - Tardive Dyskinesia
1221	\N	\N	E - Treatment Resistant
1222	\N	\N	E - Weight Gain
1229	\N	\N	C - Partial remission
1231	\N	\N	E - Adherence
1232	\N	\N	C - State Not Described
1233	\N	\N	D - Stage not described
1237	\N	\N	A - Schizotypal
1238	\N	\N	C - Suspected
1239	\N	\N	B - Schizophreniform
1243	\N	\N	E - Relapse
1244	\N	\N	E - Neurocognition
1246	\N	\N	E - Substance Abuse (Substance Abuse)
1247	\N	\N	E - Anxiety (RE Aggression)
1249	\N	\N	B - Schizotypal
1255	\N	\N	E - Mood disorder
1257	\N	\N	E - Alcohol (Substance Abuse)
1258	\N	\N	E - Withdrawal
1261	\N	\N	E - Obsessive compulsive symptoms
1262	\N	\N	E - Positive symptoms
1263	\N	\N	E - Amenorrhea
1264	\N	\N	E - Sialorrhea (Hypersalivation)
1271	\N	\N	E - Hypersalivation
1276	\N	\N	E - Delusions
1277	\N	\N	E - Adverse effects
44936	\N	\N	A - Schizophreniform
44965	\N	\N	E - Mammogen level
44968	\N	\N	E - Social function
44970	\N	\N	E - Prolactin level
44971	\N	\N	E - Cognitive function
44974	\N	\N	E - Compliance
44977	\N	\N	E - Excitement (RE Aggression)
44979	\N	\N	E - Abnormal ECG
44983	\N	\N	E - Memory
44984	\N	\N	E - Electrocardiogram
44985	\N	\N	E - Glucose metabolism
44986	\N	\N	E - Self-esteem
44989	\N	\N	E - Erythrocyte sedimentation rate
44992	\N	\N	E - Constipation
44993	\N	\N	E - Paralytic ileus
44994	\N	\N	E - Enuresis
44995	\N	\N	E - Urinary retention
44998	\N	\N	E - Liver function
45001	\N	\N	E - Sinus tachycardia
45002	\N	\N	E - Xerostomia
45014	\N	\N	E - Behaviour
45017	\N	\N	E - Glucose and lipid metabolism
45019	\N	\N	E - Extrapyramidal symptoms
45021	\N	\N	E - Glucose level
45023	\N	\N	E - Immunity
45025	\N	\N	E - Tremor
45026	\N	\N	E - Leukopenia
45027	\N	\N	E - Potassium level
45029	\N	\N	E - Blood pressure
45037	\N	\N	E - Blood glucose
45039	\N	\N	E - Electroencephalogram
45040	\N	\N	E - Emotion and social function
45045	\N	\N	E - Negative emotions
45047	\N	\N	E - Growth Hormone Level
45048	\N	\N	E - Blood lipid
45060	\N	\N	E - Blood concentration
45062	\N	\N	E - Salivation
45069	\N	\N	E - Expressed emotion and relapse
45081	\N	\N	E - Glutamate level
45096	\N	\N	E - Adverse events
45104	\N	\N	E - Negative behaviour
45112	\N	\N	E - Executive function
45114	\N	\N	E - Blood Drug Level
45118	\N	\N	E - Menstruation
45119	\N	\N	E - Hepatic dysfunction
45121	\N	\N	E - Spinal fracture
45128	\N	\N	E - Negative + Positive symptoms
45134	\N	\N	E - Metabolic syndrome
45138	\N	\N	E - Dystonia
45140	\N	\N	E - Polysialia adverse effects
45145	\N	\N	E - Serum prolactin level
45148	\N	\N	E - Serum lipid
45151	\N	\N	E - Emotional disorder
45153	\N	\N	E - Decubitus
45155	\N	\N	E - Health education
45159	\N	\N	E - Low self-esteem
45161	\N	\N	E - Lipid metabolic
45162	\N	\N	E - Dysphrenia
45168	\N	\N	E - Function improvement
45181	\N	\N	E - Hallucinations
45183	\N	\N	E - Diabetes mellitus
45187	\N	\N	E - Leucocyte
45194	\N	\N	E - Metabolism
45204	\N	\N	E - Sex hormone level
45214	\N	\N	E - Glycometabolism
45236	\N	\N	A - Psychotic
45238	\N	\N	A - Serious Mental Illness
45308	\N	\N	E - Polydipsia-hyponatremia
45314	\N	\N	E - Cardiovascular autonomic reactivity
45317	\N	\N	E - Learning disability
45318	\N	\N	E - Hypnotic action
45321	\N	\N	E - Heart disease
45337	\N	\N	E - Homelessness
45338	\N	\N	E - Cardiovascular disease
45339	\N	\N	E - Sexual functioning
45350	\N	\N	E - Decomposition
45356	\N	\N	E - Post-psychotic depression
45365	\N	\N	E - Hyperlipidemia
45372	\N	\N	E - Visual hypersensitivity attack
45373	\N	\N	E - Influence of comorbid personality disorder and serious mental illness on police contacts
45377	\N	\N	E - Erectile dysfunction
45380	\N	\N	E - Suicide
45398	\N	\N	E - Dementia
45399	\N	\N	E - Hyperprolactinemia
45404	\N	\N	E - Breast Cancer
45421	\N	\N	E - Jail Recidivism
45424	\N	\N	E - Early response to treatment
45425	\N	\N	E - Cholesterol
45429	\N	\N	E - Endogenous depression
45430	\N	\N	E - Sleep
45434	\N	\N	E - Sweat odour
45435	\N	\N	E - Eye abnormalities
45436	\N	\N	E - Metabolic disorder
45438	\N	\N	E - Hyperhomocysteinemia
45448	\N	\N	E - Attention
45450	\N	\N	E - EEG
45461	\N	\N	E - C-reactive protein levels
45533	\N	\N	E - interleukin level
45536	\N	\N	E - Anhedonia
45538	\N	\N	E - Oral hygiene
45539	\N	\N	E - Cardiac outcomes
45543	\N	\N	E - Smoking (Substance Abuse)
45545	\N	\N	E - HIV
45546	\N	\N	E - Stigma
45548	\N	\N	E - Exacerbation (RE Aggression)
45549	\N	\N	E - Economic
45554	\N	\N	E - Hypertension
45555	\N	\N	E - Hypotonic disorders
45556	\N	\N	E - Mental retardation
45559	\N	\N	E - Digestion
45560	\N	\N	E - Defective cerebral circulation
45561	\N	\N	E - Cannabis Use (Substance Abuse)
45562	\N	\N	E - Disturbed
45563	\N	\N	E - Neuroleptic resistant
45564	\N	\N	E - Polydipsia
45565	\N	\N	E - Psychopathology
45566	\N	\N	E - Neurocognitive Deficits
45567	\N	\N	E - Early onset
45568	\N	\N	E - Engagement
45569	\N	\N	E - Employment
45570	\N	\N	E - Dual diagnosis
45571	\N	\N	E - Insulin
45572	\N	\N	E - Self-perception
45573	\N	\N	e - Dystonia-parkinsonism
45574	\N	\N	E - Herpes
45575	\N	\N	E - Rehabilitation
45577	\N	\N	E - Voices
45578	\N	\N	E - PTSD
45579	\N	\N	E - Exercise
45581	\N	\N	E - Independent living
45582	\N	\N	E - Mental disability
45583	\N	\N	E - Paranoia
45584	\N	\N	E - Offenders
45585	\N	\N	E - Postmenopausal
45586	\N	\N	E - Cognition
45587	\N	\N	E - Social cognition
45588	\N	\N	E - Eye movements
45589	\N	\N	E - Amphetamine (Substance Abuse)
45590	\N	\N	E - Diet (Weight)
45591	\N	\N	E - Comorbid
45592	\N	\N	E - HSVI
45593	\N	\N	E - Insomnia
45594	\N	\N	E - Sensory gating
45595	\N	\N	E - Quality of life
45596	\N	\N	E - Stress
45598	\N	\N	E - Obesity (Weight)
45599	\N	\N	E - Excitement and Agitation (RE Aggression)
45600	\N	\N	A - At Risk of Psychosis
45601	\N	\N	A - Family History of Psychosis
45602	\N	\N	A - Mental Illness
45603	\N	\N	A - Not Described
45604	\N	\N	D - Chronic
45605	\N	\N	E - Cardiovascular Risk Factor
45606	\N	\N	E - Childhood Learning Disabilities
45607	\N	\N	E - Drug Dependence (Substance Abuse)
45608	\N	\N	E - Nicotine Dependence (Substance Abuse)
45609	\N	\N	E - Cocaine Dependence (Substance Abuse)
45610	\N	\N	E - Cognitive Impairment
45611	\N	\N	E - Comorbidity
45612	\N	\N	E - Diabetes
45613	\N	\N	E - Dually Diagnosed
45614	\N	\N	E - Diminished P50 Sensory Gating
45615	\N	\N	E - Discrimination
45616	\N	\N	E - Drug and Alcohol Use (Substance Abuse)
45617	\N	\N	E - ECT-Induced Cognitive Impairment
45618	\N	\N	E - Epilepsy
45619	\N	\N	E - Gliadin-Positive
45620	\N	\N	E - Hepatitis
45621	\N	\N	E - Herpes Simplex
45622	\N	\N	E - Methamphetamine Dependence (Substance Abuse)
45623	\N	\N	E - Hyperglycemia
45624	\N	\N	E - Muteness
45625	\N	\N	E - Non-Adherence
45626	\N	\N	E - Hyperprolinemia
45627	\N	\N	E - Impulsivity
45628	\N	\N	E - Marked Social Withdrawal
45629	\N	\N	E - Opioid Dependence (Substance Abuse)
45630	\N	\N	E - Overweight
45631	\N	\N	E - Pathological Gambling
45632	\N	\N	E - Postmenopause
45633	\N	\N	E - Prolactinemia
45634	\N	\N	E - Restless Legs Syndrome
45635	\N	\N	E - Substance Use (Substance Abuse)
45636	\N	\N	E - Unemployment
45637	\N	\N	E - Violence (RE Aggression)
45638	\N	\N	A - Tardive Dyskinesia
45639	\N	\N	E - Asthma
45640	\N	\N	E - COPD
45641	\N	\N	E - Compulsory Admission (RE Aggression)
45642	\N	\N	E - Pregnancy
45643	\N	\N	E - At Risk of Psychosis
45644	\N	\N	E - Acutely Disturbed (RE Aggression)
45645	\N	\N	A - Delirium
45646	\N	\N	A - Illness
45647	\N	\N	E - Chronic HCV Infection
45648	\N	\N	E - Galactorrhea-Amenorrhea Syndrome
45649	\N	\N	E - Psychiatric Illness
45650	\N	\N	E - Suicidal Ideation
\.


--
-- Name: condition_id_seq; Type: SEQUENCE SET; Schema: clean; Owner: postgres
--

SELECT pg_catalog.setval('condition_id_seq', 1, false);


--
-- Data for Name: document; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY document (id, label, type) FROM stdin;
\.


--
-- Name: document_id_seq; Type: SEQUENCE SET; Schema: clean; Owner: postgres
--

SELECT pg_catalog.setval('document_id_seq', 1, false);


--
-- Data for Name: drug; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY drug (id, technical_name, trade_name, who_dde, category, description) FROM stdin;
\.


--
-- Name: drug_id_seq; Type: SEQUENCE SET; Schema: clean; Owner: postgres
--

SELECT pg_catalog.setval('drug_id_seq', 1, false);


--
-- Data for Name: method; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY method (id, description) FROM stdin;
1	Cluster randomisation (events)
2	Cluster randomisation (wards)
3	Cluster randomisation (families)
4	Cluster randomisation (homes)
6	Crossover
7	Blinding - open-label
9	Blinding - unclear
10	Blinding - double
11	Blinding - single
13	Cluster randomisation (mental health workers)
14	Blinding - triple
15	Blinding - multi-blind
16	Cluster randomisation (general practices)
17	Cluster randomisation (mental health centres)
18	Factorial
21	Unclear
22	Unclear - requires translation
24	Non blinded
25	Randomised- no further info
26	Block randomisation
27	Randomised - admission order
28	Randomised- tossing a coin
29	Randomised- drawing straws
30	Randomised - date of admission, odd or even
31	Randomised - consultation order
32	Randomised - random number generation
33	Randomised - number of admission, odd or even
34	Randomised - computer random number generation
35	Randomised - admission  and consultation order
36	Randomised - discharge order
37	Randomised - admission order, even or odd
38	Randomised - admission order and tossing a coin
39	Randomised - admission number, odd or even
40	Randomised - selection order
41	Randomised - random number generation + admission order
42	Randomised - random number generation table
43	Randomised - random number, odd or even
44	Randomised - admission order and random number generation
45	Randomised - case note numbers
46	Randomised - admission order + stratified
47	Randomised - block randomisation
48	Randomised - card
49	Quasi randomization
\.


--
-- Name: method_id_seq; Type: SEQUENCE SET; Schema: clean; Owner: postgres
--

SELECT pg_catalog.setval('method_id_seq', 1, false);


--
-- Data for Name: provenance; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY provenance (id, "timestamp") FROM stdin;
\.


--
-- Name: provenance_id_seq; Type: SEQUENCE SET; Schema: clean; Owner: postgres
--

SELECT pg_catalog.setval('provenance_id_seq', 1, false);


--
-- Data for Name: register_entry; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY register_entry (id, source_id, register_info) FROM stdin;
\.


--
-- Name: register_entry_id_seq; Type: SEQUENCE SET; Schema: clean; Owner: postgres
--

SELECT pg_catalog.setval('register_entry_id_seq', 1, false);


--
-- Data for Name: results_doc; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY results_doc (id, title, type, structured_data, document_id, link, free_text, authors, source) FROM stdin;
\.


--
-- Name: results_doc_id_seq; Type: SEQUENCE SET; Schema: clean; Owner: postgres
--

SELECT pg_catalog.setval('results_doc_id_seq', 1, false);


--
-- Data for Name: source; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY source (id, title, descrition, category, cochrane) FROM stdin;
\.


--
-- Name: source_id_seq; Type: SEQUENCE SET; Schema: clean; Owner: postgres
--

SELECT pg_catalog.setval('source_id_seq', 1, false);


--
-- Data for Name: trial; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY trial (id, public_title, scientific_title, condition_or_problem, source_of_funding, date_from, date_to, exclusion_criteria, sample_size, age_from, age_to, sex, interventions, outcomes) FROM stdin;
138	Link 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
139	Arvanitis 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
140	Aaes-Jorgensen 1981a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
142	Aaes-Jorgensen 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
143	Abenson 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
144	Aberg 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
145	Abraham 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
146	Abrams 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
147	Abrams 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
149	Abuzzahab 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
150	Abuzzahab 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
151	Acker 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
152	Adamson 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
153	Adamson 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
154	Addington 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
155	Adler 1992b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
156	Adler 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
157	Adler 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
158	Adler 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
160	Adler 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
162	Affleck 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
163	Agarwal 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
164	Agelink 1997a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
165	Agrup 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
166	Aguilar 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
168	Ahlfors 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
169	Ahlfors 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
170	Ahlfors 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
171	Ahlfors 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
172	Ahmed 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
173	Abraham 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
174	Abse 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
176	Akhtar 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
177	Akimoto 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
178	Akiyama 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
179	Albert 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
180	Alexander 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
181	Alexander 1979 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
182	Alexander 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
185	Allen 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
186	Alpert 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
187	Alpert 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
188	Alpert 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
189	Altamura 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
190	Altamura 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
191	Altman 1973 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
192	Altman 1973 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
196	Amin 1977 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
197	Ananth 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
198	Ananth 1977 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
199	Ananth 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
200	Ananth 1972 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
201	Andersen 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
202	Andersen 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
203	Ackner 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
204	Adler 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
205	Albus 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
207	Andreoli 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
208	Andrews 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
209	Angus 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
210	Angus 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
211	Anonymous 1996 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
212	Anonymous 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
215	Anumonye 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
216	Aoba 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
218	Allen 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
219	Alvarez 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	Amakusa 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
224	Apfeldorf 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
225	Appleby 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
226	Apter 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
227	Arato 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
228	Arato 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
229	Armstrong 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
231	Ashby 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
232	Ashcroft 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
234	Athanassenas 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
235	Atkinson 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
236	Augustin 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
237	Awad 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
238	Axelson 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
239	Ayd 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
240	Azima 1961 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
241	Azima 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
242	Azima 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
243	d'Elia 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
244	Azima 1961 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
245	Azima 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
246	Azima 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
247	Azorin 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
249	Badgett 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
252	Bagadia 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
253	Bailey 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
254	Baker 1960 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
255	Baker 1958 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
256	Baker 1960 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
257	Baker 1958 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
258	Baker 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
259	Baker 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
261	Bakke 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
262	Barker 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
263	Barker 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
264	Baker 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
265	Balon 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
268	Ban 1975 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
269	Ban 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
270	Ban 1975 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
271	Ban 1975 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
273	Bandelow 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
274	Bankier 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
275	Bao 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
276	Barch 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
278	Barnes 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
279	Baro 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
280	Barron 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21016	李晶 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
281	Barron 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
282	Barsa 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
283	Bartko 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
284	Barbee 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
285	Barron 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
286	Barron 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
287	Bastecky 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
288	Bateman 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
289	Bechelli 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
290	Bechelli 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
291	Becker 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
293	Bedell 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
294	Beech 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
297	Benkert 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
298	Bennett 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
299	Bennett 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
300	Bennie 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
301	Berger 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
302	Berger 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
303	de Beaurepaire 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
304	Berger 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
306	Berger 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
307	Bergling 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
308	Berman 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
309	Bernstein 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
310	Bersani 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
311	Biederman 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
312	Bigelow 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
313	Bigelow 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
314	Bigelow 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
316	Binder 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
317	Birchwood 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
318	Bishop 1963 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
319	Bishop 1966 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
320	Bishop 1963 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
322	Bitter 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12314	Kabes 1984 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
323	Leon 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
324	Bilder 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
325	Bjerkenstedt 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
326	Bjorndal 1980 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
327	Blaha 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
329	Boardman 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
330	Bobruff 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
331	Bockenheimer 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
332	Bogoch 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
333	Boling 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
334	Bond 1991 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
336	Bond 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
337	Bond 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
338	Borison 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
339	Bordeleau 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
340	Borger 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
342	Borison 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
343	Borovicka 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
344	Bosio 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
345	Bourgeois 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
346	Bowes 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
348	Boyer 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
352	Braden 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
353	Brambilla 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
355	Brandrup 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
356	Brannen 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
357	Braus 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
358	Brauzer 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
359	Becker 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
360	Brambilla 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
361	Brambilla 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
362	Bratfos 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
363	Breier 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
364	Breier 1993 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
365	Breier 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
366	Breier 1988 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
367	Brems 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
369	Brengelmann 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
370	Bressler 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
371	Brewer 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
372	Brewerton 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
373	Brill 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
374	British 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
375	Brizer 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
377	Brockington 1978 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
378	Brooker 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
379	Broadhurst 1958 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
380	Brooker 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
382	Browne 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
383	Bruck 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
384	Brugmans 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
385	Bruno 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
386	Bucci 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
387	Buchanan 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
388	Buchanan 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
390	Buchsbaum 1992 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
391	Buffa 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
392	Buffaloe 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
393	Burgoyne 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
394	Burner 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
395	Burnett 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
396	Burns 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
399	Bush 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
401	Cabrera 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
404	Cahan 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
405	Cai 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
406	Caine 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
407	Callahan 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
408	Callen 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
409	Calwell 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
410	Campbell 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
411	Campbell 1972 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
412	Campbell 1972 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
414	Caradoc 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
415	Cardone 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
416	Carey 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
417	Carman 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
418	Carpenter 1992 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
419	Carpenter 1983 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
420	Carpenter 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
421	Carpenter 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
422	Carpenter 1991 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
423	Case 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
424	Casey 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
425	Casey 1960 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
426	Casey 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
427	Casey 1960 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
428	Casley 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
429	Casper 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
430	Cassady 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
431	Cassano 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
433	Catapano 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
434	Catapano 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
435	Cesarec 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
436	Ceskova 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
438	Chakos 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
439	Chang 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
440	Charalampous 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
441	Chaudhry 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
442	Cheung 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
443	Chien 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
444	Chien 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
445	Chien 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
446	Chien 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
447	Childers 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
449	Adler 1994b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
450	Agnoli 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
452	Andersson 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
453	Angus 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
454	Aronoff 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
455	Arvanitis 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
457	Askar 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
458	Audini 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
459	Babigian 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
460	Bagne 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
462	Barber 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
463	Bartoszyk 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
464	Blankertz 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
465	Becker 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
466	Bender 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
467	Bergheim 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
471	Boardman 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
473	Bondolfi 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
475	Brauzer 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
478	Brown 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
479	Bucci 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
480	Buchanan 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
481	Buchsbaum 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
482	Bourdouxhe 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
483	Chouinard 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
486	Chouinard 1979 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
487	Chouinard 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
488	Chouinard 1982 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
489	Chow 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
490	Chow 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
491	Chowdhury 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
492	Citkowitz 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
957	Hitri 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
958	Hoffer 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
959	Hogan 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
960	Hogarty 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
964	Hogarty 1979 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
966	Alexander 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
967	Alfredsson 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
968	Alpert 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
969	Ananth 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
970	Ananth 1972 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
971	Ananth 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
972	Anderson 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
973	Arnold 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
974	Bagadia 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
975	Bankier 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21017	李明德 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
977	Berman 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
978	Bond 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
979	Borison 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
981	Branchey 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
982	Brannen 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
983	Brauzer 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
984	Brotman 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1626	Liberman 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1627	Lichtenberg 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1628	Lieberman 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1630	Lieberman 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1631	Lieberman 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1634	Liebowitz 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1635	Lifschutz 1954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1636	Lifshitz 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1637	Ligthart 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1638	Lindberg 1981 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1639	Lindholm 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1640	Lindstrom 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1641	Lingjaerde 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1642	Lingjaerde 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1643	Linkowski 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1644	Linn 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1649	Lindstrom 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1650	Lindstrom 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1651	Lingjaerde 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1652	Lingl 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1653	Linn 1977 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1654	Linn 1977 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1655	Linn 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1656	Linszen 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1657	Lipinski 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1658	Lipton 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1659	Litman 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1661	Litman 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1663	Livingston 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21018	李文秀 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1664	Llorca 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1665	Lochner 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1666	Loga 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1667	Lohr 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1669	Lohr 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1670	Lomas 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1671	Lonowski 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1672	Lonowski 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1674	Loonen 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1675	Loprete 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1676	Loranger 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1677	Losonczy 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1678	Lotstra 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1679	Lotstra 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1680	Louwerens 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1681	Louza 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1682	Lovett 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1683	Lowinger 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1685	Lucas 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1687	Lund 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1688	Lundin 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1690	Lurie 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1691	Lyager 1957 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1692	Lyager 1957 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1693	Maar 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1694	Maas 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1695	Martinot 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1696	Perault 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1697	Maas 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1698	Maas 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1699	MacCarthy 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1700	MacCrimmon 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1701	Machover 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1702	Macias 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1703	MacKay 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1704	MacLeod 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1705	MacPherson 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1706	Maculans 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1707	Madew 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1708	Madgwick 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1709	Maes 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1710	Magelund 1979 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1711	Magelund 1979 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1712	Magnus 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1713	Magnus 1980 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1714	Magnusson 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1715	Maire 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1716	Majewski 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1717	Mak 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1718	Mak 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1719	Makanjuola 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1720	Malamud 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1721	Malas 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1722	Malaspina 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1723	Malek 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2355	Rogers 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2356	Rogers 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2358	Rompel 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2359	Ropert 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2360	Ropert 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2361	Rossi 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2363	Rosen 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2364	Rosenbaum 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2365	Rosenheck 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2368	Rosenthal 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2369	Rosini 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2370	Rosner 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2371	Rosner 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2372	Ross 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2373	Rosse 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2375	Roubicek 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2376	Roxburgh 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2377	Royer 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2379	Ruiz 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2380	Ruiz 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2381	Ruiz 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2382	Rund 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2383	Ruphan 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2384	Ruskin 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2385	Ruskin 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21019	李忠英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2386	Russell 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2387	Rust 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2388	Rysanek 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2389	Rzewuska 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2390	Sachdev 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2391	Sachdev 1993 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2393	Sackler 1951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2394	Sacks 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2395	Sacks 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2396	Sajadi 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2398	Saletu 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2399	Saletu 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2400	Saletu 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2401	Salokangas 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2402	Saletu 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2403	Salisbury 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2404	Salokangas 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
493	Claghorn 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
494	Clark 1968 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
495	Clark 1977 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
496	Clark 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
497	Classen 1989 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
498	Claveria 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
499	de Cangas 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
500	Harper 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
501	Markowe 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
503	Claffey 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
504	Claghorn 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
505	Claghorn 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
507	Claghorn 1974 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
508	Claghorn 1974 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
509	Claghorn 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
510	Claghorn 1967 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
511	Claghorn 1967 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
512	Clark 1973 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
513	Clark 1975 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
514	Clark 1975 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
515	Clark 1975 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1182	Chouinard 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
517	Clausen 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
518	Cocito 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
519	Coffman 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
520	Cohen 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
521	Cohen 1987 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
522	Cohen 1985 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
523	Cohen 1985 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
525	Cohen 1987 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
526	Cohler 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
527	Cole 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
528	Collard 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
529	Collins 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
530	Collins 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
531	Collins 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
535	Condray 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
536	Condray 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
537	Conley 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
538	Conley 1994 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
539	Conte 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
540	Contreras 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
543	Cookson 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
544	Cooper 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
545	Copas 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
547	Coryell 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
548	Cotes 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
549	Cowden 1956 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
551	Craig 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
552	Crane 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
553	Little 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
554	Crawford 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
557	Creed 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
559	Cronholm 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
560	Crowley 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
561	Csernansky 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
563	Csernansky 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
564	Curry 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
565	Curson 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
566	Curson 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12315	Ax 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
567	Curtis 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
568	Cutler 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
569	Cutler 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
571	Martin 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
572	Chouinard 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
574	Burgoyne 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
575	Busatto 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
576	Caffey 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
577	Carman 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
578	Carpenter 1983 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
579	Carranza 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
582	Chatterjee 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
585	Carpenter 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
586	Arvanitis 1996a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
587	Chouinard 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
589	Clark 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
590	Clark 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
591	Claus 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
593	Conley 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
594	Conte 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
595	Cookson 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
596	Cookson 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
597	Cookson 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
598	Cooper 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
599	Crow 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
601	Daniel 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
602	Davidoff 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
604	d'Elia 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
605	d'Elia 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
607	Dabiri 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
608	Dalack 1997 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
609	Dalack 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
611	Daston 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
612	Davies 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
613	Davis 1985 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
614	de Buck 1973 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
615	de Cuyper 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
617	DeCarlo 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
618	de Cuyper 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
619	Dehing 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
620	Del Guidice 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
621	de Montigny 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
623	Delcker 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
624	Den Boer 1990 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
625	Denber 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
626	Denber 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
628	Dencker 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
629	Dencker 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
630	Dencker 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
632	Denijs 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
633	Deo 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
634	Deo 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
635	Deutsch 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
636	Deutsch 1977 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
637	Deutsch 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
638	DeWolfe 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
639	Diamond 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
640	Nicholas 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
641	Dillenkoffer 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
642	DiMascio 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
643	Dimond 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
644	Dittrich 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
646	Dobson 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
648	Dohan 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
649	Dohan 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
650	Dohan 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
652	Dom 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
653	Dom 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
656	Dom 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
657	Donlon 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
658	Donlon 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
660	Dixon 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
661	D'Souza 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
662	D'Souza 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1184	Conti 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
663	Donlon 1976 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
664	Donlon 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
665	Donlon 1978 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
666	Donlon 1978 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
667	Doongaji 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
668	Doongaji 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
669	Doongaji 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
670	Dose 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
671	Double 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
672	Dozier 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
673	Dransfield 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
674	Dransfield 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
676	Drummond 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
677	Dube 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
678	Dube 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
679	Dubin 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
680	Dubin 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
681	Dufresne 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
682	Duinkerke 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
683	Dumon 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
685	Dye 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
686	Dysken 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
687	Eberhard 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
688	Eccleston 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
689	Edwards 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
690	Efron 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
691	Egan 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
694	Eitan 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
696	Ekdawi 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
697	Eklund 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
698	El Islam 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
699	Elkashef 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
700	Valencia 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
702	El Yousef 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
703	Elkes 1954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
704	Elliott 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
705	Elman 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
706	Emrich 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
707	Emrich 1980 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
708	Endicott 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
709	Engelhardt 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
710	Enoch 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
712	Escobar 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
713	Escobar 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
714	Essock 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
715	Estrella 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
716	Evans 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
717	Fabre 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
718	Fagan 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
719	Faltus 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
720	Wehnert 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
721	Fan 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
722	Faraone 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
723	Farde 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
725	Fay 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
726	Fay 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
727	Fayen 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
728	Feldman 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
729	Fennig 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
730	Fensbo 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
731	Fenton 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
732	Ferebee 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
733	Ferrari 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
734	Ferrero 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
735	Fink 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
736	King 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
737	Fleming 1958 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
738	Fleming 1958 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
739	Fleming 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
740	Fleming 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
741	Falloon 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
742	Faltus 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
744	Floru 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
746	Flynn 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
747	Fonagy 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
748	Foote 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1956	Merello 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
749	Ford 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
750	Ford 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
751	Forrest 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
752	Foxx 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
753	Frangos 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
755	Franklin 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
758	Freeman 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
759	Freeman 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
762	Freedman 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
763	Freedman 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
765	Freedman 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
766	Freeman 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
767	Freeman 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
768	Freeman 1980 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
769	Freeman 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
770	Frey 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
771	Freyan 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
772	Friedman 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
773	Friis 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
774	Frith 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
775	Fritze 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
776	Fromm 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
777	Fruensgaard 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
778	Fruensgaard 1978 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
779	Fuentenebro 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
780	Fux 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
782	Galbrecht 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
783	Galderisi 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
784	Galdi 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
785	Gallant 1968 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
786	Gallant 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
788	Gallant 1967 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
789	Gallant 1972 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
790	Gallant 1971 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
791	Gallant 1967 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
792	Gallant 1963 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
793	Gallant 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
796	Gallant 1964 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
884	Gulmann 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
797	Gallant 1964 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
798	Gallant 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
799	Gallant 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
800	Gander 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
801	Gardner 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
802	Gardos 1974 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
804	Gardos 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
805	Gardos 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
807	Garry 1962 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
808	Garry 1962 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
809	Garver 1984 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
810	Garza 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
811	Gattaz 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
812	Gelders 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
813	Gelenberg 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
814	Gendron 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
815	George 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
816	Georgotas 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
818	Gerlach 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
819	Gerlach 1975 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
820	Gerlach 1975 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
822	Gerlach 1975 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
824	Gerner 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
825	Gershon 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
827	Gerstenzang 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
829	Gibbs 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
830	Gibby 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
831	Gilgash 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
833	Gitlin 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
834	Gitlin 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
836	Glazer 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
837	Glick 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
838	Glynn 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
839	Godfrey 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
840	Godwin 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
841	Goff 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
842	Goff 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20230	朱薇薇 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
843	Goff 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
844	Goff 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
845	Goldberg 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
846	Goldberg 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
847	Goldberg 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
848	Goldstein 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
849	Goller 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
850	Guimon 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
851	Gold 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
852	Goldberg 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
854	Goldstein 1966 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
855	Gonier 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
856	Goodall 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
857	Goode 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
858	Gore 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
859	Gottfries 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
860	Goulet 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
861	Govorin 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
862	Gowardman 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
863	Gram 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
864	Granacher 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
865	Grasby 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
866	Gravem 1981 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
867	Gravem 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
869	Green 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
870	Greil 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
871	Green 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
873	Greenberg 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
874	Greenblatt 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
875	Greenblatt 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
876	Gross 1960 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
877	Gross 1960 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
878	Grosser 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
879	Grove 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
881	Grygier 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
882	Guazzelli 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
883	Guirguis 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2853	Verhoeven 1984 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
885	Gunby 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
886	Gunn 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
887	Gupta 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
888	Guz 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
890	Rolando 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
891	Haas 1982 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
892	Haastrup 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
893	Haddock 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
894	Haffmans 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
895	Hagger 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
896	Haider 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
898	Hall 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
899	Hall 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
900	Hamann 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
901	Hamid 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
902	Hamill 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
903	Hamilton 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
904	Hamilton 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
905	Hamilton 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
906	Hamilton 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
907	Hamilton 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
908	Hamner 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
909	Hankoff 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
911	Hanlon 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
912	Hanlon 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
913	Hannes 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
914	Hanssen 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
915	Hardwick 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
916	Hargreaves 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
917	Hargreaves 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
918	Hargreaves 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
919	Harnryd 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
920	Harrington 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
921	Harrington 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
922	Harrison 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
923	Hartelius 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
924	Hartley 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
925	Hartley 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
926	Hartmann 1973 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
927	Hartmann 1973 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
928	Hartmann 1973 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
929	Hartmann 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
930	Harvey 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
931	Hartman 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
932	Haslam 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
933	Haydu 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
934	Haydu 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
935	Hayes 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
936	Hays 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
937	Heath 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
938	Hebenstreit 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
939	Hedberg 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
940	Hegarty 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
941	Hegarty 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
943	Heikkila 1992 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
944	Heikkila 1981 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
946	Heikkila 1981 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
947	Heikkinen 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
948	Hekimian 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
949	Heresco 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
950	Herrera 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
951	Hershon 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
952	Herz 1989 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
953	Herz 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
954	Hine 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
955	Hirsch 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
956	Hirsch 1989 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
985	Cabrera 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
987	Holden 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
988	Hollister 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
989	Hollister 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
991	Hollister 1956 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
992	Hollister 1956 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
993	Hollister 1956 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
994	Hollister 1956 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
995	Holloway 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1137	Jones 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
996	Holman 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
997	Holmberg 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
998	Holt 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
999	Holt 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1000	Hommer 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1001	Hommer 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1004	Honigfeld 1984 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1006	Houston 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1007	Howanitz 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1008	Howard 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1010	Hrebicek 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1011	Hsu 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1012	Hu Teh 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1013	Huang 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1014	Huegel 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1015	Hunt 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1016	Hurst 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1017	Hutt 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1019	Huygens 1973 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1021	Inanaga 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1022	Inderbitzin 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1023	Innis 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1024	Iqbal 1991 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1025	Iqbal 1991 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1026	Irwin 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1027	Irwin 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1028	Itil 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1029	Itil 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1031	Itil 1971 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1032	Itil 1971 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1033	Itoh 1985 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1034	Itoh 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1035	Itoh 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1038	Borison 1991 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1039	Brook 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1041	Burns 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1043	Chouinard 1977 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1044	Champney 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1045	Chien 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1046	Chien 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1048	Chiu 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1049	Chouinard 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1050	Chouinard 1978 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1051	Chouinard 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1052	Beal 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1053	Bishop 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1054	Chouinard 1977 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1056	Chouinard 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1057	Chouinard 1976 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1059	Chouinard 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1060	Chouinard  1982 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1061	Chouinard 1979 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1066	Bergougnan 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1067	Bergougnan 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1070	Cheng 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1073	Chouinard 1976 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1075	Hong 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1076	Hooper 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1078	Horiguchi 1992 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1080	Hormia 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1081	Hornstra 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1082	Horodnicki 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1083	Huang 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1084	Hummer 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1085	Hurlburt 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1086	Ingram 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1087	Iqbal 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1089	Itil 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1090	Jackson 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1091	Jacobsson 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1092	Jacobsson 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1094	Jaffe 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1095	Jain 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1096	James 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1097	Janakiramiah 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1098	Janicak 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1099	Jann 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1101	Janowsky 1973 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1103	Jasovic 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1104	Jasovic 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1105	Jasovic 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1106	Jasovic 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1108	Janicak 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1109	Javed 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1110	Javitt 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1111	Jellinek 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1112	Jensen 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1113	Jerrell 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1114	Jerrell 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1115	Jeste 1983 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1116	Jimerson 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1117	Jin 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1118	Joergensen 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1119	Johns 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1120	Johnson 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1121	Johnson 1981 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1122	Johnson 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1124	Johnson 1981 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1125	Johnson 1981 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1126	Johnson 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1127	Johnson 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1128	Johnstone 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1129	Johnstone 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1130	Jolley 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1131	Jones 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1132	Jones 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1133	Meder 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1135	Jonckheere 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1136	Jones 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1138	Jørgensen 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1139	Joshi 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1140	Joshi 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1141	Jost 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1142	Jostell 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1143	Judah 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1144	Judd 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1145	Jus 1974 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1146	Jus 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1147	Kabes 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1148	Kahn 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1149	Kahn 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1150	Kahn 1994 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1151	Kahn 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1152	Kalinin 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1153	Kalyanasundaram 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1154	Campbell 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1155	Charalampous 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1156	Cheng 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1157	Chiu 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1158	Chouinard 1983 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1159	Chouinard 1977 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1160	Chouinard 1978 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1161	Cody 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1162	Cohen 1987 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1164	Corrigan 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1165	Cowden 1956 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1170	Daniel 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1171	Daston 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1172	Davis 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1173	de Buck 1973 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1175	Baldini 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1176	Bankier 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1177	Bechelli 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1178	Benedict 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1179	Bishop 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1180	Bogetto 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1181	Bora 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1185	Cooper 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1187	Dalack 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1188	Daniel 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1190	Daniel 1994 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1191	Garver 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1194	Fleischhacker 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1196	Foss 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1197	Freeman 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1198	Freeman 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1199	Gallant 1967 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1200	Gallhofer 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1201	Gallhofer 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1202	Gardos 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1203	Gardos 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1204	Garver 1984 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1206	Gelkopf 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1208	Glazer 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1211	Herinckx 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1212	Heresco 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1213	Herz 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1216	Herz 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1218	Herz 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1219	Herz 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1221	Himwich 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1222	Hirsch 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1223	Hogarty 1974 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1224	Hogarty 1979 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1226	Holden 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1227	Hollister 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1228	ELCCT 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1231	Kane 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1232	Kane 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1233	Kane 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1235	Kaplan 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1236	Kapur 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1237	Karlsson 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1238	Karniol 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1240	Karsten 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1241	Katila 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1242	Katz 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1243	Kaufmann 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1244	Kazamatsuri 1972 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1245	Kazdova 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1246	Keks 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1247	Kellam 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1248	Kellner 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1249	Kelly 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1250	Kelly 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1251	Kane 1982 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1252	Kelly 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1253	Kelly 1995b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1254	Kelwala 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1255	Kemp 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1256	Kendrick 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1257	Kennedy 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1259	Keskiner 1968 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1260	Keskiner 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1261	Keskiner 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1262	Keskiner 1968 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1264	Khorana 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1265	Kidron 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1266	Kielhofner 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1267	Kiloh 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1269	Kim 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1270	King 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1271	Kern 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1272	King 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1273	King 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1274	King 1992 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1275	King 1992 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1277	King 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1278	Kingstone 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1279	Kinney 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1280	Kinon 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20231	田博 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1281	Kinon 1993 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1282	Kinross 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1283	Kirli 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1284	Kissling 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1285	Kistrup 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1286	Klein 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1287	Klein 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1288	Kleinbloesem 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1289	Kleinman 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1290	Klett 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1292	Klein 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1293	Klieser 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1297	Kline 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1298	Kline 1967 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1299	Kline 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1301	Knapen 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1303	Knight 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1304	Kobayashi 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1305	Kochansky 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1306	Kogeorgos 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1307	Kojima 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1309	Kolivakis 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1310	Konrad 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1311	Korner 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1312	Kornetsky 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1313	Korol 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1314	Korsgaard 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1315	Koshikawa 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1316	Kothari 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1317	Koukkou 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1318	Kovitz 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1319	Kramer 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1320	Kramer 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1322	Kramer 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1323	Kramer 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1325	Kramer 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1326	Krawiecki 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1327	Kreeger 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1328	Kreisman 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1329	Krus 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1330	Krystal 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1332	Barchas 1980 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1333	Bastecky 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1334	Bjerkenstedt 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1335	Bjerkenstedt 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1336	Buchkremer 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1338	Davies 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1339	Corsini 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1340	Dalack 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1341	Davis 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1342	de Col 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1343	De Ronchi 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1344	Dean 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1345	Decina 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1347	Demerdash 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1350	Clark 1977 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1354	Den Boer 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1355	DiGiacomo 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1356	Denijs 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1357	Diaz Buxo 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1358	Dickey 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1359	Dillenkoffer 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1360	Dilling 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1361	Dincin 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1362	Dixon 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1363	Donlon 1976 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1364	Donnelly 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1365	Doran 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1366	Dufresne 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1368	Durell 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1369	Dutoit 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1371	Edelstein 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1372	Asher 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1373	Breier 1993 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1374	Carman 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1375	Chouza 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1377	de Cangas 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1378	Duval 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1379	Duval 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1381	Elizur 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1382	Ellenor 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1383	Emrich 1980 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1384	Emsley 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1387	Engelhardt 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1388	Erlandsen 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1390	Faretra 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1392	Abuzzahab 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1393	Antun 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1394	Clark 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1395	Crow 1977 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1396	de Cuyper 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1397	Dim 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1398	Drake 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1399	Ferebee 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1400	Filip 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1401	Ayd 1972 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1404	Falloon 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1407	Fredericks 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1408	Fleischhacker 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1409	Gonzalez 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1410	Gaebel 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1411	Garrison 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1412	Goldstein 1969 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1414	Gordon 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1415	Gottschalk 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1416	Drury 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1417	Fink 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1418	Ferrier 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1419	Gagrat 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1422	Alpert 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1423	Anonymous 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1424	Bilone 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1425	Branchey 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1426	Caldarazzo 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1427	Castellani 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2918	Watson 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1429	Curry 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1430	Diamare 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1431	Falloon 1978 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1433	Bastie 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1435	Brambilla 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1437	Clerc 1989 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1441	Digo 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1442	Digonnet 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1444	Dotti 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1446	Emrich 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1447	Giannelli 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1448	Ferrari 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1454	Haas 1982 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1455	Haffmans 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1456	Hamner 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1457	Goldwurm 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1458	Grasso 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1459	Gravem 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1460	Greenbaum 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1461	Grinspoon 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1462	Growe 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1463	Guazzelli 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1464	Gudeman 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1465	Gundlach 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1466	Gunther 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1467	Albert 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1468	Barbier 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1469	Berner 1989 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1470	Ciurezu 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1472	Costa e Silva 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1473	Darondel 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1475	Essock 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1477	Hardeman 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1478	Harford 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1479	Harris 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1480	Harris 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1481	Hawkins 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1482	Hayano 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1483	Hayes 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1484	Henley 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1486	Harrow 1951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1489	Glick 1975 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2919	Watt 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1490	Gupta 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1491	Konig 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1492	Kopell 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1494	Kordas 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1495	Kornetsky 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1496	Krebs 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1497	Krystal 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1499	Krystal 1993 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1500	Kudo 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1501	Kudo 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1502	Kugler 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1503	Kugler 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1504	Kuipers 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1505	Kuipers 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1506	Kuipers 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1507	Kuldau 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1508	Kulkarni 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1509	Kumari 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1513	Kurland 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1514	Kurland 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1515	Kurland 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1517	Kurland 1966 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1518	Kutcher 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1519	Lafave 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1520	Lahdelma 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1521	Lahti 1995a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1523	Lahti 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1524	Lam 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1525	Lampe 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1527	Kabes 1980 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1528	Kahn 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1529	Kalichman 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1530	Kammerer 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1531	Kammerer 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1533	Kariya 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1534	Karon 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1535	Lam 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1537	Lamontagne 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1538	Landis 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1539	Landmark 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1540	Lange 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1541	Langley 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1542	Langsley 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1543	Lapierre 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1544	Lapierre 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1545	Lapierre 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1546	LaPorte 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1547	Hollister 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1548	Huber 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1549	Itil 1969 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1550	Lascelles 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1551	Lasky 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1552	Latz 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1553	Laurell 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1555	Laurell 1970 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1556	Lawrie 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1557	Leblhuber 1987 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1558	Lecrubier 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1559	Lee 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1560	Lee 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1561	Lee 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1562	Lee 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1563	Lee 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1564	Lee 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1565	Lee 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1566	Leff 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1567	Lahti 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1568	Lapierre 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1569	Lapierre 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1570	Lapolla 1965 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1571	LaPorte 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1572	Leff 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1574	Lehman 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2920	Weber 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1575	Lehman 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1576	Lehman 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1577	Lehmann 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1579	Lehmann 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1580	Lehmann 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1581	Lehmann 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1582	Leighman 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1583	Leitch 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1584	Lemmens 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1585	Lemmens 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1586	Pfefferbaum 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1587	Lenzi 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1590	Leon 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1591	Leong 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1592	Lepola 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1593	Lerer 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1594	Lerner 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1595	Lerner 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1596	Leszek 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1597	Letemendia 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1598	Levin 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1599	Levin 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1600	Levine 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1601	Levine 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1602	Levinson 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1604	Levitt 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1605	Levy 1983 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1606	Levy 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1607	Levenson 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1608	Levenson 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1609	Levin 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1610	Levine 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1612	Levine 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1614	Levine 1993 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1616	Levy 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12590	Hahlweg 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1617	Levy 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1618	Levy 1983 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1619	Lewis 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1620	Lewis 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1621	Leyton 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1622	Li 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1623	Liberman 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1724	Maletzky 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1725	Maley 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1726	Malfroid 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1727	Malik 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1728	Malm 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1729	Malm 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1730	Maloney 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1731	Malt 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1733	Mandel 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1734	Mandel 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1735	Mangen 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1736	Manos 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1737	Man 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1738	Manchanda 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1739	Manis 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1740	Marais 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1741	Marchesi 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1742	Marchesi 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1743	Marder 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1744	Marder 1991 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1745	Marder 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1746	Marder 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1747	Marjerrison 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1748	Marjerrison 1966 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1749	Marjerrison 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1750	Marjerrison 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1751	Marks 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1752	Marsálek 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1753	Marshall 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1754	Martin 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1755	Martin 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20232	胡亚兰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1756	Martin 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1757	Angst 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1758	Angst 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1759	Anonymous 1993 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1760	Barnas 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1762	Bergener 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1763	Buchkremer 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1764	Burchard 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1765	Conley 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1766	D'Orsi 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1767	Hartelius 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1768	Heim 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1769	Hirsch 1989 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1771	Jonsson 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1772	Arrojo 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1773	Asada 1976 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1774	Beasley 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1777	Bohacek 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1778	Bond 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1779	Brzezicki 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1780	Bures 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1781	Cocchi 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1782	Degkwitz 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1783	Dieterle 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1784	Dohner 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1785	Doongaji 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1786	Eckmann 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1787	Etienne 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1788	Eufe 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1790	Galfi 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1791	Goncalves 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1792	Gonzalez 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1793	Hadlik 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1794	Herz 1989 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1795	Freeman 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1797	Gallant 1963 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1799	Goldberg 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1800	Hogarty 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1801	Hogarty 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1802	Johnstone 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1803	Beckmann 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1804	Bellack 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1805	Buchkremer 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1806	Hong 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1807	Eckmann 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20233	卢卫红 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1808	Fischer 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1810	Haas 1982 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1811	Heimann 1974 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1812	Hirsch 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1813	Awad 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1814	Bao 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1815	Ceskova 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1816	Feng 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1818	Fleischhauer 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1819	Goncalves 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1821	Hornung 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1822	Jing 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1823	Brambilla 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1824	Caffey 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1825	Dorevitch 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1826	Duoshen 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1827	Elie 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1828	Foster 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1829	Jungkunz 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1830	Keitner 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1831	Kern 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1833	Good 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1834	Gottfries 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1835	Antropov 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1837	Bakharev 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1838	Bishop 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1839	Bloch 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1840	Centorrino 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1841	Ceskova 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1842	Chen 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1843	Chen 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1844	Coleman 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1845	Delwaide 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1848	Gardos 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1849	Fenton 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1850	Goldstein 1969 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1851	Gryzunov 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1853	Gui-yun 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1854	Hayano 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1855	Hayano 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1857	Hollister 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1859	Joe 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20234	陆如平 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1860	Huang 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1861	Itil 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1862	Kabes 1980 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1863	Kawakita 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1865	Klieser 1992 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1867	Klieser 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1868	Kluiter 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1869	Knights 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1870	Ko 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1871	Kohler 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1872	Konrad 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1873	Kornhuber 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1874	Ladisich 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1875	Leblhuber 1987 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1876	Lewandowski 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1877	Shu 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1879	Linden 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1880	Liu 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1881	Mahadevan 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1882	Martinot 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1883	Martyns 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1884	Marx 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1885	Masiak 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1886	Masson 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1887	Mathew 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1888	Mathew 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1889	Mathur 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1890	Matkowski 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1891	Matsunaga 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1892	Mattes 1985 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1893	Mattes 1985 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1895	Mattes 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1897	Mattila 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1898	Matz 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1899	Matzner 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1900	Mauri 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1901	Mavreas 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1902	Mavroidis 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1903	Mavroidis 1984 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1904	Mavroidis 1984 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1907	McCall 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1909	McClelland 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1957	Merskey 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1911	McClelland 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1912	McCord 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1913	McCreadie 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1914	McCreadie 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1915	McCreadie 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1916	McCreadie 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1917	McCreadie 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1918	McCreadie 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1919	McCreadie 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1920	McCreight 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1921	McEvoy 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1922	McEvoy 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1923	McEvoy 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1924	McEvoy 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1925	McEvoy 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1928	McEvoy 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1929	McFarlane 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1930	McFarlane 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1931	McFarlane 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1933	McGorry 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1934	McGorry 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1935	McGrath 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1936	McGrath 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1938	McIndoo 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1939	McInnes 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1940	McInnes 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1941	McInnis 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1943	McKenzie 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1945	Meco 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1947	Meltzer 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1949	Meltzer 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1950	Meltzer 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1951	Mena 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1952	Mendlewicz 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1953	Menolascino 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1954	Menon 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1955	Menon 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1958	Meshel 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1959	Meshel 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1960	Messier 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1961	Metzer 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1962	Meyendorf 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1963	Mezquita 1972 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1964	Midha 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1965	Mielke 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1966	Mikheeva 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1967	Millar 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1968	Miller 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1969	Miller 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1970	Miller 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1971	Miller 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1972	Milne 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1973	Milner 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1975	Min 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1976	Min 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1977	Mindham 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1978	Mindham 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1979	Minervini 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1982	Mitchell 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1983	Mitchell 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1984	Mizuki 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1985	Mizuki 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1986	Modrcin 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1987	Muller 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1989	Modestin 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1990	Modestin 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1991	Moffat 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1992	Mohler 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1995	Moller 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1996	Moller 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1997	Moller 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1998	Monteleone 1988 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1999	Monteleone 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2000	Montero 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2001	Montgomery 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2002	Moore 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2003	Moore 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2921	Weckowicz 1960 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2004	Moore 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2005	Morse 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2006	Morton 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2007	Morand 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2008	Morgan 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2009	Morphy 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2010	Morris 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2011	Morrison 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2013	Midha 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2014	Morandini 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2015	Morinigo 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2016	Morse 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2018	Mosher 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2019	Mosnik 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2020	Moss 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2021	Mouret 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2022	Movin 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2023	Moyano 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2024	Muijen 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2026	Mulder 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2027	Mulholland 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2028	Muller 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2030	Munitz 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2031	Munkvad 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2034	Muyard 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2035	Myers 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2036	Naber 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2037	Naber 1983 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2038	Naber 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2039	Nachshoni 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2040	Nagaraja 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2041	Nahunek 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2042	Nahunek 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2044	Nahunek 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2045	Nahunek 1982 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2046	Nahunek 1982 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2047	Nahunek 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2048	Nahunek 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2049	Nahunek 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2050	Nair 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2051	Nair 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2052	Naidoo 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2053	Nair 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2054	Nakazawa 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2055	Nasrallah 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2056	Nasrallah 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2057	National 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2058	Neal 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2059	Nedopil 1985 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2060	Nedopil 1985 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2061	Needham 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2062	Negrette 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2063	Nelson 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2065	Neppe 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2066	Nestoros 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2067	Nestoros 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2068	Nestoros 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2069	Netter 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2070	Netter 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2071	Neu 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2072	Neubauer 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2073	Newcomer 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2074	Nicholas 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2075	Nicolini 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2076	Nicolson 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2077	Nienhuis 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2079	Nisbet 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2080	Nishikawa 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2081	Nishikawa 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2082	Nishikawa 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2083	Nishikawa 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2084	Nishikawa 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2087	Nistico 1974 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2089	Norbeck 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2090	Nuechterlein 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2091	Nuechterlein 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2093	Nurowska 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2094	O'Brien 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2095	O'Brien 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2239	Potkin 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2096	O'Connor 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2097	O'Connor 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2098	Odejide 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2099	Oei 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2100	Offer 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2101	Ogata 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2102	Okasha 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2103	Okuma 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2104	Olson 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2105	Oltman 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2106	Omerov 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2107	Ortega 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2110	Ortega-Soto 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2111	Orzack 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2112	Marjerrison 1966 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2113	May 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2114	Mayo 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2115	McAllister 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2116	Olbrich 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2117	Os'makova 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2118	Ota 1974 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2119	Ota 1974 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2120	Otero 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2122	Ottosson 1960 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2128	Overall 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2129	Overall 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2130	Owen 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2131	Owen 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2132	Owens 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2134	Pai 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2135	Paillere 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2136	Palao 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2139	Palmstierna 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2140	Panaccio 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2141	Pancheri 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2142	Pandurangi 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2143	Pang 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2144	Paprocki 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2145	Paredes 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2146	Parent 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2147	Parent 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2148	Park 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2149	Park 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2150	Patris 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2151	Pattie 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2153	Patterson 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2154	Patterson 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2155	Paul 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2156	Paul 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2157	Paul 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2158	Paulman 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2159	Paulson 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2160	Paunovic 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2161	Payne 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2162	Payne 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2163	Pazdirek 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2164	Peak 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2165	Pearl 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2166	Pecknold 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2167	Pecknold 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2168	Peet 1981 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2171	Peet 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2173	Peniston 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2174	Penman 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2175	Peppel 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2176	Perales 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2180	Peselow 1987 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2181	Peselow 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2184	Petit 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2187	Petrie 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2188	Petzel 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2189	Pfeiffer 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2190	Pfeiffer 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2191	Pflug 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2192	Pflug 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2193	Phanjoo 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2194	Pharr 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2195	Phillips 1965 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2196	Pi 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2197	Pichot 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2198	Pickar 1987 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2199	Pickar 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2200	Pickar 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2201	Pickar 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2202	Pickar 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2203	Pickar 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2204	Pickar 1987 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2205	Pietzcker 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2206	Pigache 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2207	Pinard 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2208	Pinto 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2209	Pinto 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2211	Pishkin 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2212	Pishkin 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2213	Placidi 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2214	Platz 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2215	Pleasure 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2216	Prien 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2217	Polak 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2219	Pollack 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2220	Pollmacher 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2222	McClelland 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2224	Merlis 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2225	Monteleone 1988 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2226	Montigny 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2227	Munetz 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2229	Newton 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2231	Nordic 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2232	Ota 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2233	Poldinger 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2234	Pollack 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2235	Portnow 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2236	Posner 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2237	Potkin 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2238	Potkin 1997 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20235	严琦 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2240	Potkin 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2241	Potkin 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2242	Pool 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2243	Porot 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2244	Poser 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2246	Potkin 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2248	Potkin 1994 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2249	Potkin 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2251	Prange 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2252	Prange 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2254	Price 1987 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2255	Price 1987 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2257	Prien 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2258	Prien 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2260	Prien 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2261	Van Praag 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2262	Perez 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2263	Perovich 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2265	Provenza 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2266	Prusoff 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2267	Pryce 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2268	Pryce 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2269	Psaras 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2271	Puente 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2272	Pugh 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2274	Quinlivan 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2276	Quinn 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2279	Quitkin 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2280	Rachman 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2281	Rackensperger 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2282	Rada 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2283	Rada 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2284	Ragland 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2285	Rammsayer 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2286	Ramsay 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2287	Ramu 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2289	Rama Rao 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2290	Rapisarda 1982 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2292	Rapp 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3325	Karniol 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2293	Rappaport 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2294	Rappaport 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2295	Rappaport 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2296	Rappaport 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2297	Raptis 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2298	Rasch 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2299	Rasheed 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2300	Rasmussen 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2301	Rastogi 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2302	Rassidakis 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2304	Ratey 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2305	Rathod 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2306	Rathod 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2307	Ravaris 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2309	Ravensborg 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2310	Rawitt 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2311	Razali 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2314	Realmuto 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2316	Reardon 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2317	Rees 1951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2318	Rees 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2321	Reichert 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2322	Reid 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2324	Reinhardt 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2325	Reiter 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2327	Remr 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2328	Remvig 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2329	Ren 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2330	Reschke 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2332	Rice 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2333	Richardson 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2334	Richardson 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2335	Rickels 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2336	Rifkin 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2337	Rifkin 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2339	Rifkin 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2340	Rifkin 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2341	Rifkin 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2343	Rinaldi 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2344	Rinieris 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2345	Ritter 1972 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2346	Ritter 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2347	Ritter 1972 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2348	Robak 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2349	Robinson 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2350	Robinson 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2351	Roder 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2352	Rodova 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2353	Rodova 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2354	Roelofs 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2405	Salomon 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2406	Salzman 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2407	Sampath 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2408	Samuels 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2409	San Miguel 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2414	Sanfilipo 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2415	Santos 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2416	Sarai 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2417	Saretsky 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2418	Sarkar 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2420	Sauter 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2421	Saxena 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2422	Schlosberg 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2423	Schaffer 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2424	Scheuing 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2425	Schiele 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2426	Schiele 1969 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2427	Schmauss 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2428	Schmidt 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2429	Schmidt 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2431	Schmidt 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2432	Schnetzler 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2434	Schooler 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2437	Schulman 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2438	Schulz 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2439	Schulz 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2440	Schut 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20236	唐伟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2441	Schwartz 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2442	Scanlan 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2443	Scapicchio 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2444	Schoenen 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2445	Schonell 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2450	Schooler 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2451	Schrut 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2453	Schulz 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2454	Schulz 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2457	Seager 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2458	Sebree 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2459	Seeman 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2460	Sehdev 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2462	Seiler 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2994	Woggon 1986 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2995	Wolkowitz 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2996	Owen 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2999	Wolk 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3000	Wolkin 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3001	Wolkin 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3002	Wolkin 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3004	Wolkowitz 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3005	Wolpert 1968 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3006	Wood 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3007	Wyant 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3008	Xia 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3009	Xiang 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3010	Xiao 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3011	Xiong 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3015	Yamawaki 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3016	Abse 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3017	Adityanjee 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3018	Affleck 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3019	Al-Faris 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3020	Alson 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4642	Weldon 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4644	Werner 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4645	Weinhardt 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4646	Zhang 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4647	Wykes 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4648	Yue 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4649	Wyatt 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4650	Yang 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4651	Wykes 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4655	Zhang 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4656	Zhang 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4657	Yang 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4660	Yagi 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4661	Wollersheim 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4664	Wykes 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4665	Zwanikken 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4669	Addington 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4671	Rosen 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4672	Filteau 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4673	Abramowitz 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4674	Potterat 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4675	Freyslinger 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4676	Nugent 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4677	Lomax 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4678	Bronzino 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4679	Arace 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4680	Buchbauer 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4681	McCarthy 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4682	Streicker 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4683	Hunter 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4684	Mooney 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4685	Green 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4686	Abston 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4687	Lancaster 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4688	Potelunas 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4689	Agan 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4690	Wagner 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4691	McLatchie 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4692	Loper 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4693	Denicola 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5513	Cotes 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4694	Glover 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4695	Beckham 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4696	Pique 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4697	Marshall 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4700	Janicak 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4704	Silver 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4705	Matthews 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4706	Prien 1968 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4708	Turkington 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4709	Karon 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4710	Gray 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4711	Cohen 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4712	Mosko 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4720	Warner 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4721	Shimodera 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4722	Penn 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4724	Umbricht 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4725	Raaska 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4727	Shern 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4728	Chu 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4730	Schmid 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4732	Dalack 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4733	Schultz 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4734	Sharma 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4735	Balasubramanian 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4736	Nedopil 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4737	Dimroth 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4738	Maurer 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4739	Rapp 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4752	Tyrer 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4753	NCT00001247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4754	Woods 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4755	Wallace 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3601	Volk 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4756	Velligan 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4757	Wilson 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4758	Turner 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4760	Bentall 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4762	Berns 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4764	Birchwood 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4765	Birchwood 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4766	Birchwood 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4768	Brownlee 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4769	Bullock 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4770	Burns 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5485	Rist 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5487	Gallagher 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5491	Heimann 1974 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5492	Berner 1989 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5493	Barchas 1980 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5494	Arbitman 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5496	Haas 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5499	Hassiotis 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5500	McKenzie 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5502	Clark 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5503	Hansen 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5504	Crow 1977 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5506	Brown 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5507	Golightly 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5509	Lesem 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5511	Berk 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5512	Caspi 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20237	贾艳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5520	Miller 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5521	Malla 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5522	Lam 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5523	Kluznik 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2465	Selman 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2466	Semenov 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2467	Seppala 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2469	Serban 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2470	Serok 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2471	Seth 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2472	Sethi 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2473	Shaskan 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2474	Shawver 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2476	Scheinin 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2477	Shader 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2478	Shader 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2479	Shalev 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2480	Shalif 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2481	Shanker 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2482	Sharma 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2483	Sharma 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2486	Shaw 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2487	Shaw 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2488	Sheldon 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2489	Sheldon 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2490	Shelton 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2491	Shenoy 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2493	Shepherd 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2494	Shestakov 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2496	Henry 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2497	Shiloh 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2498	Shirvaikar 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2499	Shopsin 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2500	Shopsin 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2501	Shopsin 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2502	Shriqui 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2503	Shvartsburd 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2504	Sibilio 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2505	Silbergeld 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12592	Bender 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2506	Silver 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2509	Silver 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2510	Silverman 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2511	Silverstone 1984 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2512	Silverstone 1984 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2513	Simpson 1972 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2514	Simpson 1972 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2515	Simpson 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2516	Sime 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2517	Simeon 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2519	Simon 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2520	Simopoulos 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2521	Simpson 1973 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2522	Simpson 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2523	Simpson 1972 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2524	Simpson 1971 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2525	Simpson 1970 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2526	Simpson 1967 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2527	Simpson 1968 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2528	Simpson 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2529	Simpson 1967 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2530	Simpson 1976 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2531	Simpson 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2533	Simpson 1970 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2534	Simpson 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2535	Sims 1975 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2536	Simpson 1976 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2537	Simpson 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2538	Simpson 1971 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2539	Simpson 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2540	Simpson 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2541	Sines 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2542	Singer 1971 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2544	Singer 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2545	Singh 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2546	Singh 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2547	Singh 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2548	Singh 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2549	Singh 1973 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2550	Singh 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2551	Singh 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2552	Singh 1973 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2557	Siris 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2560	Siris 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2565	Siris 1983 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2567	Siris 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2569	Sjostrom 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2570	Skopova 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2574	Slotnick 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2575	Sluchevskii 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2577	Small 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2579	Small 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2581	Smith 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2582	Smith 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2583	Smith 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2584	Smith 1959 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2585	Smith 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2586	Smith 1987 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2587	Smith 1961 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2588	Smith 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2589	Smith 1960 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2590	Smith 1960 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2591	Smith 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2593	Smythies 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2594	Smythies 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2595	Soloff 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2596	Shu 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2597	Shu 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2598	Soldatos 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2600	Solomon 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2601	Solomon 1998 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2602	Solomon 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2603	Solomon 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2604	Somerville 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2606	Sommerness 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3603	Weiden 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2607	Song 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2608	Soni 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2609	Soni 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2610	Soni 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2611	Soni 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2612	Sorgi 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2613	Soria 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2614	Soucek 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2615	South 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2617	Speer 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2620	Spencer 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2621	Spencer 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2622	Spiegel 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2623	Spina 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2624	Spina 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2625	Spohn 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2626	Spohn 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2627	Spohn 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2628	Spohn 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2630	Sramek 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2631	Stabenau 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2632	Stahl 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2633	Stanley 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2635	Stauning 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2636	Stearns 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2637	Steffes 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2638	Steffy 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2639	Stein 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2640	Stein 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2641	Stein 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2642	Steinberg 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2643	Steinbook 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2644	Steinbook 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2645	Steiner 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2646	Steinert 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2647	Steingard 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2697	Swenson 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20238	周益辉 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2648	Stenback 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2649	Stenson 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2650	Sterlin 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2651	Stevens 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2652	Stevens 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2654	Stewart 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2655	Stewart 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2656	Sterlin 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2657	Sterlin 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2661	St Jean 1964 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2662	St Jean 1964 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2663	St Jean 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2665	Storms 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2666	Stotsky 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2667	Straight	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2672	Sturm 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2673	Su 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2674	Subramaney 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2675	Suddath 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2676	Sugerman 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2677	Sugerman 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2678	Sugerman 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2679	Sullivan 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2680	Sundby 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2681	Susser 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2683	Suzuki 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2684	Svestka 1989 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2685	Svestka 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2686	Svestka 1982 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2687	Svestka 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2688	Svestka 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2689	Svestka 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2690	Svestka 1989 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2691	Svestka 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2692	Svestka 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2693	Svestka 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2694	Svestka 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2696	Svestka 1982 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2698	Syvalahti 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2700	Szmukler 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2703	Taiminen 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2705	Takahashi 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2707	Takeshita 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2708	Talbot 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2709	Tamminga 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2710	Tamminga 1986 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2711	Tamminga 1986 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2712	Tamminga 1986 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2713	Tamminga 1986 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2714	Tamminga 1978 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2715	Tamminga 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2716	Tamminga 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2717	Tamminga 1978 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2719	Tamminga 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2720	Tamminga 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2723	Tang 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2724	Tanghe 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2729	Tarsy 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2733	Taylor 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2734	Tegeler 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2735	Teja 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2736	Telles 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2737	Tench 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2738	Tenenblatt 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2739	Terao 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2741	Test 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2744	Tetreault 1969 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2749	Thaker 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2751	Thaker 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2753	Thorpe 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2754	Tobin 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2756	Toledo 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2757	Tompkins 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2758	Toru 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2759	Toru 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2760	Tourney 1960 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12594	Graber 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2761	Tourney 1960 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2764	Tran 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2765	Trandafir 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2767	Trichard 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2768	Tripodianakis 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2769	Troshinsky 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2770	Tuason 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2771	Tuason 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2772	Tucker 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2773	Tuma 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2774	Turjanski 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2775	Turner 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2776	Sermat 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2777	Shutty 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2778	Speller 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2779	Strakowski 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2780	Thorpe 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2781	Turner 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2782	Tyrer 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2783	Tyrer 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2784	Ucer 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2785	Uddyback 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2786	Uhlir 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2787	Ulett 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2788	Ullmann 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2789	Ungvari 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2792	Ungvari 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2793	Urquhart 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2795	Vaddadi 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2796	Vaddadi 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2797	Vagen 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2798	Vaisanen 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2799	Vallely 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2800	Van Berckel 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2801	Van Berckel 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2802	Van Hassel 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2804	Van Kammen 1985 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2806	Van Kammen 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15767	Cabrera 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2807	Van Praag 1975 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2809	Van Praag 1971 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2810	Van Praag 1982 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2811	Van Kammen 1985 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2812	Van Ree 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2813	Van Ree 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2814	Van Wyk 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2815	Van Wyk 1971 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2816	Van Kammen 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2817	Van Kammen 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2820	Van Kammen 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2821	Van Leeuwen 1977 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2822	Van Lommel 1974 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2824	Van Minnen 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2825	Van Praag 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2826	Van Putten 1986 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2827	Van Putten 1986 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2828	Van Putten 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2829	Van Putten 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2830	Van Ree 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2833	Vandecasteele 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2834	VanderZwaag 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2835	Vanherweghem 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2836	Van Dyke 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2837	Van Kammen 1982 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2838	Van Kammen 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2839	Van Praag 1973 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2840	Van Putten 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2841	Vangala 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2842	Vanherweghem 1979 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2843	Vartiainen 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2844	Vasavan 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2845	Vaughan 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2846	Vaughan 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2847	Velligan 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2848	Venables 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2850	Verhoeven 1981 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2852	Verhoeven 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2856	Van Der Velde 1975 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2857	Vangtorp 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2859	Vereecken 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2861	Verhoeven 1984 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2862	Verhoeven 1981 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2863	Verhoeven 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2864	Verhoeven 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2866	Versiani 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2867	Vestre 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2868	Viala 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2869	Vianna 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2871	Villeneuve 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2872	Villeneuve 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2873	Vinar 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2874	Vinar 1976 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2875	Vincent 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2876	de Vogelaer 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2877	Vinar 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2878	Vinar 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2880	Vinar 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2881	Vital 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2882	Viukari 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2883	Vlissides 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2889	Volavka 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2890	Volavka 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2891	Volavka 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2892	Volavka 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2893	Volterra 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2895	Volterra 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2896	Volavka 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2899	Vollema 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2900	Volz 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2902	Vyas 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2903	Wada 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2904	Wadzisz 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2905	Waehrens 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2906	Wagemaker 1983 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2907	Wagemaker 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2909	Wahlund 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2911	Walinder 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2914	Walsh 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2915	Wang 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2916	Watson 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2917	Watson 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2922	Weckowicz 1960 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2923	Wehnert 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2924	Weiden 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2925	Weingaertner 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2926	Weinman 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2927	Weir 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2929	Welbel 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2930	Welbel 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2931	Wells 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2935	Weston 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2936	Wessels 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2937	West 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2938	Wetzel 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2939	Wetzel 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2941	Wexler 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2942	Whetstone 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2943	White 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2945	Whiteford 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2946	Whitehead 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2947	Whittaker 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2948	Widerlov 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2952	Wikler 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2954	Wilson 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2955	Wilson 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2956	Walker 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2957	Wiles 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2958	Wiles 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2959	Wilkins 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2962	Williams 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2964	Wilson 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2965	Wilson 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2966	Wilson 1982 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2967	Wilson 1982 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2969	Wing 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2970	Winslow 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2971	Winter 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2972	Winter 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2973	Winter 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2975	Wirt 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2976	Wirshing 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2977	Wirshing 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2978	Wirshing 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2981	Wistedt 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2983	Wistedt 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2985	Wittenborn 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2986	Wittenborn 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2987	Witton 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2989	Wode-Helgodt 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2991	Woggon 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2992	Woggon 1986 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2993	Woggon 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3021	Andersen 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3023	Cole 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3024	Anonymous 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3025	Anonymous 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3026	Barsa 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3028	Bellini 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3031	Ben-Dor 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3032	Bennett 1954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3035	Beuzen 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3038	Asch 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3039	Ascough 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3041	Baker 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3042	Bizon 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3043	Blum 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3044	Blumberg 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3045	Blumberg 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3049	Brankovic 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3050	Braus 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3051	Brecher 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3054	Brill 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3055	Broadhurst 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3058	Byalin 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3059	Cabrera 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3060	Casacchia 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3062	Cerniglia 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3063	Aman 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3064	Andia 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3065	Bastecky 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3067	Caffey 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3068	Chance 1954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3069	Buruma 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3070	Carscallen 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4564	Schulsinger 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3072	Chandler 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3073	Chaplin 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3074	Chen 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3075	Cohen 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3076	Collins 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3077	Claghorn 1967 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3078	Clark 1968 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3079	Clark 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3080	Cohen 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3082	Coryell 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3083	Costello 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3088	Davidson 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3090	Alpert 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3091	Anderson 1982 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3092	Auberger 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3093	Blin 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3094	Braden 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3095	de Smedt 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3096	de Giacomo 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3097	de Jong 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3100	Desager 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3101	Devriese 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3102	Arato 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3103	Bouchard 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3104	Brook 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3106	Dickey 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3107	Dilonardo 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3108	DiMascio 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3109	Domino 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3110	Dorevitch 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3111	Douglas 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3113	Wolpert 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3114	Yamada 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3115	Yamagami 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3116	Yamagami 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3119	Yan 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3120	Yang 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3121	Yisak 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3122	Yisak 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3124	Yorkston 1977 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3125	Yorkston 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3126	Young 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3128	Young 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3129	Youssef 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3130	Youssef 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3131	Yu 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3134	Zann 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3135	Zapletalek 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3136	Zapletalek 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3137	Zapletalek 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3139	Zapletalek 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3140	Zarranz 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3141	Zastowny 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3142	Zeller 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3143	Zemishlany 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3145	Zhang 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3146	Zhang 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3147	Zhang 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3148	Zhang 1987 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3149	Zhang 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3150	Zhang 1994 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3151	Zhang 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3152	Daniel 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3153	Diamond 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3154	Velligan 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3155	Vernallis 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3156	Vestre 1961 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3158	Vollenweider 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3160	Zimmermann 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3161	Zirkle 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3162	Zissis 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3164	Zohar 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3167	Zuoze 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3168	Zuzarte 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3169	Zuzarte 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3170	Zwanikken 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18176	Navidian 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3172	Diamond 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3173	Downing 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3174	Downing 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3176	Engelhardt 1969 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3177	Fann 1973 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3178	Fann 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3180	Fisk 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3181	Frangos 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3182	Freedman 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3183	Freedman 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3184	Freedman 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3186	French 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3188	Friedhoff 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3189	Friedhoff 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3190	Fudge 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3191	Gabrynowicz 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3192	Gallagher 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3193	Gardos 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3195	Garfield 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3196	Garry 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3197	Geddes 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3198	George 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3200	Gerlach 1975 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3201	Gilbertson 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3202	Gilgash 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3203	Giordana 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3204	Goff 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3205	Goff 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3206	Gelenberg 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3207	Gelenberg 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3208	Goldberg 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3209	Goldberg 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3210	Goldman 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3211	Goldstein 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3212	Goldstein 1966 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3213	Goldstein 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3214	Gorelick 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3215	Gould 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20239	杨绪娜 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3219	Clark 1970 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3220	Allard 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3221	Bjorndal 1980 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3222	Blanc 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3225	Cowen 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3227	Christensen 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3228	Christensen 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3229	WR  1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3233	Greenberg 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3234	Greendyke 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3235	Grinspoon 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3236	Gripp 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3237	Gross 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3239	Growdon 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3240	Gu 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3241	Guilmot 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3242	Grinspoon 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3243	Wirshing 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3244	Zhang 1987 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3246	Yamagami 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3247	Zernig 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3248	Anonymous 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3249	Bagby 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3250	Baba 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3251	Beard 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3252	Bell 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3253	Ezra 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3255	de Ronchi 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3256	Dengler 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3257	Evans 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3258	Greil 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3260	Gutierrez 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3261	Guy 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3262	Hackman 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3263	Haider 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3264	Hajioff 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3265	Hall 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3266	Hanlon 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3267	Harrington 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3268	Hellerstein 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18766	Caseiro 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3269	Hamelin 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3270	Hart 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3271	Hartley 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3272	Hartley 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3275	Heath 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3276	Hebenstreit 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3279	Hesslinger 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3280	Hesso 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3281	Hickerson 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3282	Higgins 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3283	Hirsch 1989 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3284	Hirschowitz 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3285	Hodel 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3286	Holden 1969 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3287	Hoffer 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3292	Huang 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3294	Hymowitz 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3295	Inanaga 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3296	Ionescu 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3297	Issakidis 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3298	Itil 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3299	Jackson 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3301	Jaffe 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3302	Jakobitsch 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3303	Jambur 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3304	Jankovic 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3305	Janowsky 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3306	Janowsky 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3307	Jasovic 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3308	Jensen 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3309	Jeste 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3310	Jeste 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3311	Johnstone 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3314	Jones 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3315	Jus 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3316	Jus 1974 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3318	Kahn 1993 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3320	Kalachnik 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3321	Kanas 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3322	Kandel 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3323	Kang 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20240	彭爱琴 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3326	Karon 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3328	Mercer 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3330	Meyer-Lindenberg1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3333	Modai 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3334	Monroe 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3335	Morselli 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3336	Mulholland 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3338	Cutler 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3339	Adler 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3342	Awad 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3344	Battaglia 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3346	Bellaire 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3347	Bieniek 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3350	Bastiaens 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3353	Barrowclough 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3354	Browne 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3355	Bruns 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3356	Buchanan 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3357	Buckley 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3359	Carpenter 1992 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3360	Carroll 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3361	Cassady 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3362	Clouth 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3363	Chanpattana 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3364	Carpenter 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3365	Breier 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3367	Cormier 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3369	Covi 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3371	Denef 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3372	Dorevitch 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3376	Emsley 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3377	Faustman 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3378	Fenton 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3379	Fenton 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3380	Fleischhacker 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3381	Friberg 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3382	Gaebel 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3384	Golightly 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3385	Goncalves 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3386	Gottschalk 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3387	Grawe 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3388	Gray 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3389	Green 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3390	Hampton 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3391	Haverstock 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3392	Hirsch 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3393	Hoffman 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3394	Iizuka 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3395	Ivarson 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3397	Junker 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3398	Kazamatsuri 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3402	Kelly 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3403	Kelly 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3406	Danion 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3409	Kenny 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3410	Kenway 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3412	Kim 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3413	Kim 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3415	King 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3417	Kinon 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3418	Kitzinger 1949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3419	Kleinman 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3421	Klimke 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3422	Kline 1967 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3423	Knott 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3424	Koller 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3425	Komori 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3426	Korinkova 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3427	Korsgaard 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3428	Krystal 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3429	Krystal 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3430	Kuang 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3431	Kudo 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3432	Kuipers 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3435	Kurland 1966 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3436	Kurland 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3437	Kurland 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3438	Lahti 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3439	Lahti 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3440	Lal 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3442	Lamb 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3443	Lapierre 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3444	Lapolla 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3445	Laurian 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3446	Leckman 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3448	Lee 1994 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3449	Lehman 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3450	Lehrl 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3451	Lejoyeux 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3452	Leon 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3453	Levita 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3454	Leys 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3455	Li 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3456	Liberman 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3457	Lieberman 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3458	Lindenmayer 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3459	Lindenmayer 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3460	Lindsay 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3461	Linn 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3462	Linnoila 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3463	Linszen 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3464	Littrell 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3465	Lopez 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3466	Lorr 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3467	Lublin 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3468	Luckey 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3469	Ludatscher 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3470	Lynch 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3471	Magner 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3473	Mak 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3474	Malhotra 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3475	Malhotra 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3476	Marder 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3477	Marjerrison 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3478	Marken 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3479	Marneros 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3480	Marsálek 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3482	Mattila 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3483	Mattke 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3484	Mattke 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3485	McBain 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3486	McDonald 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3487	McEvoy 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3488	McEvoy 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3489	McGorry 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3490	McGorry 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3491	McKeever 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3493	McLaren 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3494	Medalia 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3495	Melnyk 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3500	Muller 1978 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3503	Murasaki 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3504	Nahunek 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3505	Nahunek 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3506	Nair 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3507	Nasrallah 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3508	Needham 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3509	Netz 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3510	Nijdam 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3511	Nussbaum 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3512	Nutt 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3513	Nuttbrock 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3514	O'Hanlon 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3515	O'Reilly 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3516	Offord 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3517	Olfson 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3518	Otani 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3519	Pach 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3521	Parellada 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3522	Pathiraja 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3523	Pecknold 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3525	Penovich 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3526	Petit 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3527	Petit 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3528	Phan 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3530	Pinard 1972 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3531	Pishkin 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3532	Poyurovsky 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3534	Puech 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3535	Puri 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3537	Potkin 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3538	Rainaut 1975 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3540	Rasmussen 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3543	Reeves 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3544	Reinstein 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3545	Reker 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3547	Riemann 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3548	Rinaldi 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3549	Ringwald 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3550	Roback 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3551	Rondot 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3552	Roos 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3553	Roos 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3557	Rosenthal 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3558	Rubin 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3559	Saito 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3560	Sakurai 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3561	Salokangas 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3566	Schultz 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3568	Schwartz 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3569	Sedman 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3570	Selze 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3571	Sensky 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3573	Serafetinides 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3575	Silver 1996 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3578	Singer 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3580	Slavinsky 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3583	Spitzer 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3584	Stein 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3585	Takeshima 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3589	Taylor 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3590	Tetreault 1969 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3591	Theilemann 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3592	Thomas 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3596	Tollefson 1996  b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3598	Van Praag 1981 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3599	Vanherweghem 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3600	Velligan 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19295	唐红 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3605	Wirshing 1992 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3607	Wykes 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3610	Daniel 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3611	Daniel 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3614	Gerlach 1977 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3615	Gerlach 1977 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3618	Glazer 1985 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3619	Glazer 1985 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3624	Hayano 1991 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3625	Hayano 1991 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3628	Hogarty 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3630	Janowsky 1977 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3631	Janowsky 1977 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3633	Jerrell 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3634	King 1959 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3635	King 1959 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3638	Knudsen 1985 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3639	Knudsen 1985 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3641	Knudsen 1985 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3642	Kocher 1980 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3644	Lee 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3645	Lee 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3652	Mahmoud 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3654	Munroe 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3655	Munroe 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3657	Petit 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3658	Pichot 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3659	Pichot 1988 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3661	Platt 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3667	Sanger 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3670	Schulman 1983 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3671	Schulman 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3672	Simpson 1973 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3673	Simpson 1973 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3674	Smith 1977 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3675	Smith 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3676	Smith 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3677	Smith 1977 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3678	Solomon 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3830	Wilner 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3680	Solomon 1995 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3681	Spencer 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3682	Spencer 1994 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3683	Swift 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3684	Swift 1998 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3685	Tamminga 1979 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3686	Tamminga 1979 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3690	Gunderson 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3691	Hall 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3695	Herrmann 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3697	Knights 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3701	Pickar 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3702	Hoult 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3707	Borison 1994b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3708	Johnstone 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3709	Johnson 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3710	Judd 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3711	Kane 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3713	Kane 1983 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3715	Hirsch 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3716	Kornetsky 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3717	Kornestsky 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3718	Kulkarni 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3721	Kurland 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3722	klieser 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3723	Leff 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3724	Leff 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3726	Manos 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3727	Marshall 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3728	NCT00249132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3730	Marder 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3733	Munoz 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3734	Marchesi 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3735	Mason-Browne 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3736	May 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3737	McCreadie 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3740	Merson 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3742	McCrone 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3744	Munk 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3746	Neborsky 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3748	Goldberg 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3751	Nordström 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3757	Pasamanick 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3758	Peet 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3759	Petho 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3762	Pickar 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3764	Pigache 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3765	Heilizer 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3766	Prien 1968 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3768	Reeves 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3769	Remr 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3772	Schooler 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3774	Sakalis 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3775	SSRG 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3779	Kasper 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3780	Serafetinides 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3790	Geraisy 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3791	Simon 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3792	Singh 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3793	Sledge 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3795	Solomon 1994 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3799	Tarrier 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3801	Tollefson 1997 HGAJ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3821	Truax	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3822	Van Putten 1991 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3823	Van Putten 1991 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3824	Verhoeven 1981 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3825	Wode-Helgodt 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3826	Wistedt 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3827	Wistedt 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3833	Wittenborn	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3834	Uys 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3835	Van Putten 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3836	Volavka 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3838	Volavka 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3842	Wiersma 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3843	Verhoeven 1981 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3844	Vernallis	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3845	Villeneuve 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3846	Villeneuve 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3847	Villeneuve 1970 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3848	Vinar 1968 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3849	Vinar 1968 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3850	Vinar 1968 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3852	Volk 1976 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3854	Aagaard 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3860	Agarwal 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3861	Akhondzadeh 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3862	Akhtar 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3864	Allan 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3866	Anashkina 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3868	Clark 1973 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3872	Glick 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3873	Glick 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3874	Goff 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3875	Hoffman 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3876	Hoffman 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3878	Kendrick 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3880	McGlynn 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3881	Nordentoft 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3936	Aquila 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3938	Beasley 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3939	Bordeleau 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3940	Burrell 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3941	Amin 1977 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3943	Bitter 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3944	Abel 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3945	Ban 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3946	Benedict 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4113	Pecknold 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3947	Barak 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3949	Branchey 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3951	Aliyev 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3954	Bredkjær 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3955	Anker 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3956	Coons 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3957	Catafau 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3958	Coons 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3961	Çetin 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3962	Canive 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3968	Ceron 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3972	Clark 1971 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3974	Cooper 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3978	Currier 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3979	Daniel 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3980	Daniel 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3981	Daniel 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3983	Danion 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3985	Deutsch 1977 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3986	Deutsch 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3991	Eaton 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3993	Emsley 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3995	Engelhart 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3996	Erehefsky 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3997	Essock 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3999	Fox 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4001	Gallant 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4002	Gauthier 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4006	Godemann 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4007	Godleski 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4008	Gouzoulis 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4047	Gross 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4048	Gunne 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4055	Harvey 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4057	Hellerstein 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4058	Henderson 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20241	谭淑平 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4059	Hermesh 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4060	Hind 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4061	Hobbs 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4062	Hogarty 1974 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4063	Hranov 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4068	Jenner 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4074	Knegtering 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4075	Koenigsberg 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4076	Koenigsberg 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4078	Reeves 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4079	Marder 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4081	Mintzer 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4082	Mulqueen 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4083	Pesco 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4084	Rector 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4085	Risch 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4088	Sajatovic 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4090	Kudo 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4091	Lemperiere 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4092	Matkovits 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4093	Mergl 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4094	Mullen 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4095	Munjiza 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4096	Murasaki 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4097	Nordentoft 1999 OPUS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4099	Levene 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4100	Perro 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4101	Pushkaryova 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4102	Ramsay 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4103	Remr 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4104	Rostow 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4106	Sirota 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4110	Lehmann 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4112	Paprocki 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19296	蓝惠燕 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4114	Quitkin 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4115	Rifkin 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4116	Vergara 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4117	Michael 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4119	Schnore 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4121	Li 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4122	Lysaker 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4123	Mokrani 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4124	Ranz 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4125	Riemann 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4126	Weiden 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4127	Wiedemann 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4128	Wu 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4129	Kablinger 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4135	Kaleda 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4136	Daniel 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4137	Frazier 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4138	Nagao 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4139	Kolff 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4140	Lindan 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4141	Lee 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4143	Lasser 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4145	Lam 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4146	Kreitschman 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4147	Kulkarni 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4148	Martényi 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4149	Marjerrison 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4150	Murasaki 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4151	McGlashan 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4152	McGorry 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4153	Mosher 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4155	Nahunek 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4156	Scheepers 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4157	Rajotte 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4159	Schooler 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4160	Norrie 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4161	Postma 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4162	Potkin 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4163	Reuster 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4164	Schneider 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4166	Yaryura 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4167	Tetreault 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4168	Sharpley 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4169	Wright 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4171	Schooler 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4172	Smith 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4173	Simons 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4174	Swift 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4178	Clark 1970 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4179	Arango 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4180	Aravagiri 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4183	Ascher 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4185	Angunawela 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4186	Aoba 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4187	Auriol 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4188	Andres 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4189	Azrin 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4190	Azrin 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4192	Bark 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4194	Barker 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4196	Becker 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4197	Bauml 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4198	Beck 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4201	Behere 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4202	Bhatia 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4203	Bredkjær 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4207	Berk 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4208	Bickel 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4210	Bernardi 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20242	谢琴 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4211	Buchsbaum 1992 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4212	Callaghan 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4213	Byrne 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4214	Buccheri 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4216	Burns 1998 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4218	Buckley 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4219	Burns 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4221	Channabasavanna 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4222	Cetin 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4224	Chai 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4227	Caracci 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4228	Carpenter 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4229	Chang 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4231	Calsyn 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4232	Chaplin 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4233	Chouinard 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4234	Cantell 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4235	Castellani 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4236	Chartier 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4237	Carroll 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4239	Carpenter 1991 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4241	Chow 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4244	Cooper 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4245	Crawford 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4248	Chouinard 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4251	Cramer 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4252	Coburn 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4253	Creed 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4255	Colonna 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4256	Christianson 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4258	Corsini 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4261	Deskmukh 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4263	Davis 1985 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4264	Curtis 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4563	Schipper 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4265	Csernansky 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4268	Degkwitz 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4270	Dalack 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4272	Delaney 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4273	Davidoff 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4275	Davis 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4276	Darby 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4278	Den Boer 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4280	Dua 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4283	Elizur 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4284	Eisler 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4285	Earnst 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4286	Drotts 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4287	Drake 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4288	Eranti 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4289	Elman 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4290	Dose 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4291	Drake 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4292	Eguiluz 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4293	Dorfman 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4296	Dyck 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4297	Dixon 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4298	Eklund 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4299	Eckmann 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4300	Fischer 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4301	Fekete 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4302	Fernandez 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4303	Facciola 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4304	Essock 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4305	Evins 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4306	Fillatre 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4307	Finch 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4308	Fink 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4309	Filipova 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4310	Fleischhacker 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4312	Glick 1997 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4313	Gill 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4314	Glicksohn 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4315	Goff 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4316	Freeman 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4318	Geretsegger 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4319	Fucetola 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4320	Gardos 1974 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4322	Goldstein 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4323	Fishwick 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4324	Goldberg 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4326	Garver 1984 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4327	Goodacre 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4329	Griffith 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4330	Green 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4331	Haasen 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4332	Gutierrez 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4333	Gunter 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4334	Gutride 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4335	Grunder 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4336	Gouzoulis 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4337	Guy 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4338	Hahlweg 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4339	Hagg 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4340	Haddock 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4342	Hafner 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4343	Hemnani 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4345	Halperin 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4347	Hellman 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4348	Heresco 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4349	Hedges 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4351	Herz 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4352	Hassiotis 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4355	Henggeler 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4356	Held 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4358	Hirschowitz 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4359	Hong 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4365	Hicklin 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4369	Huttunen 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4370	Johnston 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4372	Jin 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4374	Johnstone 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4375	Janowsky 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4376	Jequier 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4387	Kane 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4388	Kaiser 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4389	Kaiser 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4390	Jungerman 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4391	Jones 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4392	Kaneno 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4393	Kamis 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4394	Kaneko 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4395	Kaiser 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4397	Keck 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4399	Kapur 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4400	Kapur 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4401	Kapur 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4402	Kelly 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4403	Kellam 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4404	Kato 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4405	Kato 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4406	Khanna 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4408	Kern 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4409	Kern 1997 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4411	Kirli 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4412	Keshavan 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4413	King 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4414	Kendrick 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4415	Kemperdick 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4416	Krystal 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4418	Kopelowicz 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4419	Kramer 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4420	Kroner 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4422	Kopelowicz 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4423	Klinkenberg 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4424	Klein 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4425	Kremer 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4426	Kulkarni 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4427	Lahti 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4428	Levine 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4430	Krystal 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4431	Kumra 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4433	Lapierre 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4435	Lahti 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4439	Lavalaye 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4440	Kudo 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4442	Lacruz 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4443	Leese 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4444	Lapuc 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4445	Kurland 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4447	Louwerens 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4449	Lucey 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4450	Makaric 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4451	Lewis 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4452	Louwerens 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4453	Lynch 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4456	Lui 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4457	Liu 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4460	Liu 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4461	Lindholm 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4462	Mahal 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4463	Mahal 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4464	Manning 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4466	McGorry 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4467	Merlo 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4469	Meltzer 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4470	Mitchell 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4472	McHugo 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4474	Miceli 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4475	Masciocchi 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4476	McInnis 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4477	Monroe 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4478	Merinder 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4479	Mishory 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4480	McDougall 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4481	Mattke 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4482	McCrone 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4483	Mavroidis 1984 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4484	Mavroidis 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4486	Natani 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4487	Naukkarinen 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4488	Mraz 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4489	Mowbray 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4490	Montero 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4491	Monteleone 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4492	Murasaki 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4494	Mori 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4496	Netter 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4497	Newcomer 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4498	Nordström 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4499	Newcomer 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4500	Nuttbrock 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4501	Nijman 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4502	Noorbala 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4503	O'Donnell 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4504	Nigl 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4505	Nitsun 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4506	Oliemeulen 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4507	Patra 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4510	Odhner 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4511	Petrides 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4512	Oranje 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4513	Pach 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4515	Oka 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4516	Pach 1998 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4517	Pach 1998 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4520	Okuma 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4521	Perry 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4522	Paire 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4523	Parent 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4524	Petrioli 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4527	Reeder 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4528	Rachkauskas 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4531	Poyurovsky 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4532	Pinto 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4533	Priebe 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4535	Radant 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4536	Pisvejc 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4538	Reinstein 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4539	Rickard 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4540	Hu 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4542	Reyntjens 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4543	Resnick 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4544	Robert 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4545	Robin 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4546	Roder 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4547	Scheepers 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4549	Schulz 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4550	Sellwood 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4551	Schulz 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4554	Sajjad 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4558	See 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4560	Salganik 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4561	Schmider 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4562	Schneider 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20243	孙志刚 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4565	Sainz 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4566	Peet 2001a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4567	Sethi 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4568	Srivastava 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4569	Singh 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4570	Sim 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4571	Sovani 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4572	Spooren 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4573	Sernyak 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4574	Silver 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4575	Shamir 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4576	Sensky 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4577	Smith 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4578	Simpson 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4579	Sharma 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4580	Sramek 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4581	Sramek 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4582	Sharpley 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4583	Sizaret 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4586	Suppes 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4588	Svensson 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4589	Takahashi 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4590	Swartz 1999a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4592	Sweeney 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4594	Swanson 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4595	Swartz 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4599	Thompson 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4602	Tegeler 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4603	Taylor 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4605	Thornicroft1 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4606	Trotorella 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4609	Tyrer 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4610	Tollefson 1998 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4932	Chien 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4612	Valencia 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4614	Van-Berckel 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4616	Ungvari 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4617	Ungvari 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4620	Torrey 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4621	Tsai 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4622	Tollefson 1999 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4623	Truffinet 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4624	Turvey 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4627	Velligan 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4628	Wiersma 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4629	Velligan 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4631	Van-Berckel 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4632	Vaughan 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4633	Wang 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4634	Wetzel 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4635	Verster 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4637	Walsh 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4639	Van Berckel 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4640	Volavka 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4641	Wolf 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4771	Burns 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4772	Burns 2000 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4773	Bustillo 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4774	Byerly 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4775	Byng 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4777	Carey 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4778	Centorrino 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4779	Chakos 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4780	Chan 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4781	Chengappa 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4933	Curry 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4784	Day 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4785	Dick 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4787	Donnison 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4788	Drury 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4789	Durham 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4790	Durham 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4791	Dyck 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4792	Dye 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4794	Essock 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4795	Evans 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4796	Evins 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4797	Fowler 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4798	Freedman 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4800	Garety 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4802	George 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4803	Goff 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4804	Goff 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4806	Golightly 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4809	Greene 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4810	Gumley 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4811	Gumley 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4812	Haddock 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4813	Haddock 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4814	Haenschel 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4817	Harvey 2000 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4818	Hasey 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4822	Heresco 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4823	Hirsch 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4824	Hirsch 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4825	Hoffman 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4826	Hogarty 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4827	Honer 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4830	Jones 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4831	Jones 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4832	Jones 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4833	Kane 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4834	Kee 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4835	Kelleher 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4836	Kelly 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4837	Kern 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4840	Kindermann 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4842	Klein 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4844	Kuipers 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4845	Kulkarni 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4846	Lacro 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4847	Leavey 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4848	Leavey 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4849	Lester 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4851	NCT00628290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19406	王秀芳 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4853	Lewis 2000 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4854	Lewis 2000 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4858	Lieberman 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4859	Lynch 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4860	Magnuson 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4862	Marangell 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4863	Marder 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4865	Marshall 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4866	McCreadie 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4869	Mintz 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4870	Newcomer 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4871	Otto 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4873	Paykel 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4876	Perkins 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4877	Petch 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4878	Purdie 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4883	Reveley 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4884	Reveley 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4888	Rohriht 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4889	Rosebush 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4890	Sackeim 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4891	Sahakian 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4893	Sensky 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4894	Sensky 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4899	Sharma 2000 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19407	掌永莉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4900	Sharma 2000 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4901	Sharma 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4902	Sheitman 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4904	Startup 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4905	Startup 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4908	Szmukler 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4909	Szulecka 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4910	Tarrier 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4911	Tarrier 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4912	Tarrier 2000 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4913	Tarrier 2000 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4914	Tarrier 2000 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4915	Tarrier 2000 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4916	Taylor 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4917	Theresa 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4918	Trower 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4919	Trower 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4920	Turkington 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4922	Sharma 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4924	Bauml 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4925	Bauml 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4926	Becker 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4927	Boehle 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4928	Borg 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4930	Campbell 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4931	Catlin 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4934	Fahn 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4935	Fitzgerald 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4936	Fleming 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4937	Freeman 1980 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4938	Gater 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4939	Goldfinger 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4940	Henggeler 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4941	Jackson 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4942	Kabes 1980 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4943	Lanza 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4944	Lecomte 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4945	MacDonald 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4946	Mosca 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4947	Peyman 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4948	Anand 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4949	Andersen 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4950	Arato 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4951	Barbhaiya 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4955	Bradshaw 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4957	Breier 1999 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4958	Brook 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4959	Bryson 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4961	Classen 1989 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4962	Classen 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4966	Zelaschi 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4968	Zimbroff 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4970	Zhu 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4971	Conley 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4972	Covell 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4973	D'Souza 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4974	David 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4978	Fahy 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4979	Fenton 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4980	Fleming 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4981	Fuller 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4982	Glynn 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4983	Goff 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4985	Good 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4986	Jeppesen 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4987	Kim 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4990	Lenert 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4995	Zheng 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4997	Konicki 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4999	Kulkarni 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5000	Kurtz 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5001	Lahti 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5002	Lahti 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5004	Goldensohn 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5005	Krajewski 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5006	Lancon 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5007	Lenior 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5009	SOCRATES	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5010	Madonick 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5013	Miller 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5014	Mitchell 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5015	Mockler 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5016	Newcomer 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5017	Nordentoft 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5018	O'Neill 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5021	Phillips 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5026	Suzuki 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5028	Garmezy 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5029	Klieser 1992 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5030	Kuhs 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5031	Lemmer 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5034	Naber 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5036	Perenyi 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5037	Peter 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5038	Preussler 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5039	Preussler 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5040	Reeves 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5041	Richardson 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5042	Sadik 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5043	Schooler 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5045	Siris 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5046	Swift 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5434	Beramendi 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5047	Toney 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5048	Umbricht 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5049	Van Bruggen 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5050	Vestre 1961 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5052	Wright 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5054	Bauml 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5055	Berk 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5056	Carpenter 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5057	Cooper 2000 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5058	Copolov 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5063	Reeves 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5064	Roder 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5066	Sharma 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5067	Sherr 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5068	Spaulding 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5069	Thompson 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5070	Tys 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5072	Velligan 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5073	Victolo 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5074	Wehnert 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5075	Wirshing 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5076	Wykes 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5077	Wykes 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5078	Yurgelun 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5079	Anderson 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5080	Baker 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5081	Carpenter 1983 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5082	Clark 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5083	Davidson 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5084	Draine 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5085	Gallant 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5086	Gallant 1971 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5087	Gentry 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5088	Gershon 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5090	Havassy 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5092	Lehmann 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5143	Kasckow 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20244	王帅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5093	Mahmoud 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5094	Mayang 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5096	Rossger 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5097	Schonell 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5099	Stankovska 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5100	Wagemaker 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5101	Wetzel 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5102	Wright 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5105	Beasley 1996 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5106	Brecher 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5108	Chouinard 1979 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5110	Dalheim 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5116	Kohler 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5117	Levy 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5120	Mihara 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5121	O'Connor 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5122	Purdon 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5123	Razali 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5124	Reznik 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5125	Schuld 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5126	Shamir 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5127	Shamir 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5128	Shaw 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5129	Silver 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5130	Simpson 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5131	Simpson 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5133	Stevens 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5134	UK700 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5135	Velligan 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5136	Wassef 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5138	Wirshing 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5140	Zinner 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5141	Dunn 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5142	Granholm 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6409	Takahashi 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5144	Kinon 2001 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5145	McQuaid 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5146	Angst 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5147	Anonymous 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5150	Browne 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5151	Burns 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5152	Carpenter 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5153	Chacon 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5159	Fransella 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5160	Gater 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5161	Gelkopf 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5162	Glen 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5164	Greendyke 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5165	Greil 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5166	Haase 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5168	Huang 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5169	Jann 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5171	Levine 1997 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5172	Lipska 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5173	Malhotra 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5175	Miceli 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5177	Mosnik 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5180	Patat 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5181	Pujalte 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5182	Raaska 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5183	Reeves 1998 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5184	Reeves 1998 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5186	Roitman 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5187	Ropert 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5188	Schiele 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5191	Schwartz 1997 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5192	Sharma 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5193	Singer 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5195	Swanson 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5196	Swift 1998 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5197	Szafranek 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5370	Petersen 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5198	Teague 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5199	Zemishlany 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5200	Zubenko 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5202	Luo 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5203	Bamrah 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5239	Alberti 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5240	Almond 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5241	Altamura 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5242	Altamura 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5243	Bitter 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5245	Colonna 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5246	Cosar 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5248	Daniel 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5249	Daniel 1999 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5250	David 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5251	Diehl 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5253	Giudicelli 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5255	Hirsch 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5256	Kinon 1999 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5257	Krupitsky 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5258	Lecrubier 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5259	Lemperiere 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5260	Lerner 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5261	Loza 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5262	Malyarov 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5263	Nordström 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5264	Rein 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5267	Sirota 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5268	Snaterse 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5269	Szafranski 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5271	Weiden 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5274	Cole 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5275	Alter 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5276	Canning 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5277	Rossi 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5278	Hickman 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5279	Gary 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5280	Muller-Clemm 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5281	Price 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5282	Cannon 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5372	Potkin 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5283	Aldavoud 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5284	Coyle 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5285	Tom 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5287	Kleiser 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5288	Koettgen 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5289	Schubert 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5290	Muller 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5291	Addington 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5292	Alva 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5293	Alvarez 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5297	Bell 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5298	Bera 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5301	Berman 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5303	Bobes 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5305	Buckley 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5312	Cucchiaro 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5313	D'Souza 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5314	David 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5316	Denney 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5317	Depatie 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5319	Dittmann 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5322	Ereshefsky 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5324	Friedman 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5325	Gaebel 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5330	Hammond 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5333	Jarboe 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5335	Jenner 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5338	Kalali 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5340	Kern 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5342	Kinon 2001 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5344	Kristiansen  2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5346	Lehman 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5356	McGurk 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5357	Medalia 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5358	Meltzer 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5359	Miknyak 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5360	Miller 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5364	Naber 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5365	Nordentoft 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5367	Paquet 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5373	Purdon 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5380	Ritch 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5383	Sikich 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5384	Small 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5387	Thaker 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5389	Velligan 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5390	Ventegodt 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5391	Weisman 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5394	Wilner 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5396	Wright 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5400	Arango 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5401	Adityanjee 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5402	Bellack 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5403	Armenteros 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5404	Apicella 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5405	Barnes 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5406	Barnes 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5407	Adams 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5409	Bark 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5410	Bell 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5411	Brook 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5412	Rüther 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5415	Tyrer 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5416	Murasaki 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5419	Hirose 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5420	Arioni 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5421	Cohler 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5422	D'Urso 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5424	Mezquita 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5425	Jerrell 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5426	Frojan 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5427	Eleazer 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5428	Panteleyeva 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5429	Haran 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5430	Vinci 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5431	Kaden 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5432	Bueno 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5433	Dusek 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20245	徐晔 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5436	Pelham 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5437	Rosenheck 1993 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5438	Durr 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5439	Kaufmann 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5440	Zuoning 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5441	Bond 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5442	Palma 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5443	Murow 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5444	Meyers 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5445	Matthee 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5446	Kudo 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5447	Mori 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5448	Itoh 1985 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5449	Okuma 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5451	Murasaki 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5452	Itoh 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5454	Ishimaru 1971 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5456	Tanimukai 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5457	Kudo 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5458	Shi 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5460	Yang 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5461	Mark 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5463	Zhao 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5464	Kudo 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5465	Kudo 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5466	Takahash 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5467	Shimizu 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5468	Tanimukai 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5470	Feng 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5471	Li 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5472	Anonymous 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5473	Kokasa 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5474	Yanai 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5475	Onodera 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5477	Kudo 1983 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5478	Kurihara 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5479	Takesada 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5480	Gu 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5481	Gunther 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5484	Florin 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6410	Itoh 1969 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5525	Mueser 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5526	Vinson 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5527	Dixon 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5528	Medalia 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5529	Harvey 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5530	Cuesta 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5532	Walsh 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5534	Bellack 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5535	Ayd 1972 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5536	George 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5537	Kern 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5538	Muller 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5539	Steadman 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5541	Rapisarda 1982 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5542	Medalia 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5545	Lehtinen 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5546	McGeary 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5547	Carriere 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5551	Keck 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5552	Petit 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5554	Ellis 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5555	Clarke 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5556	Covington 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5558	Kaji 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5559	Okada 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5560	Kojima 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5561	Kondo 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5562	Kudo 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5563	Nakazawa 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5564	Saito 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5565	Shimizu 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5568	Nishimatu 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5569	Kariya 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5570	Murasaki 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5571	Itoh 1969 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5572	Leclerc 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5574	Mosolov 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5576	Vinson 2001a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5577	Tomaras 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5578	Basan 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5579	Dalack 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5580	Chowdhury 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5582	Beasley 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5583	Barsa 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20246	祁玲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5584	Gambill 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5585	Herman 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5587	Zito 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5592	Rees 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5593	Lapolla 1965 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5595	Tarrier 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5596	Barrowclough 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5597	Cockburn 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5598	Weston 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5599	Lamb 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5601	Bellack 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5604	Gray 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5605	Carey 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5606	Tran 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5610	Toro 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5611	Washburn 1976 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5614	Briggs 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5615	Itil 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5616	Hollister 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5617	Griffiths 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5618	Becker 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5619	Platt 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5623	Miller 1953	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5624	Leone 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5630	Allison 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6384	Breier 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6386	Chaplin 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6387	Beebe 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6388	Barak 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6389	Shrivastava 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6391	Ryan 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6392	Grassi 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6394	Blankertz 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6395	Anonymous 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6396	Lilburn 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6397	McGorry 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6398	Kazamatsuri 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6399	Kudo 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6401	Toru 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6402	Umene 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6404	Muller 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6407	Min 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6408	Wu 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20247	李育军 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6411	Macias 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6412	Xue 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6413	Cappelen 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6415	Volz 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6416	Anzai 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6417	Woods 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6419	Samele 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6420	Kluger 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6421	Lingjaerde 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6422	Wiedemann 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6424	Dolnak 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6426	Goldman 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6431	De Cuyper 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6432	Kamisada 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6433	Zinner 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6434	Martinot 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6437	Beard 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6438	Chouinard 1983 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6439	Itoh 1969 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6441	Heylen 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6442	Gerbaldo 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6445	Clardy 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6446	Mackeprang 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6448	Wessels 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6449	Blin 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6454	Ritchie 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6458	Crosthwaite 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6463	Pappas 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6464	Baumann 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6465	Hitzemann 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6471	Gutierrez 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6474	Daniel 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6475	Kudo 1994 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6478	Perro 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6479	Yagdiran 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6484	Burns 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6485	Morrison 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6486	Gold 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6488	Roder 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6491	Van Der Gaag 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6492	Wilk 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6494	Koch 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6497	Kudo 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6498	Hirano 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6499	Okubo 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6501	Burhan 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6502	Suleman 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6504	Adler 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6505	Morozova 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6506	Lerner 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6507	Haug 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6509	Naber 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6510	Vichaiya 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6513	Tait 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6514	Ayers 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6516	Bishop 1966 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6518	Yorkston 1976 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6519	Clark 1970 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6520	Itil 1970 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6521	Lehmann 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6522	Lehmann 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6523	Krumholz 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6524	Kurland 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6525	Gallant 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6526	Yaryura 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6527	Schiele 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6528	Merlis 1968 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6529	Krumholz 1968 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6530	Krumholz 1968 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6531	Clark 1968 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6532	Wolpert 1968 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6533	Clark 1969 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6534	Krumholz 1968 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7400	Cai 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7401	Wang 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7402	Chen 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7403	Cui 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7404	Zhou 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7405	Tao 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7406	Chen 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7407	Zoccali 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7408	Mamo 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7409	Wiersma 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7410	Chou 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7411	Gan 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7412	Liu 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7413	Jiang 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7414	Zhang 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7415	Wang 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7416	Huang 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7417	Sun 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7420	Fucetola 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7422	Ritter 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7424	Alphs 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7426	Xiao 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7428	Simpson 1968 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7429	Weickert 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7430	Chen 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5634	Brandstaetter 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5635	Brecher 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5636	Breier 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5638	Bustillo 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5643	Fischer 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5644	Friedman 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5646	Gefvert 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5648	Glenthoj 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5655	Hellewell 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5656	Hoffman 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5658	Jauhar 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5663	Kinon 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5664	Lanzaro 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5665	Lecrubier 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5666	Lee 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5667	Lemmer 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5670	Marques 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5671	Mazian 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5672	McGurk 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5674	Meltzer 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5675	Mullen 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5677	Möller 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5678	Peuskens 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5679	Philipps 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5680	Potkin 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5682	Risch 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5684	Salzman 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5687	Vasquez-Gomez 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5689	Yurgelun-Todd 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5690	Zhong 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5691	Burns 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5694	Simhandl 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5697	Akhondzadeh 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5698	Azorin 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19408	周益辉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5699	Wright 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5700	Lerner 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5701	Adler 1994a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5704	Owens 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5705	Lenior 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5706	Byford 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5707	Mattes 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5709	Esel 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5710	Swoboda 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5711	Michaux 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5713	Janecek 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5714	Gallant 1963 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5715	Gallant 1963 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5716	Bishop 1963 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5719	Summerfelt 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5720	Raymond 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5722	Peet 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5724	Bellack 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5726	Odland 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5727	Langsley 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5728	Rosen 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5729	Tsang 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5734	Langsley 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5737	Buitelaar 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5738	Ishigooka 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5739	Nishizono 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5740	Phillips 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5741	Bartels 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5742	Davis 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5743	Bergemann 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5745	Anonymous 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5746	Gordon 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5747	Berk 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5749	Deberdt 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5752	Godley 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5753	Lindenmayer 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5754	Su 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5757	Haffmans 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5760	Duval 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5761	Diaz 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5762	Brook 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5763	Breier 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5764	Bilder 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5765	Awad 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5766	Atmaca 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5768	Anil 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5771	Yagdiran 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5773	Turkington 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5777	Peuskens 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5782	Loza 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5785	Ananth 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5787	Breier 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5788	Breier 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5791	Castle 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5793	Conde 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5794	Dunn 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5796	Gabriels 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5797	Gefvert 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5798	Glick 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5801	Klotz 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5802	Kolivakis 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5803	Lehmann 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5806	Littrell 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5808	Martinez 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5809	McGlashan 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5814	Pai 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5815	Poyurovsky 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5816	Reinstein 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5817	Rosenberg 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5818	Shamir 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5821	Simpson 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5823	Turkington 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5824	Turkington 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5826	Walsh 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5828	Wirshing 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5833	Levine 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5834	Schulz 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5835	Fenton 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5836	Okpaku 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5840	Bagadia 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5842	Bell 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5844	Velasquez 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5847	Sheppard 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5848	Wolff 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5850	Daniels 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5851	Schmidt 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5852	Floru 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5853	Engstrand 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5854	Funke 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5857	Gaertner 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5859	Pereira 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5860	Smeraldi 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5862	Bandeira 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5867	Sittampalam 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5868	Solomon 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5870	Hayashi 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5872	Bergman 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5874	Wolkon 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5875	Zwerling 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5876	King 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5878	Vestre 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5879	Janakiramiah 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5880	Lecompte 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5881	Goldman 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5885	Caffey 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5887	Walker 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5888	Azrin 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5890	Keith 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5891	Bridler 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5892	Shiloh 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5894	Blaha 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5895	Bomboir 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5896	Ishimaru 1971 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5897	Ruphan 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5898	Lecompte 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5899	Borell 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5905	Kodama 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5907	Schene 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5908	Sharpley 1964 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5909	Whittier 1960 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5910	McEvoy 1993 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5912	Alfredsson 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5916	Jones 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5919	Lahti 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5922	Carpenter 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5924	Bell 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6356	St Jean 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5926	Dunn 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5927	Sumiyoshi 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5928	Barrowclough 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5932	Whittier 1960 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5935	Feldmann 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5937	Gillin 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5938	Smith 1977 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5940	McCartan 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5941	Mueser 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5942	Schutz 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5943	Zhang 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5944	Boyer 1989 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5945	Estorges 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5946	Monfort 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5947	Oliveira-Castro 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5948	Barrelet 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5949	Lemperiere 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5950	Santiago 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5951	Burger 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5955	Alexander 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5956	Arango 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5957	Baker 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5958	Baker 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5960	Battaglia 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5961	Bechdolf 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5964	Brewer 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5965	Brook 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5966	Castle 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5967	Cavazzoni 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5968	Chue 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5970	Cutler 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5971	Czekalla 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5972	David 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5976	Emsley 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5978	Gharabawi 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5988	Keefe 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5989	Kingdon 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5991	Knegtering 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5992	Korell 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5995	Kumari 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5998	Linszen 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5999	Marcelis 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6000	Maurer 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6001	McGlashan 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6002	Meehan 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6003	Merlo 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6004	Morrison 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6005	Muller 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6007	Nienhuis 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6008	Nikiforova 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6010	O'Donnell 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6011	Ohlenschlaeger 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6012	Olié 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6013	Power 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6014	Ritch 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6015	Sharma 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6016	Turkington 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6019	Vangeneugden 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6020	Vlokh 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6021	Walsh 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6025	Wykes 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6027	Zachariah 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6028	Brecher 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6030	Cheine 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6031	Chanpattana 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6034	Collins 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6035	Blumberg 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6037	Lehman 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6042	Sharpley 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6048	Blake 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6050	Chanpattana 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6052	Corrigan  2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6053	Cramer 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6056	Medalia 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6057	Singh 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6058	Singh 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6060	Wahass 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6061	Chanpattana	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6062	Small 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6064	Olié 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6065	Lane 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6785	Tandon 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6067	Hale 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6069	Haasen 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6070	Roder 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6074	Lindenmayer 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6075	Huxley 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6079	Segers 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6080	Gelders 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6081	Perry 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6082	Balow 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6083	Imai 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6085	Corr 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6087	Wotman 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6089	Bigelow 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6090	Cante 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6091	Macmillan 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6093	Tsai 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6094	McFarlane 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6095	Winnik 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6097	Hochstadt 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6099	Adler 1992a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6100	Cavallaro 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6104	Sacristan 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6106	Okuma 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6107	Bell 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6108	Xu 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6109	Agelink 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6110	Diaz 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6112	Cole 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6117	Ortega-Soto 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6118	Zimbroff 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6119	Gitlin 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6122	Kane 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6124	Ahmed 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6127	Bernardo 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6128	Daniel 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6129	George 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6133	Barnas 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6134	Hansson 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6136	Blumberg 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6137	Sellwood 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6138	Shamir 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6141	Walsh 2001 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6142	Hadas-Lidor 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6146	Tracy 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6151	Bruggeman 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6152	Holi 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6154	Tiihonen 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6155	Addington 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6158	Bai 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6160	Bilder 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6162	Brown 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6164	Carson 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6165	Casey 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6166	Castilla 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6168	Conte 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6172	David 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6173	Gefvert 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6174	Glaser 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6175	Glaser 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6176	Han 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6183	Kinon 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6184	Knapp 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6185	Kujawa 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6188	Mauri 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6189	McGorry 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6190	Miceli 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6191	Mori 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6193	Namjoshi 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6194	Nasrallah 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6195	Pivac 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6198	Schmidt 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6200	Sowell 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6201	Young 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6203	Otsuka 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6204	Ito 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6205	Yagi 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6206	Miyakawa 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6207	Itoh 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6208	Yagi 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6209	Sugano 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6210	Okuda 1979 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6211	Nakazawa 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6212	Itoh 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6213	Yagi 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6214	Hyugano 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6215	Iwanaga 1980 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6216	Maeda 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6217	Samejima 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6218	Kubokura 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6219	Montero 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6220	Bell 2001 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6221	Smith 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6222	Matthews 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6223	Cassity 1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6224	Leff 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6225	Overall 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6226	Tourlentes  1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6229	Blackburn 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6230	Hordern 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6232	Lee 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6233	Bertolino 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6234	Chiu 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6236	Joffe 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6242	Verdoux 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6245	Spiegel 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6246	Ro-Trock 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6248	Rüther 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6254	Eckmann 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6255	Ehlert 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6256	Startup 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6258	Lunde	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6259	Haddock 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6260	Rosenthal 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6261	Arvanitis 1998a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6263	Goldstein 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6264	Mueser 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6266	Marder 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6267	Chaudhry 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6268	Granholm 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6269	Dahmen 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6270	Penn 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6271	Ihalainen 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6273	Kostakoglu 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6274	Svestka 1989 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6279	Weiden 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6283	Rymaszewska 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6285	Meltzer 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6293	Modai 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6296	David 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6297	Currier 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6299	Awad 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6300	Richmond 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6301	Carpenter 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6302	Hirshowitz 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6303	Marder 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6304	Hirsch 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6306	Krystal 1993 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6307	Potkin 1993 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6308	Herz 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6310	Van Putten 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6311	Borison 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6312	inderbitzin 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6313	Krystal 1993 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6314	Sharma 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6315	Kane 1993 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6316	McEvoy 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6317	Potkin 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6318	Munroe-Blum 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6319	Schooler 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6320	Johnston-Cronk 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6321	Kane 1993 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6322	Hirsch 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6326	Awad 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6327	Breier 1988 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6332	Rollnik 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6333	Fischel 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6334	Risch 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6335	Bai 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6336	Jones 2000 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6337	Schooler 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6340	Lecrubier 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6341	Borovicka 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6342	Angst 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6344	George 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6347	Burke 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6349	Hayashi 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6350	Rosen 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6351	Coelho 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6352	Mortimer 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6353	Gillis 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6354	Dehnel 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6355	Gallant 1968 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6357	Wolpert 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6358	Cooper 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6360	Jones 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6362	Wiedemann 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6364	Magliozzi 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6366	Evins 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6367	Goff 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6368	Potkin 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6369	Potkin 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6370	Potkin 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6371	Scheepers 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6374	de Haan 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6375	Fairweather 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6379	Iwahashi 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6381	Payne  1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6382	McLoughlin 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6383	Muller 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6535	Clark 1969 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6536	Clark 1969 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6537	Ko 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6538	Hwang 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6539	Merlis 1968 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6540	Wolpert 1968 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6541	Lehmann 1969 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6543	Johnson 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6544	Small 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6545	Hollister 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6546	Hekimian 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6547	Gallant 1971 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6548	Gallant 1970 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6549	Clark 1971 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6550	Cole 1970 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6551	Clark 1970 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6552	Denber 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6553	Gallant 1970 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6554	Freeman 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6555	Gershon 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6556	Kurland 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6558	Lehmann 1970 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6559	Lapolla 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6560	Lehmann 1969 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6561	Lehmann 1969 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6562	Lehmann 1970 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6563	Lehmann 1970 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20248	李育军1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6565	Denber 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6566	Cole 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6567	Wolpert 1968 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6568	Itil 1969 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6569	Krumholz 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6572	Harrison-Read 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6573	Merlo 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6574	Javitt 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6575	Meltzoff 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6578	Yang 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6579	Cozolino 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6580	Swift 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6581	Nejtek 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6584	Smith 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6585	Simopoulos 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6586	George 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6587	Hirsch 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6588	Shon 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6589	Gensthaler 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6590	Basdekis 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6592	Amminger 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6593	Rosenbaum 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6596	Kryzhanovskaya 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6599	Lecomte 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6600	Szmukler 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6601	de Lima 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6602	Linszen 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6603	Baker 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6604	McGlashan 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6606	Morrison 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6607	Perro 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6608	McGorry 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6609	Lenior 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6611	Zimbroff 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6613	Velligan 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6614	Tandon 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6615	Shelley 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6616	Romano 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6618	Okereke 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6620	Meltzer 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6622	Kolivakis 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6623	Kirwan 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6626	Sirota 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6628	Simpson 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6629	Toprac 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6630	Young 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6632	Wirshing 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6635	Druss 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6636	Felker 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6637	Dixon 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6638	Glick 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6640	Ferenc 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6642	Engelhart 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6643	Duval 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6644	Dunn 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6648	David 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6649	Daniel 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6650	Daniel 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6655	Cavazzoni 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6656	Castle 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6658	Castilla-Puente 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6660	Buckley 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6661	Breier 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6662	Breier 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6663	Breier 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6664	Berk 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6665	Bell 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6666	Aquila 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6667	Ananth 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6673	Rosenberg 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6675	Shamir 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6676	Schooler 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6677	Sajatovic 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6678	Sikich 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6684	Risch 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6685	Rector 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6687	Meltzer 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6689	Meisler 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6691	Vaglum 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6692	Hoffman 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6693	Hellerstein 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6694	Harvey 2002 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6695	Keith 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6698	Koenigsberg 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6700	Lehman 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6704	Marder 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6705	Marder 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6708	Masand 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6710	McFarlane 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6714	Heck 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6715	Schooler 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6717	Jerrell 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6719	Chue 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6720	Hale 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6721	Fairweather 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6723	Azorin 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6724	Auby 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6726	Veser 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6728	Strous 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6729	Rein 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6730	Poyurovsky 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6731	Poyurovsky 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6733	Murasaki 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6736	Martins 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6737	Loza 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6739	Jockers-Scherübl2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6740	Schiele 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6743	Reynolds 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6748	Azhar 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6751	Goldstein 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6752	O'Connor 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6753	Robinson 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6754	Smith 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6755	Buchsbaum 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6756	Dalack 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6757	Lee 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6758	Stankovska 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6759	Soygur 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6763	Morrison 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6764	Mizuno 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6765	Lu 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6768	King 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6769	Haldun 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6770	Gaebel 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6772	El-shafei 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6773	Dittmann 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6774	Dejanovic 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6775	Dan 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6779	Peuskens 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6780	Klieser 1991 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6781	Borison 1991 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6782	Wolf 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6783	Trivedi 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6784	Tang 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6787	Solomon 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6788	Druss 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6790	Arvanitis 1998b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6791	Poyurovsky 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6792	de Haan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6795	Baymiller 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6798	Croudace 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6799	Kern 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6800	Moran 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6803	Papageorgiou 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6805	Desta 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6806	Liberman 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6807	Godoy 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6809	Richardson 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6813	Shiloh 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6814	Godleski 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6815	Lee 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6816	Goldberg 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6819	Dixon 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6820	Shin 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6821	Hoffman 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6823	Bellucci 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6824	Lieberman 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6825	Moller 1992 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6827	Pancheri 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6828	Andris 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6829	Anonymous a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6830	Anonymous b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6833	Szmukler 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6834	Agib 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6835	p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6836	Barker 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6837	Barnes 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6838	Beer 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6839	Birchwood 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6840	Britto 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6842	Burns 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6843	Byng 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6844	Coburn 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6845	Cookson 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6846	Craig 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6847	Drury 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6848	Fallon 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6849	Wykes 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6850	Woodruff 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6851	Watson 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6852	Tyrer 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6853	Turner 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6854	Thornicroft 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6855	Taylor 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6856	Tarrier 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6858	Singh 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6859	Singh 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6863	Painter 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6866	Meaden 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6867	McKenna 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6868	Lloyd 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6869	Lewis 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6870	Kingdon 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6871	King 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6872	Kelly 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6873	Joyce 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6875	Hemingway 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6876	Gumley 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6877	Graham 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6878	Godfrey 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6879	George 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6882	Fowler 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6883	Jackson 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6884	Patterson 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6885	Evins 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6886	Bechdolf 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6888	Ohno 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6889	Vauth 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6891	Goswami 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6892	Jasovic-Gasic 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6893	Kudoh 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6894	French 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6897	Finzen 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6898	Schiller 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6899	Harvey 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19409	王艳 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6900	Dyck 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6901	Bowen 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6902	Dekker 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6903	Barak 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6904	Klinkenberg 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6906	Risch 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6907	Sechter 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6908	Su 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6909	Boczkowski 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6910	Haggstrom 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6912	Carranza 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6913	Benoit 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6914	Kawamura 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6915	Schlosser 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6917	Rein 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6918	Rein 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6919	Rein 1998 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6921	Pichot 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6923	DEFASLP	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6924	Anonymous 1984 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6925	Anonymous 1984 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6928	Rein 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6929	Moller 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6930	Patel 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6931	Daniel 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6932	Casey 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6933	Kallert 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6936	DiNitto 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6937	Lima 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6938	Swanson 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6940	Bryson 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6941	Corrigan 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6942	Velligan 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6943	Munjiza 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6944	Wolkowitz 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6945	Janicak 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6946	Murphree 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6947	Casey 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6948	Tsuang 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6949	Pesco-Koplowitz 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6950	Friedman 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6951	Mullen 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6953	Talbot 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6954	Anonymous 1993 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6955	Mosholder 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6956	Lahti 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6959	Andreason 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6961	Huttunen 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6965	Gomez 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6968	Lauriello 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6971	Gumley 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6973	Beasley 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6980	Castle 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6981	Morrison 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6985	Buchanan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6986	Bryson 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6988	Bennett 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6989	Benattia 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6990	Bell 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6993	Ascher-Svanum 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6995	O'Keefe 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6996	Ogasa 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6997	Parepally 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6998	Perez 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6999	Pondrom 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7000	Potkin 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7001	Prentice 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7002	Renshaw 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7004	Rossotto 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7005	Sergi 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7007	Smelson 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7008	Smith 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7009	Stein 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7010	Sumiyoshi 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7012	Weiner 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7015	Wunderink 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7019	Centorrino 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7021	Docherty 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7022	Edwards 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7024	Farhall 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7025	Fiszdon 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7026	Gaither 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7027	Ganguli 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7028	Gharabawi 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7097	Chengappa 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7030	Hoffman 2003  a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7032	Jenner 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7033	Jin 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7034	Josiassen 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7036	Kelleher 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7037	Kern 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7038	Khanna 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7040	Kollack-Walker 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7043	Lahti 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7044	Lenior 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7046	Linszen 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7047	Marder 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7049	Addington 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7050	Canuso 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7052	Deberdt 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7053	Evins 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7054	Hackman 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7055	Kane 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7056	Kane 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7059	Kinon 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7068	Motlova 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7069	Poyurovsky 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7070	Renshaw 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7071	Turkington 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7072	Ball 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7075	Zhong 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7076	de Leon 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7077	Brown 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7078	Battaglia 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7079	Montgomery 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7081	Smelson 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7082	Rodriguez 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7083	McGlashan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7086	Jones 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7088	Hussain 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7089	Gehrs 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7090	Bossie 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7091	Smith 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7092	Smith 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7093	Brook 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7095	Richardson 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7098	O'Donnell 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7099	Kumari 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7101	McQuade 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7102	Bossie 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7103	Poyurovsky 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7104	Taymeeyapradit 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7106	Al Haddad 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7107	Nahas 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7108	Durham 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7109	CATIE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7110	Pickar 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7112	Tugal 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7113	Wright 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7115	Velligan 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7116	Jerrell 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7117	Ritchie 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7118	Swenson 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7119	Duncan 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7120	Beck 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7122	Van Der Gaag 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7123	Kris 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7124	Drake 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7125	Claghorn 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7126	Mielke 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7128	Weiden 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7131	Miceli 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7133	Intersept 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7134	Lis 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7135	Taneli 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7136	Kopala 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7137	Sacchetti 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7139	Davidson 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7140	Chaudhry 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7142	Myers 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7144	Diamond 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7145	Sumiyoshi 2003b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7147	Gaebel 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7148	Atmaca 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7149	Wynchank 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7150	Godemann 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7152	Velligan 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7153	Malm 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7154	Bell 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7156	Norman 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7157	Oosthuizen 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7158	Oosthuizen 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7159	Wuerker 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7160	Chengappa 2003a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7161	Chin 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7165	Ban 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7166	Harvey 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7167	Tuma 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7168	Rosenheck 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7169	NCT00007774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7170	Bai 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7171	Rector 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7173	Power 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7177	Uzun 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7179	Jhee 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7181	Kinon 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7182	Csernansky 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7183	Adson 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7184	Lecrubier 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7187	Shumeiko 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7188	Schooler 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7189	Malykhin 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7190	Riedel 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7191	Mitchell 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7192	Ermilov 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7194	Svestka 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7195	Svestka 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7196	Rabinowitz 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7198	Chan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7199	Vollenweider 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7200	Daniel 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7201	Daniel 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7203	Beasley 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7204	Lin 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7205	Mortimer 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7207	Dubitsky 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7208	Dubitsky 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7209	Dubitsky 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7210	Dubitsky 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7211	Dubitsky 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7212	Dubitsky 2002 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7213	Dubitsky 2002 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7214	Dubitsky 2002 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7215	Dubitsky 2002 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7216	Dubitsky 2002 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7217	Dubitsky 2002 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7218	Dubitsky 2002 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7219	Dubitsky 2002 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7220	Dubitsky 2002 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7221	Warren 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7222	Bean 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7224	Mena 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7228	Abi-Saab 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7229	Akhondzadeh 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7230	Bond 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7234	Salzer 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7235	Stone 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7236	Graeber 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7237	Marcelli 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7238	Akhondzadeh 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7239	McDonald 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7240	Pantalon 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7241	Swanson 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7242	Petit 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7243	Buchain 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7244	Mattejat 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7245	Engelhardt 1969 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7246	Gothelf 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7247	Kashner 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7248	Depla 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7250	Seidman 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7257	Bark 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7258	Chien 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7261	Heresco-Levy 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7262	Atmaca 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7263	Dossenbach 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7264	Yen 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7265	Hellewell 1998b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7266	Hellewell 1998c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7267	Joyce 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7268	Crane 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7269	Binkhorst 1963 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7270	Binkhorst 1963 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7271	McKenzie 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7272	Kazamatsuri 1972 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7273	Van Meijel 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7275	Arango 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7276	Tsemberis 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7277	Apiquian 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7278	Kodesh 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7279	Daniel 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7280	Ettinger 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7282	Keefe 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7283	Kopelowicz 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7285	Penn 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7287	Sikich 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7289	Leiguarda 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7290	Borison 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7291	Turrone 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7292	Kelly 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7293	Zeng 1995 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7294	Yi 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7295	Li 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7296	Zeng 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7297	Ju 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7298	Huang 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7299	Huang 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7300	Wang 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7301	Schooler 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7303	Malla 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7304	Mottaghipour 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7306	Dahl 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7307	Opjordsmoen 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7309	Avasthi 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7310	Kufferle 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7311	Oranje 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7312	Daskalakis 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7313	Fu 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7314	Kristiansen 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7315	Heydebrand 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7316	Hodel 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7317	Louza 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7319	Tsai 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7320	Corrigan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7322	Petrakis 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7325	Huber 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7327	Veznedaroglu 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7328	Ueland 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7329	Bellack 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7330	Tsemberis 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7331	Trower 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7332	Qian 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7333	Li 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7335	Chen 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7336	Li 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7337	Lv 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7339	Liang 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7340	Zhang 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7341	Ni 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7342	Zhu 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7343	Ren 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7344	Wu 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7345	Zhu 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7346	Jin 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7347	Lu 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7348	Zhang 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7349	Zhang 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7350	Liu 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7351	Wang 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7352	Wang 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7353	Cui 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7355	Zuo 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7356	Pan 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7357	Zhang 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7358	Pang 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7359	Su 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7360	Ren 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7361	Zhu 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7362	Anonymous 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7363	Cha 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7364	Lin 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7365	Li 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7366	Xiang 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7367	Zhu 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7368	Sheng 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7369	Zhu 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7371	Xu 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7372	Hu 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7373	Pang 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7374	Li 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7376	Lei 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7377	Wang 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7379	Ban 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7380	Hou 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7381	Mei 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7382	Wu 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7383	Ban 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7384	Sun 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7385	Nan 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7386	Chen 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7387	Peng 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7388	Gao 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7389	Luo 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7390	Xie 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7391	Xin 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7392	Zhang 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7393	Wang 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7396	Chen 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7397	Yu 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7399	Zhou 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7431	Xiang 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7433	Niu 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7434	Liu 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7435	Ju 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7436	Chen 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7437	Yang 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7438	Zhang 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7439	Zhang 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7440	Wang 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7441	Qian 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7442	Zhang 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7443	Li 2003 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7444	Wu 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7445	Ge 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7446	Yang 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7447	Yang 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7448	Liu 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7449	Liang 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7450	Van Os 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7451	Mueller 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7452	Abbas 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7453	Bersani 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7454	Bowie 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7455	Ciudad 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7457	Earley 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7458	Emsley 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7459	Greenspan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7460	Hardy 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7461	Harrison 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7464	Ellenor 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7465	Marquez 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7466	Marquez 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7467	Marquez 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7469	Henderson 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7470	Hussain 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7473	Lysaker 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7474	McCreadie 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7477	Pandina 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7478	Riedel 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7479	Rodriguez 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7480	Strejilevich 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7481	Strejilevich 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7483	Urioste 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7485	Vreeland 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7486	Kollack-Walker 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7488	Akerele 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7490	Wu 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7491	Cao 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7492	Wang 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7493	Yu 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7494	Zhu 2002 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7495	Fan 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7496	Liu 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7497	Yang 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7498	Guan 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7500	Zhu 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7501	Ou 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7502	Weng 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7503	Chen 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7504	Liu 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7505	Chen 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7506	Huang 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7507	CHA 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7508	Lu 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7509	Gan 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7510	Liu 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7511	Cui 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7512	Li 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7513	He 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7514	Ma 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7515	Weng 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7516	Wang 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7517	Xie 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7518	Zhu 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7519	Yang 1998 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7520	Chen 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7521	Meng 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7522	Yu 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7523	Li 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7524	Luo 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7526	Wang 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7527	Wang 1994 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7530	Zhou 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7531	Liu 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7532	Wang 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7535	Yao 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7536	Chen 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7537	He 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7538	Chang 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7539	Bian 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7540	Zhao 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7541	Li 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7542	Zhang 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7543	Huang 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7544	Xu 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7545	Ning 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7546	Song 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7547	Xu 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7548	Zhan 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7549	Zhang 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7550	Feng 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7551	Dong-Qiang 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7552	Zhong 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7553	Zhang 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7554	Wang 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7555	Li 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7556	Qiu 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7557	Wang 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7558	Wang 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7559	Liu 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7560	Gan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7562	Tang 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7565	Li 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7566	Yang 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7567	Deng 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7568	Chen 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7569	Yang 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7570	Xu 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7571	Linag 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7572	An 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7573	Li 2003 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7576	Huang 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7577	Zheng 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7579	Ma 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7580	Chen 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7581	Guo 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7582	Zhou 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7583	Liu 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7584	Guo 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7585	Zhan 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7586	Lu 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7587	Zhou 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7588	Liu 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7589	Zhu 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7590	Currier 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7594	Zhao 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7595	Liang 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7598	Gao 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7600	Liu 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7601	Li 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7602	Chen 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7604	Wang 2002 f 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7606	Dong 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7607	Xu 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7609	Pu 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7610	Zhou 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7612	Pu 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7613	Sun 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7614	Ma 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7618	Zhan 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7619	Zheng 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7621	Chen 2003 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7623	Saren 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7626	Zhou 2003 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7628	Xu 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7632	Ma 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7633	Wang 2000 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7634	Wang 2002 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7635	Wang 2002 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7640	Li 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7644	Zhang 2003 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7645	He 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7646	Gao 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7650	Zhu 2002 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7654	Yang 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7656	Tang 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7658	Tang 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7661	Weng 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7662	Zeng 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7663	Zhang 2002 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7665	Xiang 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7667	Wang 2001 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7668	Du 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7672	Zhang 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7675	Guo 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7676	Sun 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7677	Liu 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7678	Wang 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7679	Lu 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7680	Ling 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7681	Wang 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7682	Xu 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7683	Zhang 1998 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7684	Lu 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7685	Meng 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7686	Wang 2002 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7687	Wang 2001 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7688	Xu 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7689	Yan 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7690	Zhang 2003 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7691	Guo 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7692	Guo 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7693	Zeng 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7694	Ma 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7695	He 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7696	Bi 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7698	Liu 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7699	Zhao 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7700	Su 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7701	Ma 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7702	Yao 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7703	Zhang 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7705	Liu 1995 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7706	Wang 2000 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7707	Lu 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7710	Han 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7711	Chen 2001 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7712	Zeng 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7713	Chen 2001 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7714	Ma 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7715	Yin 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7717	Cong 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7719	Zhang 2003 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7720	Zhou 2003 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7721	Lu 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7722	Li 2003 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7723	Gan 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7724	Liu 1997a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7725	Lin 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7727	Zhang 2000 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7730	Ma 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7732	Chen 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7733	Xu 2001 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7734	Zhuang 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7735	Peng 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7736	Mei 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7737	Du 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7738	Lu 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7739	Ma 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7740	Wang 2003 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7741	Zheng 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7742	Zheng 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7743	Wang 2000 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7744	Shi 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7745	Zhou 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7746	Zhang 2001 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7747	Wu 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7748	Xia 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7749	Zhou 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7750	Ren 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7751	Weng 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7752	Li 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7753	Chen 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7755	He 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7756	Yue 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7758	Liu 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7759	Liu 1997b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7760	Zhong 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7764	Wu 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7771	Huang 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7772	Song 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7774	Yang 2002 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7775	Zhu 2002 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7780	Lu 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7783	Xu 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7784	Li 2003 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7785	Wu 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7787	Ren 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7788	Chen 2003 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7789	Gan 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7790	Qiu 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7791	Zhang 2003 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7792	c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7793	Gao 2003 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7794	Zhu 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7795	Li 2003 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7796	Liu 2003 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7797	An 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7798	Fang 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7799	Cao 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7800	Tang 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7801	Liu 2000 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7802	Liu 2000 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7803	Qu 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7805	Hu 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7806	Guo 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7807	Yu 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7808	Hu 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7809	Huang 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7810	Wu 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7811	Li 2002 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7812	Zhang 2002 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7813	Zhang 2002 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7815	Ren 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7816	Zhou 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7818	Song 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7820	Wang 1995a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7821	Yu 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7822	Yang 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7823	Zhu 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7824	Wang 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7825	Luo 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7826	Zhang 1997 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7827	Yang 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7828	Ren 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7829	Liu 1996 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7830	Zhang 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7831	Yao 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7832	Huang 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7833	Lin 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7836	Shen 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7838	Wang 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7840	Li 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7841	Yi 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7843	Yao 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7844	Hu 1994 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7845	Gong 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7849	Chen 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7850	Zhao 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7852	Jia 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7853	Yang 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7854	郝以辉 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7855	Qiu 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7856	Hou 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7857	Yu 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7858	Chen 2003 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7859	Xiang 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7862	Li 2001 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7863	Sun 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19410	黄平 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7864	Tan 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7865	Yang 1998 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7866	Chen 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7868	Chen 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7869	Chou 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7870	Zhang 1999 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7871	Chen 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7872	Zuo 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7873	Zhang 1994 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7874	Zhang 2003 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7875	Zhang 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7876	Yu 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7877	Yue 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7878	Han 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7880	McGurk 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7881	Xu 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7882	Du 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7883	Good 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7884	Rogers 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7885	Timko 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7886	Ries 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7887	Leavey 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7888	Gray 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7889	Marshall 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7890	Meltzer 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7892	Small 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7893	McConville 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7894	Power 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7897	Harrigan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7898	Townsend 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7899	Zhang 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7900	Wonodi 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7902	Lopez-Luengo 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7903	James 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7904	Chien 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7905	Stryjer 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7906	Poyurovsky 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7907	Henderson 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7908	Kremer 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7909	Duncan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7910	Bloch 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7912	Fann 1973 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7913	Janowsky 1973 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7914	El-Yousef 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7915	Janowsky 1973 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7916	Valmaggia 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7917	Janowsky	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7918	Mueser 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7919	Steinberg 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7922	Rein 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7924	Girish 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7925	Cavazzoni 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7926	Chang 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7928	Simpson 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7929	Beasley 1996 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7930	Turner 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7931	Gaitz 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7932	Tassis 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7933	Benaim 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7934	Smith 1961 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7935	Dalack 1997 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7936	Ottosson 1960 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7937	Ottosson 1960 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7938	Ottosson 1960 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7939	Ottosson 1960 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7940	Otto 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7941	Wykes 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7942	Maratos 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7943	Calsyn 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7944	Calsyn 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7945	Marco 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7946	Fahy 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7950	Ozguven 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7951	Nordentoft 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7952	Appelberg 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7953	Bechdolf 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7954	Hamann 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7955	Basi 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7957	Dal Santo 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7958	Boulay 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7959	Brunstein 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7960	Addington 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7961	Anselmetti 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7964	Hawkins 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7965	Harvey 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7966	Aasen 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7968	Hardy 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7969	Emsley 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7970	Graham 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7971	Houston 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7973	Jenner 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7974	Mahmoud 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7975	Hay 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7978	Kopala 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7979	Horacek 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7980	Kinon 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7981	Keefe 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7982	Morrison 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7983	Mitchell 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7985	Miceli 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7987	McGlashan 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7988	McGlashan 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7989	Mackell 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7991	Power 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7992	Pagsberg 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7993	Wong 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7994	Walsh 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7996	Smelson 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7997	Riera 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7998	Rettenbacher 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8000	Sharma 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8002	Jockers-Scherübl2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8003	Sirota 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8004	Lewis 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8005	Rimon 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8007	Van Brunt 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8009	Green 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8012	David 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8015	Nordentoft 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8016	Bendall 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8018	Bertelsen 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8021	Gleeson 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8023	Jackson 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8024	Jackson 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8139	Niu Yajuan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8025	ACE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8026	Jenner 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8028	Lester 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8030	McGlashan 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8031	Morrison 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8032	Petersen 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8036	Stuart 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8037	Thorup 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8038	Woods 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8039	Zipursky 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8042	Miller 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8046	Abdollahian 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8047	Buchsbaum 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8048	Cavallaro 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8049	Davidson 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8050	Dyck 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8051	Earley 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8052	Economou 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8053	Fadden 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8054	Honer 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8056	Harrison 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8057	Kallert 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8061	Magliano 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8063	Penades 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8064	Pioli 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8065	Harvey 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8067	Roerig 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8069	Talwar 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8071	Torres-Gonzales 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8072	Fiorillo 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8074	Kung 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8075	Turkoz 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8076	Phillips 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8078	Rodriguez 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8079	Urioste 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8080	Beasley 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8081	Walsh 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8082	Kane 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8083	Sun 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8084	Ding 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8085	Wang 2000 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8086	Chu 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9047	Luo 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8087	Tong  2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8088	Wang 2001 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8089	Su Hui 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8090	Zhang Jing 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8091	LI Yanxian 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8093	Li 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8094	Li 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8095	Liu Yan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8097	Kong 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8098	Wang 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8099	Du 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8100	Fang Yunling 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8102	Wang Jian 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8103	Bao 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8104	Liu 2004 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8105	Wang 2000 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8106	Liu 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8107	Fu 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8108	Sheng 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8109	Wei 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8110	Ji 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8111	Feng 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8112	Huang 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8113	Li 2001 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8114	Peng 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8115	Dong 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8116	Wu Haoran 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8117	Yu 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8118	Yang Fude 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8119	Deng 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8120	Zou Jian hua 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8121	Shi Fuming 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8122	Zhang Shoulai 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8123	Zhang 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8124	Ma Wentao 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8125	Liu 2001 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8126	Chen 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8127	Liang Shaocai 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8128	Lu 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8129	Wang 2002 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8130	Cao 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8131	Wang 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8137	Wang 2003 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8138	Lu 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8140	Guo 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8141	Cheng 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8143	Wang 2003 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8144	Li 2003 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8145	Chen 2003 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8146	Cao 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8147	He 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8148	Zhou 2003 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8149	Mao Yemeng 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8150	Wang 2000 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8151	Zhao Jiantong 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8153	Wang 2000 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8154	Hou Yezhi 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8155	Huang 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8157	Xing 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8158	Qing Hai Liu 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8159	Hu 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8160	Li 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8161	BAO Feng 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8162	Cao 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8163	Chang 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8164	CHEN Rifang 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8166	Dai 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8167	Dai 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8168	DingYuanfu 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8169	Du 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8170	Du 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8171	Fan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8172	Feng 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8173	Fu 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8174	Ge Qianrong 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8175	Ge 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8176	Huang 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8177	Hao 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8178	He 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8179	Hu 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8180	Huang 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8181	Huang 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8182	Ji 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8183	Jiang Xingyan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8184	Jin hong 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8185	Shi Tianyuan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8186	Wang 2004 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8188	Li Li 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8189	Li 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8190	Li 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8191	Li 2004 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8192	LI Zhen yu 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8193	LI Zheng 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8194	Li 2004 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8195	Liang 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8196	Liao 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8197	Lin 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8199	Liu 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8200	Liu Lin 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8201	Liu Weibo 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8202	Liu Yan  2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8203	Lu  2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8204	Lv  2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8205	Ma Xiaozhi 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8206	Ma 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8207	Ma 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8208	Ma Zheng 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8209	Ma 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8210	Mao Zhengrong 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8211	Min 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8212	Pan Miao 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8213	Pan Miao 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8214	Peng 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8216	Qi Fusheng 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8217	Qi Xia Liang 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8218	QIAN Dongli 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8219	Ren 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8220	Ren Kai 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8221	Ren 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8222	Ren Xianfeng 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8223	Sha 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8225	Sun Dong 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8226	Tan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8227	Saren 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8228	Tang Ying 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8230	Tu 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8231	Wang  2004 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8232	Wang 2004 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8233	Wang 2004 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8234	Wang 2004 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8235	Wang 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8236	Wang 2004 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8237	Wang Xianjun 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8239	Wang 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8240	Wang 2004 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8241	Wang 2004 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8242	Wang 2004 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8243	Wang 2004 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8244	Wang 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8245	Wu 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8246	Wu Haiping 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8247	Wu Yi 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8248	Wu Yi 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8250	Xiang 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8251	Xiao Bo 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8252	Xiong 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8254	Xu Chunjun 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8255	Xue 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8256	Yan 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8257	YANG Bin 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8258	Yang Fude 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8259	Yang 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8260	Yang 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8261	Yin 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8262	Ying Lishen 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8263	Yu E Li 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8265	YUE Shuying 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8266	Yue 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8268	Gao 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8269	Zhang Hua 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8270	Zhang 2004 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8271	ZHANG Li 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8272	Zhang 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8273	Zhang 2004 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8274	Zhang Yu 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8275	Yueying 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8276	Zhang 2004 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8277	Zhang 2004 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8278	Zhang 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8279	Futao 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8280	Yubo 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8281	Ma 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8282	Xianzhen 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8283	Zheng 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20249	李育军2 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8284	Zhou 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8285	Zhou 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8787	Brar 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8790	Gallagher 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8791	Tugal 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8792	Turner 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8793	Turner 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8794	Williams 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8797	Wykes 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8798	Yagcioglu 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8799	Yamashita 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8800	Yasui-Furukori 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8801	Ye 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8802	Yurgelun-Todd 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8803	Valmaggia 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8804	Zhang 2004 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8805	Van Bruggen 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8806	Zoccali 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8807	Zhou 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8808	Cook 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8813	Bradshaw 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8814	Tregellas 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8815	Chung 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8816	Zeng 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8817	Velloso 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8818	Thompson 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8819	Du 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8820	Wang 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8821	de Jesus Mari 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8822	Fitzgerald 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8823	Ginsberg 2003 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8824	Gazdag 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8825	Elizure 1978 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8826	Gattaz 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8828	Diehl 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8829	de Leon 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8830	Schulz 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8831	Wallace 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8832	Wolkin 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8834	Hwang 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8835	Jarema 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8837	Hertling 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8838	Khazaie 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8839	Goldman 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20250	李玲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8840	Goldman 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8841	Goldman 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8842	Philipp 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8844	Poplawska 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8847	Nakajima 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8848	Moller 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8849	Newton 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8850	Schindler 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8851	Vittorielli 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8852	Valencia 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8853	Stock 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8854	Sankawa 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8857	Boyer 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8858	Jia 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8859	Plesnicar 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8861	Van Putten 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8862	Vestre 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8863	Boylan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8864	Williams 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8865	Cada 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8867	Cada 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8869	Cada 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8870	Van Nimwegen 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8872	Goff 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8873	Evins 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8874	Levkovitz 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8875	de Sena 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8876	Brunelleschi 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8877	Lee 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8878	Argo 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8889	Bell 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8890	Riedel 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8892	Schutzwohl 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8893	Sibitz 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8894	Smith 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8895	Tandon 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8896	Cavallaro 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8897	Corrigan 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8898	Herrera 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8899	Glenthoj 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8900	Jurjanz 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8901	Ko 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9208	Zhong 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8903	Khanna 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8906	Arends 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8907	Mihai 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8908	Palma 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8909	Levine 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8910	Mahmoud 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8911	Mueller 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8912	Roncone 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8913	Brook 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8914	Stone 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8915	Dean 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8916	Rosenbaum 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8917	Li 2005 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8918	Spence 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8919	McCreadie 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8923	D'Souza 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8924	Kane 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8925	Fleischhacker 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8927	Naber 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8928	Bergemann 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8929	Naber 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8930	Mahmoud 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8931	Kluiter 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8932	Poulet 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8933	Cather 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8934	Rathod 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8935	De Luca 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8936	Barch 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8937	Rapaport 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8938	Sartory 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8939	Eerdekens 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8940	Fatemi 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8286	Zhu 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8287	An 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8288	Nan 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8289	Chen 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8290	Du 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8291	Jing yi 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8292	Zhuli 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8293	Yu 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8294	Li 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8295	Qian 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8296	Li 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8297	Xinfeng 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8298	Li 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8300	Liu 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8301	LU Shichen 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8303	Ren 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8304	SHENG Weiyue 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8305	Shun Shuzhen 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8306	Wan Zhili 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8307	Wang 2005b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8308	Wang Juncheng 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8309	Wei Chun xiang 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8310	Xiang 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8311	Xu 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8312	YANG Bo 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8313	Yu 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8314	Yu Jun 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8315	Yue 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8316	ZHANG Fuying 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8317	Zhang 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8318	Zhao Lin 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8319	Zhang 2004 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8320	攣醮 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8321	抪棄 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8322	曲洪芳1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8323	李英敏 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8324	温益雄 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8325	梁家 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8326	舒伟洁 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8327	鲍文卿 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8328	张向阳 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8329	王宗叶 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8330	高存友 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8331	张太泉 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8332	卢金山 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8333	李光辉 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8334	Wang 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8335	曾昭祥 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8337	惠治冬 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8338	郑秀霞 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8339	郑秀霞 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8340	Wu 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8341	陈林庆 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8342	贾裕堂 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8343	林小兰 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8344	王志凌 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8345	王素梅 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8346	宋志强 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8347	李冬梅 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8348	王征 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8349	黄书华 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8350	吴晓梅 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8351	马振武 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8352	戴润珠 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8353	常发伟 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8354	杨铭哲 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8356	王昕 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8357	石寿森 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8358	Liang 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8359	陈圣祺 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8360	杜宏群 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8361	李淑英 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8362	郑曾生 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8363	杨靖 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8364	徐贵云 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8365	孔庆任 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8366	Han 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8367	孟昭蓉 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8368	宋茂轩 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8369	高树河 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8370	白照庆 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8371	雷光文 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8372	张海峰 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8373	李小新 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8374	张彩鸾 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8375	韩鹏 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8376	王建军 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8377	陈强 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8378	李玉 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8379	张永华 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8380	庄建华 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8381	黄玉海 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8382	李炜东 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8383	周国权 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8384	陈伟钊 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8385	程绍忠 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8386	沐志强 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8387	朱新国 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8388	王宝安 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8389	谭友果 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8390	伍毅 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8391	杨九州 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8392	张曦明 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8393	郭杰 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8394	李洪祥 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8395	李侠才 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8396	刘庆海 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8398	刘振东 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8399	石金钟 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8400	钟红文 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8401	张淑芹 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8402	胡文亮 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8403	黄自勇 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8404	张淑芹 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8405	方润领 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8406	王莉 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8407	孟广彦 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8408	朱美兰 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8409	张淑芹 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8410	李永远 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8411	施晓辉 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8412	杨永杰 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8413	郭辉荣 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8414	任清涛 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8415	卢白莉 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8416	王秀英 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8417	张守来 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8418	万纯 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8419	刘宏林 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8420	肖正军 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8421	黄群明 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8422	刘俊彪 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8423	李禄斌 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8424	吴多琛 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8425	王强 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8426	王健 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9209	Cao 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8427	范庆祝 1996 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8428	路英智 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8429	范庆祝 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8430	张衍军 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8431	董雪琴 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8432	Ju 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8433	曹典永 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8434	童伟鹏 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8435	马起民 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8436	钱烈 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8437	刘南华 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8438	韩孝龙 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8439	殷青云 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8440	翁正 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8441	常素兰 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8442	张利霞 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8444	王丽娟 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8445	许海丽 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8446	Li 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8447	丁利陆 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8448	孙祺章 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8449	孙秀珍 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8450	盖万良 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8451	文素荣 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8452	徐美勤 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8453	袁国桢 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8454	滕光华 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8455	崔金波 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8456	张衍军 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8457	张敬悬 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8458	余国汉 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8459	姜文成 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8460	张宝山 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8461	贾占玲 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8462	司淑玉 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8463	王丽娟 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8464	邵亚琴 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8465	任进军 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8466	胡锡澄 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8467	肖晓梅 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8468	张喆 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8469	熊典樟 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8470	蔡铁水 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8471	王振声 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20287	赵业华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8472	蒋先胜 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8473	孙树花 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8474	邹开庆 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8475	倪建良 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8476	李健芬 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8477	楚平华  2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8478	Zheng 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8479	孙祺章 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8480	阮鸿杰 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8481	王大华 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8482	曹静 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8483	宋春爱 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8484	黎丽燕 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8485	沈鉴清 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8486	庞道记 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8487	王俊 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8488	刘绍梅 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8489	王胜利 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8490	龙瑞芳 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8491	何传才 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8492	邹国华 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8493	汪金霞 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8494	吴晓梅 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8495	杨小男 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8496	谷瑞莲 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8497	王荣芝 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8498	詹来英 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8499	黄蜀礼 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8500	蔡志利 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8501	严明 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8502	唐焕英 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8503	解昌国 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8504	Lv 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8505	李晏 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8506	李定国 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8507	王辉 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8508	周一平 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8509	梁绮霞 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8510	吴丽荣 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8511	邱亚锋 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8512	李义明 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8513	邢秀娟 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20288	赵雅琴 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8514	魏德花 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8515	周虎江 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8516	周保 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8517	王勇 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8518	张福英 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8519	邹果果 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8520	刘锋 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8521	梁芝国 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8522	周虎江 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8523	周秀华 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8524	任朝晖 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8525	刘剑涛 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8526	吕兴林 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8527	刘红兵 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8528	周长梅 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8529	陈元生 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8530	杜文佳 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8531	陈昌钦 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8532	Liu 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8533	钟华 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8534	杜晋峰 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8535	冯义萍 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8536	Yan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8537	徐青 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8538	朱倩芸 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8539	张培新 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8540	孔令霞 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8541	李聪慧 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8542	安宝富 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8543	曹欣冬 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8544	周保慧 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8545	戴敏誉 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8546	李聪 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8547	余国汉 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8548	安宝富 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8549	陈彬 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8550	谌益华 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8551	吴金凤 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8552	魏爱荣 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8553	冯义萍 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8554	王长奇 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8555	杨小男 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8556	邓炳 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9300	Morrison 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8557	李转清 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8558	Zhang 2004 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8559	尹浩然 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8560	汪涛 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8561	邓云峰 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8562	曹永康 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8563	曹永康 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8564	万杰 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8565	张建球 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8566	宋爱美 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8567	杨玲 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8569	陈宇晖 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8570	陈玉广 8505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8571	丁关元 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8572	孙秀娟 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8573	Bai 2005a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8574	陶用富 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8575	张志强 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8576	韦强 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8577	宋金环 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8578	刘桂荣 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8582	McGlashan 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8583	Urioste 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8584	Jones 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8586	Houston 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8588	Krystal 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8589	Mobascher 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8590	Ganguli 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8591	Castelein 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8592	Bertelsen 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8593	Savitz 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8595	Greig 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8596	Summerfelt 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8598	Gaither 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8599	Baker 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8600	Reeder 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8601	Bryson 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8602	Mueller 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8604	Mishara 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8605	Tapp 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19411	周继前 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8606	McGurk 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8607	Brown 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8608	Kulkarni 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8609	Hunter 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8610	Benitez 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8611	Perry 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8612	Lauriello 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8613	Gafoor 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8614	Faber 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8615	Pierre 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8616	Thorup 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8617	Rupnow 2005a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8618	Apiquian 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8620	Locklear 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8621	Kane 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8622	Schubert 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8623	Kinon 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8624	Kim 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8628	Antonova 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8629	Oren 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8630	Abel 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8631	Zhong 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8632	Dunn 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8633	Lindenmayer 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8634	Lasser 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8636	Gopalan 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8637	Joan 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8640	Zipursky 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8641	NTR374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8642	Lieberman 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8643	Harrison 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8644	Gaebel 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8645	Bellack 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8647	Bell 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8648	Nuechterlein 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8649	Wykes 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8650	McDonell 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8651	Alvarez 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8653	Deberdt 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8654	Schulze Monking 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8656	Oldham 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8657	Wu 2002 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8658	Liu 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8660	Hogarty 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8661	Kinon 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8662	Adler 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8663	Atmaca 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8665	Atmaca 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8666	Bechdolf 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8667	Feldman 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8675	Beebe 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8676	Bodkin 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8678	Brunstein 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8679	Buchanan 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8680	Chaichan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8681	Evins 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8683	Fiszdon 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8684	Chinman 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8685	Diaz 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8686	Bhavani 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8688	Han 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8689	Frackiewicz 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8690	Glick 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8692	Higashima 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8694	Heresco-Levy 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8696	Brooks 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8697	Josiassen 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8700	Jolley 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8702	Kapur 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8703	Kelly 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8705	Lauriello 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8706	Lamure 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8707	Levkovitz 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8710	Li 2004 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8712	Littrell 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8714	Lu 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8715	Lerner 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8716	Lester 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8719	McGurk 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8720	McIntosh 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8722	Mintzer 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8723	Modell 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8724	Moresco 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8726	Nasrallah 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8727	Newton 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8729	Reynolds 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8730	Oosthuizen 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8733	Petrakis 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8735	Papageorgiou 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8736	Harris 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8737	Holi 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8738	Harvey 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8739	Harrison 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8741	Hu 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8742	Huber 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8746	Kuipers 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8748	Kotler 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8749	Kingsep 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8750	Kern 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8752	Marcus 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8753	Mahmoud 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8754	Kenny 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8755	Brook 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8756	Daniel 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8757	Lesem 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8758	Brook 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8759	Swift 1998 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8760	Liberman 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8761	Rosenfarb 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8762	Rutter 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8763	Schooler 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8764	Sela 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8765	Sheitman 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8766	Shin 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8767	Pandalai 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8770	Souetre 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8774	Tidey 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8777	Groff 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8778	Honer 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8780	Reeder 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8781	Wykes 1999 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8782	Kane 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8783	Johns 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8784	Johnson 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8941	Jacobsen 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8942	Temple 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8944	Montero 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8945	Dolan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8946	Dakhale 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8947	Calsyn 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8948	Sheremata 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8949	Sheremata 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8950	Garver 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8951	Chibbaro 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8952	Bechdolf 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8953	Bechdolf 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8954	Kulkarni 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8955	Kulkarni 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8956	McCabe 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8957	Smelson 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8959	Toscano 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8960	O'Regan 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8961	Rabinowitz 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8962	Papas 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8963	Lee 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8966	Kumari 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8967	Belenkaya 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8970	Lieberman 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8971	Sharma 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8972	Bai 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8973	Bayar 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8976	Carson 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8977	Bombin 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8978	Turczynski 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8979	Oleneva 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8980	Nachshoni 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8983	Peuskens 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8984	Mattys 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8985	Ophir 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8986	Modell 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8987	Meltzer 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8988	Tang 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8989	Moller 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8990	Rubio 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8992	Ogasa 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8993	Ray 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20289	熊明兰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8994	Seemann 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8995	Seemann 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8996	Tunis 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8997	L'Italien 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8998	Kapur 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8999	Vanelle 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9001	Gafoor 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9002	Sethuraman 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9003	Deberdt 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9004	Deberdt 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9005	Loza 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9007	Kim 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9008	Hamann 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9010	Chabannes 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9011	Morken 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9013	Pae 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9018	Ciliberto 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9019	Hajak 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9020	Freudenreich 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9021	Corripio 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9022	Evans 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9024	Basu 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9026	Fleischhacker 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9027	Akhondzadeh 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9028	Hansen 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9029	de Lima 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9030	Barak 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9031	Mori 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9032	Su 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9033	Silver 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9034	Weng 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9035	Wagner 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9036	Startup 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9037	Zhang 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9038	de Leon 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9039	Revicki 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9040	Tait 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9041	Scherer 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9042	Aasen 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9043	Friedman 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9045	Kudoh 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9046	Lopez-Carrero 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9048	Sevy 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9049	Weissman 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9050	Mihalopoulos 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9052	Dobmeyer 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9053	Metcalfe 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9054	de Leon 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9055	Evins 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9056	Larrison-Faucher2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9057	Hordern 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9059	Lipkovich 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9063	Owens 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9064	Weckowicz 1960 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9065	Gerson 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9066	Rush 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9067	Wolf 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9069	Sun 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9070	Tan 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9071	Mathai 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9072	Martin 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9073	Sergi 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9074	Vauth 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9075	Atmaca 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9076	Kraus 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9078	Dollfus 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9079	Brunelin 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9080	Kumari 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9082	Hovens 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9084	Riedel 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9086	Keefe 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9087	Tsai 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9088	Himei 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9091	Ritchie 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9092	Rohricht 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9093	Rotondi 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9094	Strakowski 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9095	Zipursky 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9096	Jhirwal 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9097	Remillard 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9098	Forchuk 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9099	Kane 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9100	Kozuki 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9301	Saxena 1990a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9101	Kreinin 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9104	Lecuona 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9106	STAR 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9109	McQuade 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9112	Geller 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9113	Lieberman 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9116	Loughnan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9117	Delay 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9118	Glick 1975 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9119	Goff 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9120	Goff 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9121	Lewis 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9122	Lewis 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9125	Anzai 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9126	Farzin 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9127	Generali 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9128	Kallert 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9130	Kretzschmar 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9131	Langle 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9132	Nechifor 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9133	Ukpong 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9134	Schulte 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9135	Yamashita 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9141	Kavanagh 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9142	Scholten 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9143	Akhondzadeh 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9144	Bazzoni 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9147	Melle 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9149	Rosenberg 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9150	Turkington 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9151	Feng 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9152	Fu 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9153	Jiang 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9154	Li 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9155	Li 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9156	Liu 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9157	Qin 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9158	Sun 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9159	Ma 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9160	Tang 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9161	Wang 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9162	Wang 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19412	单美艳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9163	Xie 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9164	Yang 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9165	Ye 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9166	Zhang 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9167	Zhang 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9168	Zhang 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9169	Zhang 2005 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9170	Zhao 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9171	Zhou 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9172	Cao 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9173	Chen 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9174	Chen 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9175	Chen 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9176	Bai 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9177	Chen 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9178	Gao 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9179	Guan 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9180	Han 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9181	Hao 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9182	Tan 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9183	He 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9184	Jiang 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9185	Li 2005 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9186	Lin 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9187	Mai 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9188	Tang 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9189	Wang 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9190	Wang 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9191	Wang 2005 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9192	Wang 2005 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9193	Wang 2005 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9194	Wang 2005 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9195	Wang 2005 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9196	Wu 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9197	Wu 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9198	Xia 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9199	Yang 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9200	Yao 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9201	Yuan 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9202	Zhao 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9203	Zhai 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9204	Zhang 2005 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9205	Zhu 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9206	Zhu 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9207	Zhong 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19413	陈丽娟 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9210	Cheng 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9211	Dai 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9212	Ding 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9213	Du 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9214	Du 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9215	Du 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9216	Du 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9217	Fan 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9218	Fan 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9219	Gao 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9220	Guo 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9221	Han 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9222	He 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9223	Hong 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9224	Huang 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9225	Jiang 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9227	Li 2005 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9228	Li 2005 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9229	Li 2005 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9230	Li 2005 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9231	Liu 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9232	Liu 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9234	Luo 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9235	Luo 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9236	Miao 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9237	Meng 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9238	Peng 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9239	Qiu 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9240	Pan 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9241	Shang 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9242	Sheng 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9243	Shi 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9244	Tan 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9245	Tao 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9246	Tao 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9247	Wang 2005c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9248	Wang 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9249	Wang 2005 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9250	Wang 2005 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9251	Wang 2005 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9252	Wang 2005 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9253	Wang 2005 q	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9254	Wang 2005 r	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9255	Wang 2005 s	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9256	Wang 2005 t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9257	Wang 2005 u	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9258	Wang 2005 v	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9259	Wu 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9261	Xu 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9262	Yao 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9263	Yuan 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9264	You 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9265	Ye 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9266	Yang 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9267	Wang 2005 w	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9268	Zhou 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9269	Zhang 2005 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9270	Zhang 2005 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9271	Zhang 2005 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9272	Zhang 2005 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9273	Zhi 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9274	Zhou 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9275	Tian 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9276	Sun-ling 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9277	Huang 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9278	Keri 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9279	Li 2005 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9280	Li 2005 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9282	Su 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9284	Ren 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9285	Bao 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9286	Barnas 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9287	Chang 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9288	Carpenter 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9289	Cooper 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9290	De Cuyper 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9291	Eklund 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9293	Jarema 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9294	Jasovic-Gasic 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9295	Kissling 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9296	Kissling 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9297	Meszaros 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9298	Montgomery 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9299	Mori 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9302	Saxena 1990b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9303	Strauss 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9304	Ulmar 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9305	Yagi 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9306	Widerlov 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9307	Yamagami 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9308	Hebenstreit 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9309	Hebenstreit 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9310	Yang 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9314	Minami 1990 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9315	Minami 1990 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9316	Adams 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9317	Adams 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9318	Barnes 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9319	Barnes 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9320	Barrowclough 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9321	Barrowclough 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9322	Bentall 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9323	Byng 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9326	Bebbington 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9327	Britto 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9328	Birchwood 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9329	Birchwood 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9330	Burns 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9331	Burns 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9332	Burns 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9333	Chambers 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9334	Crawford 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9335	Cook 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9336	Dye 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9337	Garety 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9338	Dursun 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9340	Doody 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9341	Day 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9342	Dick 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9343	Ebrahim 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9344	Ebmeier 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9345	Fahy 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9346	Fallon 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9347	Fewtrell 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9348	Fowler 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9351	Francis 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9352	Garety 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9353	Guy 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9355	Godfrey 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9358	Gumley 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9359	Gumley 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9360	Gumley 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9361	Hirsch 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9362	Henderson 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9365	Harvey 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9366	Haddock 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9367	Haddock 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9368	Jumnoodoo 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9369	Jones 2001 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9370	Jones 2001 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9371	Jaycock 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9372	Jackson 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9373	Hirsch 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9374	Knapp 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9375	Kerwin 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9376	Jones 2005b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9377	Lewis 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9378	Lewis 2001 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9379	Lewis 2001 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9381	Lynch 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9382	McCabe 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9383	McCreadie 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9384	McKenna 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9385	McLoughlin 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9386	Lester 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9387	Lewis 2001 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9388	Morrison 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9389	Mortimer 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9390	Mortimer 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9391	Mortimer 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9392	Mortimer 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9394	Michael 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9398	Petch 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20290	于信兵 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9401	Purdie 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9402	Ramamurthy 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9403	Ratna 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9404	Reveley 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9405	Reveley 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9406	Reveley 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9407	Reveley 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9408	Reynolds 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9409	Richardson 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9410	Richardson 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9411	Richardson 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9412	Ritchie 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9413	Rohriht 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9414	Gournay 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9415	Sharma 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9416	Sharma 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9418	Sensky 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9419	Sahakian 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9420	Suri 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9421	Startup 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9422	Spurrell 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9423	Singh 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9425	Sharma 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9426	Sharma 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9427	Sharma 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9428	Leavey 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9429	Tarrier 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9430	Tarrier 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9431	Tarrier 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9432	Tarrier 2001 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9433	Tarrier 2001 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9434	Tattan 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9435	Taylor 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9436	Thornicroft 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9437	Thornicroft 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9438	Thornicroft 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9439	Trower 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9440	Trower 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9441	Turkington 2001 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9442	Turner 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9443	Tyrer 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9444	Williams 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9445	Warner 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9446	Wieck 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9447	Williams 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9448	Wilson 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9449	Wright 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9450	Wright 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9451	Wykes 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9452	Szmukler 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9453	Tarrier 2001 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9454	Thompson 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9455	Lester 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9457	Chapman 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9458	Johnson 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9459	Lester 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9460	Drury 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9462	McCreadie 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9463	Nothard 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9464	Sireling 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9466	Chaudhry 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9467	Beasley 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9468	Binder 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9469	Meyer 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9471	Potkin 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9472	Pina 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9473	Marder 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9477	Conrad 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9479	Grass 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9480	Gaudiano 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9481	Gumley 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9482	Howell 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9483	Kinon 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9484	Stroup 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9485	Scocco 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9486	McEvoy 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9489	Wagner 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9490	Velligan 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9492	Krakowski 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9493	Harrison-Read 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9494	Tyrer 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9495	Gross 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9496	Carson 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9497	Carson 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9498	Casey 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9500	Jody 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9503	Casey 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9516	Bhaskaran 1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9517	Matheu 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9518	Ray 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9519	Roncone 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9520	Scharfstein 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9522	Archie 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9523	Awad 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9524	Emsley 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9525	Gopalakrishnan 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9526	Miodownik 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9527	Mauri 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9528	Lencz 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9529	Lee 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9530	Kim 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9531	Jandl 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9533	Heresco-Levy 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9534	Haddock 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9535	Christensen 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9536	Gumley 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9537	Poyurovsky 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9539	Sharma 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9540	Wu 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9542	Bresee 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9543	Emsley 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9544	Timko 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9545	Cui 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9546	Jiang 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9547	Li 2004 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9548	Liu 2004 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9549	Ren 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9550	Wei 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9551	Zhong 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9553	Bellack 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9554	Citrome 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9555	Soo Kwon 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9556	McGurk 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9558	Shaw 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9559	Olincy 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9560	Dickey 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9561	Mitchell 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9563	Van Meijel 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9564	Berkman 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9565	Bradley 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9566	Mir 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9567	Valencia 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9568	Grecu 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9569	Loebel 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9570	Schlogelhofer 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9571	Vasquez 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9572	Ascher-Svanum 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9573	Bilder 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9574	Boidi 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9575	Bossie 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9576	Byerly 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9577	Canas 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9579	Citrome 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9581	Cottingham 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9582	Currier 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9584	Daniel 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9585	Faries 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9586	Faries 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9588	Gaebel 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9592	Jean-Baptiste 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9597	Kim 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9598	Kim 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9599	Kryzhanovskaya 2006a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9600	Lewis 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9602	Loebel 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9603	Potkin 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9604	Penades 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9605	Newcomer 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9607	Meyer 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9608	Davidson 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9609	McEvoy 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9610	McEvoy 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9613	Rathod 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9614	Rodriguez 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9615	Rubio 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9618	Strom 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19414	熊辉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9620	Sacchetti 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9622	Warrington 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9623	Zelaschi 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9624	Bai 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9625	Baloescu 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9626	Bosia 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9627	Castrogiovanni 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9628	Chaudhry 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9631	Ertugrul 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9632	Farzin 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9634	Gharabawi 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9635	Giaquinto 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9636	Keefe 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9637	Kelemen 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9638	Kim 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9640	Parellada 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9641	Musil 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9642	Mossaheb 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9643	Mechri 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9645	Marinkovic 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9646	Mantua 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9647	Lasic 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9648	Lin 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9650	Plesnicar 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9651	Ko 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9652	Klaras 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9653	Prikryl 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9654	Rappard 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9655	Robles 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9656	Ryu 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9658	Shim 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9659	Strous 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9660	Su 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9661	Tudor 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9663	Lewis 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9665	Lewis 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9666	Lewis 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9667	Morrens 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9669	Addington 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9670	Alaghband-rad 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9671	Alaghband-rad 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9673	Bechdolf 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9674	Castelein 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9675	Crespo-Facorro 2006a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9676	Dittmann 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9677	Gafoor 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9678	Hoffman 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9679	Jackson 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9681	Keet 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9682	Killackey 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9684	Leclerc 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9685	Lecomte 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9686	Linszen 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9687	Lester 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9689	Bertelsen 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9690	Hodgekins 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9691	Hodgekins 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9692	Mottaghipour 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9693	Nienhuis 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9694	Newton 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9695	Nordentoft 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9697	Power 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9698	Ruhrmann 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9699	Ruhrmann 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9700	Sharifi 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9701	Srihari 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9702	Stain 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9703	Verhaegh 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9704	Wunderink 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9705	Duval 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9706	Wyszogrodzka 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9707	Morrison 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9708	Eli Lilly 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9709	Eli Lilly 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9710	Eli Lilly 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9711	Eli Lilly 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9712	Eli Lilly 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9713	Eli Lilly 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9714	Eli Lilly 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9715	NCT00103571	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9716	Eli Lilly 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9718	NCT00337662	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9719	Eli Lilly 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9721	Eli Lilly 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9722	Reilly 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9723	Ascher-Svanum 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9724	Caplan 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9725	Chien 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9727	Green 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9728	Lane 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9729	Levine 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9730	Hasson-Ohayon 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9731	Killaspy 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9732	McEvoy 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9735	Perkins 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9736	Schubert 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9738	Kryzhanovskaya 2006b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9739	Wonodi 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9741	Chrzanowski 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9742	Farrow 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9743	Lambert 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9745	McCue 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9746	Alvarez 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9747	Kinon 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9748	Azorin 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9749	Lal 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9750	McDonell 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9751	Ritsner 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9752	Uchida 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9753	Weber 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9754	Vanherweghem 1979 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9755	Bai 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9756	Berger 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9757	Berger 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9758	Buchanan 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9759	NCT00916461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9760	Chengappa 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9761	Chiu 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9762	Drake 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9763	Evins 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9764	Fitzgerald 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9765	Fleming 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9766	Gallo 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9767	Greenberg 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9768	Gross 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19415	王新法 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9769	Hashimoto 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9770	Jaskiw 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9771	Jin 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9772	Johnstone 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9773	Kelleher 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9774	Kern 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9775	Keshavan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9776	Kulkarni 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9777	Leweke 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9778	McNeil 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9779	Muller 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9780	NCT00483964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9781	O'Donnell 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9782	Penn 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9783	Potkin 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9784	Prasad 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9785	Savitz 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9786	Schneider 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9787	Simonsen 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9788	Smith 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9789	Tamminga 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9790	NCT01041092	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9791	Wang 2003 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9792	Weiser 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9793	Wuliji 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9794	Zhang 2003 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9795	Zhang 2003 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9796	Zhang 2005 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9797	de Lima 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9798	Holt 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9799	刘成霞 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9800	庞胜芝 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9801	张艳秋 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9803	胡铜森 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9804	李敏 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9805	汤剑平 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9807	刘桂芳 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9808	吕纪珍 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9810	何蕊芳 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9811	Yang 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20291	魏维 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9812	贾太莲 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9813	王汉婵 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9814	李轶群 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9815	苏慧 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9816	陈元堂 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9817	范建华 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9818	肖莉蓉 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9819	王大开 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9820	梁峻铭 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9821	童寿明 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9822	周志英 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9823	王树阳 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9824	赵业华 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9825	杨俊义 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9826	王立杰 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9827	汪宏才 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9828	刘启珍 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9829	沈秀梅 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9830	张子平 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9831	黄金茹 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9832	肖琳 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9833	栗大顺 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9834	马兆峰 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9835	王宏林 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9836	田瑞芳 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9837	韩中媛 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9838	Quan 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9839	朱良君 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9840	连文仙 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9841	张冬红 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9842	张冬红 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9843	朱逸人 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9844	周志英 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9845	于得霞 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9846	朱良君 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9847	蒋菊芳 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9848	高月云 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9849	张海风 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9850	丁志杰 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9851	王秀芳 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9852	陈蕊 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9853	Zhi 2005a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9854	麻赤贞 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9855	张跃兵 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9856	樊凌姿 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9857	王相立 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9858	张金钊 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9860	孙花 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9861	赵成香 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9862	陈洪辉 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9863	安新发 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9864	刘春仙 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9865	张海燕 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9866	高俊霞 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9867	延英芹 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9868	褚会英 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9869	文胜惠 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9870	Pan 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9871	吴军 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9872	钟薇 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9873	殷俊凤 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9874	章浩明 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9875	李秀英 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9876	张海杰 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9877	韦强 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9878	黄英 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9879	刘琳 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9880	朱春红 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9881	刘雪萍 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9882	Ucok 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9883	Arango 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9884	Ascher-Svanum 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9886	王秋燕 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9887	余洁 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9888	刘春仙 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9889	梁在益 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9890	刘可智 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9891	Zhou 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9892	郑永梅 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9893	王立娥 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9894	Cosden 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9895	Gold 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9897	Lenert 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9899	Rossi 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9900	Tunis 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9902	Guillem 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9903	Kim 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9904	张长军 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9905	Tassaneeyakul 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9906	Naeem 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9907	Naeem 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9908	Taira 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9909	Knegtering 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9912	Gold 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9913	Grawe 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9914	Martino 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9915	Petrakis 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9917	Brenner 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9918	Kraemer 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9919	Neumann 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9920	Scheidhacker 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9923	Sayers 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9924	Simpson 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9925	Zhong 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9926	Vreeland 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9927	Hemingway 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9928	Kitchener 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9929	Sugar 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9930	Boulay 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9931	Morrison 2004 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9933	Hall 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9934	Saba 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9935	Wang 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9936	Maoz 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9937	Baker 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9938	Baker 2006b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9939	Bustillo 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9940	Emsley 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9943	McKibbin 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9944	Patterson 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9945	Swanson 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9946	Zhang 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9947	Fowler 2007a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9948	EDIE-2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9949	Esfahani 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9951	Muhlack 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9952	Kinon 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9953	Janssen-Ortho 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9954	Chiu 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9955	Van Meijel 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9956	Bjorkman 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9957	Hu 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9958	Baymiller 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9959	Zhang 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9960	Salkever 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9961	Akdede 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9962	Crespo-Facorro 2006b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9963	Farhady 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9964	Zadeh 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9965	Shafti 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9966	Shafti 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9967	Shafti 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9968	Ren 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9969	Knott 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9970	Choi 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9971	Harvey 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9973	Haug 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9974	Langle 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9975	Mozes 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9976	Sells 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9977	Veser 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9978	Veltro 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9979	Morse 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9981	Eli Lilly HGDV 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9983	Chan 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9985	Lasser 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9986	Mosolov 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9989	Depatie 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9990	Kane 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9991	Suresh Kumar 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9992	Pae 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9993	Lindenmayer 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9994	Caroff 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9995	Barretto 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9996	Peng 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9997	An 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20292	黄卫东 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9998	An 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9999	Ao 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10000	Bai 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10002	Cao 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10004	Chen 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10005	Chen 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10007	Chen 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10008	Chen 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10009	Chen 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10010	Cheng 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10011	Cheng 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10013	Dai 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10014	Deng 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10015	Deng 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10016	Deng 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10017	Ding 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10018	Ding 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10019	Ding 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10020	Du 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10021	Du 2005 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10022	Fan 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10023	Fan 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10024	Gong 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10025	Guo 2003 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10026	Gao 2003 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10027	Guo 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10029	He 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10030	Hou 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10031	Hu 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10032	Hu 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10033	Lin 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10034	Huang 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10036	Huang 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10037	Huang 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10038	Ji 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10039	Jia 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10040	Jiang 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10041	Jiang 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10042	Kong 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10043	Kuang 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10044	Lai 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10045	Lan 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10046	Lei 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10047	Liu 2005 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10048	Li 2005 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10049	Li 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10050	Li 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10052	Li 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10053	Li 2005 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10054	Li 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10055	Li 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10058	Li 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10060	Liang 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10061	Lin 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10062	Lin 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10064	Liu 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10065	Liu 2004 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10067	Liu 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10069	Liu 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10070	Liu 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10071	Liu 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10072	Liu 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10074	Liu 2003 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10075	Liu 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10076	Liu 2004 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10077	Liu 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10078	Liu 2004 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10079	Lu 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10081	Lu 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10082	Lu 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10084	Lu 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10086	Lu 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10087	Lu 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10088	Luo 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10089	Ma 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10090	Ma 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10091	Ma 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10095	Pan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10096	Pang 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10097	Qi 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10098	Qin 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10099	Qu 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10100	Ren 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10101	Ren 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20293	黄卫东1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10102	Shen 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10103	Shi 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10104	Song 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10106	Sun 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10107	Sun 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10108	Sun 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10109	Sun 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10110	Sun 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10111	Sun 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10114	Tang 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10115	Tang 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10116	Tang 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10117	Tao 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10118	Tian 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10119	Tian 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10120	Wan 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10121	Wang 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10122	Wang 2003 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10123	Wang 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10124	Wang 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10125	Wang 2003 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10126	Wang 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10127	Wang 2005 x	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10129	Wang 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10130	Wang 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10131	Wang 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10132	Wang 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10133	Wang 2006 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10134	Wang 2006 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10135	Wang 2006 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10136	Wang 2001 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10137	Wang 2004 q	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10138	Wang 2006 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10139	Wang 2004 r	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10140	Wang 2003 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10141	Wang 2006 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10142	Wang 2006 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10143	Wei 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10144	Wei 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10145	Wei 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10146	Wen 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10147	Wu 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10148	Xie 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10149	Xie 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10152	Xu 2001 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10153	Xu 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10155	Gong 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10156	Xu 2003 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10157	Xu 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10158	Xun 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10159	Yan 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10160	Yan 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10161	Yang 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10162	Yang 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10163	Yang 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10165	Yang 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10166	Yang 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10167	Yang 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10168	Yang 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10169	Yang 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10170	Yang 2005 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10171	Yang 2005 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10172	Yang 2005 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10173	Yang 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10174	Yang 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10175	Yang 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10176	Yang 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10177	Yao 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10179	Ye 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10181	Ying 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10182	Yu 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10183	Yu 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10184	Yuan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10185	Zeng 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10186	Zhang 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10187	Zhang 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10188	Zhang 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10189	Zhang 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10190	Zhang 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10191	Zhang 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10192	Zhang 2006 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10193	Zhang 2006 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10194	Zhang 2006 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20294	马新莲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10195	Zhang 2006 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10196	Zhan 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10197	Zhang 2006 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10198	Zhang 2006 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10199	Zhang 2006 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10200	Zhang 2004 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10201	Zhao 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10202	Zhao 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10203	Chu 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10204	Zhi 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10205	Zhong 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10206	Zhou 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10208	Zou 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10210	Zhou 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10211	Zhou 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10212	Zhou 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10213	Zhu 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10214	Zhu 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10215	Zhu 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10216	Zhu 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10217	Li 2003 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10220	Killaspy 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10221	Bell 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10222	Lysaker 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10224	Ramu 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10226	McLeod 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10227	Akhondzadeh 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10228	Baptista 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10229	Combs 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10230	Eack 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10231	Rosenheck 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10232	Keefe 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10233	Khazaal 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10234	Kurtz 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10235	Lindenmayer 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10236	Penades 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10237	Strous 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10238	NCT00034801	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10239	Xiang 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10240	Beebe 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10498	NCT00305474	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10241	Turkington 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10242	Slade 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10243	Rabinowitz 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10245	Latimer 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10246	Das 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10247	McLeod 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10249	Costa 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10250	Talwar 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10251	Gray 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10252	Barrowclough 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10253	Barnett 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10254	Ehrenreich 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10256	McEvoy 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10257	Harvey 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10258	Lin 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10259	Fei 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10260	Li 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10261	Xu 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10262	Yang 2005 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10263	Yang 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10265	Goswami 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10266	Ettinger 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10267	Kabanov 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10268	Chandra 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10269	Agarwal 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10270	Goswami 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10271	Ulrich 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10272	Harrison 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10273	NTR405	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10274	Klingberg 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10277	Burns 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10278	Lewis 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10279	Burns 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10280	Kumani 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10281	Lester 2004d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10282	Fahy 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10283	Harrison-Read 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10284	Van Nimwegen 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10285	Huf 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10286	Barrowclough 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10287	Jackson 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10288	Kuipers 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10289	ISRCTN37811364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10290	Wykes 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10291	Johnson 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10292	ISRCTN54567688	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10293	Richardson 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10294	Trower 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10295	Tyrer 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10296	Castelein 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10297	Barrowclough 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10298	Byng 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10300	NTR443	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10301	Ngan 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10302	Craig 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10303	Craig 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10304	Guy 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10305	Kingdon 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10306	Joffe 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10307	NTR179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10308	Busschbach 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10309	NCT00514423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10310	Howard 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10312	Van Gestel 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10313	NTR226	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10314	Becker 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10315	Brown 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10316	Lewis 2000 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10318	Gray 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10319	Ritchie 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10321	Loebel 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10322	Marder 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10323	Osborn 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10325	Szmukler 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10326	Ngan 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10327	Hunter 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10328	Lewis 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10329	Hirsch 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10330	Thornicroft 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10331	Tyrer 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10332	Tyrer 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10333	Tyrer 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10335	Wykes 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10336	Hemingway 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10337	Thornicroft 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10339	NCT00175513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10340	NCT00206115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10341	NCT00237848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10342	NCT00237809	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10343	NCT00237796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10344	NCT00232687	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10345	NCT00231933	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10346	NCT00231894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10347	NCT00231335	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10348	NCT00145847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10349	NCT00148083	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10350	NCT00261716	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10351	NCT00261794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10352	NCT00269035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10353	NCT00272168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10354	NCT00276263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10355	NCT00280813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10356	NCT00260273	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10358	NCT00412373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10359	NCT00412620	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10360	NCT00259870	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10361	NCT00257192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10362	NCT00256997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10363	NCT00255515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10364	AstraZeneca 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10365	NCT00249288	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10366	NCT00248794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10367	NCT00246259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10368	NCT00140179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10369	NCT00206544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10370	NCT00245206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10371	NCT00202293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19416	杨如良 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10372	NCT00161031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10373	NCT00167310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10374	NCT00167934	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10375	NCT00168311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10376	NCT00169689	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10377	NCT00169702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10378	NCT00169988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10379	NCT00174889	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10380	NCT00176423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10381	NCT00158366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10382	NCT00176436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10383	NCT00176449	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10384	NCT00179465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10385	NCT00177905	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10386	NCT00177177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10387	NCT00177580	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10388	NCT00190749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10389	NCT00189995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10390	NCT00186771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10391	NCT00183443	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10392	NCT00192751	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10393	NCT00182494	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10394	NCT00192582	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10395	NCT00192855	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10396	NCT00202280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10397	NCT00203788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10398	NCT00205660	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10399	NCT00206102	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10400	NCT00132314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10401	NCT00136760	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10402	NCT00137189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10406	NCT00137280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10407	NCT00138021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10408	NCT00139919	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10848	Potkin 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10849	Strom 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10850	Talbott 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10852	Collins 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19417	潘志芳 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10853	Daniel 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10854	Goldstein 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10855	Haut 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10856	Ibrahim 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10857	Kaushik 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10858	Perez-Iglesias 2007a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10859	Van Os 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10860	Allen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10862	NCT00396643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10863	Arnt 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10864	Ascher-Svanum 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10865	Baker 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10866	Barr 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10867	Baskak 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10868	Bell 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10869	Bennett 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10870	Bertelsen 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10872	Jensen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10873	Holland 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10874	Haupt 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10875	Harvey 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10876	Harris 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10878	Hale 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10879	Greig 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10880	Green 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10881	Granholm 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10882	Fahnestock 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10883	d'Souza 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10884	Canuso 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10885	Buchanan 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10886	Brecher 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10888	Jessani 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10889	Jeste 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10890	Josiassen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10891	Jung 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10892	Khan 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10893	Killackey 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10894	Kim 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10895	Kollack-Walker 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10896	Kramer 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19489	Lindenmayer 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10897	Kujawa 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10898	Kulkarni 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10899	Lahti 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10900	Allison 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10901	Fioritti 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10902	Daskalakis 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10903	Davis 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10904	de Castella 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10905	Diamond 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10906	Drake 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10907	Boonstra 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10910	Leweke 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10911	Lysaker 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10912	Luthringer 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10913	Loebel 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10914	Lecomte 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10915	Lesem 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10916	Linszen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10917	Marder 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10918	McCabe 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11556	Peng 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11557	Pu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11558	Qin 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11559	Qin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11560	Qiu 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11561	Qiu 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11562	Qu 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11563	Qu 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11564	Sha 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11565	Shen 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11566	Shen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11567	Song 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11568	Song 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11569	Song 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11570	Su 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11571	Sun 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11572	Sun 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11573	Sun 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11574	Sun 2006 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11575	Sun 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11576	Tan 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20251	易著英 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11577	Tan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11578	Tang 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11579	Tang 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13494	Evins 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13497	Lane 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13498	Lenior 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13501	Hoffman 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13504	Gillis 1977 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13505	Kern 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13507	Ko 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13510	Kretschmar 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13512	Solomon 1995 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13515	Finnell 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13520	Kalali 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13521	Warawat 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13522	Amann 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13523	Fries 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13524	Klingberg 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13525	Koch 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13526	Rappold 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13528	Takats 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13529	Wiebel 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13533	Greenfield 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13534	Siris 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13536	Ban 1975 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13537	Fleischhacker 1995 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13538	Ogunmefun 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10409	NCT00140166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10410	NCT00210717	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10411	NCT00212836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10412	NCT00401089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10413	NCT00328978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10414	NCT00138775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10415	NCT00140192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10416	NCT00144027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10417	NCT00145496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10418	NCT00148564	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10419	NCT00148447	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10420	NCT00148590	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10421	NCT00148616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10422	NCT00149734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10423	NCT00149955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10424	NCT00150176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10425	NCT00156065	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10426	NCT00156091	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10427	NCT00158223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10428	NCT00206128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10429	NCT00206557	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10430	NCT00206570	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10431	NCT00210548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10432	NCT00215917	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10433	NCT00216281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10434	NCT00216671	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10435	NCT00220714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10436	NCT00218231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10437	NCT00223418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10438	NCT00044083	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10439	NCT00044655	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10440	NCT00048828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10441	NCT00056498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10442	NCT00057707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10443	NCT00071604	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10444	NCT00088049	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10445	NCT00088491	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10446	NCT00090324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10447	NCT00100165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10448	NCT00124683	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10449	NCT00111189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10450	NCT00129441	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10451	NCT00130923	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10452	NCT00352339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10453	NCT00357006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10454	NCT00361166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10455	NCT00361543	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10456	NCT00362804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10457	NCT00373321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10458	NCT00373126	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10459	NCT00372151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10460	NCT00369577	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20252	张青磊 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10461	NCT00366704	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10462	NCT00374777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10463	NCT00374244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10464	NCT00373672	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10465	NCT00375050	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10466	NCT00380224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10467	NCT00363376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10468	NCT00391677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10469	NCT00392249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10470	NCT00395915	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10471	NCT00396214	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10472	NCT00396565	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10473	NCT00397033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10474	NCT00400166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10475	NCT00401973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10476	NCT00403247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10477	NCT00403546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10478	NCT00404573	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10479	NCT00406718	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10480	NCT00407277	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10481	NCT00409201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10482	NCT00303602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10483	NCT00338598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10486	NCT00334035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10487	NCT00333970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10488	NCT00333177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10489	NCT00330863	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10490	NCT00330551	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10491	NCT00325689	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10492	NCT00324051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10493	NCT00320697	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10494	NCT00320671	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10495	NCT00320489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10496	NCT00308997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10497	NCT00306475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10499	NCT00307216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10500	NCT00312962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10501	NCT00312949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10502	NCT00309452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10503	NCT00309413	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10504	NCT00316238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10505	NCT00314639	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10506	NCT00338949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10507	NCT00349973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10508	NCT00347425	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10509	NCT00345033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10510	NCT00338975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10511	NCT00338832	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10512	NCT00345982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10513	NCT00350467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10514	NCT00350883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10515	NCT00351936	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10516	NCT00356317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10517	NCT00344500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10518	NCT00281320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10519	NCT00225498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10520	NCT00231101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10521	NCT00282165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10522	NCT00287820	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10523	NCT00288353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10524	NCT00288366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10525	NCT00289861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10526	NCT00295048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10527	NCT00295139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10528	NCT00297947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10530	NCT00300651	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10531	NCT00300846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10532	NCT00291226	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10533	曹新妹 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10534	Jia 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10535	Li 2002 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10536	Li 2002 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10537	Liu 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10538	Ma 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10539	Wang 2002 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10540	Wang 2002 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10542	Xu 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10543	Yang 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10544	Yang 2002 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10545	Zhang 2002 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10547	Zhao 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10548	Zhao 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10549	Zhu 2002 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10552	Ye 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10553	Zhou 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10554	阿怀红 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10555	阿怀红 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10556	Bai 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10557	Bi 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10558	Cai 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10559	Cai 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10560	Cao 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10561	Cao 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10562	Chang 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10563	Chang 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10564	Chen 2003 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10565	Chen 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10566	Chen 2005 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10567	Chen 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10568	Chen 2006 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10569	Chen 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10570	Chen 2006 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10571	Chen 2005 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10572	Chen 2004 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10573	Chen 2006 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10574	Chen 2003 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10575	Chen 2006 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10576	Chen 2006 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10577	Cheng 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10578	Cheng 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10579	Cui 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10580	Deng 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10581	Ding 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10582	Ding 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10583	Ding 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10584	Dong 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20253	樊增华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10585	Du 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10586	Fan 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10587	Fan 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10588	Gan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10589	Gao 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10590	Gao 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10591	Gao 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10592	Gao 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10593	Guo 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10594	Han 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10595	Hang 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10596	He 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10597	He 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10598	He 2003 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10599	Hou 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10600	Huang 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10601	Huang 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10602	Huang 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10603	Huang 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10604	Huang 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10605	Huang 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10606	Ji 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10607	Jiang 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10608	Jiang 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10609	Kuang 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10610	Lei 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10611	Li 2004 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10612	Li 2006 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10613	Li 2006 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10614	Li 2005 r	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10615	Li 2005 s	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10616	Li 2003 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10617	Li 2006 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10618	Li 2006 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10619	Li 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10620	Li 2004 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10621	Li 2006 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10622	Li 2006 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10623	Li 2006 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10624	Li 2006 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10625	Li 2006 q	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10626	Liang 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20254	段文涛 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10627	Liang 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10628	Lin 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10629	Lin 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10630	Lin 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10631	Lin 2005 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10632	Liu 2003 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10633	Liu 2006 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10634	Liu 2003 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10635	Liu 2003 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10636	Liu 2006 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10637	Liu 2005 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10638	Liu 2006 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10639	Lu 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10640	Lv 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10641	Ma 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10642	Mei 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10643	Qi 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10644	Qian 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10645	Ren 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10646	Rosenheck 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10647	Ruan 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10648	Sheng 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10649	Sheng 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10650	Song 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10651	Song 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10652	Su 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10653	Sun 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10654	Sun 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10655	Sun 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10656	Sun 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10657	Sun 2000 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10658	Tan 2005 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10659	Tang 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10660	Tang 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10661	Tang 2005 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10662	Tang 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10663	Tao 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10664	Tao 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10665	Tian 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10666	Wang 2006 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10667	Wang 2006 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10668	Wang 2006 q	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10669	Wang 2004 s	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20255	武建斌 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10670	Wang 2006 r	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10671	Wang 2005 z	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10672	Wang 2004 t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10674	Wang 2000 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10675	Wang 2006 s	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10676	Wang 2001 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10677	Wang 2006 t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10678	Wang 2005 ab	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10679	Wang 2005 ac	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10680	Wei 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10681	Wei 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10682	Wen 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10683	Wen 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10684	Wu 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10686	Xiao 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10687	Xie 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10688	Xie 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10689	Xu 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10690	Xu 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10691	Xu 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10692	Xu 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10693	Xu 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10694	Xu 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10695	Xun 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10696	Yang 2006 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10697	Yang 2006 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10698	Yang 2006 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10699	Yang 2003 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10700	Yang 2005 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10701	Yang 2006 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10703	Yi 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10704	Yin 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10705	You 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10706	Yu 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10707	Yu 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10708	Yu 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10709	Yuan 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10710	Zhan 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10711	Zhang 2005 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10712	Zhang 2006 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10713	Zhang 2006 q	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10714	Zhang 2006 r	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10715	Zhang 2006 s	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10716	Zhang 2006 t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10717	Zhang 2006 u	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10718	Zhang 2005 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10719	Zhang 2006 v	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10720	Zhang 2006 w	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10721	Zhang 2006 x	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10722	Zhang 2006 y	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10723	Zhang 2004 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10724	Zhang 2005 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10725	Zhang 2006 z	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10726	Zhao 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10727	Zheng 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10728	Zheng 2003 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10729	Zheng 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10730	Zhou 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10732	Zhou 2005 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10733	Zhou 2000 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10734	Zhu 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10735	Zhu 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10736	Zhu 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10737	Zhuang 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10738	Cao 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10739	Han 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10740	Li 2006 r	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10741	Yang 2006 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10742	Chen 2005 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10743	Guo 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10745	Fei 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10746	Huang 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10747	Li 2002 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10748	Liu 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10749	Lu 2002 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10750	Luo 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10751	Wang 2002 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10752	Wang 2002 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10753	Xiang 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10754	Xiang 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10755	Zhang 2002 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10756	Zou 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10757	Block 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10758	Baptista 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10759	Baptista 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10760	Andrezina 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10761	Carpenter 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10762	Donaldson 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20256	柴艳丽 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10763	Essock 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10765	Jackson 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10766	Macias 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10767	Hogarty 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10768	Schutzwohl 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10769	Morken 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10770	Marder 1991 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10771	Solomon 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10772	Arranz 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10773	Bernardo 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10775	Bell 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10777	Gang 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10778	Fagerlund 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10779	Emsley 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10780	de Leon 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10782	Alverson 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10784	Miodownik 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10785	Meltzer 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10786	McCay 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10787	Lee 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10788	Lidvall 1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10789	Gunne 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10790	Guz 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10791	Frangou 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10792	Jager 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10793	Smelson 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10794	Smelson 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10796	Startup 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10797	Skrinar 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10798	Mueser 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10800	Wunderink 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10801	Jenner 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10802	Lee 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10803	McGurk 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10804	Mortimer 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10805	Pierson 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10806	Reimold 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10807	Robinson 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10808	Rosenheck 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10810	Stroup 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10813	Li 2005 t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20257	杨苏萍 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10814	Shi 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10815	Zhang 2002 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10816	Fagerlund 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10817	Zhang 2006 aa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10818	MATISSE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10819	Muller 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10823	EMEA 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10824	EMEA 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10825	EMEA 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10826	EMEA 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10827	EMEA 2007 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10828	EMEA 2007 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10829	EMEA 2007 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10830	EMEA 2007 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10831	EMEA 2007 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10832	EMEA 2007 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10833	EMEA 2007 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10834	Ahmed 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10836	Boggs 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10837	Casey 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10838	Kane 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10839	Keefe 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10840	Heisterberg 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10841	Lazarus 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10843	Marcus 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10844	Meltzer 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10847	Peuskens 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10919	McGorry 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10921	Meltzer 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10922	Mueser 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10923	Miller 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10924	Minzenberg 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10926	Moser 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10927	Nienhuis 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10928	Nelson 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10929	Newcomer 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10930	Nyhuis 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10931	O'Donnell 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10932	Ogasa 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10933	Oren 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10934	Papas 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10936	Peters 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10937	Petersen 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10938	Phillips 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10939	Prikryl 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10940	Procyshyn 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10941	Ritch 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10942	Robinson 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10943	Aranda 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10944	Reeder 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10945	Roder 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10946	Sartory 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10947	Sanchez-Cubillo 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10948	Savitz 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10949	Sergi 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10950	Shapira 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10951	Shibre 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10953	Silverstein 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10954	Smith 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10955	Tzimos 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10956	NCT00455663	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10957	NCT00472862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10958	Warrington 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10960	Weiden 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10961	Wunderink 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10962	Wykes 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10963	Zipursky 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10964	Maples 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10968	Huang 2006 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10969	Lang 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10970	Wang 2006 u	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10971	Wang 2004 u	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10972	Wang 2006 v	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10973	Yang 2003 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10974	Anon a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10975	Yazici 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10976	Sivasankaran 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10978	NCT00018642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10979	NCT00018668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10982	NCT00036088	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10983	NCT00044187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10984	NCT00051298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10985	NCT00073164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10986	NCT00080327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10987	NCT00085748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10988	NCT00085891	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10989	NCT00088478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10990	NCT00095524	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10991	NCT00097942	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10992	NCT00100776	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10993	NCT00108368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10994	NCT00114595	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10995	NCT00149292	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10996	NCT00159081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10997	NCT00159120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10998	NCT00159133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10999	Bartels 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11001	NCT00175955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11002	NCT00191555	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11003	NCT00191828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11004	NCT00204087	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11006	NCT00214578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11007	NCT00222235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11008	NCT00161018	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11009	NCT00164242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11010	NCT00222794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11012	NCT00237939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11013	NCT00239122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11014	NCT00254241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11015	NCT00254787	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11016	NCT00304473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11017	NCT00305422	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11018	NCT00307203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11020	NCT00320736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11021	NCT00331825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11022	NCT00339170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11023	NCT00383747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11025	NCT00419146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11026	NCT00430560	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11029	NCT00435721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11030	NCT00440843	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11031	NCT00449397	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11032	NCT00453804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11033	NCT00455650	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11034	NCT00457899	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11035	NCT00461318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11036	NCT00465920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11037	NCT00466323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11038	NCT00469664	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11039	NCT00485498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11040	NCT00485810	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11041	NCT00485823	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11042	NCT00485901	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11043	NCT00486005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11044	NCT00487942	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11045	NCT00488163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11046	NCT00492336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11047	NCT00492349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11048	NCT00495911	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11049	NCT00320723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11050	NCT00506909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11051	NCT00509067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11052	NCT00255918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11053	NCT00423943	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11054	NCT00481026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11056	NCT00083668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11057	NCT00078039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11058	NCT00077727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11059	NCT00077714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11060	NCT00074477	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11061	NCT00073320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11062	NCT00071747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11063	NCT00071591	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11064	NCT00069433	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11065	NCT00063349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11066	NCT00063297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11068	NCT00053690	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11069	NCT00300963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11070	NCT00046085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11071	NCT00043693	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11072	NCT00042224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11073	NCT00042159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11074	NCT00018629	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11075	NCT00001768	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11076	NCT00088075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11077	NCT00101634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11079	NCT00119756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11080	NCT00153959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11081	NCT00157313	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11082	NCT00157378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11083	NCT00161408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11084	NCT00167362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11085	NCT00169026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11087	NCT00169039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11088	NCT00169065	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11089	NCT00169091	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11090	NCT00178971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11091	NCT00179062	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11092	NCT00179231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11093	NCT00183625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11094	NCT00184509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11095	NCT00190008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11097	NCT00197093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11098	NCT00202007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11099	NCT00203775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11100	NCT00204061	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11101	NCT00206947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11102	NCT00206960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11103	NCT00206986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11104	NCT00216476	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11105	NCT00220870	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11106	NCT00222495	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11107	NCT00235352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11108	NCT00236379	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11109	NCT00236457	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11111	NCT00240708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11112	NCT00249119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20258	杨建华 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11114	NCT00249223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11115	NCT00253110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11116	NCT00253136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11117	NCT00261430	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11118	NCT00272584	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11119	NCT00283179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11120	NCT00297388	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11121	NCT00286299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11122	NCT00300404	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11124	NCT00304616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11125	NCT00328276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11126	NCT00328367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11127	NCT00337350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11128	Liang 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11129	NCT00512070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11130	NCT00508560	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11131	NCT00508157	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11132	NCT00506077	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11133	NCT00505765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11134	NCT00505076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11135	NCT00495352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11136	NCT00494650	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11137	NCT00493233	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11138	NCT00491569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11139	NCT00358709	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11140	NCT00378183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11141	NCT00423878	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11142	NCT00425815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11143	NCT00428168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11144	NCT00431184	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11145	NCT00431223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11146	NCT00435370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11147	NCT00456976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11148	NCT00465283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11149	NCT00466310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11150	NCT00468533	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11151	NCT00481156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11152	NCT00482430	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11154	NCT00484302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11155	NCT00469365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11156	NCT00000374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11157	NCT00000387	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11158	NCT00013000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11159	NCT00044005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11160	NCT00044044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11161	NCT00046813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11162	NCT00047450	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11163	NCT00102479	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11164	NCT00102063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11165	NCT00088634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11166	NCT00057135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11167	NCT00053703	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11168	NCT00051740	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11169	NCT00051233	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11170	NCT00048269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11171	NCT00105326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11172	NCT00105794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11173	NCT00139906	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11174	NCT00141479	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11175	NCT00145444	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11176	NCT00159770	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11177	NCT00119574	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11178	NCT00151424	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11179	NCT00156104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11180	NCT00156117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11181	NCT00156637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11182	NCT00223535	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11183	NCT00218218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11185	NCT00212771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11186	NCT00208143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11187	NCT00193713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11188	NCT00182442	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11189	NCT00177983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11190	NCT00174200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11191	NCT00507988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11192	NCT00500695	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11193	NCT00498550	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11194	NCT00498004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11195	NCT00490516	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11196	NCT00480844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11197	NCT00486798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11198	NCT00470106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11199	NCT00463372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11200	NCT00463346	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11204	NCT00431574	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11205	NCT00420823	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11206	NCT00420498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11207	NCT00419653	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11208	NCT00418873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11209	NCT00418171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11210	NCT00310661	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11211	NCT00291213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11212	NCT00265551	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11214	NCT00239109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11215	NCT00237861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11216	NCT00235274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11217	NCT00224380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11218	NCT00224315	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11219	NCT00455715	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11220	NCT00455702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11221	NCT00463879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11222	NCT00499044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11224	Zhou 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11225	Zhao 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11226	Brewer 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11228	Davidson 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11229	Davies 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11230	Freudenreich 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11231	Mackin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11233	Mogg 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11234	Strous 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11235	Wu 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11236	Xiang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11237	Weinberger 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11238	Akerele 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11239	Baptista 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11240	Boidi 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11241	Buchsbaum 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11242	Carra 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11243	George 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11244	Kohler 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20259	李少梅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11245	Keks 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11246	Lee 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11247	Sumiyoshi 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11248	Ohlmeier 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11249	Poyurovsky 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11250	Riedel 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11251	Risch 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11252	Wynn 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11253	Zoccali 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11254	Nakonezny 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11255	Richardson 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11256	Lu 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11257	Lu 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11258	Ma 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11259	Peng 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11260	Shan 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11261	Wang 2003 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11262	Wang 2002 q	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11264	Zhang 2004 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11265	Xu 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11266	Zhang 2005 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11267	Zhu 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11268	Yuan 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11269	Ma 2004 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11270	Chen 2003 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11271	Chen 2005 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11272	Chi 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11273	Ding 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11274	Huang 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11275	Jiang 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11276	Jiang 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11277	Jin 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11278	Li 2002 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11279	Li 2001 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11280	Menzies 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11281	Hang 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11282	Li 2002 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11283	Dunn 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11284	Duraiswamy 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11285	England 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11286	Henderson 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11287	Jin 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11288	Lecrubier 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11289	Schonebaum 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11290	Patterson 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11292	Bauml 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11293	Patel 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11294	Lenior 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11295	Sytema 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11296	Valencia 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11297	Martinez 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11298	Bai 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11299	Bauml 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11300	Gigantesco 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11302	Kaptsan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11303	Kashner 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11305	Magliano 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11306	McHugo 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11307	Miller 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11309	Reeder 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11310	Tracy 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11311	Ciudad 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11312	Elbogen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11313	Bosia 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11314	Maneesakorn 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11315	McMahon 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11316	Milas 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11317	Beasley 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11318	Canas 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11319	Brunelin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11320	Corrigan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11321	Evins 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11322	Manchanda 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11323	Stant 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11324	Wu 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11325	Zhang 2006 ab	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11326	Ng 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11327	Stefancic 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11328	Agid 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11329	Chan 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11330	D'Souza 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11331	Samarasekera 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11377	Bernardo 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11332	Smith 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11333	Robinson 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11334	Potkin 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11336	Neale 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11337	Malhotra 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11338	Lieberman 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11339	Kane 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11340	Jayathilake 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11341	Lewis 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11342	Lewis 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11344	Smith 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11345	Mata 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11346	Yi 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11347	Wu 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11348	Wang 2002 r	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11349	Lee 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11351	Aguglia 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11352	Sumic 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11353	Grant 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11354	Heller 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11355	Leitch 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11356	Fowler 2007b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11358	Birchwood 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11359	Pilowsky 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11360	Joffe 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11361	Michon 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11362	Lester 2004 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11363	Lee 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11364	Priebe 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11365	Eli Lilly 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11366	Eli Lilly 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11367	Eli Lilly 2004 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11368	Eli Lilly 2004 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11369	Eli Lilly 2004 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11370	Eli Lilly 2002 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11372	Thornicroft 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11373	Kim 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11374	Jakovljevic 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11375	Goldberg 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11376	Eklund 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20260	夏仲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11378	Anchor 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11379	Lee 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11380	Lopez-Luengo 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11381	Mamo 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11382	Ruhrmann 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11383	Thorup 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11385	Landeen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11386	Guthrie 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11387	Burns 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11388	Birchwood 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11389	Chipchase 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11390	Startup 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11391	Ai 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11392	An 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11393	Ao 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11394	Bai 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11395	Bai 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11396	Bai 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11397	Bao 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11398	Cai 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11399	Cai 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11400	Chang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11401	Chang 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11402	Chen 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11403	Chen 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11404	Chen 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11405	Chen 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11406	Chen 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11407	Chen 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11408	Chen 2007 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11409	Chen 2007 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11410	Chen 2007 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11411	Chen 2007 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11412	Chen 2006 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11413	Chen 2006 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11414	Chen 2007 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11415	Chen 2007 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11416	Chen 2007 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11417	Cheng 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11418	Dai 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11419	Dai 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11420	Dang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11421	Deng 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11422	Deng 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11515	Lin 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11423	Deng 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11424	Deng 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11425	Diao 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11426	Diao 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11427	Ding 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11428	Du 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11429	Fan 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11430	Feng 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11431	Feng 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11432	Gan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11433	Gao 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11434	Gao 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11435	Gao 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11436	Gao 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11437	Gong 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11438	Gong 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11439	Guan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11440	Guo 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11441	Guo 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11442	Guo 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11443	Guo 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11444	Guo 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11445	Guo 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11446	Han 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11447	Han 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11448	Han 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11449	Hao 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11450	He 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11451	He 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11452	He 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11453	He 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11454	Hou 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11455	Hou 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11456	Hu 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11457	Hu 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11459	Huang 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11460	Huang 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11461	Huang 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11462	Huang 2006 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11463	Huo 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11464	Ji 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11465	Jia 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11466	Jiang 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11467	Jiang 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11468	Jiang 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11469	Jiang 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11470	Jiang 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11471	Jiang 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11473	Jiang 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11474	Jiang 2006 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11475	Jin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11476	Kang 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11477	Kong 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11478	Kong 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11479	Kuang 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11480	Kuang 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11481	Kuang 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11482	Lan 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11483	Li 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11484	Li 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11485	Li 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11486	Li 2006 s	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11487	Li 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11488	Li 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11489	Li 2006 t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11490	Li 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11491	Li 2007 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11492	Li 2007 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11493	Li 2007 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11494	Li 2006 u	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11495	Li 2006 v	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11496	Li 2007 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11497	Li 2006 w	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11498	Li 2006 x	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11499	Li 2007 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11500	Li 2006 y	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11501	Li 2006 z	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11502	Li 2007 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11503	Li 2007 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11504	Li 2007 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11505	Li 2007 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11506	Li 2007 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11507	Li 2007 q	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11508	Li 2007 r	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11509	Liang 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11510	Liang 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11511	Liang 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11512	Liang 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11513	Liang 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11514	Lin 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11516	Lin 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11517	Lin 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11518	Lin 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11519	Lin 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11520	Ling 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11521	Liu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11522	Liu 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11523	Liu 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11524	Liu 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11525	Liu 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11526	Liu 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11527	Liu 2006 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11528	Liu 2007 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11529	Liu 2007 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11530	Liu 2006 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11531	Liu 2007 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11532	Liu 2007 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11533	Lou 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11534	Lu 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11536	Luo 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11537	Lv 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11538	Lv 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11539	Lv 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11540	Ma 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11541	Ma 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11542	Ma 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11543	Ma 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11544	Ma 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11545	Ma 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11546	Mei 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11547	Ming 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11548	Mu 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11549	Nai 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11550	Nai 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11551	Ou 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11552	Ou 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11553	Pan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11554	Peng 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11555	Peng 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11580	Tang 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11581	Tang 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11582	Tang 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11583	Tang 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11584	Tao 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11585	Tao 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11586	Tian 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11587	Tian 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11588	Tian 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11589	Tong 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11590	Tong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11591	Tu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11592	Wan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11593	Wan 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11595	Wang 2006 x	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11596	Wang 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11597	Wang 2006 y	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11598	Wang 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11599	Wang 2006 z	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11600	Wang 2006 aa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11602	Wang 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11603	Wang 2006 ac	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11604	Wang 2006 ad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11605	Wang 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11606	Wang 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11607	Wang 2006 ae	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11608	Wang 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11609	Wang 2007 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11610	Wang 2006 af	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11611	Wang 2006 ag	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11612	Wang 2007 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11613	Wang 2006 ah	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11614	Wang 2007 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11615	Wang 2006 ai	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11616	Wang 2007 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11617	Wang 2007 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11618	Wang 2007 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11619	Wei 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11620	Wei 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11621	Wei 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11622	Wen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11623	Wu 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11624	Wu 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11625	Wu 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11626	Wu 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11627	Wu 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11628	Wu 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11629	Wu 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11630	Xia 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20261	闾金杰1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11631	Xiao 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11632	Xiao 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11633	Xiao 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11634	Xie 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11635	Xiong 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11636	Xu 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11637	Xu 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11638	Xu 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11639	Xu 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11640	Xu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11641	Xu 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11642	Xu 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11643	Xu 2007 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11644	Xu 2007 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11645	Xuan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11646	Yan 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11647	Yang 2006 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11648	Yang 2006 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11649	Yang 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11650	Yang 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11651	Yang 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11652	Yang 2006 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11653	Yang 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11654	Yang 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11655	Yang 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11656	Yang 2007 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11657	Ye 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11658	Yi 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11659	Yi 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11660	Yi 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11661	Yi 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11662	Yu 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11663	Yu 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11664	Yu 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11665	Yue 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11666	Yue 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11667	Zeng 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11668	Zeng 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11669	Zeng 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11670	Zeng 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11671	Zeng 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11672	Zeng 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11673	Zeng 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11674	Zhan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11675	Zhang 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11676	Zhang 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11677	Zhang 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11678	Zhang 2006 ac	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11679	Zhang 2006 ad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11680	Zhang 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11681	Zhang 2006 ae	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11682	Zhang 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11683	Zhang 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11684	Zhang 2007 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11685	Zhang 2006 af	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11686	Zhang 2006 ag	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11687	Zhang 2006 ah	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11688	Zhang 2007 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11689	Zhang 2007 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11690	Zhang 2007 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11691	Zhang 2007 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11692	Zhang 2007 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11693	Zhang 2007 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11694	Zhang 2007 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11695	Zhang 2006 ai	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11696	Zhang 2007 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11697	Zhang 2007 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11698	Zhao 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11699	Zhao 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11700	Zhao 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11701	Zhao 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11702	Zhao 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11703	Zhao 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11704	Zhe 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11705	Zheng 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11706	Zheng 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11707	Zheng 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11708	Zheng 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11709	Zhong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11710	Zhong 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11712	Zhou 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11713	Zhou 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11714	Zou 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11715	Zhou 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11716	Zhou 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11717	Zhou 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11718	Zhou 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11719	Zhou 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11720	Zhou 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20262	李巧 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11721	Zhou 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11722	Zhou 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11723	Zhu 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11724	Zhu 2006 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11725	Zong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11726	Zhou 2007 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11727	Zou 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11728	Zou 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11729	Zuo 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11730	Wang 2006 aj	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11731	Yang 2007 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11732	Wu 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11733	Eli Lilly 2007 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11735	Chien 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11736	Goldberg 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11737	Rivera 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11738	Rowe 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11739	Hanlon 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11740	Barbui 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11741	Bond 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11742	Buchanan 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11743	Buchanan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11744	Byerly 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11745	NCT00308360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11746	Gold 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11747	Greig 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11748	Honer 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11750	Jean-Baptiste 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11751	Johnson 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11752	Lane 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11753	Marder 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11754	McCann 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11755	McCue 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11756	Heres 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11757	Mortimer 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11758	Munro 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11761	Sacchetti 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11762	Suzuki 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11763	Taylor 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11764	Turkington 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11765	Valencia 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11768	Lapidus 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11770	Gaebel 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11771	Hasson-Ohayon 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11772	Lerner 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11774	Potkin 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11775	Rosa 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11776	Saddichha 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11777	Schutt 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11778	Ulrich 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11779	Rahav 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11780	Chan 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11781	Ohlenschlaeger 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11783	Ohlenschlaeger 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11784	Sullivan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11786	NCT00334126	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11787	Carson 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11788	Castelein 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11789	Cavezian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11790	Chen 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11791	Emsley 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11792	Frommann 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11793	Frommann 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11794	Grenier 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11795	Han 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11797	Hui 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11798	Juckel 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11799	Kalali 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11800	Kane 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11802	Kulkarni 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11803	Kulkarni 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11804	Levkovitz 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11805	Meltzer 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11806	Pajonk 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11807	Peuskens 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11808	Rossenu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11809	Sushko 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11811	Harvey 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11812	Kramer 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11813	Jackson 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11815	Morrison 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11816	Mortimer 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11817	Cowen 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11818	Laugharne 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11819	Jackson 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11820	Austwick 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11821	Wykes 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11822	Gumley 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11823	Goeroecs 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11824	Daniel 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11825	Hansen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11826	Linne 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11827	Naber 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11828	Peuskens 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11829	Awad 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11830	Kinon 2003 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11831	Harrison 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11832	Nyilas 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11839	Anon 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11840	Stock 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11841	DelBello 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11842	Roychowdhury 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11843	Roychowdhury 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11844	Roychowdhury 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11846	Gilaberte 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11847	Keks 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11848	Uzun 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11849	Santa Ana 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11851	Wu 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11852	Amiri 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11853	Baptista 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11854	Byerly 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11855	Bergemann 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11857	Ellett 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11858	George 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11860	Wu 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11861	Saddichha 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11862	Kumra 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11863	Jackson 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11864	Johnson 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11866	Perlick 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11951	NCT00535574	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11867	Poulin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11868	Assion 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11869	Cook 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11870	Cortese 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11871	NCT00254202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11872	Friedman 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11873	Gallhofer 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11874	Goff 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11875	Goff 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11876	Goldstein 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11877	Goyal 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11878	Kluge 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11879	Riedel 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11880	Weinberger 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11882	Kelleher 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11883	Sapra 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11884	Bobo 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11885	Thyssen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11886	Hough 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11887	Mandel 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11888	Hill 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11889	Hamilton 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11890	Cazorla 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11891	Whitehead 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11892	Medori 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11893	Prescorn 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11895	Shen 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11896	Simonson 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11897	Parsons 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11899	Gopal 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11901	Macfadden 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11902	Greenberg 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11903	Cassella 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11904	Lavedan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11905	Bogeum 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11906	Lee 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11907	Chiu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11908	Cordes 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11909	Ereshefsky 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11910	NCT00034749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11911	NCT00323193	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11952	NCT00534898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11912	NCT00356291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11913	NCT00380536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11914	NCT00514449	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11915	NCT00392236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11916	NCT00435903	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11917	NCT00447720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11918	NCT00458094	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11919	NCT00496691	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11920	NCT00515671	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11921	NCT00515723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11922	NCT00517075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11923	NCT00518323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11924	NCT00520728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11925	NCT00523445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11926	NCT00524043	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11927	NCT00525304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11928	NCT00525863	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11929	NCT00528905	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11930	NCT00531518	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11931	NCT00535132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11932	NCT00570063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11933	NCT00567710	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11934	NCT00567203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11935	NCT00567034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11936	NCT00565175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11937	NCT00564096	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11938	NCT00560937	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11939	NCT00559572	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11940	NCT00554840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11941	NCT00552500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11942	NCT00549718	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11943	NCT00548327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11944	NCT00547118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11945	NCT00546403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11946	NCT00545467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11947	NCT00541398	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11948	NCT00539071	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11949	NCT00538642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11950	NCT00538070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11953	NCT00534183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11954	NCT00573287	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11955	NCT00573417	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11956	NCT00567281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11957	NCT00575666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11958	NCT00575848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11959	NCT00580125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11960	NCT00585390	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11961	NCT00587561	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11962	NCT00588731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11963	NCT00589914	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11964	NCT00590577	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11965	NCT00591318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11966	NCT00595504	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11967	NCT00600756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11968	NCT00601224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11979	NCT00653406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11980	NCT00646256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11981	NCT00686998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11982	NCT00604760	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11983	NCT00621634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11984	NCT00637234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11985	NCT00657631	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11987	NCT00694707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11988	NCT00605995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11989	NCT00640510	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11990	NCT00645944	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11991	NCT00646581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11992	NCT00688259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11994	NCT00615511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11995	NCT00621777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11996	NCT00663039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11997	NCT00690235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11998	NCT00690274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11999	NCT00604279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12000	NCT00618280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12001	NCT00628394	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12002	NCT00635700	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12003	NCT00639886	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12004	NCT00789698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12006	NCT00658645	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12007	NCT00686699	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12008	NCT00686153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12009	Chanpattana 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12010	Wykes 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12011	Pae 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12012	Penades 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12013	Jenner 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12014	Faber 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12015	Pampoulova 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12017	Ruhrmann 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12018	Schliefer 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12019	Simpson 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12020	Simpson 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12021	Simpson 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12022	Thompson 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12023	Nyberg 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12024	NCT00611806	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12025	NCT00640562	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12026	NCT00644969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12027	NCT00654706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12028	NCT00655239	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12029	NCT00660595	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12030	NCT00672464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12031	NCT00677898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12032	NCT00685321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12033	NCT00694889	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12034	ISRCTN02658871	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12035	Jumnoodoo 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12036	Thornicroft 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12039	Gouzoulis 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12040	NCT00615433	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12041	ISRCTN44218911	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12311	Malm 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12044	Grodner 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12045	NCT00581243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12046	Birchwood 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12047	Jones 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12049	NCT00572247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12050	Moritz 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12051	Garety 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12052	Gournay 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12053	Gray 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12054	NCT00563706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12056	Mak 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12057	So 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12059	Chabannes 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12060	Golden 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12061	Glenthoj 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12062	McClellan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12063	Craig 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12064	Bressi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12065	Whitten 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12066	Pickett-Schenk 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12067	Lindenmayer 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12068	Wong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12069	Sefasi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12070	Kongsakon 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12071	Kageyama 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12072	Heim 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12075	Schneider 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12083	Peacock 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12086	Trueman 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12105	Astrup 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12106	Green 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12109	Hamilton 1999b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12110	Hildebrandt 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12114	Margo 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12115	Marx 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12118	Pfeiffer 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12121	Brotons 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12122	Pavlicevic 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12124	Rosenheck 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12135	Immich 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12141	Bucci 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12149	Zhu 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12151	Agius 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12157	Jackson 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12162	Ray 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12163	Bustillo 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12167	NCT00455234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12170	Meco 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12173	Hogarty 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12174	Barton 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12175	Berk 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12176	Castelein 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12178	Chen 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12179	England 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12180	Fletcher 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12181	Gallagher 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12183	Hatta 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12184	Hong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12185	Keefe 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12187	Lavoie 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12188	NCT00788970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12191	Rouillon 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12194	Wood 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12195	Agid 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12196	Barbui 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12197	Brunelin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12198	Dyer 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12199	Foster 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12202	Jubelt 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12205	Killackey 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12206	Latimer 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12209	Rami 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12210	Russell 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12211	Sartory 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12212	Shekhar 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12214	Thompson 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12215	Tremeau 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12216	Velligan 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12219	Sharpley 1964 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12220	Lin 2006 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12221	Taemeeyapradit 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12222	Intoh 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12224	Rosoiu 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12225	Mohr 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12226	Kim 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12227	Liang 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12229	Tamrakar 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12230	Keisar 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12231	Kopelowicz 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12232	Chouinard 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12234	Daniel 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12235	Genc 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12236	Doering 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12237	Rupnow 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12238	Kemp 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12239	Perham 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12240	Klein 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12242	Cheng 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12243	Wolf 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12244	Fuentes 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12246	Padgett 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12251	Salize 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12254	Schafer 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12255	Milano 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12256	Chiappelli 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12257	Tang 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12259	Shoja 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12261	Tunis 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12263	Ahmadi 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12265	Karahmadi 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12266	Singh 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12267	Delva 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12268	Humphrey-Beebe 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12270	Weinberg 1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12279	Field 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12281	Bond 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12283	Morice 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12284	Gervey 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12285	Durost 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12288	Vosseler 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12290	Souto 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12291	Ayuso-Gutierrez 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12292	Suwa 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12296	Naoki 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12297	Sungur 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12298	Isawa 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12299	Jensen 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12300	Svestka 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12304	Chen 2002 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12307	Kim 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12310	Han 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12316	Cho-Boon 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12319	Inoue 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12324	Sorgi 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12326	Mair 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12327	Brown 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12328	Kline 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12329	Brook 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12330	Curtis 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12333	Liang 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12334	Santos 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12335	Smith 1987 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12336	Sharma 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12337	Vora 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12339	Lindberg 1981 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12340	Lindberg 1981 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12341	Baker 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12343	Chandler 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12345	Carey 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12346	Drake 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12347	Hulse 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12348	Mangrum 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12349	Mowbray 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12350	Sacks 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12351	Xie 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12352	Barrowclough 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12353	Sitharthan 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12355	Baro 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12360	Zhang 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12361	Yuan 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12363	Lin 1999 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12364	Zhou 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12367	Yang 1997 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12370	Yao 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12371	Li 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12376	Lewandowski 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12378	Ping 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12380	Rifang 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12381	Ushakov 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12384	Bailine 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12386	Van Kammen 1982 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12387	Anon 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12388	Mausbach 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12392	Yoon 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12393	Park 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12394	Lee 1997 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12395	Lee 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12396	Kim 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12397	Ahn 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12398	Lifschitz 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12399	Hotz 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12401	Feng-Ju 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12406	Jacobs 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12411	Yang 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12414	Dong 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12415	Martyn 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12417	Kumar 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12418	ISRCTN38856272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12419	Kabes 1984 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12420	Hofmann 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12421	Grandmontagne 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12422	Cullerre 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12423	Crosse 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12425	Balanchandran 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12426	Korsgaard 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12427	Heikkila 1992 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12428	O'Krent 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12429	Lin 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12430	del Giudice 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12432	Schooler 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12438	Hirsch 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12444	McGowan 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12446	Campbell 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12447	Okuda 1979 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12450	Wang 2004 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12451	Li 2004 k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12456	Akerele 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12457	Qiu 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12458	Ries 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12459	Belmaker 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12460	Havassy 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12461	Evins 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12462	Cao 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12463	Byrne 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12464	Richmond 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12467	Ziegler 1989 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12470	Stant 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12471	Xue 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12473	Madalena 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12474	Garciaruiz 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12475	Deberdt 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12477	Akerele 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12480	Tuma 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12485	Ding 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12490	Zhong 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12515	Clerc 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12516	Clerc 1989 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12521	Ebrinc 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12538	NCT00707382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12540	Wu 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12543	NCT00645502	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12544	Fitzgerald 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12546	Uzenoff 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12547	Owen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12548	NCT00711464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12549	NCT00649844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12550	NCT00634348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12551	NCT00723606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12552	NCT00639483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12553	NCT00705783	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12554	NCT00706654	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12555	NCT00650611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12556	NCT00725855	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12557	NCT00645372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12558	NCT00727103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12559	NCT00566735	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12561	NCT00733057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12562	NCT00712270	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12563	NCT00728195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12564	NCT00725075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12565	NCT00672373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12568	Ganguli 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12570	NCT00645515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12571	NCT00268749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12572	NCT00628420	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12573	NCT00712660	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12574	NCT00725270	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12576	Strous 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12577	NCT00695708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12578	NCT00722176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12579	NCT00704509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12580	Kopecek 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12581	Baeuml 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12582	Jennings 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12583	Anand 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12584	Brinkman 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12586	Ropert 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12588	Nguyen 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12589	Pichot 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12595	Malaspina 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12596	Klingberg 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12597	Gabbard 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12598	Messotten 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12603	Svendsen 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12604	Wang 2005 ad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12606	Mazeh 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12608	Habib 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12613	Alphs 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12615	Davis 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12616	Detke 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12617	Detke 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12618	Dodd 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12620	Forbes 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12621	Glenthoj 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12622	Gulliver 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12623	Gulliver 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12624	Han 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12625	Chetvertnykh 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12627	Jensen 1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12629	Buckley 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12632	Duffy 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12633	Zimmer 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12634	Agara 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12635	Sibitz 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12636	Berkman 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12637	Feng 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12639	Anon 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12640	Kin Wong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12641	Assuncao 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12642	NCT00090012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12644	Han 2008 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12648	Turkington 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12655	Yoon 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12656	Wolwer 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12657	Weiser 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12664	Mosolov 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12666	Pinto 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12667	Price 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12668	Iancu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12671	Prikryl 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12672	Potapov 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12674	Olincy 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12676	Miyake 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12677	Saito 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12679	Lee 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12680	Lee 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12682	Klein 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12683	Kinon 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12684	Kapur 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12685	Inada 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12687	Siu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12689	Twamley 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12690	Velligan 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12692	Peuskens 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12693	Bayer 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12695	Remillard 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12697	Wang 1998 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12698	Chafetz 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12699	Faries 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12700	Hill 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12701	Qian 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12702	Drake 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12704	Gabor 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12707	McCay 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12708	Barr 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12710	Berget 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12712	Bell 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12715	Ruhrmann 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12717	NCT00621998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12718	NCT00722163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12719	NCT00654576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12720	NCT00714818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12721	NCT00713804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12722	NCT00659919	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12723	NCT00709202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12724	NCT00737256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12726	NCT00686140	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12728	NCT00563550	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12729	NCT00711269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12730	NCT00718510	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12731	NCT00089869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12732	NCT00736710	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12733	NCT00712075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12734	NCT00522613	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20263	王志强 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12735	NCT00712686	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12736	Hyde 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12737	Creed 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12743	Puschner 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12745	Wolford 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12746	Chien 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12747	Sikich 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12748	Gallagher 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12749	Patil 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12751	Yuan 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12753	Popov 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12754	Halbreich 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12755	Findling 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12757	Arman 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12758	Sacco 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12759	Kim 2006 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12760	Vaz-Leal 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12761	Van Nimwegen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12765	Chen 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12767	Yao 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12768	Twamley 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12769	Salimi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12771	Schneider 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12773	Moxon 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12774	Cook 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12776	Moller 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12777	Combs 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12778	Zanjani 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12779	Luty 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12781	So 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12782	Ascher-Svanum 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12786	Bisol 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12790	Harvey 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12793	Moller 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12794	Rusch 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12795	Van Dorn 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12796	Bergemann 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12797	Deberdt 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12798	Jensen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12800	Ader 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20264	周芳珍 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12801	Fakra 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12802	Dunn 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12803	Bustillo 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12816	Raweh 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12817	Haggarty 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12819	Bechdolf 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12822	Lysaker 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12826	Apiquian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12828	Kinon 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12831	Davis 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12832	Ko 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12833	Doruk 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12834	Pratt 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12836	Velligan 2001 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12841	NCT00768612	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12848	Shafti 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12850	Schrock 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12852	NCT00781794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12853	NCT00255879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12854	NCT00791440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12855	NCT00631722	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12856	NCT00786318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12857	NCT00772005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12858	NCT00798109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12859	NCT00791882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12860	NCT00761670	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12861	NCT00783120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12862	NCT00790517	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12863	NCT00797277	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12864	NCT00621465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12865	NCT00794963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12866	NCT00770744	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12867	NCT00770237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12868	NCT00757497	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12870	NCT00753051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12872	NCT00783185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12873	NCT00781079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12874	NCT00790192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12875	NCT00641745	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12876	NCT00793780	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12877	Lichtenberg 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12878	NCT00645099	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12879	NCT00693472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12883	Spaulding 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12884	Sensky 2000 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12887	Startup 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12889	Gong 1998 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12905	Imai 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12910	Zhang 1997 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12914	Bellomo 1972 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12917	Drake 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12931	Kubacki 1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12933	Caranza 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12936	Kinross 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12939	Rupnow 2005b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12940	Riedel 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12941	Lasser 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12942	Cavazzoni 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12944	Dunn 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12945	de Lima 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12946	Shim 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12947	Preskorn 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12948	Nyilas 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12950	Buchsbaum 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12952	Eerdekens 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12953	Fleming 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12954	Harvey 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12955	Izakova 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12957	Kim 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12958	Kim 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12959	Lee 2007 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12961	Gwynne 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12963	Holden 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12964	Wijsenbeek 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12966	Gerlach 1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12975	Sherr 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12980	Jarema 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12982	Callahan 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12990	Colombo 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12991	Sells 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12993	Josiassen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13105	Brown 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12994	Safa 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12995	Goff 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12996	Lan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12997	Forsberg 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12999	ISRCTN25455020	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13006	Perez 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13007	Han 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13008	Gutierrez 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13009	An 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13010	Goder 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13017	Hemnani 1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13019	Eack 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13023	Abderhalden 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13026	Gunby 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13039	Angst 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13045	Anon 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13048	Anon 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13050	Swartz 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13051	Hanlon 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13053	Hankoff 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13055	Azima 1962 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13059	Yue 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13060	Wang 2002 s	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13067	NCT00734435	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13068	Ding 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13070	Lecomte 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13071	Gutierrez-Suela 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13072	Lewis 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13073	Akhondzadeh 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13075	Akhondzadeh 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13076	Strous 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13079	DelBello 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13080	Barbui 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13082	Bylund 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13088	Ben Hadj 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13091	Purvis 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13103	Rotatori 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13104	Archie 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20265	张子平 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13106	Weiden 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13108	Kryzhanovskaya  2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13109	Bilder 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13111	Mulholland 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13112	Nobay 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13114	Lieb 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13115	Fleming 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13116	Dickerson 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13118	Haro 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13119	Kapur 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13120	Morozova 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13121	Wang 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13122	Tamminga 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13123	Dickerson 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13124	Cai 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13125	Norman 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13126	Muller 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13127	Dolnak 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13128	Xiao 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13129	Popovic 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13130	Cowen 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13131	Belmaker 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13133	Vinogradov 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13135	Jarskog 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13136	Muller 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13137	Lun 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13138	Thaker 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13139	Kohler 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13140	Lara 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13141	Conley 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13142	Muller 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13144	Emsley 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13145	Wieck 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13146	Brusov 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13147	Desta 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13148	Cheung 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13149	Belmaker 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13150	Fenton 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13151	Bahn 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13152	Bahn 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13153	Bustillo 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13154	Xu 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13156	Hadley 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13157	Young 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13158	Poyurovsky 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13159	Joffe 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13161	Berk 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13162	NCT01066403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13163	Savitz 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13164	O'Callaghan 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13165	Klushnik 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13166	Ritsner 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13167	Poyurovsky 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13168	Zhang 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13169	Rujescu 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13170	Juckel 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13171	Anil 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13172	McClellan 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13173	Potkin 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13174	Strous 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13175	Xiao 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13176	Lieberman 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13177	Spivak 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13178	Potkin 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13179	Lieberman 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13180	Ma 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13181	Tiihonen 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13182	Alem 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13183	Li 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13184	Dickerson 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13185	Lerner 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13186	Wang 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13187	Thomas 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13190	Smulevitch 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13191	Nasrallah 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13193	Lundbeck 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13202	Gruzelier 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13207	Ratey 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13208	Mata 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13217	Fleischhacker  2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13222	Buchsbaum 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13224	Ono 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13225	Atsushi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13226	Behdani 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13227	Hebrani 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13229	Kapas 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13230	Detke 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13232	Detke 2008 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13234	Lan 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13237	Tsai 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13239	Wei 2006 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13240	McDonel 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13241	Barrett 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13242	Byerly 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13243	Lundbeck 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13251	NCT00034905	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13252	NCT00843687	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13257	NCT00796081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13258	NCT00845026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13259	NCT00791232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13261	NCT00791622	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13262	NCT00791349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13267	NCT00817648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13268	NCT00827918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13269	NCT00819689	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13270	NCT00796185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13271	NCT00817336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13272	NCT00759993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13273	NCT00810355	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13274	NCT00832845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13275	NCT00829400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13276	NCT00802100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13277	NCT00809770	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13278	NCT00753506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13279	NCT00826202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13280	NCT00816894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13281	NCT00833547	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13282	NCT00740259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13283	NCT00768326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13284	NCT00810667	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13285	NCT00759421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13286	NCT00006195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13287	NCT00817154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13288	NCT00757978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13289	NCT00827840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13290	NCT00825539	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13291	NCT00838032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13292	NCT00806234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13293	NCT00759460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13294	NCT00813436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13295	NCT00816907	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13296	NCT00763841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13297	NCT00742079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13298	NCT00802919	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13303	Lemperiere 1962 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13305	Potter 1989 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13310	Meltzer 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13311	NCT00197483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13316	Dencker 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13318	Acil 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13319	Akhapkin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13320	Shen 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13321	Gold 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13324	Pollard 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13325	Choi 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13326	Goff 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13327	Akhondzadeh 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13330	Dickerson 2009 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13331	Byerly 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13332	Sacco 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13334	Lysaker 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13335	Mossner 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13337	Cook 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13338	Horan 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13340	Moritz 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13342	Sacks 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13343	Duncan 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13344	Sandlund 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13345	Pilling 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13346	Cordes 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13347	Hiller 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13348	Van Der Gaag 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13349	Remington	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13350	Potter 1989 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13351	Meszaros 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13352	Potkin 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13353	Mulholland 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20266	王发兵 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13355	Lohr 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13359	Schutzwohl 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13362	Waldrop 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13367	Steadman 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13368	Reiter 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13370	Weickert 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13377	Ruiz 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13378	Wirshing 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13379	Philipp 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13381	Patel 1996 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13383	Vallina 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13388	Silverstein 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13389	Weiden 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13390	Ralevski 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13391	Tsurumaru 1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13392	Rubin 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13394	Motlova 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13396	Torres 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13397	Munetz 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13398	Moriana 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13401	Perry 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13402	Shumway 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13405	Williams 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13406	Mihara 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13407	Tohen 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13409	Wunderink 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13412	Venegas 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13415	Smith 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13419	Small 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13420	Yildiz 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13421	Rubioz 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13422	Roder 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13423	Mosher 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13425	Mueser 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13426	Tsang 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13429	Nair 1998 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13430	Tiihonen 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13431	Sheidow 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13432	Munnich 1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13433	Shoja-Shafti 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13434	Wykes 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13435	Murray 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13438	Prior 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13442	Millar 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13443	Millar 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13446	Morozova 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13447	Fraser 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13448	DeMarce 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13450	Gandelman 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13451	Figueroa 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13455	Addington 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13456	Vickar 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13457	Van Orden 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13459	Pioli 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13461	Krakowski 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13462	Takeuchi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13463	Koshino 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13465	Evins 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13466	Eyler 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13467	Kim 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13468	Hodel 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13469	Greenspan 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13473	Harvey 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13475	Kallert 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13477	Kallert 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13478	Koshino 1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13480	Ko 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13481	Lee 2008 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13482	Erickson 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13488	Evins 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13489	Lane 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13490	Kumar 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13492	Goncalves 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13493	Kudoh 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13542	Crespo-Facorro 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13543	Silverstein 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13544	de Oliveira 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13545	Baptista 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13546	Farhall 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13549	Eklund 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13550	Bagati 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13551	Chan 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13553	Riedel 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13554	Wiersma 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13555	Lieberman 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13556	Dickerson 2009 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13557	Casey 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13558	Penn 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13560	Harris 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13561	Potkin 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13562	Kurt 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13565	Uzenoff 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13568	Crespo Iglesias 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13569	Germana 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13572	Tang 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13573	Gangadhar 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13575	Szmukler 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13576	Garety 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13577	Nahunek 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13578	Bertensen 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13579	Mathew 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13601	Karagianis 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13602	Sharifi 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13603	Kwon 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13604	Fawzi 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13605	McDonnell 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13606	Montes 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13607	Katz 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13610	Sacchetti 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13611	Klingberg 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13612	Erinfolami 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13613	Fleischhacker 2009b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13614	Wirshing 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13617	Piegari 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13618	Gigantesco 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13619	Burns 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13621	Zahn 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13623	Morrison 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13635	Haddock 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13637	Drebing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14255	Zhang Jing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14256	Zhang Jie 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14257	Zhang Jin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14258	Zhang Jin 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14259	Zhang RenKai 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14260	Zhang RenKai 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14261	Zhang Rong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14262	Zhang RuiXia 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14263	Zhang ShaoLi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14264	Zhang ShengLi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14265	Zhang ShuJie 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14266	Zhang WenMin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14267	Zhang Yi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14268	Zhang XinJun 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14269	Zhang XiaoYan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14270	Zhang XiaoLing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14271	Zhang 2008a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14272	Zhang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14273	Zhang YiZhong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14274	Zhang YongShui 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14275	Zhang YueKun 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14276	Zhang YuMei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14277	Zhang ZhanChou 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15194	汪周兵 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15196	温广妹 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15200	王相立 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15201	王秀丽 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15202	王茂萍 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15204	田梅 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15205	田红梅 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15208	皇甫丽 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15209	程均 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15210	程平 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15217	罗来兴 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15220	肖勃 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15221	肖攀攀 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15222	肖敏 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15223	苏京利 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15225	莫春娥 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15227	董汉振 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15230	蔡云帆 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15231	蔡进伟 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15235	覃松 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15238	许玉梅 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15240	谢红武 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15241	谭会 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15243	赵侠 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16535	Yue 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16536	ISRCTN50487713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16548	MO2-547	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16555	Newcomer 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16563	Valencia 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16566	Anderson 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16569	NCT01157351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16573	NCT01136772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16575	NCT01149655	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16576	NCT01129674	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16587	NCT01143077	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16588	NCT01125358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16595	NCT01192880	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16597	NCT01116830	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16601	NCT01193153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16602	NCT01122927	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16606	NCT01189006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16608	Weiner 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16612	NCT01175135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16621	NCT01173874	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16622	NCT01164059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16626	NCT01139502	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16627	NCT01175642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16628	Pinninti 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16632	NCT01213836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16635	Poletti 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16644	NCT01163227	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16667	NCT00845507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16669	NCT01167556	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16670	NCT01190254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16681	NCT01172106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16695	NCT01142596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16700	NCT00682448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16701	NCT01206153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16702	NCT01192594	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16703	NCT01133080	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16704	Terevnikov 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16705	NCT01196286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16710	NCT01202357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16715	NCT01133587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16722	NCT00728728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16729	Thyssen 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16737	NCT01214005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16744	NCT00086593	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16747	NCT01169142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16748	NCT00669903	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16755	NCT01207414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16759	NCT01137799	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16760	NCT01165294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16761	NCT01186471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16762	NCT01167348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16765	NCT01139099	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16770	NCT01119014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16772	NCT01176721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16775	ISRCTN11501328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16780	NCT01207219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16782	NCT01161277	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16784	Zuardi 1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16786	Kong 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16796	Lin 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16797	Pandina 2010 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16799	Dulude 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16800	Feifel 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16804	Brown 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16805	Karagianis 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16808	Fijal 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16824	Morrison 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16828	Fiszdon 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16834	Wittorf 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16845	Fleischhacker 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16847	Lee 2010 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16853	Gafoor 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16854	Carpenter-Song 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16857	Penadas 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16873	Feifel 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16882	Stryjer 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16892	Villeneuve 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16903	Wilder 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16906	Bakali 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16913	Giakoumaki 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16915	Woltmann 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16919	Thomas 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13682	Breier 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20267	祝敬溪 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16926	Ascher-Svanum 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16937	Canuso 2010 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16939	Pedersen 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16945	Tsai 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16948	Savitz 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16957	Simpson 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16958	Pandina 2010 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16959	Harvey 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16960	Barak 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16961	Gulliver 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16962	Kern 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13639	Zhang 2009b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13640	Weaver 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13641	Tsang 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13642	Sacchetti 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13644	McGurk 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13645	Marzolini 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13646	Lecardeur 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13650	Barbie 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13651	Arango 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13653	Kukla 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13654	Gutierrez 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13656	Conley 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13657	Chabannes 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13660	Fang 2003 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13666	NCT00864045	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13667	NCT00876304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13668	NCT00864825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13669	NCT00848432	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13670	NCT00859872	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13671	NCT00857818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13672	NCT00847600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13673	NCT00870909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13674	NCT00856583	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13675	NCT00861796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13676	NCT00866645	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13677	NCT00862992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13678	NCT00875498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13679	NCT00848484	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13680	EUFEST	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13681	Xie 2003 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20268	刘桂芳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13683	Tao 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13684	Cao 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13685	Korr 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13687	Gulcur 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13689	Gulcur 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13690	Dixon 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13691	Obenchain 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13699	Meyer 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13706	Tohen 2000 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13708	Hong 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13710	Kinon 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13711	Kinon 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13717	Remington 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13718	Lauber 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13719	Lambert 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13720	Durham 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13721	Crespo-Facorro 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13725	Rogers 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13726	Okugawa 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13727	Newcomer 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13728	Kulhara 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13732	Henderson 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13734	Avital 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13735	Algul 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13736	Potkin 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13739	Dai 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13740	Chen 2005 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13741	Gao 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13742	Zhao 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13743	Zhao 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13744	Li 2006 aa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13752	Demily 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13757	Cleton 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13759	Su 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13760	Miller 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13761	ACTRN12608000188336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13762	ACTRN12608000475347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13763	NCT00884897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13764	NCT00882518	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13765	NCT00878462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13766	Weickert 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13767	Swadi 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13812	NCT00893256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20269	赵蓓 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13768	Startup 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13769	Guastella 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13771	ACTRN12608000472370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13772	NCT00892528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13773	NCT00892021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13774	NCT00940394	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13775	NCT00885716	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13777	Moore 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13778	McGorry 2000 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13779	NCT00929370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13780	NCT00914238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13783	NCT00917293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13784	NCT00924976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13785	NCT00937261	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13786	NCT00936351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13787	NCT00934908	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13789	NCT00932529	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13790	NCT00930150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13791	NCT00919607	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13792	NCT00926965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13793	NCT00919620	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13794	NCT00923078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13795	NCT00922272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13796	NCT00921804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13797	NCT00905307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13798	Harris 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13799	ACTRN12605000267651	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13800	NCT00929955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13801	Killackey 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13802	ACTRN12609000421235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13803	Castle 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13804	ACTRN12605000594628	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13805	Croft 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13806	Dodd 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13807	Farhall 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13808	ACTRN12608000210370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13809	NCT00888693	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13810	NCT00895258	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20270	卓子禄 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13813	Francey 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13814	NCT00885690	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13815	ACTRN12609000064202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13816	NCT00894842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13817	Jorm 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13818	Killackey 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13819	Berk 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13820	NCT00918021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13821	Arvanitis 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13822	Chiesa 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13823	Smith 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13824	Pappa 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13825	Bush 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13826	Abdollahian 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13827	Yoon 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13828	Chesnoy 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13829	Lehrer 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13832	McDonnell 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13833	Rubio 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13834	Cazorla 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13835	Pajonk 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13836	Haznedar 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13837	Hazlett 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13838	Muller 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13839	Wykes 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13840	Maples 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13841	Brecher 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13843	Reinke 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13844	Newcomer 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13845	Nieves 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13846	Niznikiewicz 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13847	O'Brien 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13851	Penn 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13853	Pope 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13854	Postel 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13855	Postma 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13856	Poyurovsky 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13859	Zipursky 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13860	Lerner 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13864	Luengo 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13868	Reza 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14024	Dickerson 2009 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13869	McDonell 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13870	McDonell 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13872	Meltzer 2005 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13879	Tanabe 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13881	Twamley 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13885	Sramek 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13886	Voss 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13887	Wells 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13888	Wolwer 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13889	Woods 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13893	Risch 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13898	Stengard 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13899	Schmidt 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13901	Shahar 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13907	Schimmelmann 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13911	Castiello 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13912	Chengappa 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13914	Chung 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13915	Collie 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13916	Bressi 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13918	Cook 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13923	Chung 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13924	Bellack 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13927	Arato 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13929	Bai 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13935	Birchwood 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13936	Boulay 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13937	Broerse 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13938	Bechdolf 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13939	Kisely 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13942	Hitsman 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13944	Hoptman 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13946	Huang 2005 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13947	Dippenaar 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13952	Kwon 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13953	Lane 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13954	Lasser 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13956	Ginsberg 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13957	Evins 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13960	Fonder 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13964	Henquet 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20271	徐鹏 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13965	Ginsberg 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13969	Drake 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13970	ISRCTN77769281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13971	Jones 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13974	Canuso 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13975	Canuso 2008 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13976	Kane 2008a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13977	Loebel 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13980	Roberts 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13983	Na 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13984	Gil Sanz 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13987	Velligan 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13988	Shafti 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13990	Pae 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13993	Glick 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13995	Cheng 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13997	ACTRN12609000603213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13998	NCT00946348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13999	NCT00018850	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14000	NCT00956189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14001	NCT00960219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14002	NCT00960375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14003	ISRCTN11889976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14006	Johnson 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14007	Afshar 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14008	Almomani 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14009	Fisher 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14010	Henderson 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14012	Kern 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14013	Lindenmayer 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14015	Ryckmans 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14016	Salmasi 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14017	Tonge 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14020	Barton 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14021	Borras 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14023	Carrizo 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14025	Garcia 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14026	Guo 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14030	Luty 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14032	Mueser 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14034	Ravanic 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14037	Sonmez 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14038	Hatta 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14039	Cuesta 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14040	Chanpattana 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14041	Broadhurst 1958 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14042	Brockington 1978 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14044	NCT00963846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14045	NCT00977522	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14046	NCT00975611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14047	NCT00964041	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14048	NCT00963924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14049	NCT00968851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14050	NCT00970281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14052	Yang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14053	Xu 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14054	Yang 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14055	Dickerson 2009 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14056	Garry 1962 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14060	Xu 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14061	Xu 2008 c 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14062	Yang 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14064	Liu BaiCong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14066	Liu QingLian 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14067	Liu Qin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14068	Liu MingShan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14069	Liu JiaSheng 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14070	Liu HuanZhong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14071	Liu ZhengRong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14072	Liu ZhengRong 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14073	Liu QingHai 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14074	Liu XiaoHong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14075	Liu Jie 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14076	Liu ShuHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14077	Liu QingLian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14078	Liu JingNian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14079	Liu CongMin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14080	Liu WeiFeng 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14081	Liu Yong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14082	Liu GuoXiong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14083	Liu BoCong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14084	Liu GuoYou 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14085	Liu HuaLi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14086	Liu YouDuo 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14087	Liu TongZhou 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14088	Liu XiFen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14089	Liu XiuQing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14090	Liu LiFang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14091	Liu Wei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14092	Liu YunHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14093	Liu Rui 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14095	Lu ChunAi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14096	Liu Hao 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14097	Lu ChunPei 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14098	Lu YanChun 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14099	Sarita 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14101	Tran 1999 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14102	Falloon 1978 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14103	Luo Cheng 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14105	Luo Xin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14107	Luo YuLing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14108	Lv BinJun 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14109	Lin Hui 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14110	Zhou HaoTian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14111	Zhu YiRen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14112	Yuan 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14113	Zhang ChuanHai 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14114	Zhang YueLan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14115	Yan MeiYing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14116	Yan FengJuan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14117	Yan BaoChang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14118	Xue ZhiQiang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14119	Xu Ying 2008 -1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14120	Xu RuJin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14121	Xu Miao 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14122	Xu MeiQin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14123	Xu JianXiong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14124	Xu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14125	Xiong YingJu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14126	Xin Gang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14127	Xie ZhongYing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14128	Xie 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20272	庞可可 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14129	Yang Ping 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14130	Wei YueLing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14131	Wu WenLi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14132	Wu Sai 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14133	Wu NingQiang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14134	Wen YiXiong 2008 -1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14135	Wen YiXiong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14136	Wen NaiYi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14137	Wei XuHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14138	Wei YouFang 2008 - 1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14139	Wei Wei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14140	Wei RanJing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14141	Wei PingXiang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14142	Wei Jun 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14143	Wang ZhengHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14144	Wang ZaoLan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14145	Wang YunGang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14146	Wang YuLing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14147	Wang YuanChang 2008 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14150	Wang YuanChang2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14151	Wang YuMei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14152	Xie XinNian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14153	Xie WenJiao 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14155	Xia JinXiao 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14156	Wu YuanFang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14157	Wu Yi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14158	Wang Yi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14159	Wang Yi 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14160	Wang Ying 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14161	Wang Ying 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14163	Wang XiangYang2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14164	Mi GuoLin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14165	Liang Yan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14166	Sha Rong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14167	Shuai HongLi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14168	He ChuanCai 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14169	Ha Si 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14170	He ShuFen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14171	Liu XiYing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14172	Lv JinJie 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14173	Wang XiaoQuan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14174	Wang Yang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20273	李双 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14175	Lu AiYi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14176	Chen JingYu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14178	Chen Kai 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14179	Chen PengYue 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14180	Chen QingSong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14181	Chen QingSong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14182	Chen Song 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14183	Chen XiangLi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14184	Chen XiaoHan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14185	Chen Yong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14186	Chen ZhenLei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14187	Cheng XiaoChun 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14188	Cui JieFeng 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14189	Cui Meng 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14190	Dai SuPing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14191	Dai XinGuo 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14192	Deng Hua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14193	Deng KeWen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14194	Deng LiangHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14195	Ding YongHong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14196	Ding YuanFu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14197	Ding ZhiJie 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14198	Dong RuiLan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14199	Dong TaiXin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14200	Dong TaiXin 2007-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14201	Dong Wei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14202	Du Biao 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14203	Fan BeiFang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14204	Fan JianHua 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14205	Fu CanLi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14206	Fu ChunHong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14207	Fu GuoZhu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14208	Gan JingLi 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14209	Gao CunYou 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14210	Gao CunYou 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14211	Gao Hui 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14212	Gao ShiQing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14213	Gao XingHai 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14214	Gao XinHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14215	Gao ZhenBo 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14216	Geng YuChen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14217	Gong DeXuan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14218	Gong GaoQin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14219	Gong Qian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14220	Kou GuiMin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14221	Guo Li 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14222	Guo YanQiao 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14223	Guo ZhenYu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14224	Han Bai 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14225	Han Bai 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14226	Han Peng 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14227	Han XueFeng 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14228	He RunFang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14229	He MinHui 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14230	He XingMei 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14231	He YiQun 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14232	Yang XiuShuang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14233	Yang ShunCai 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14235	Yang XiaoMei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14236	Yao MingRong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14237	Xu ChengMin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14238	Yi HuanWen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14239	Yi XiaoRong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14240	Yin JunXian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14241	Yin JunXian 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14242	Yu AiZhen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14243	Yu JunTao 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14244	Yu Lin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14246	Yu RuiYan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14248	Yu YongTao 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14249	Yu ZhiGang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14250	Zeng GuiE 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14251	Zhang ChangJun 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14252	Zhang DaWen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14253	Zhang Feng 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14254	Zhang HaiTao 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14278	Zhang ZhenDong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14279	Zhang ZhiFeng 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14280	Zhang ZhongShan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14281	Zhao CuiPing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14282	Zhao GuiXia 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14283	Zhao LuPing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14284	Zhao QingLian 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14285	Zhao Shan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14286	Zhao Zheng 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14287	Zheng JingLi 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14288	Zheng QingMei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14289	Zheng WanLing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14290	Zheng XiaoRong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14291	Zheng XiuXia 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14292	Zheng XueBao 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14294	Zhong XiaoBing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14295	Zhou Ping 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14296	Zhou WeiChun 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14297	Zhou WeiDong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14298	Zou XiaoHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14299	Zhou Yong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14300	Zhou YuanJia 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14301	Zhou YuLin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14302	Zhou Zhen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14303	Zhu ManLian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14304	Xu YuFang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14305	Hou HongBo 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14306	Hu GuoHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14307	Hu JingRong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14308	Hua Ting 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14310	Huang ChangHuang2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14311	Huang JinRu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14312	Huang JiWei 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14314	Huang XingBing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14315	Huang Xiong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14316	Huang Ying 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14317	Huang ZhiYong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14318	Huang ZiQiong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14319	Jiang CuiMei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14320	Jiang CuiMei 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14321	Cheng MingJun 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14322	Dai JunQiu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14323	Fan JiMei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14324	Gan JiXing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14325	Li CongHui 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14326	Li Jing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14327	Li Xi 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14328	Li XiaoJun 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14329	Luo JianHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14330	Mu DeJun 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14331	Song GuiQing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14332	Song GuangMing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14333	Wang CuiMin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14334	Wang GangPing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14335	Wang JingBo 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14336	Wang MingTao 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14337	Wang QingGong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14338	Xu ZhiPing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14339	Yang Juan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14340	Yang Lian 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14341	Zhang ShengLi 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14342	Zhou YuanDong 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14343	Jiang GuoQing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14344	Jiang JuFang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14345	Jiang ZeYu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14346	Jie Rui 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14347	Jin JianFeng 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14348	Jin LuPing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14349	Jin Xin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14350	Jin Ying 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14351	Jing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14352	Kang HongYing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14353	Kong LingFang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14354	Kong SuLi 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14355	Kong Yuan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14356	Kou GuiMin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14357	Lai ShuZhen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14358	Lei JinMei 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14359	Lei QingHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14360	Li DengMing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14361	Li DengMing 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14362	Li Gang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14363	Li GuoRong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14364	Li HaiGen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14365	Li JianHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14366	Li JinBo 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14367	Li JinBo 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14368	Li Jing 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14369	Li JunHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14370	Li JunHua 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14371	Li JunHua 2008-2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14372	Li LiYan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14373	Li MeiHua 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14374	Li MeiJuan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14375	Li MeiJuan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14376	Li Min 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14377	Li QiaoMin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14378	Li QiBin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14379	Li QiBin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14380	Li RuYu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14381	Li ShuiChao 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14382	Li ShuMin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14738	連文仙 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14383	Li SuRong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14384	Li SuRong 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14385	Li SuYin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14386	Li SuYin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14387	Li 2008a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14388	Li WanXiu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14389	Tao JianQing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14390	Tao JianQing 2008-2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14391	Tao JianQing 2008-3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14392	Tao JianQing 2008-4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14393	Tao ShiWu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14394	Li XiaoHong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14395	Li XiPo 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14396	Li XiPo 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14397	Li Yong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14398	Lian ShuKui 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14399	Liang GuiFang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14400	Liang Jia 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14401	Liang Liang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14403	Wang Jie 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14405	Wang JiCai 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14406	Wang JiFeng 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14407	Wang JiHong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14408	Wang JiHong 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14410	Wang Jing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14411	Wang KaiWu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14412	Wang LiLi 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14413	Wang LiLi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14414	Wang LiZhi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14415	Wang Ling 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14416	Wang LiSha 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14417	Wang RenFeng 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14418	Wang RenChang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14419	Wang TianLong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14420	Wang XiangYang2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14421	Wang XiaoDong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14422	Wang XiaoHong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14423	Wang XiaoLong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14424	Wang XiaoQuan 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14425	Wang XueBin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14426	Wang YanHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14427	Wang YanJun 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14428	Wang YanZhi 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14429	Tao ShiWu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15039	Lan 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14430	Tao YongFu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14431	Tian Hong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14432	Zou Xun 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14433	Zhong GuoJian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14434	Wan Hao 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14436	Wan ZhengYan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14437	Wang BaoHong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14438	Wang BingHua 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14439	Wang BingHua 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14440	Wang CaiRong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14441	Wang ChunYang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14442	Wang DeGang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14443	Wang GangPing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14444	Wang GuiYing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14445	Wang GuoFu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14446	Wang JianRong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14447	Song ZhenHua 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14449	Song ZiXiang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14450	Su KeYu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14451	Su Mian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14452	Su Qin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14453	Sun FuGen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14454	Sun Hui 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14455	Sun Hui 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14456	Sun MeiLing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14457	Sun 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14458	Sun ShuMin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14459	Sun Yi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14460	Tang BenLing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14461	Tang ChunGuang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14462	Tang Hong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14463	Tang Wei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14464	Tang ZhenKun 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14465	Lv ChunMei 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14466	Ma Li 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14467	Ma LiXia 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14468	Ma Qi 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14469	Ma XiaoGuang 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14470	Mao XiXiang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14471	Mei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14472	Meng JianFeng 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14473	Meng YueLan 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15040	Si 2009b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14474	Mo WeiJing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14475	Nai XiaoZhen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14476	Ni YuLan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14477	Nie SuoCheng 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14478	Ning ZhengYuan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14479	Pan LiMei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14480	Pan TianWei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14481	Pan WenYan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14482	Pei JinYu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14483	Peng DongYing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14484	Peng WeiZhen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14485	Peng YongHong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14486	Qin AiLing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14487	Qiu YuZhu 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14488	Qu JianXin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14489	Ru BaoJian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14490	Ruan ShuiYing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14491	Shan HongFu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14492	Shang XiuZhen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14494	Shen Feng 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14495	Shi DongQing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14496	Shi YuZhong 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14497	Shuai HongLi 2008-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14498	Song ChunLian 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14499	Song JianZhu 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14500	Song WenYing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14501	Song YanPing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14502	Ai ChunQi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14503	An ChengGe 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14504	An HongWei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14505	Bai ShuYing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14506	Ban Na 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14507	Bu Ru 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14508	Cai JinWei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14509	Cai QingQi 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14510	Cai XiongYing 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14512	Cao Jiang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14513	Cao YongKang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14514	Chang FaWei 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14515	Chang ShuangHai 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14516	Chang YuShan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14518	Chen Fei 2007-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14519	Chen Fei 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14520	Chen FengXian 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14521	Chen HanBo 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14523	Chen JingQing 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14524	Wang WenLin 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14525	NCT00983476	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14526	NCT00980252	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14527	NCT00990925	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14528	NCT00988728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14529	NCT00996242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14530	NCT00995553	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14531	NCT00998608	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14532	NCT00982020	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14533	NCT00960024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14534	NCT00992407	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14535	NCT00986531	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14536	NCT00981526	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14538	NCT00947375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14539	Aleman 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14540	Thornicroft 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14541	Conus 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14542	Zuo 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14543	Vinogradov 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14547	Lipkovich 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14549	Kim 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14550	Berwaerts 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14552	Nagel 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14553	Moss 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14555	Hough 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14557	Vercammen 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14559	Ritsner 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14560	Nemoto 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14561	McKee 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14562	Manuel 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14567	Choi 2009b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14568	Chen 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14569	Buchsbaum 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14573	Sockalingam 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14574	Magliano 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14575	Kumari 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14577	Burns 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14581	Huang Sheng 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14582	Smith 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14584	McEvoy 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14586	Ricbmond 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14591	Nishimatsu 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14594	AstraZeneca 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14595	AstraZeneca 2005 L	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14596	AstraZeneca 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14597	AstraZeneca 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14598	AstraZeneca 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14599	AstraZeneca 2005 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14602	Bristol-Myers 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14604	Bristol-Myers 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14605	Bristol-Myers 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14606	Bristol-Myers 2004 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14607	Bristol-Myers 2004 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14608	Bristol-Myers 2004 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14609	Bristol-Myers 2004 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14610	Bristol-Myers 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14611	Bustillo 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14614	Dietrich 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14615	Eisai 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14616	Eli lilly 2005 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14617	Eli lilly 2005 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14618	Eli lilly 2004 l	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14619	Eli Lilly 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14620	Eli lilly 2006 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14621	Eli Lilly 2004 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14622	Eli Lilly 2006 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14623	Eli Lilly 2006 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14624	Eli lilly 2005 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14625	Eli Lilly 2004 n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14626	Eli Lilly 2004 o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14627	Eli Lilly 2007 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14628	Eli Lilly 2006 p	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14629	Elman 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14631	GlaxoSmithKline 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14632	Hafner 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14640	Touma 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14642	Pfizer 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14643	Pfizer 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14644	Pfizer 2005 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14645	Pfizer 2005 i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14648	Sumiyoshi 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14658	刘小玉 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14660	劉桂芳 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14661	劉自力 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14664	呂紀珍 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14665	呂靜芹 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14666	周小东 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14667	周素芝 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14672	姚寧 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14676	孫全新 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14677	孫秀珍 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14678	孫立華 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14681	張金釗 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14682	徐天朝 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14683	成愛萍 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14685	文素榮 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14686	施劍飛 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14687	无 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14688	朱桂兰 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14689	朱毅平 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14690	朱毅平 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14691	朱毅平 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14692	朱良君 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14693	朱良君 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14694	朱逸人 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14696	李剛 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14698	李軼群 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14699	林勁松 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14705	樊凌姿 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14706	樊愛珍 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14709	汪宏才 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14713	潘艷芬 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14714	王以云 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14716	王樹陽 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14717	王漢嬋 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14718	Wang 2005a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14719	王立 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14720	王立娥 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14724	祝书文 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14727	胡明月 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14728	蓋萬良 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14729	蘇華龍 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14730	袁杰 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14731	褚建平 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14732	許麗榮 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14735	趙利國 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14737	趙長印 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14739	Xing 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14740	鄒清蘭 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14743	钟镭勇 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14745	陈启豹 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14746	陳情 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14747	陳玉廣 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14748	陶建青 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14750	韋強 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14753	馬繼東 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14758	龐勝芝 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14759	นงเยาว์ พ 2542	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14762	วรวัฒน์ 2544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14763	任清涛 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14764	冯雪雁 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14765	刘晋洪 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14767	刘英江 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14771	周秀华 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14772	唐永怡 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14775	孙轻骑 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14776	宋艳萍 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14778	崔隽 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14779	张东卫 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14780	张守来 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14781	张建 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14782	张文敏 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14784	张登科 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14785	徐丽珍 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14787	支勝利 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14788	施剑飞 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14789	曾为群 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14790	朱丽萍 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14791	朱乐信 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14792	朱华芳 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14799	李紅 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14801	林福荣 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14805	梁绍材 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14806	梅桂森 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14808	汤启芳 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14810	沈爱新 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14815	王精 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14816	王萍 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14817	秦天星 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14818	耿玉辰 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14820	许洪伟 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14821	许玉芳 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14824	郑桂芝 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14826	鄧炳煙 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14827	闫俊英 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14829	韦有芳 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14830	顾桂英 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14831	高金香 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14833	Liu 2005 h	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14838	McCrone 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14845	Velligan 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20274	汤庆军 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14848	Nasr 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14849	Miyaoka 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14850	Mittal 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14852	Chadwick 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14853	Cavallaro 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14855	Hamann 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14856	Green 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14857	Goldstein 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14863	Buchanan 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14867	Potkin 2009 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14877	Haller 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14878	ISRCTN74919979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14879	Matsui 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14880	Modabber 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14882	NCT01003132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14883	NCT01003379	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14884	NCT01009047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14885	NCT01009060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14886	NCT00999505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14887	NCT01012167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14888	Smith 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14889	Ganguli 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14890	Meyer 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14893	Richardson 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14895	Harvey 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14897	Findling 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14898	Potkin 2007 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14906	Ascher-Svanum 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14907	Gandelman 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14908	Sapra 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14909	Uzcategui 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14910	Wu 2007 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14911	Haas 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14913	Schulz 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14914	Sacchetti 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14917	Ibrahim 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14918	Stahl 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14920	Corey-Lisle 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14921	Pae 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14922	Kim 2007 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14923	Weiden 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14925	Weiden 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14927	Klieser 1991 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14929	Klieser 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14930	Mei 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14931	Yan 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14932	Wang 2005 ae	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14933	Tang 2005 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14934	Shi 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14935	Svestka 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14936	Shopsin 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14937	Kramer 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14938	Yang 2006 q	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14940	Gallinat 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14941	Postma 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14942	Tamminga 1997 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14943	Tamminga 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14944	Krakowski 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14945	Schreiner 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14946	Saddichha 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14947	Letourneau 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14949	Wunderink 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14951	Stenberg 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14953	Noordsy 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14955	Tereynikov 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14957	Vita 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14960	Goff 2009 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14965	Adrianzen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14966	Hawthorne 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14967	Shafti 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14970	Ingole 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14972	Beebe 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14974	Howard 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14977	Chapel 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14980	Cordes 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14982	Lahti 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14984	Schuhmacher 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20275	杨如良 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14986	Chen 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14987	Eack 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14989	Brown 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14990	Weiden 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14991	Kane 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14992	Faith 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14993	Jayashri 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14994	David 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14995	Baker 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14996	NCT01022489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14997	NCT01016145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14998	NCT01027962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14999	NCT01028677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15000	NCT01029769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15001	Lee 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15003	Chan 2000 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15004	Nicholls 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15007	Swadi 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15008	Leutwyler 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15009	Stauffer 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15010	Pappadopulos 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15012	Robb 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15014	Carothers 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15015	Canuso 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15016	Samochowiec 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15017	Alphs 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15018	Fleischhacker 2009c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15019	Baptista 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15020	Nicol 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15021	Grinspan 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15024	Gopal 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15025	Hardy 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15026	Cassella 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15027	Moghadam 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15029	Hamilton 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15030	Damsa 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15032	Kollack-Walker 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15033	Correll 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15034	Nicol 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15035	Hoffmann 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15037	Pandina 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15038	Johnsen 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20276	陈宇晖 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15043	Lothringer 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15045	Edwards 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15046	Yung 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15047	Francey 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15048	Malla 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15050	Chen 2008 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15052	Hui 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15053	Leweke 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15054	Mottaghipour 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15055	Bechdolf 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15056	Fowler 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15057	Santos 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15058	Gafoor 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15059	Alvarez-Jimenez 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15061	Sharifi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15062	Nyilas 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15067	Ritsner 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15068	Bechdolf 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15070	Killackey 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15072	Bertelsen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15073	Chong 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15074	Nordentoft 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15075	Amini 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15077	Kumar 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15079	于兆阳 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15082	任列 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15089	侯雪玲 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15093	兰琳 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15094	刘从敏 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15096	刘俊彪 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15097	刘勇 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15099	刘志东 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15100	刘昊 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15103	刘晓红 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15117	吴晓梅 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15122	周云 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15123	周云 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15127	周海晓 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15128	夏静 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15130	姚明荣 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15135	孟庆珍 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20277	耿在香 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15139	宋春联 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15141	寻知元 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15142	尤晓莉 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15145	常蔚 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15146	张丽 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15147	张亚红 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15155	张洪秋 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15156	张瑞芬 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15159	彭汝春 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15160	彭燕 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15161	彭瑛 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15164	徐娟 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15169	方政华 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15170	施泉惠 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15172	曲万仁 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15173	朱建忠 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15174	朱玉星 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15175	朱颖 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15184	李英 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15189	杨雀屏 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15190	林云 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15191	林卓毅 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15193	汪卫华 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15244	赵晶媛 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15246	赵晶媛 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15250	邓春继 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15251	邓梅 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15253	邱学文 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15254	郑春 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15255	郝广义 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15259	陆爱益 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15260	陈仁念 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15262	Chen 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15263	陈晓晟 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15265	陈汝兰 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15267	陈远岭 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15269	鞠康 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15272	马忠智 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15276	高丽红 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15278	高志勤 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15280	魏丽霞 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15281	魏绪华 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15282	黄承繁 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15285	黄群明 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15290	李宏 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15291	Wang 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15293	Basu 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15294	Delahaye 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15296	Williams 2008 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15297	Alvarez-Jimenez 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15299	Koletsi 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15300	Velligan 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15301	Akhondzadeh 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15302	Lin 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15303	Mackle 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15304	Akhondzadeh 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15309	Haas 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15310	Villalta-Gil 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15311	Smith 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15312	Park 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15313	Lucena 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15314	Stewart 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15315	Levitt 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15316	Dewa 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15317	Premkumar 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15318	Chu 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15320	海燕 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15321	AstraZeneca 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15322	Anon 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15324	NCT01047592	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15325	NCT01045720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15326	NCT01041976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15327	NCT01052389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15328	NCT01043458	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15329	NCT01052714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15330	NCT01041053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15331	NCT01041274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15332	NCT01036282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15333	NCT01052103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15334	Geddes 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15335	Burns 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15336	Valimaki 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15337	McCabe 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15339	Kovitz 1956 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15342	陶建青 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15345	天龙王 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15347	Schtzwohl 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15350	Hanlon 1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15352	Martens 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15356	Nieznanski 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15358	Morgenstern 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15359	Gauthier 1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15360	学军王 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15361	Wang 2007 m	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15362	Loza 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15365	Saygilarli 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15367	Lee 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15369	Morrison 2002 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15370	Chung 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15371	Supczynska 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15372	Lee 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15375	Kein 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15377	Mallinckrodt 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15383	Kageyama 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15385	Kiejna 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15386	Atmaca 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15390	Sun 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15393	Kircher 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15394	Kim 1997 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15395	Burns 1999 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15397	Kiejna 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15398	Eckmann 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15399	Acosta 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15401	Momolov 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15402	Carson 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15403	Wong 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15406	Kinon 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15412	Levkovitz 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15413	Lecrubier 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15414	McCay 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15416	Braga 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15417	Rotondi 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15419	George 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15421	Mauri 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15422	Vanelle 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15501	Anon 2003 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15423	Li 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15424	Lieberman 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15425	Potkin 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15427	Loza 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15431	Meyer 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15432	Rappard 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15433	Sacchetti 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15435	Kramer 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15437	Ratner 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15438	Joyce 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15439	Chen 2008 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15440	Malhotra 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15442	Chakos 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15443	Suzuki 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15444	de Lucena 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15445	Weiden 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15450	Kane 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15453	Olivares 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15454	Cuidad 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15455	Ono 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15460	McCabe 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15461	Fakra 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15464	John 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15465	Tsai 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15467	Boonstra 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15468	Kinon 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15470	Sumiyoshi 2001 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15471	Gurpegui 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15473	McLoughlin 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15475	Stahl 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15480	Schutt 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15483	Hayward 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15484	Kopelowicz 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15489	Liberman 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15495	McClure 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15496	Kaizl 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15499	Schutzwohl 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15500	Anon 2003 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20278	和西波 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15502	Goff 2009 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15503	Organon 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15504	Fleischhacker 2009d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15505	Shafti 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15506	Shafti 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15507	Kaplan 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15508	Druss 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15509	Giron 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15511	Becker 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15513	Poyurovsky 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15517	Waldo 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15518	Chan 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15519	Dickinson 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15524	Bloch 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15525	Langley 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15527	Burti 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15529	Lee 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15531	De Lucena 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15535	NCT01055509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15538	Woolderink 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15539	Zoeteman 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15540	Kho 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15541	de Haan 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15542	de Haan 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15543	Verstappen 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15544	Dragt 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15545	Staring 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15546	NTR1166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15547	Dlabac-de Lange 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15548	NTR1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15549	Sun 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15551	Hodge 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15552	Hodgekins 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15553	Hafner 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15554	Steinlechner 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15557	Byerly 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15558	Izakova 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15561	MacFadden 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15562	Fakra 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15563	Lublin 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15564	Biegel 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15568	Lloyd 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15569	Chen 2008 f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15570	Hui 2008 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15579	Byford 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15581	Kabes 1985 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15582	Sikich 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15584	Byng 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15588	Nordentoft 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15589	Nordentoft 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15591	Janicak 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15593	Canuso 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15595	Kabes 1985 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15597	Nordontoft 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15599	Chengappa 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15600	Conley 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15601	Johnson 1981 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15602	Johnson 1981 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15603	Klein 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15604	Nahas 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15605	Pickett-Schenk 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15606	Abbasi 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15607	Hough 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15609	Osborn 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15610	Kane 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15611	Krakowski 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15614	Gray 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15615	Lerner 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15617	Giakoumaki 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15618	Findling 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15619	Honer 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15620	Kumra 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15621	Letourneau 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15622	Mueser 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15624	Nuechterlein 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15625	Pelayo-Teran 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15626	Rushby 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15627	Shu 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15628	Liebman 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15629	Roder 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15630	Shim 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15631	Stahl 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15632	Van Der Gaag 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15633	Zhou 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15634	Zhang 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15635	Classen 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15637	Hornung 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15640	Eberhard 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15641	Anon 2009 g	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15643	Agid 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15644	Apud 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15645	Biedermann 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15647	Dubovsky 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15648	Geffen 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15649	Genevsky 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15650	Matsui 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15651	McCabe 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15652	Noordsy 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15653	Velligan 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15654	McGorry 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15655	Tan 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15656	Xu 2008 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15657	Alwi 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15658	Alwi 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15659	Adamowski 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15661	Yasui-Furukori 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15662	Leontieva 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15663	Chien 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15664	Janssen 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15665	Ji 2005 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15666	NCT01010477	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15667	NCT01015001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15668	NCT01029067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15670	NCT01075295	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15671	NCT01077700	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15674	NCT01077791	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15675	NCT01078129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15676	NCT01078870	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15677	NCT01081769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15678	NCT01082250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15680	NCT01082588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15681	NCT01083381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15682	NCT01086748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15683	NCT01091506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15684	NCT01093365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15685	NCT01095562	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15686	NCT01098110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15687	NCT01101464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15689	NCT01104766	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15690	NCT01104779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15691	Miceli 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15692	Klingberg 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15693	Hallak 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15694	Ritchie 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15695	Loo 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15696	EDIE-NL	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15697	Wang 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15698	Oluboka 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15699	Gleeson 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15700	McCormack 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15704	Almomani 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15721	Andrade 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15729	ISRCTN42305247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15732	Bas Oosterhout 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15734	Bechdolf 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15736	Bechdolf 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15744	Berwaerts 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15745	Bhowmick 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15747	Bloemers 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15757	Braga 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15763	ISRCTN28876952	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15764	Bushe 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15772	Canuso 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15775	Carothers 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15783	Chan 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15785	Chandler 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15789	Chouinard 1987 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15806	Crespo-Facorro 2009b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15810	Davidson 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15822	Dieterle 1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15825	Dixon 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15827	D'Souza 2002 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15836	Fagerlund 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15838	NCT01111149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15842	Fleischhacker  2008a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15844	Forchuk 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15846	Foster 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15850	Freeman 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15857	Galderisi 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15868	ISRCTN79497236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15869	Gilmore 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15877	Goodchild 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15883	Gray 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15884	Grebb 1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15888	NCT01118208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15894	Hargarter 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15897	Hegde 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15911	Hough 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15914	ISRCTN83261243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15932	Kabes 1985 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15933	Kahn 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15934	Kahn 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15935	Kahn 2007 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15937	Kane 2004 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20279	李志文 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15939	Kane 2004 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15943	Keefe 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15952	Khodabakhshi 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15955	ISRCTN25898179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15956	Kim 2006 j	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15972	Kryzhanovskaya 2006c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15973	Kryzhanovskaya 2006d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15975	Kryzhanovskaya 2006e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15976	NTR1318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15977	NCT01121042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15981	Kungel 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15984	Lachler 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15987	Lane 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15999	Levkovitz 2009b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16009	Lieberman 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16017	Lobban 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16019	Loebel 2007a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16020	Loebel 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16023	Lomena 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16025	Lung 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16026	ISRCTN47146067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16034	McEvoy 2006 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16037	McLoughlin 2006a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16038	McQuade 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16040	Meehan 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16045	Meyer 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16048	Miceli 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16050	Milstein 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16059	Mueller 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16066	Newcomer 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16070	Niknam 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16071	Nordentoft 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16073	Nordentoft 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16074	Nyberg 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16078	Oliveira 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16080	Oren 2007a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16083	Pae 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16086	Paillot 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16087	Pajonk 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16088	Pandina 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16089	Patel 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16090	ISRCTN42412532	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16091	Penades 2006 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16092	Peralta 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16101	Peuskens 2007 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16106	Pickett-Schenk 2006a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16114	Poyurovsky 2007a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16116	ISRCTN84216587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16121	Raaska 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16123	Randal 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16134	Robb 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16136	ACTRN12610000241033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16138	Rogers 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16142	Rupnow 2005 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16153	Sandison 1960 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16161	Schooler 2003a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16162	Schuhmacher 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16163	Schultz 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16168	Sevy 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16180	Silverman 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16193	Smeerdijk 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16195	ISRCTN67096137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16198	Stenberg 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16204	Sumiyoshi 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16207	Swildens 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17258	于席丽 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16211	NCT01100775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16223	Tregellas 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16224	Tsang 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16234	Valmaggia 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16236	Van Nimwegen 2006a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16237	Van Nimwegen 2006b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16245	Vanweringh 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16248	Vercammen 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16258	ISRCTN03613183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16263	Whitehead 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16265	ACTRN12610000249055	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16267	Wilson 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16269	Wisniewski 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16270	Wisted 1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16271	Woods 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16273	ISRCTN55488371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16281	Luo Xin 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16282	Wang JiHong 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16286	Canuso 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16287	Canuso 2010b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16289	Cordes 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16290	Johnsen 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16293	ISRCTN27745631	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16295	Meltzer 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16296	Peuskens 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16306	Choi 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16312	Lee 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16313	Mirabella 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16316	Aghotor 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16317	Eack 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16323	Berwaerts 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16325	Bushe 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16326	Butler 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16328	Ceccato 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16330	Finding 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19875	NCT01714661	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16334	Howard 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16335	Hsu 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16337	Kinon 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16338	Kramer 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16341	Li 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16342	Liang 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16343	Maurel 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16344	McClure 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16345	McCrone 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16346	Mittrach 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16348	Narula 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16349	Pandina 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16353	Stenberg 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16355	Vernon 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16356	Wang 2010b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16357	Williams 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16359	Kavanagh 2004a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16360	Emmanuel 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16361	Engelhardt 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16362	Maosheng 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16363	Pandina 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16364	Gulliver 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16365	Alphs 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16366	Schoemaker 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16370	Ananth 1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16371	Roberts 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16372	Claghorn 1970 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16375	Holden 1971a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16376	Deutsch 1971a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16377	Guirguis 1977a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16380	McLaughlin 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16383	Ghaeli 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16386	Merrick 1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16388	Froemming 1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16392	Kramer 1975a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16395	Cold 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16396	Garcia 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16397	Lampe 1969a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16398	Beebe 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16400	Borges 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16402	Forsberg 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16403	Mielke 1975a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16405	Jus 1975a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16413	Lim 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16414	Levine 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16416	Minzenberg 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16418	Fisher 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16422	Lak 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16427	Mueser 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16428	Linnoila 1976a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16430	Robinson 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16432	Jones 1995a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16433	Dufresne 1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16436	Pietrzak 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16437	Reyntens 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16441	Diaz 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16442	Fernandez 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16443	Francey 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16445	Muller 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16447	Smith 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16448	Srinath 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16449	Stahl 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16450	Stip 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16451	Van Veelen 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16453	Xiong 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16457	Shinde 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16459	Anon 2010 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16462	Barrio 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16469	Choi 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16472	Day-Poulsen 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16473	De Las Cuevas 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16485	Gopal 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16487	Guo 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16489	Han 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16490	Iancu 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16491	Kasckow 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16494	Klrov 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16495	Koethe 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16496	Kramer 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16497	Kuwilsky 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16499	Lencz 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16503	Malla 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16504	Mittal 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16505	Miller 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16506	Montero 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16507	Nasrallah 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16509	Nomoto 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16511	Novak 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16513	Peters 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16514	Prakash 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16518	Salyers 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16519	Schoemaker 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16522	Shiina 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16524	Stinson 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16526	Tondora 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16530	Van Der Feltz 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16533	Yang 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16534	Zisook 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16963	Singh 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16964	Cazorla 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16965	Joep 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16969	Chiu 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16970	Baptista 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16972	Dubovsky 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16973	Witte 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16975	Slotema 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16976	Litman 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16977	Stahl 2010 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16978	Alphs 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16980	Chan 2010 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16984	Xiang 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16988	Zhang 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16989	Li 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16993	Takekita 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16994	Pandina 2010 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17003	Mohammadi 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17007	Chaudhry 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17015	Iglesias-Garcia 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17032	Kane 2010 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17038	Granholm 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17048	ACTRN12610000954022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17049	ChiCTR-TRC-10000934	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17052	NTR747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17053	NTR2350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17054	NTR1799	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17055	NTR1787	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17056	Turner 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17060	NCT00137267	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17061	NCT00439634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17062	NCT00227305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17063	NCT00299702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17064	NCT00642369	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17069	Chandler 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17072	Faries 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17078	Koolaee 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17079	Schepp 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17080	NCT01251055	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17081	NCT01246232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17082	NCT01244854	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17083	NCT01242371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17085	NCT01234454	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17086	Ereshefsky 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17087	Garcia 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17088	Johnsen 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17090	Kim 2010 e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17091	Kinon 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17092	Marsh 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17094	Rodewald 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17096	Segarra 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17097	Slotema 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17098	Stauffer 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17101	Tsapakis 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17104	Filia 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17106	Guastella 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17108	Marsh 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17109	McCabe 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17110	Reece 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17111	Robinson 2010b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17112	Saddichha 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17208	Schepp 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21009	李燕 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17113	Stain 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17114	Vercammen 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17116	Weickert 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17118	Crocq 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17119	Grootens 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17120	Anon 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17122	Ciorabai 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17124	De 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17125	Gaebel 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17127	Nelleman 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17130	Haut 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17133	Shibre 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17134	Vercammen 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17141	Eack 2010b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17143	Malchow 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17149	Botha 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17152	Nyhuis 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17153	Tiwari 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17162	Cotton 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17178	NCT00212784	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17179	NCT00061802	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17180	NCT00946985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17183	NCT01051531	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17184	Potkin 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17185	Greenspan 2005a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17186	Greenspan 2005 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17187	Potkin 2005a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17188	Alvarez 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17190	Chaplin 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17191	Alvarez 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17196	ISRCTN22581937	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17197	ISRCTN03732457	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17198	ISRCTN16939126	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17199	ISRCTN02507940	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17200	ISRCTN29607432	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17201	ISRCTN60687844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17203	ISRCTN68824876	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17204	ISRCTN95603741	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17205	ISRCTN71943786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21010	李永强 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17209	Scheppp 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17210	NCT01259427	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17211	NCT01266174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17213	Tenhula 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17214	Pierce 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17218	Cusack 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17223	Kender 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17227	Addington 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17229	Daumit 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17230	Kaplan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17231	Tregellas 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17232	Pietrzak 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17233	Bose 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17234	Cassella 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17236	Dubovsky 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17237	Fricchione 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17238	Ghaleiha 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17239	Istikoglou 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17240	Klirova 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17241	Marque 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17243	Pandina 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17244	Perez 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17246	Schmidt 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17247	Sliwa 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17248	Staring 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17250	Tessier 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17251	Zhang 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17252	Genevsky 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17254	Ritsner 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17256	丁兆生2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17257	于伟文 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17259	于文斗 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17260	付华秀 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17262	任春生 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17263	任祥艳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17264	任艳萍 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17265	伍群萍 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17266	伏彩霞 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17267	伏彩霞 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17268	但雪姣 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17269	何凤叶 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17270	何凤叶 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17271	He 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17272	何燕飞 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17273	何玲 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17274	He Ruirong 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17275	何香娟 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17276	余成国 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17277	余瑞高 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17278	余英仪 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17279	侯占岭1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17280	侯占岭 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17281	侯雪玲 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17282	傅深省 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17283	Fu 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17284	党亚军 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17285	全瑞国 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17286	冒雷明 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17287	农秋燕 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17288	冯宝珍 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17289	冯龙喜 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17290	刘井华 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17292	刘卉兰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17293	刘华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17294	刘发强 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17295	刘国友 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17296	刘国友 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17297	刘国斌 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17298	刘增龙 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17299	刘娟 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17300	刘守梅 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17301	刘少华 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17302	刘庆军 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17304	刘忠 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17305	刘忠 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17306	刘新发 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17307	刘昊 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17308	刘昊 2009 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17309	刘春平 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21011	李永强1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17310	刘智 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17311	刘朝军 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17312	刘杜娟 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17313	刘永忠 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17314	刘汝震 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17315	刘洪秋 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17316	刘清连 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17317	刘献标 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17318	刘献标 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17319	刘献标 2010 v	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17320	刘磊 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17321	刘秀珍 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17322	刘翔宇 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17323	刘胜皇 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17324	刘艳芳 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17325	刘金光 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17326	华芳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17327	单美艳 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17328	单金凤 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17329	占归来 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17330	卢世臣 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17331	卢伟 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17332	卢伟 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17333	卢春爱 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17334	卢桂华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17335	印文娜 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17336	原富强 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17337	史晓慧 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17338	Shi 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17339	史良荣 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17340	叶萌 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17341	叶飞 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17342	叶飞英 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17343	吕斌军 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17344	吴延海 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17345	吴建杰 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17346	吴晓虹 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17347	吴永辉 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17349	吴碧兰 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17350	吴秀光 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17351	吴胜 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17352	吴莉珍 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17353	周串莲 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17354	周云 2009 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17355	周云 2009 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17356	周仁义 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17357	周宝卿 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17358	周庆华 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17359	周建初 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21012	李梅英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17360	周秀芳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17361	周立发 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17362	周维春 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17363	唐嵩 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17365	唐茂芹 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17366	唐静 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17368	奈效祯 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17369	姚华华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17370	姜小琴 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17371	Jiang 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17372	孔国强 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17373	孙东 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17374	孙付根 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17375	孙付根 2009b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17376	孙凤环 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17377	孙德生 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17378	孙爱民 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17379	Sun Xiuqi 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17380	孙群星 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17381	孙静 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17382	孙鹏 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17383	孟彬 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17384	孟江 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17385	季显琼 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17386	季林影 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17387	安孝群 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17388	安琼 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17389	宋丽 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17390	宋军平 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17391	宋喜霞 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17392	宋新虹 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17393	宋燕 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17394	宋芳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17395	宋长惠 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17396	寇桂敏 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17397	展咏1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17398	岳德华 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17399	岳英 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17400	崔开艳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17401	庄华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17402	齐波 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17403	龙复青 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17404	庞良俊 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17405	康建华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17406	廖更生 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17407	张东卫 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17408	张丽 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17409	张丽娜 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17410	张云芳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17411	张亚红 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17412	Zhang Baoli 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17413	张军勐 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17414	Zhang 2009c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17415	张冬敏 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17416	张加明 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17417	张启林 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17418	张小智 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17419	张展筹 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17420	张峻岭1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17421	张帆 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17422	Zhang Ping 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17423	张怀伦 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17424	张怀惠 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17425	张敏 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17426	张文顺 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17427	张新平 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17428	张明松 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17429	张映虹 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17430	张景崴 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17431	张树龙 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17432	张毅 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17433	张毅 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17435	张海杰 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17436	张海燕 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17437	张淑芬 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17438	张深山 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17439	张灵娥 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17440	张灵娥 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17441	张炜 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17442	张玉清 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17443	张玖龙 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17444	Zhang 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17448	张疆莉 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17449	张疆莉 2010b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17451	Zhang 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17452	张红英 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17453	张艳杰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17454	张艳琦 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17455	张艳琦 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17456	张艳琦 2010b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17457	张艳琦 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17458	张莉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17459	张轶杰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17460	张长军 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17461	张雪静 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17462	张香芝 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17463	张鸿 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17464	彭乐存 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17465	彭亮 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17468	彭红艳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17469	彭萍1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21013	李树敏 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17470	徐丽红1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17471	徐国洪 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17472	徐文炜 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17473	徐斐康 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17475	徐松 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17476	徐清 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17477	徐清芝 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17478	徐秀梅 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17479	徐筠 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17480	徐裕 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17481	徐鹏 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17482	支胜利 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17483	文丽 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17484	文启琴 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17485	文家松 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17486	方亚明 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17487	方传荣 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17488	施万平 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17489	施季华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17490	易世国 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17491	易元平 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17492	晏桂萍 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17493	曾兆圣 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17494	曾庆翰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17495	曾祥刚 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17496	朱宛平 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17498	朱志高 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17499	朱晓芬 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17500	朱玉星 2009b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17502	Zhu Hongmei 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17503	朱逸溪 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17504	李万秀 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17505	李义会 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17506	李代秀 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17507	李作珍 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17508	李倦国 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17509	李健 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17510	李军 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17511	李凡 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17513	李启斌 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17514	李国兰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17515	李国胜 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17516	李守春 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17518	李幼灵 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17519	李志雄 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17520	李春燕 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17521	李春芳 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17522	李春芳 2009b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17523	李昱 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17524	李晓华1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17525	李晓玲 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17526	李晓英 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17527	李晓菊 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17528	李杰 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17529	李杰 2010b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17530	李松林 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17531	李松林1 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17532	Li 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17533	李树霞 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17534	李梁 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17535	李海军 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17536	李海涛 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17537	李淑华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17538	李烽 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17539	李玉凤 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17540	李益群 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17541	Li 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17542	李莹 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17543	李莹 2010b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17544	李萍 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17545	李超 2010b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17546	李轶琛 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17547	李轶群1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17548	李鑫 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17549	杜俊林 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17550	杜淑艳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17551	杜玉杰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17552	杜秀蓉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17553	Du 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17554	杜荣荣 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17555	Yang 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17556	杨光 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17557	杨彩儒 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17558	杨春强 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17559	杨春强 2009b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17560	杨玲 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17561	杨甫德 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17562	Yang Xiucheng 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17563	杨老虎 2010b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17564	杨老虎 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17565	杨菊琼 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17566	杨雀屏 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17570	林升 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17572	林文 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17573	林素兰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17574	林纯玲 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17575	林跃泉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17577	梁国英 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17578	梁润娣 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17579	梁素霞 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17580	梁红 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17581	欧学军 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17582	欧阳杏娟 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17583	段武刚 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17584	段武钢 2010b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17585	段武钢 2010c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17586	段武钢-曾德志-罗建武-1 201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17587	段武钢-曾德志-罗建武-2 201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17588	毛星-刘洪秋-陈玉辉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17589	Tang Qingping 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17590	汤景文-何东东-刘建明- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17593	汪波-刘智-付以蓉-宁洁 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17594	汪波-周建初-刘智-宁洁 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17595	汪磊萍-魏爱荣-周艾英- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17596	汪莉-张斌-徐乐平-施建 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17597	沈丽华-沈菊梅 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17598	沈婷-李朝-王飚-王慧芳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17599	沈婷-王飚-王慧芳-江开 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17600	沈峰-王玲芝-李敏慧-梁 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17601	沐志强-杨顺英-李弼 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17602	洪娜 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17603	涂国和-胡有平-周学儿 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17604	温云辉-李惠仙-康建华- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17605	温广妹-何燕丰-王美-王 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17606	潘勇-庞波 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17607	潘朝霞-尹定富-刘宁汉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17610	熊剑-钟志兵 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17611	熊昆武-黄朝红-周莉 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17612	熊骊龙1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17613	王万章-张晓斌-杨兆正- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17614	王丽君-张静 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17615	王俊仙-高平来 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17616	王兴元-张帆-康建华 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17618	王勇-陈祖金-袁洪彬 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17619	王吉祥 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17620	王善松-王翠芳-张岿-曹 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17621	王学军-马富晓 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17622	王学文-李宝珠 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17623	王宪琴-张程赪 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17624	王延祜-唐济生-柴新生- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17625	王彩虹-杨永杰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17626	王慧芳-张红霞-杨晓敏- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17627	王敏-付艳菊-侯晓梅 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17628	王敬龙-王建平 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17629	王方国-陈慧芹-王胜 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17630	王晓平-崔亚男-王勇 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17631	王景丽-袁俊梅 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17632	王洁萍-刘诏薄-饶文康 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17633	王淑芳-邢君 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17634	王祥 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17636	王秀梅-李刚-李忠义 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17637	王素芬-王琼秀-李小玲- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17638	王红志-王成芳-乔义俊 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17639	王绍昌 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17640	王继红-宋新勤-李莹-曹 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17641	Wang 2010c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17642	王莹-陈清刚-李涛 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17643	王远昶 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17644	王锐成-孙洪刚-杨波 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17645	王长虹-李晏-苏林雁-马 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17646	王闻 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17647	王闻1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17648	王静 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17649	王鹤秋-许本键-马永春- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17650	王龙书 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17653	由炜-付崇铭-米国琳 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17654	白云1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17655	白剑文1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17656	白慧丽-颜淑环-郑素娟- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17657	白红娟-马军-周丽红 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17658	白锦波-黄海燕-陶世武- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17659	皮玥玥 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17660	盛民生-胡军-欧阳海兰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17661	石夏明-朱凤艳-张向阳- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17662	石建喜-赵建龙-岳华-张 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17664	石雪丽 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17665	祖晓雪-孙仲秋 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17667	程平-雷志豪-邱堂威 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17668	程燕 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17669	穆世铭-简天容 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17670	穆莉莉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17672	童梓顺-赵素华-蒋泽宇 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17673	符爱琴 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17674	管銮友 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17675	米国琳-唐茂芹-王远玉- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17676	米国琳-蒋燕敏-栾习云- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17677	米瑛1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17678	纪红玉-张鸿-傅列云 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17679	缪海燕-徐健 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17680	罗亨全 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17681	罗俊明-胡曦 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17682	罗慧芳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17683	罗来兴 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17684	罗琦-陈筱章-熊典樟-邹 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17685	Luo Yu 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17687	罗红梅 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17688	罗维肖-林汉-孙志国-谭 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17689	耿寒松-刘荣芹-边辛丑- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17690	肖勃-谢文娇-丘春柳-林 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17692	胡亚湘-崔炳喜-于浚玫- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17693	胡海燕-朱未名-王文花- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17694	艾芳-张宇 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17695	苏勉-苏天勋-梁艳-叶健 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17696	苏爱东-李军花-李晓芳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17697	苏雪萍 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17698	Su 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17699	苏鸣新1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17700	苏鸣新 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17701	范建华-覃宗厚-吴国伟 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17702	范文澜-余成民-李正发 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17703	莫亚莉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17704	葛传惠-孙凤霞-骆祥芬 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17706	葛淑君-王春艳-朱丹 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17707	董伟-顾卫霞 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17708	董晓茹-孙利-武晓杰 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17709	董汉振-蒲金玉-孙梦月- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17710	董继承-席巧真-缪竞诚 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17711	蒋军生-许美园 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17712	蒋合萍-罗毅平 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17713	蒋国庆-罗捷 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17714	蒋幸衍-黄寅平-徐清-陆 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17715	蒋廷云-张文蔚-石福强 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17716	蒋德政-易崇贵-王世荣- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17717	蒋海潮-金凤仙 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17718	蔡广超-李朝晖 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17719	蔡海英 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17720	蔡连秀 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17721	薛僖峰-孙晓刚 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17722	袁纯玲1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17723	Yuan 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17724	Pei 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17725	Pei 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17726	裴树景-杨红卫 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17727	解克平-韩莹 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17728	詹兆能 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17729	许宏伟-蔡晖-杨桂芝 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17730	许若煌 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17731	诸春明 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17732	诸春明-彭光海-朱培俊- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17733	谢子任 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17734	谢守付-董晔-李奕-乔晶 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17735	谢根生-赵新蕾-钱国平- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17736	谢淑娟-黎群 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17737	谢炜麟1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17738	谢育南-邝云航-刘献标- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17739	谢舟明-龚毅 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17741	谭柏坚-叶飞英-叶百维- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17742	谭茂玉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17743	谭莉-金圭星-王学义-尤 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17744	Gong 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17745	贾敏 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17746	贾永涛-张海燕-展咏 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17747	贾秋梅 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17748	贾秋梅1 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17750	赵明丽-常余善 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17751	赵晋娴-杨轲馨 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17752	赵晶媛-张红星-郭素芹- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17754	赵洪祖-杜好瑞-崔二龙 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17755	赵素萍-马超-于朋永-李 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17756	赵贵文 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17757	赵青霞-胡海涛-张丽霞 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17758	路光晖-韩英 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17759	邓文-徐彩霞-祁富生-陈 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17760	邢秀娟 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17761	邬素萍-黄群明-朱伟芳 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17762	郎春英-唐莉莉-付萍萍- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17763	郑惊涛 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17764	郑昌爱 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17766	郑艳梅 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17767	郑蓉-刘幸全 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17768	郝广义-张万红-李春来- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17769	郭平-李转 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17770	郭桂胜-刘丽 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17771	郭永清-张必然-晏迎春 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17772	郭赛玲1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17773	鄢爱平-曾德志-樊学文- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17774	钟小兵-林志雄 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17775	钟智勇-王相兰-王厚亮- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17776	钟潇琦-孙祺章-卢芸凌 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17777	钟潇琦-郑建玲-黄雄 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17778	钱文胜 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17779	闾金杰-拜有根-黄胜华- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17780	闾金杰-黄胜华-拜有根- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17781	阚瑞云 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17782	阿怀红-沈君-廖东升-屠 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17783	陆爱军-王永强 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17786	陈世珍-蔡卓珊 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17787	陈丽-朱凤艳 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17788	陈丽娟 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17789	陈丽霞-田常青 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17790	陈光财-邓方渝-王德燧- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17791	陈克彦 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17792	Chen 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17793	Chen Yan 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17794	陈常云-李守春-陈维香 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17795	陈平勋-罗建慈-刘桃芳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17797	陈恩民 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17798	陈恩民1 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17799	陈恩民2 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17800	陈春梅 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17801	陈永红 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17802	陈永红1 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17803	陈汝兰-江连娣-招用燕- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17804	陈玲-王俊超 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17805	陈红英-张郦-付迎春-季 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17806	陈莉晶 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17808	陈鸾凤 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17809	陶世武-杨诚-陈强-潘润 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17810	陶庆兰-邓红-张树森-沈 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17811	靳西龙 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17812	鞠康-费玥-季卫东-高运 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17813	韦盛中 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17814	韩伟 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17815	韩卫军-孙桂荷 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17816	韩惠芬 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17817	韩树华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17818	顾秀华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17819	颜淑环-程荣玉-王玉丽- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17820	马丽波-姜平平-王旸-张 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17821	马俊国-徐富玲-谭余龙 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17822	马兆峰1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17823	马军-刘永义-殷朝辉-张 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17824	Ma 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17825	马廷斌-宁志军 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17826	马明 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17827	马明1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17828	马明2 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17829	马洪涛-程丽华-许家泉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17830	马贵君 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17831	马迅 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17832	马闯胜-马玲-张淑芳 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17833	高丽红-路光辉 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17834	高伟-王瑞-徐学兵 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17835	高军-张伟 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17836	高军-张伟 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17837	高宏强-陈冬-常余善-张 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21014	李杰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17838	高式兰1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18421	NCT01412060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18422	NCT01412866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18423	NCT01420575	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18424	NCT01422902	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18425	NCT01423916	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18427	NCT01431092	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18428	ACTRN12611000849998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18429	CTRI-2011-08-00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18430	IRCT13870605110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18431	ACTRN1261100091	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18432	Castro 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18443	Bechdolf 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18449	Chavda 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18453	Crespo 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18458	Drummond 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18460	Druss 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18462	Eldred 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18463	Faber 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18465	Gallant 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18466	Gallant 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18470	Hekimian 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18475	Horan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18479	Jeri 1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18482	Koike 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18486	Laan 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18487	Lafave 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18497	Mises 1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18502	Philipp 2003 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18504	Portela 1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18511	Sarin 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18525	Woltmann 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18527	Zhang 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18528	Zillinger 1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18530	Pfizer 2006 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18533	Borba 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18536	Palma 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18538	Raposo 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18540	Tidey 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18543	Zhang 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18551	Pedersen 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18553	Lee 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18556	Silverman 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18558	Maurino  2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18560	De 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18562	Ascher 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18565	Hanrahan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18566	Eack 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18568	IRCT20110718704	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18569	ISRCTN18240558	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18570	ISRCTN46241817	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18572	NCT01436331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18574	NCT01446328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18575	NCT01448499	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18576	Tanasiewicz 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18579	ISRCTN58667926	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18580	10714 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18581	Mesotten 1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18582	Morgan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18586	Birchwood 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18593	Fung 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18594	Girgis 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18598	Hsiao 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18599	Jin 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18605	Mico 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18608	Ozguven 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18609	Park 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18611	Saddichha 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18612	Tessier 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18613	Veltro 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18616	Williams 1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18618	NCT01457339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18619	NCT01458379	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18620	NCT01451164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18621	NCT01459029	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18623	NCT01451736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18624	NCT01452919	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18625	NCT01450514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19795	Raniwallal 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19796	NCT00558298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19798	Chen 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19803	Su 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19804	Ge 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19805	Roache 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19812	Rezaee 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19816	Niitsu 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19817	Ory 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19819	Zhang 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19824	Wettermann 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19826	Nielsen 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19828	Rascol 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19836	Hwang 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19843	Harmell 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19849	Wing 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19855	Center for Drug 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19856	Quinn 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19862	Cheng 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19863	Dixon 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19866	Kroon 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19867	Kroon 2011 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19869	ACTRN1261200105	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19870	ACTRN1261200111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19871	NCT01699997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19872	NCT01701609	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19873	NCT01704833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19874	NCT01712646	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21015	李晶武 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21020	Li 2013a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21021	李彩玲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21022	李广玉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21023	李巧波 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21024	李守春 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21025	李宁 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21026	李国珍 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21027	李嘉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21028	李卫军 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21029	李华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21030	李剑 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21031	李刚 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21032	李冬梅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21033	李健 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21034	李伟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21035	李于林 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21036	李于林1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21037	李于林 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21038	朱琳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21039	朱明蓉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21040	朱慧 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21041	朱巧玲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21042	朱士皊 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21043	朱国辉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21044	曾默 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21045	曾德志 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17839	高彩虹 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17840	高志勤-余海鹰-崔雪莲- 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17841	高志勤-余海鹰-崔雪莲- 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17842	高志勤-余海鹰-金梅-邱 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17843	高慧-戴晶景-朱岚 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17844	高长青 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17845	魏书红 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17846	魏波-黄健-肖忠承 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17847	魏秋菊-魏春香-楚平华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17849	鲍丽萍-潘晋-崔晓青-程 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17850	麻显娇-卢喜金-邹晓华 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17851	黄凌霜-梅红彬-李勇 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17852	黄婷-李丽娟 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17853	黄峰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17854	黄峰1 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17855	黄河亮-孙艳惠-吕明玉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17856	黄河亮-王桂香 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17857	黄河香-黄淼 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17858	黄祖荣-林家幸-余木英 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17859	黄粱镔-龙欣-王臬茂 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17860	黄芳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17861	黄芹2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17862	黄芹2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17863	黄金茹2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17864	黎举红2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17865	黎举红200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17866	陈常云 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17867	Brandon 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17868	Stone 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17869	Leung 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17999	Redhead 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20280	寇根生	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17872	Levine 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17876	Detke 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17878	Hough 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17881	Leutwyler 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17883	NCT01281527	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17884	NCT01280305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17885	NCT01279213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17886	NCT01279070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17887	NCT01272765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17888	NCT01272752	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17894	Simon 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17895	Pandina 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17896	Cho 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17897	Behere 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17900	Stobbe 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17901	Kusumi 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17902	Catty 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17904	Crook 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17905	NCT00103727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17906	NCT00049946	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17910	Ahn 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17916	Mintzer 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17917	Barak 2001 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17918	Sutton 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17919	Sandison 1960 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17920	Sandison 1960 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17921	Sandison 1960 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17923	Lai 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17925	IRCT201011085133N1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18002	Blumberger 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20281	翟江 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17926	IRCT201010042935N4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17927	IRCT201009112181N5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17928	IRCT138903254191N1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17929	IRCT138902113843N1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17930	IRCT138811022935N3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17931	IRCT138809201457N7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17932	IRCT138809201457N6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17933	IRCT138801241457N4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17934	JPRN-UMIN000004931	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17936	JPRN-UMIN000004398	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17939	ISRCTN60855021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17941	125152891 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17942	123158394 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17943	110253575 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17944	033115352 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17945	CTRI-2011-091-000140	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17946	A1281039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17947	AstraZeneca 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17949	F1D-MC-HGMF S	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17950	AstraZeneca 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17951	AstraZeneca 2006 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17953	AstraZeneca 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17954	D1441C00112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17955	AstraZeneca 2005 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17956	AstraZeneca 2006 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17957	Anon 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20282	杨迎兰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17958	AstraZeneca 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17959	AstraZeneca 2001a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17961	NCT01300637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17962	NCT01300364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17964	NCT01295372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17965	NCT01291511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17966	NCT01282307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17967	NCT01267019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17968	NCT01258920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17969	NCT01248195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17970	NCT01235585	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17971	NCT01235559	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17972	NCT01235520	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17973	NCT01234298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17974	NCT01216891	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17975	NCT01213524	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17976	Van 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17978	Lesem 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17981	Bhurgri 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17984	Penn 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17986	Kulkarni 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17988	D'Amato 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17990	Breitborde 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17991	Beauchamp 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17992	Si 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17993	Kam 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17994	Chatterjee 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17995	Bhathena 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17996	Koivunen 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17998	Muscatello 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18004	Ritsner 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18013	Akhondzadeh 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18015	Buchanan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18017	Popov 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18018	Rosenheck 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18019	Scoriels 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18020	Slotema 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18021	Eack 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18022	Stant 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18031	ISRCTN41137900	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18032	ISRCTN49454276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18033	ISRCTN96754763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18034	NCT01307800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18035	NCT01312272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18036	NCT013126491	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18037	NCT01313052	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18038	NCT01315002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18039	NCT01315587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18040	NCT013188501	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18041	NCT01323205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18042	NCT01324297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18043	NCT01324973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18044	U1111-1119-5851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18045	Barbui 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18047	Griswold 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18051	Watzke 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18053	Bio 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18056	Kane 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18057	Mann 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18058	Combs 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18060	Hill 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18061	Grootens 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18063	Robles 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18064	Ross 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18065	Toozandehjani 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18066	Vesterager 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18067	Decot 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18068	Detke 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18069	Dickerson 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18071	Falkai 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18072	Ferziger 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18073	Goetz 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18074	Granholm 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18075	Gupta 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18076	Hill 2011b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18079	Kaushik 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18080	Kayo 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18081	Kelly 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18082	Keshavan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18083	Kinon 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18084	Kosten 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18085	Krakowski 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18086	Kulkarni 2011b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18087	Kulkarni 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18088	Landa 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18089	Lin 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18091	Machielsen 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18092	Markus 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18093	McCabe 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18094	McFarlane 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20283	胡琼英 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18095	Melau 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18098	Mueller 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18100	Nicol 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18101	Nordentoft 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18102	Nugent 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18103	Prasad 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18104	Radhakrishnan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18105	Rotondi 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18107	Schooler 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18108	Shim 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18110	Sliwa 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18111	Somers 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18113	Stain 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18114	Stentebjerg 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18115	Subotnik 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18117	Twamley 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18118	Twamley 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18119	Umbricht 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18120	Vanover 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18121	Warren 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18122	Allott 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18123	Ascher 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18124	Attux 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18125	Audier 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18126	Austin 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18127	Ballon 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18129	Beebe 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18130	Bell 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18131	Bennett 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18132	Bowie 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18133	Brunette 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18134	Buchanan 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18135	Buller 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18136	Chaves 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18141	Li 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18142	Brown 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18143	Moritz 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18144	Stenberg 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18146	Fan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18147	Hong 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18148	Lindenmayer 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18149	Redden 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18156	Manuel 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18157	NCT01339858	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18158	NCT01338298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18159	ISRCTN28632626	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18160	ISRCTN23197625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18161	Akbarpour 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18162	Ball 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18166	Campbell 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18172	Jahn 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18173	Kane 2011b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18177	Schennach 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18178	Segal 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18180	Stauffer 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18199	Allen 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18200	Baldacara 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18202	Friedman 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18204	Kinon 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18206	Muscatello 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18208	Wass 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18210	NCT01354132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18211	NCT01364792	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18212	NCT01363349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18213	NCT01359293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18214	NCT01368406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18215	NCT01361698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18220	Klein 1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18222	Catty 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18224	Kent 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18227	Tek 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18229	Crespo 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18230	Girgis 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18232	Yung 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18233	Woolley 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18235	Dutra 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18238	Mobascher 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18240	Gopal 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18243	Boonstra 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18244	Hatta 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18245	Silverman 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18246	Sungur 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18247	Huguelet 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18249	Salkever 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18250	Mosolov 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20284	刘臣2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18254	Stroth 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18255	Stone 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18256	Smith 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18257	Sharifi 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18258	Shafiei 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18259	Ranjbar 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18260	Piegari 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18261	Montes 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18265	Farshidfar 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18268	Bose 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18271	Alphs 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18279	NCT01386918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18281	NCT01378078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18282	NCT01377233	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18283	NCT01376596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18284	NCT01376076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18285	NCT01370291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18286	NCT01365299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18287	IRCT13880124145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18289	IRCT20110610155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18290	CTRI-2011-06-001792	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18291	IRCT20110603155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18293	Vancampfort 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18294	Vancampfort 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18295	Rodewald 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18298	Ralevski 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18299	Ren 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18300	Weiner 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18301	Liemburg 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18302	Ghaleiha 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18304	Tchoukhine 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18306	Zhang 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18307	Fardig 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18309	Lassen 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18313	Crespo 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18325	Klein 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18326	Rüther 1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18415	Rotondi 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18328	Edgelow 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18329	Katz 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18332	MHRN 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18337	ISRCTN69299093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18339	Worrell 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18340	OCTET	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18342	ISRCTN96677673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18343	Birchwood 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18349	JPRN-JapicCTI-101175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18350	IRCT20110328393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18351	ACTRN12611000731998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18352	NCT01393600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18353	NCT01391390	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18354	NCT01394471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18355	NCT01400477	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18356	NCT01390376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18358	NCT01391403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18360	NCT01393613	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18361	NCT01396421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18362	NCT01410357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18367	Segal 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18368	Tas 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18369	De Jesus 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18370	Dickerson 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18371	Essock 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18373	Ralevski 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18374	Terevnikov 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18378	Barr 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18379	Bhugra 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18382	Hardy 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18383	Hashimoto 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18387	Keshavan 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18390	Methapatara 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18392	Rosenheck 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18393	Sturz 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18394	Visceglia 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18399	Case 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18401	Hasan 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18402	Malchow 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18403	Ganguli 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18408	Bonsack 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18410	Schmechtig 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18413	Kasckow 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18414	Kreyenbuhl 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18765	Bruxner 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18417	Umbricht 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18418	IRCT20110714393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18419	ISRCTN27704027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18420	JPRN-UMIN000006011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18626	NCT00902694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18629	ISRCTN33576045	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18630	NCT01478815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18631	ISRCTN63382258	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18632	NCT01465074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18633	NCT01478880	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18635	NCT01473550	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18638	NCT01481883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18639	NCT01469039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18640	Dazzan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18641	Dazzan 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18642	Dazzan 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18689	Beebe 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18690	Aho 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18696	Bartzokis 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18698	Slotema 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18703	Potkin 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18718	Arbour 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18720	Bouhlel 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18723	Novick 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18727	JPRN-UMIN000006685	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18728	Bitter 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18730	NCT00316303	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18731	NCT01491490	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18732	NCT01493726	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18733	NCT01499563	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18734	NCT01490086	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18735	NCT01496690	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18736	NCT01435928 (PEARL)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18738	NCT01487668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18739	NCT01488929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18740	IRCT20111018783	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18741	NCT01492439	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18743	IRCT20100905255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18744	NCT01503359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18745	NCT01494623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18746	IRCT20110822393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18750	Van 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18751	Johnson 2008 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18753	De 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18758	Tang 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18759	Umbricht 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18763	Birchwood 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18764	Bonsack 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18768	Chen 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18769	Chen 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18770	Eack 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18773	Gaebel 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18775	Hinton 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18777	Killackey 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18779	Meister 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18784	Pelayo 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18785	Perez 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18788	Shahrivar 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18789	Simon 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18790	Smeerdijk 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18791	Stain 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18792	Tessier 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18794	Van Der Krieke 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18795	Vesterager 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18796	Xiao 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18805	Firestone 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18829	Cook 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18830	Gleeson 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18837	Brown 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18839	Guan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18842	Jonikas 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18843	Kelleher 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18845	Redden 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18846	Schlosser 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18847	ACTRN12605000440628	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18850	Nischk 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18852	Ruiz 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18853	Kusumi 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18855	Fiorillo 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18857	Dunbar 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18859	Hopkins 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18860	Loza 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18861	Loza 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18862	Nisenbaum 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18866	NCT01506765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18867	NCT01512290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18868	NCT01514682	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18869	NCT01515423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18870	NCT01516424	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18871	NCT01517360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18872	NCT01518894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18873	NCT01519557	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18874	NCT01521026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18876	NCT01523730	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18877	NCT01524380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18878	ISRCTN74054823	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18879	ISRCTN34900108	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18883	CTRI-2012-01-00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18891	Vita 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18895	Blank 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18899	Van Gestel 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18900	Wolwer 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18905	Chao 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18910	Zhang 2011 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18911	Bajaj 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18912	Jamora 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18914	Swildens 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18921	Hoffmann 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18923	Remington 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18929	Chen 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18930	Davis 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18931	Deutsch 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18932	Feifel 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18935	Hong 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18936	Hosford 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18937	Lasser 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18940	Mathalon 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18941	Oranje 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18942	Pedersen 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18943	Potkin 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18944	Prasad 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18945	Robinson 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18946	Roffman 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18948	Shen 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18950	Szegedi 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18952	Ibrahim 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18953	Agam 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18955	Woolley 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18956	Buchsbaum 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18957	Bunney 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18958	Chen 2010 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18959	Feifel 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18960	Ferziger 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18961	Garcia 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18962	Keefe 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18963	Leweke 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18964	Lieberman 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18965	Lieberman 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18967	Minzenberg 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18969	Pedersen 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18970	Prasad 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18972	Smith 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18974	Tregellas 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18975	Umbricht 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18976	Vanover 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18977	Wing 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18981	Bergk 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18982	NCT01529515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18983	ISRCTN76324634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18984	ACTRN1261200021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18985	ACTRN1261200019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18986	ISRCTN61109178	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18987	ISRCTN75675072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18990	Deakin 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18992	Gelkopf 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18993	Rabovsky 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18994	Vazquez 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18999	Shifu 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19001	Tempier 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19004	Fang 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19006	Fleischhacker 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19008	Royer 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19009	Silverman 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19011	Bechdolf 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19014	Gassmann 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19018	Klingberg 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19019	NCT01123408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19020	Lincoln 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19022	Malchow 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19023	McCabe 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19025	Ojeda 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19027	Quisenaerts 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19028	Scheewe 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19029	Scheewe 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19031	Shaygan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19033	Van 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19037	Coppola 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19042	Langer 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19047	Tomita 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19058	Rosenheck 1998 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19059	NCT01567124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19060	NCT01555697	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19061	NCT01561859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19062	NCT01567943	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19063	NCT01566513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19064	NCT01563016	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19066	NCT01569659	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19068	NCT01561742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19070	NCT01568528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19072	CTRI-2012-03-00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19073	NCT01556763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19074	NCT01547026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19075	NCT01559272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19076	NCT01551979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19078	DRKS00003623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19079	IRCT20120206729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19081	IRCT20120224155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19082	ISRCTN32545295	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19083	ISRCTN79584912	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19084	James 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19085	McGuire 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19086	Jones 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19087	IRCT201202117373N2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19089	Behdani 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19090	Nielsen 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19097	Xiang 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19098	Averbeck 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19104	Raven 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19105	Wang 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19107	Cullen 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19108	Hatta 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19110	Bechi 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19115	Mattai 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19120	Bagoien 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19122	Berti 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19125	Johnson 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19126	Kroon 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19127	Kroon 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19128	Latimer 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19130	Michon 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19131	Puschner 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19133	Roosenschoon 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19135	Schmechtig 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19136	Schulze 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19137	Hansen 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19141	McElroy 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19142	Perlick 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19143	Ratliff 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19145	Tek 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19146	Twamley 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19147	Younis 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19148	Burton 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19152	Kopelowicz 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19153	Chen 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19156	Na 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19157	Schneiderhan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19158	Stone 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19159	Tangu 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19166	Arbabi 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19171	2011-005138-21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19172	NCT01570712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19173	NCT01573637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19178	McDonnell1 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19179	Schepp 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19181	李杰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19182	沙蓉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19184	彭渝 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19185	赵肖霞 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19186	兰庆榜 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19187	杨诚 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19188	Wang 2010a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19189	薛蓉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19190	Xie 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19191	杨迎兰 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19192	解克平 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19193	彭东阳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19194	刘琼华 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19195	蒋菊芳 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19196	陈俊雄 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19197	蒋红 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19198	刘翠欣 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19199	高志勤 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19200	刘晓军 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19201	徐亚秋 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19202	翁深宏 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19203	梅映台 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19204	方崇芳 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19205	卢爱莲 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19206	胡光涛 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19207	杨健 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19208	焦薇 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19209	王玲 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19210	杨梅 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19211	马迅 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19212	谢育南 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19213	侯春兰 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19214	李智强 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19215	王丽莉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19216	陈正 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19217	陈庆红 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19218	肖世富 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19219	温盛霖 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19220	顾广善 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19221	李永红 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19222	Yao 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19223	刘纪猛 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19224	唐爱珠 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19225	李广田 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19226	左潇 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19227	林虹 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19228	寇金爱 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19229	吴德华 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19230	高海江 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19231	陈平勋 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19232	张谦 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19233	陈勇 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19234	杜永慧 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19235	刘显阳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19236	成为荣 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19237	陶世武 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19238	褚梅林 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20285	吕振雷 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19239	陈绪焕 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19240	余雪芹 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19241	谢国建 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19242	侯锐钢 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19243	Sun 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19244	范春云 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19245	刁端忠 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19246	刘玉局 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19247	杨老虎 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19248	刘晓军 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19249	刘海瑶 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19250	梁勇 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19251	张超 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19252	余雪虎 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19253	钟如青 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19254	周永静 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19255	孙桂兰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19256	Tang 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19257	魏玉莲 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19258	宋红 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19259	高班玲 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19260	任智勇 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19261	赵云 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19262	苏京利 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19263	李广田 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19264	姜俊哲 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19265	曹经纬 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19266	李西敏 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19267	段武钢 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19268	黄志茹 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19269	丁宁 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19270	吴开文 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19271	刘月芬 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19272	成为荣 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19273	唐建良 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19274	周平 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19275	曹国兴 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19276	徐莉萍 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19277	罗燕 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19278	刘建君 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19279	周广玉 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19280	黄玉琴 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19281	翟乃霞 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19282	罗颖 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19283	张莉 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19284	司丽华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19285	侯玉玲 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19286	何丽婵 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19287	谷德康 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19288	胡立红 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19289	肖凤新 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19290	杨英 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19291	王英群 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19292	徐燕川 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19293	涂亚莉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19294	苏勉 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19297	张献强 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19298	刘建金 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19299	段武钢 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19300	张玉海 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19301	张华坤 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19302	Xie 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19303	杨云秀 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19304	Teng 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19305	陈幼然 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19306	齐巧玲 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19307	Nong 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19308	傅慕君 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19309	汪正华 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19310	陈刚伟 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19311	李兰芳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19312	宋丽 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19313	梁玉婵 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19314	于瑞丽 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19315	王振华 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19316	侯月红 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19317	王艳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19318	张学民 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19319	颜建辉 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19320	柳贵明 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19321	何震 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19322	刘林晶 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19323	贾竑晓 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19324	高海江 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19325	黄志茹 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19326	王学升 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19327	周清清 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19328	孙宏俊 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19329	胥德广 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19330	罗世芳 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19331	张子梅 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19332	卢殿军 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19333	樊献丽 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19334	唐仕友 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19335	姜俊哲 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19336	Liu 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19337	张永俐 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19338	余学 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19339	张明兰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19340	汤景文 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19341	邓方渝 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19342	Zhu 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19343	冯亚芬 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19344	刘根凤 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19345	张瑞芬 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19346	余海鹰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19347	赵占宏 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19348	王红艳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19349	姚兴军 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19350	韩永惠 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19351	李守春 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19352	周庆华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19353	刘明辉 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19354	王怀静 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19355	乔金荣 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19356	马秋 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19357	董汉振 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19358	任杰 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19359	刘丽微 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19360	Huang 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19361	郭全芳 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19362	周广玉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19363	陈华云 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19364	代嘉庚 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19365	张玲 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19366	庞铁良 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19367	张莉 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19368	穆世铭 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19369	郑樱 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19370	刘国霞 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19371	皮玥玥 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19372	莫迪 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19373	谢鸿珍 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19374	余亚珍 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19375	蒋燕 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19376	陶敏 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19377	汪艳 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19378	陈海莹 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19379	徐天朝 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19380	杜玉杰 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19381	尹道亮 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19382	张晓阳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19383	戚惠娟 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19384	张述杰 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19385	赵青霞 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19386	于艳华 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19387	李祥 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19388	陈刚伟 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19389	李鹰 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19390	石保青 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19391	张咏梅 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19392	孙艳 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19393	Liu 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19394	张保利 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19395	周天红 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19396	李晓一 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19397	张静 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19398	李超 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19399	朱凤宜 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19400	易峰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19401	杨明华 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19402	张恒 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19403	王昉 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19404	罗玲玲 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19405	李超 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19418	马树芝 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19419	贾竑晓 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19420	朱玉梅 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19421	刘彩兴 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19422	哈秀英 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19423	李建峰 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19424	张红旗 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19425	罗慧芳 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19426	杨杰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19427	任艳萍 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19428	张峰 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19429	温占红 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19430	陈慧 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19431	熊辉 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19432	孙平 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19433	冉昌华 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19434	黄智辉 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19435	林敏 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19436	胡华廷 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19437	赵敬平 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19438	何文刚 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19439	王金堂 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19440	宋丽 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19441	崔明伟 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19442	杨仁登 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19443	卢殿军 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19444	王体宾 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19445	王永学 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19446	李仕军 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19447	王刚平 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19448	邓广 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19449	喻志敏 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19450	邢香然 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19451	李春花 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19452	许亚平 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19453	吕长波 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19454	秦捷 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19455	阿怀红 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19456	张鸿燕 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19457	李培轩 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19458	黄峰 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19459	何淑芬 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19460	徐丽芬 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19461	Li 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19463	张志娟 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19464	叶百维 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19465	殷月珍 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19466	Prasad 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19477	Morrison 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19479	Sulaiman 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19480	Vita 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19481	Weiser 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19488	Honarmand 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19493	Edwards 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19496	Liang 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19497	Mahmoud 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19498	Nuijten 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19500	DeMartinis 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19501	Hegde 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19502	Jarskog 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19503	Jaugey 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19505	Leweke 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19507	Nasrallah 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19508	Rakesh 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19509	Sanchez 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19510	王 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19511	Fan 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19512	黄振英 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19517	David 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19518	Dawes 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19522	Chaudhry 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19524	Steinwachs 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19531	Phutane 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19533	Yalcin 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19535	Faber 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19537	Kelleher 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19539	Zhu 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19552	Wu 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19554	Yanos 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19555	Chang 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19571	Yang  2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19573	NCT01598623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19574	NCT01598896	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19575	IRCT20120513155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20286	谢明华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19577	NCT01607840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19578	NCT01601587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19579	NCT01609153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19581	NCT01593774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19582	NCT01597141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19583	NCT01602029	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19584	DRKS00003603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19585	NCT01606254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19586	NCT01607424	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19587	NCT01606436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19588	ISRCTN82129964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19589	NCT01595503	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19592	Pelosi 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19593	Chung 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19606	Gurvich 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19610	Nielsen 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19613	Jarrett 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19615	Sachs 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19616	Valencia 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19626	Medalia 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19629	Won 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19634	Pandina 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19638	Morozova 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19640	Taylor 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19641	NCT01635075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19642	NCT01634373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19643	NCT01626872	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19644	NCT01626859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19645	NCT01626456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19646	NCT01625897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19647	NCT01625000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19648	NCT01623726	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19649	NCT01623713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19650	NCT01622166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19651	NCT01621737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19652	NCT01620086	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19653	NCT01619319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19654	NCT01617187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19724	Tregellas 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19656	NCT01614899	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19657	JPRN-UMIN000008201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19659	ISRCTN61621571	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19660	ISRCTN34145189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19661	ChiCTR-TRC-12002273	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19662	UKCRNID9332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19663	UKCRNID9544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19668	Yasui 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19669	Castilla 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19671	Gurvich 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19672	NCT01639872	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19673	ISRCTN06118265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19674	JapicCTI-101175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19676	Bowie 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19677	Brunelin 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19681	Rass 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19688	Chang 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19689	Hjorth 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19692	Montes 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19693	Quisenaerts 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19694	Sharif 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19696	Chen 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19698	Eack 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19701	Buchsbaum 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19702	Bunney 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19704	Chen 2010 d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19705	Cutler 2011a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19706	Feifel 2010 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19707	Ferziger 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19709	Garcia 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19712	Leweke 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19713	Lieberman 2010 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19714	Lieberman 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19717	PEARL 2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19718	Pedersen 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19719	Prasad 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19720	Schmechtig 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19722	Smith 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19908	Barr 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19725	Umbricht 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19727	Vanover 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19728	Vinogradov 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19729	Wing 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19733	Jianjun 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19740	Sharifi 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19748	Yi 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19750	Smeerdijk 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19751	Li 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19752	Meszaros 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19753	Spaniel 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19754	Stryjer 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19756	Barr 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19757	Li 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19760	Chen 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19761	Gholipour 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19763	Mohammadi 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19764	Egerton 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19765	Kim 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19766	Wu 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19772	Kay 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19776	Montes 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19781	Clayton 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19782	Roiz 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19783	NCT01688037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19784	NCT01682161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19786	ISRCTN45593573	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19787	ISRCTN98067793	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19788	ACTRN12612000974808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19789	ACTRN12612000963820	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19790	JPRN-UMIN000008818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19793	Radulovic 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19794	Mohr 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19876	NCT01714713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19877	NCT01716975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19878	UKCRN ID 11514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19889	Zheng 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19891	Geffen 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19892	Kupsch 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19893	Tomita 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19894	Twamley 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19897	Kwon 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19899	O'Brien 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19900	He 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19901	Xie 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19902	Morthorst 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19903	Perry 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19904	Sato 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19905	Weiss 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19910	Kilian 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19915	Schonebaum 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19916	Zarafonitis 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19921	Scheewe 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19926	McCrone 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19929	O'Reilly 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19935	Davies 2007 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19937	Torres-Carbajo 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19938	Sudaporn 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19939	NCT01729650	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19940	NCT01729572	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19941	NCT01724476	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19942	NCT01738698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19943	NCT01733121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19944	NCT01731977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19945	NCT01733602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19946	NCT01724372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19947	NCT01722344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19948	NCT01731171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19949	ISRCTN99672552	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19950	ISRCTN17160673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19951	IRCT201109287660N1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19952	JPRN-UMIN000009239	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19955	UKCRN ID 13062	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19956	UKCRN ID 12951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19958	Pikalov 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19960	Koychev 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19961	Weissman 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19962	Mandel 1961 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19964	McDonell 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19965	Perez 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19966	Sukegawa 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19970	Mamah 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19974	Jin 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19975	Slotema 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19976	Baker 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19977	NCT00616798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19978	Chaudhry 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19979	Findling 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19981	Fricchione 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19984	Hwang 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19985	Jia 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19988	Keshavan 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19989	Kinon 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19990	Kong 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19991	Lan 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19992	Li 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19993	Loze 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19995	Meltzer 2009 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19996	Oosthuizen 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19998	Pelayo 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20001	Schreiner 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20002	Shimada 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20003	Suzana 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20005	Turncliff 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20010	Alphs 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20012	Jerrell 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20013	Zhang 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20014	IRCT138712231764N1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20015	Stant 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20020	Gharaeipour 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20023	Magliano 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20024	Mobascher 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20025	Wustenberg 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20026	Abhishekh 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20027	Takao 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20028	Jochems 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20030	Madigan 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20031	Anandarajan 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20035	Guse 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20037	Kinter 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20038	Parsons 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20040	Shim 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20042	Van 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20043	Haimov 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20044	Kaushal 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20045	Schreiner 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20046	Varambally 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20047	Zincir 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20048	Allott 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20050	Bartzokis 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20051	Bechdolf 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20053	Castle 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20054	Chan 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20055	Chang 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20056	Chaudhry 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20057	Christensen 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20061	Farreny 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20062	Francey 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20063	Gleeson 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20066	Killackey 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20154	Davis 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20068	Lawlor 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20070	Malla 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20071	Malla 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20072	Marvin 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20074	Moran 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20076	Nishida 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20077	Nordt 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20078	Nuechterlein 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20079	Nuechterlein 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20080	Piskulic 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20081	Rohleder 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20082	Rondeau 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20083	Rosenbaum 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20085	Saija 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20087	Smith 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20088	Srihari 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20089	Srihari 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20090	Subotnik 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20093	Weiden 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20094	Woods 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20095	Woolley 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20096	Yung 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20097	De 2011 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20101	Vayisoglu 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20103	Lee 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20106	NCT01749124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20107	NCT01752465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20108	NCT01752712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20109	ISRCTN01416694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20111	ISRCTN34757603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20112	IRCT20111009301	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20118	Ferraz 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20119	Garber 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20123	Rogers 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20124	Penades 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20125	Stognone 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20126	Rogers 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20128	Lu 2004 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20130	Lin 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20131	EUCTR2012 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20133	NCT01760889	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20137	NCT01779700	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20138	NCT01768000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20139	NCT01780116	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20140	NCT01779440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20141	NCT01765829	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20146	Ratliff 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20149	Palmier 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20153	Citrome 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20155	Fleischhacker 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20156	Gallego 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20158	Kelly 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20159	Keshavan 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20160	Kochunov 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20161	Leweke 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20164	Meltzer 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20165	Rasetti 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20166	Reichenberg 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20169	Turncliff 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20170	Vanover 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20171	Wang 2010 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20172	Weiser 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20173	Woolley 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20174	Zukin 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20176	Dixon 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20177	Ho 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20178	Marcus 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20182	Kasthurip 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20183	Kumar 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20186	Rosenbaum 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20187	Sahoo 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20189	Smith 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20191	Gu 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20192	Kusumi 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20193	Pandina 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20196	Echeburua 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20200	Rathod 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20201	Rus 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20202	Conde 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20204	Baksheev 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20206	ISRCTN00721331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20207	孙平 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20208	闾金杰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20209	侯正华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20210	郑艳明 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20211	刘娜 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20212	刘洁 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20213	李四冬 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20214	李媛媛 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20215	徐成敏 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20216	吴美娟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20217	吴慧 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20218	梁家騋 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20219	盛嘉玲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20220	顾小静 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20221	周玉梅 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20222	冯宝珍 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20223	刘芳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20224	向应强 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20225	欧阳杏娟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20226	刘晓伟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20227	高红锐 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20228	陈健华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20229	张丽英 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20295	静 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20296	雷远严 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20297	陈胜华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20298	金建烽 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20299	郭金宏 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20300	邓小娟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20301	辛一帆 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20302	赵雅琴 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20303	许爱琴 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20304	许晓英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20305	许兰花 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20306	胡君 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20307	耿寒松 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20308	祖鑫 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20309	王秀莉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20310	王文骁 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20311	曹书改 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20312	张红旗 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20313	张伟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20314	廖东升 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20315	寇根生 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20316	孙洪祥 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20317	娟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20318	姚丰菊 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20319	周长凤 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20320	周彩莲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20321	Liu 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20322	刘彩秀 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20323	刘彩秀 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20324	余利国 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20325	付春红 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20326	满孝琴 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20327	巨怀林 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20328	吴海龙 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20329	张长春 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20330	陈俊雄 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20331	王敬龙 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20332	王宏林 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20333	刘延永 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20334	屈艳妮 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20335	谢杰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20336	柳贵明 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20337	董红霞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20338	顾培 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20339	孙洁 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20340	毕旭军 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20341	陈时平 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20342	于丽 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20343	陈雄 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20344	褚建平 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20345	裴双义 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20346	袁月芳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20347	袁国锋 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20348	Fan 2013a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20349	王宇峰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20350	王云红 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20351	杨润康 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20352	杜剑峰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20353	李素君 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20354	徐爱群 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20355	徐敬文 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20356	徐优明 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20357	张薇薇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20358	张洪亮 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20359	孙长军 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20360	刘宗和 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20361	张继聪 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20362	柳宏宇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20363	柳宏宇1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20364	李良 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20365	朱肖飞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20366	马彩娥 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20367	吴慧 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20368	张睿 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20369	丁宁 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20370	齐红梅 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20371	邹凯 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20372	熊桂兰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20373	刘军 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20374	张加强 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20375	刘振英 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20376	闫少校 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20377	李和军 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20378	李宁 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20379	黄艳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20380	黄碧琴 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20381	魏明琼 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20382	颜为轩 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20383	陈红梅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20384	赵树霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20385	苏嵘 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20386	Wang 2013a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20387	王海渊 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20388	杨玉清 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20389	张月恒 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20390	张景彦 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20391	张景彦 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20392	张传海 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20393	回秀清 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20394	周怀忠 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20395	凌卫明 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20396	王永柏 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20397	马雁冰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20398	韩桂玲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20399	韩文艳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20400	董亚辉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20401	石广念 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20402	汪津洋 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20403	杜春燕 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20404	成军 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20405	陈春红 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20406	汪东明 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20408	梁映 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20409	马清 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20410	曾新平 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20411	李东美 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20412	许方义 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20413	杨卫东 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20414	孙平 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20415	范成 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20416	寇根生 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20417	穆朝娟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20418	高粉霞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20419	贾敏 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20420	王健	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20421	纪芳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20422	周小青 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20423	王敬龙1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20424	胡祖林 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20425	王宏林1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20426	刘娜 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20427	孙润珠 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20428	李延红 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20429	潘振山 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20430	刘向阳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20431	赵和丹 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20432	王海燕 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20433	吴翠杰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20434	宋传福 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20435	张俊峰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20436	夏庆润 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20437	段兴斌 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20438	赵学庆 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20439	廖春平 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20440	张恒 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20441	沈丽珍 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20442	尹烈虎 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20443	白慧丽 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20444	王彩虹 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20445	周会爽 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20446	肖师惠 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20447	陈日访 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20448	李四冬1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20449	辛一帆 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20450	张加明 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20451	汪富军 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20452	李冰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20453	杨静娟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20454	邓春江 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20455	张星亮 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20456	何海霞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20457	王鹏 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20458	周长凤 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20459	黄朝华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20460	吕晓静 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20461	宋奕 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20462	孙淑云 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20463	王延鹤 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20464	崔菁 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20465	苏邹 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20466	赵桂军 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20467	范成1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20468	刘洪刚 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20469	陈凤仙 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20470	唐再胜 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20471	艾春启 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20472	刘铭涛 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20473	安孝群 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20474	朱琼 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20475	杨显东 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20476	薛蓉 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20477	李晓玲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20478	李巧爱 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20479	武翠凤 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20480	朱蔼 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20481	吴盛荧 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20482	周梦煜 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20483	龚飞中 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20484	王素红 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20485	成军	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20486	张磊 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20487	马云 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20488	陈日访1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20489	钱丹红 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20490	韦强 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20491	杨小曲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20492	尹雪冰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20493	宣彩英 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20494	唐艳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20495	关伟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20496	罗娴 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20497	许庆文 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20498	顾曙光 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20499	王鹤秋 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20500	龙珊珊 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20501	张丽 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20502	杨立身 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20503	杨立身1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20504	刘从敏 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20505	陈燕 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20506	李晓琼 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20507	Chen 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20508	Li 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20509	王红尔 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20510	孔鑫 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20511	封蕴 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20512	付慧鹏 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20513	张燕锋 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20514	王洪娟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20515	劳恩荣 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20516	郑宏 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20517	徐枝楼 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20518	崔中兰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20519	徐春花 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20520	马久华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20521	时德菊 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20522	李和军 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20523	冯艾群 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20524	申振可 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20525	许婷 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20526	郭献锋 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20527	马效芝 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20528	黄发妮 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20529	戴晶璟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20530	鲍丽萍 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20531	王文君 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20532	崔凤琢 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20533	李振超 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20534	高瑛 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20535	李萍 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20536	张莉 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20537	顾桂英 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20538	陈瑞芳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20539	周丹 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20540	李耀东 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20541	杨伟芳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20542	马婉 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20543	李萍1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20544	孙蔚华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20545	赵业华1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20546	李冰1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20547	张星亮 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20548	王祖森 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20549	李皖生 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20550	段妮 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20551	刘林晶 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20552	陈进东 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20553	徐德会 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20554	汪艳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20555	邹宏涛 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20556	张尚荣 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20557	王有斌 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20558	李耀东1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20559	李凯杰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20560	罗俊蓉 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20561	查智群 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20562	Xiao 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20563	林涛 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20564	华彩霞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20565	左彥 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20566	张玉娥 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20567	刘付敏 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20568	黄冬琳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20569	许艳红 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20570	张红 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20571	王文君1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20572	陈永刚 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20573	周锦 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20574	王娜娜 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20575	徐莉 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20576	许本健 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20577	陈钊 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20578	姚凤云 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20579	方喜玲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20580	胡美玉 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20581	林丽霞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20582	庞月萍 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20583	林连英 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20584	黄玉英 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20585	姜欢 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20586	胡卫群 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20587	黄晓芳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20588	李东美1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20589	刘美玲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20590	甄莉丽 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20591	罗世芳 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20592	张晓明 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20593	朱倩芸 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20594	瞿波 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20595	刘庆奇 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20596	宋艳萍 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20597	周怀忠 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20598	刘海军 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20599	赵亚明 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20600	杨逢润 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20601	林文 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20602	张洪亮 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20603	戴涛 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20604	杨凌雪 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20605	陈秀珍 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20606	张朝峰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20607	孙亚军 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20608	徐严秀 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20609	马效芝1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20610	程菊英 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20611	肖师惠1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20612	王尚红 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20613	黄丽宏 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20614	王玉玲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20615	韩树华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20616	竹道平 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20617	王飞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20618	梁金梅 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20619	江学锋 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20620	王志 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20621	赵涛 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20622	刘伟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20623	范祚君 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20624	兰开荣 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20625	易东晓 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20626	朱倩芸1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20627	王艳红 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20628	于志淼 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20629	杨显东1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20630	李冰2 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20631	任尚 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20632	朱宛平 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20633	张香云 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20634	徐彩霞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20635	苏庆伟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20636	王新春 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20637	韩兴玲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20638	赵永厚 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20639	赵永厚1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20640	蒋军生 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20641	郑友玲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20642	张冬敏 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20643	戴涛 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20644	严叶良 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20645	李小莲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20646	胡海霞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20647	陈勇华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20648	梁文石 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20649	梁宏光 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20650	林树冲 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20651	王仁峰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20652	陶金梅 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20653	Wang 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20654	李海云 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20655	马海霞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20656	黄河 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20657	潘淑先 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20658	宋宝华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20659	Chang 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20660	陈汉华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20661	马元业 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20662	胡亚兰1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20663	陶锋 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20664	曹德 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20665	巩秀芹 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20666	巩秀芹	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20667	鞠红珍 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20668	胡红霞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20669	赵永红 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20670	刘锟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20671	王继丰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20672	蒋卫平 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20673	张庆娥 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20674	张庆娥 2012 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20675	蒋幸衍 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20676	赵新苗 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20677	曹伟 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20678	陆燕华 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20679	张泽栋 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20680	岳丽萍 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20681	许洁 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20682	王晓捷 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20683	葛霞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20684	权文香 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20685	龚发金 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20686	何杰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20687	张生翠 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20688	Zhang 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20689	李春 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20690	梁皓明 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20691	陶锋 2012 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20692	刘飞 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20693	邹义 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20694	黄佩珊 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20695	姚自强 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20696	郭艳梅 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20697	张素琼 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20698	崔虹 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20699	林晓兰 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20700	Fan 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20701	Liu 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20702	马廷斌 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20703	邓文 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20704	李璐 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20705	耿磊 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20706	罗世芳1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20707	龚士虎 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20708	齐俊茹 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20709	黎赛英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20710	黎华柱 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20711	黄萍 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20712	黄继伟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20713	黄秀芳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20714	黄海涛 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20715	黄桥生 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20716	黄杏娟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20717	黄晓慧 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20718	黄春艳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20719	黄娟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20720	Huang 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20721	鲁国芬 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20722	魏荣国 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20723	魏维 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20724	高良会 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20725	高红锐 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20726	高玉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20727	高湘 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20728	高平来 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20729	高孟英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20730	马金芳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20731	马筠 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20732	马秀青 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20733	马春燕 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20734	马建华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20735	马云 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20736	额尔敦 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20737	顾桂英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20738	顾桂英1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20739	顾桂英2 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20740	雷田香 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20741	雷田香1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20742	雷志洁 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20743	雷小燕 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20744	雷佳峰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20745	陶用富 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20746	陶建青 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20747	陈香 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20748	陈飞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20749	陈雪晶 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20750	陈雄 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20751	陈雄1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20752	陈钰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20753	陈艳波 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20754	陈筱章 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20755	陈泽 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20756	陈智敏 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20757	陈宇晖 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20758	Chen 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20759	陈亚萍 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20760	陈云芳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20761	陈丽香 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20762	陈丽香 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20763	陈一郡 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20764	陆雪山 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20765	闾金杰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20766	闫爱国 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20767	闫明贵 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20768	闫丽华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20769	钟爱红 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20770	钟文凯 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20771	钟古华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20772	金鑫 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20773	Jin 2013a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20774	郭育君 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20775	郭细先 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20776	郭献锋 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20777	郭新聊 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20778	郭建雄 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20779	郭侠 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20780	郭会霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20781	郭云龙 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20782	Chi 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20783	郑梅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20784	郑杏珊 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20785	郑昌爱 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20786	郑宏 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20787	郁莉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20788	邹灵芳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20789	邹海欧 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20790	邹凯 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20791	邹凯1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20792	邵阁忠 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20793	邵平 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20794	邵平1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20795	邵国艳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20796	邬东红 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20797	邢锋 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20798	邢锋1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20799	邓良华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20800	邓广 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20801	邓娟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20802	辛春萍 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20803	赵龙 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20804	赵静 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20805	赵青霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20806	赵红梅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20807	赵淑琴 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20808	赵春海 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20809	赵成清 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20810	赵小荣 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20811	赵小玲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20812	赵小玲1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20813	赖飞翔 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20814	谷士军 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20815	谭颖芬 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20816	谢秀钦 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20817	谢文娇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20818	谢振强 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20819	谢友许 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20820	许锦泉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20821	许锦泉1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20822	Xu 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20823	许志平 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20824	许志平1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20825	许子明 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20826	许勤伟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20827	解小永 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20828	袁日强 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20829	袁日强1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20830	薛雷 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20831	薛爱兰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20832	薛文 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20833	蔡长源 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20834	蔡艳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20835	蔡经宇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20836	蔡琳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20837	蔡军 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20838	蒲金玉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20839	蒲绮霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20840	蒲绮霞1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20841	蒙莉莉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20842	蒋燕升 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20843	蒋永红 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20844	蒋正伟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20845	蒋丽红 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20846	蒋丽红 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20847	董雪刚 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20848	董自强 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20849	菅彩霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20850	菅彩霞1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20851	范洁 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20852	苏柯羽 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20853	苏卫东 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20854	芈志勇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20855	臧秀萍 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20856	胡雪梅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20857	胡长霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20858	胡春丽 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20859	胡怡 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20860	胡学慧 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20861	胡孝芬 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20862	胡君1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20863	胡光涛 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20864	胡义思 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20865	肖群林 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20866	Xiao 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20867	聂文燕 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20868	耿在香 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20869	罗汝琴 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20870	罗晓东 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20871	罗伟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20872	等 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20873	符巍 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20874	童小均 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20875	章珠妃 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20876	穆慧 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20877	程闯 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20878	程敏锋 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20879	秦春红 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20880	秦培云 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20881	石森 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20882	石岩 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20883	盛嘉玲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20884	皮峻峰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20885	申文武 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20886	甄莉丽 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20887	甄庆伟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20888	璩宪法 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20889	琳等 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20890	王鸿雁 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20891	王飞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20892	王静波 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20893	王锦芬 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20894	王进祥 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20895	王菲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20896	王茜 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20897	王自强 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20898	王翠英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20899	王维强 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20900	王维强1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20901	王红艳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20902	王立志 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20903	王秀芳 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20904	王秀芳 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20905	王琦 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20906	王珊 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20907	王玉翠 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20908	王爱青 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20909	王洪明 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20910	王泽民 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20911	王汉婵 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20912	王桂珍 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20913	王格斐 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20914	王晓璇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20915	王文英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20916	王成芳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20917	王成艳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20918	王慢利 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20919	王建波 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20920	王小红 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20921	王小红1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20922	王小丽 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20923	王宇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20924	王娣 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20925	王天明 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20926	Wang 2013d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20927	王双凤 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20928	王双凤1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20929	Wang 2013c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20930	王凤英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20931	王军 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20932	王健 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20933	王俊 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20934	王伯军 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20935	王伟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20936	王任昌 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20937	王东平 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20938	狄邦成 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20939	狄邦成1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20940	牛轶 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20941	牛慧明 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20942	潘燕 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20943	潘殊 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20944	潘国良 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20945	满孝琴1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20946	Wen 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20947	洪梅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20948	洪巧丽 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20949	沈君 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20950	沈君 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20951	汤耀明 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20952	江永 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20953	毛智群 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20954	殷朝辉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20955	段瑞瑞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20956	段惠峰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20957	Wu 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20958	欧小春 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20959	欧九娣 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20960	樊凌姿 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20961	梁识崇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20963	梁航 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20964	梁翠英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20965	梁松新 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20966	梁映 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20967	柴萌 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20968	林连英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20969	林昭宇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20970	杨靖 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20971	杨铭哲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20972	杨薇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20973	杨艳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20974	杨翠英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20975	杨维林 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20976	杨玲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20977	杨淼 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20978	杨淼1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20979	杨润康1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20980	杨永秀 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20981	杨新 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20982	杨斌 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20983	杨彩霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20984	杨建华1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20985	杨建华 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20986	杨安军 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20987	杨国平 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20988	杨和增 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20989	杨修来 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20990	杨亚妮 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20991	李鹏程 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20992	李雪晶 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20993	李雅忠 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20994	李金惠 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20995	李达 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20996	李辉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20997	李言禹 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20998	李萌 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20999	李莉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21000	李美艳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21001	李红远 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21002	李红英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21003	李立群 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21004	李秀美 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21005	李福英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21006	李祥 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21007	李祥 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21008	李玉英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21046	曹民佑 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21047	曹志良 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21048	曹志良1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21049	曹德 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21050	易著英 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21051	易峰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21052	时林 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21053	方美华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21054	方竞红 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21055	斌 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21056	房海英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21057	戚惠娟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21058	成芝花 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21059	成岗 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21060	成军1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21061	成军2 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21062	徐雪梅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21063	徐维斌 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21064	徐红霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21065	徐红霞1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21066	徐淑敏 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21067	徐开营 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21068	徐勇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21069	徐健康 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21070	徐世超 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21071	彭红波 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21072	彭红波1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21073	Peng 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21074	彭星 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21075	彭保全 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21076	强瑞香 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21077	张静静 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21078	张英辉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21079	张翔 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21080	张红军 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21081	张紫娟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21082	张玉敏 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21083	张玉娥 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21084	张焱 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21085	张淑云 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21086	张涛 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21087	张海华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21088	张洪新 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21089	张永超 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21090	张毓茂 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21091	张桂平 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21092	张春锋 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21093	张文蔚 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21094	张改兰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21095	张懿 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21096	张懿1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21097	张慧芳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21098	张建 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21099	张尚坤 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21100	张国富 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21101	张变梅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21102	张华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21103	张冬敏 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21104	张俊青 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21105	张仁凯 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21106	廖之明 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21107	庞铁良 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21108	庞波 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21109	庆雷 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21110	常超华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21111	常俊华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21112	嵇迎春 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21113	岳莉莉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21114	居丽晶 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21115	宋珀槿 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21116	宋洁 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21117	宋桂清 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21118	宋来云 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21119	宋丽娜 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21120	安琦 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21121	安晓东 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21122	季锦毅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21123	孟月兰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21124	孙飞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21125	孙霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21126	孙淑红 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21127	孙本树 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21128	孙晓丹 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21129	孙文欣 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21130	孙国胜 2013a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21131	孙国胜 2013b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21132	娄渊敏 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21133	姜诚勇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21134	姜明霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21135	姚玲玲 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21136	夏荷秀 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21137	喻晓 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21138	唐岩 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21139	唐兢 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21140	唐义莲等 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21141	周龙川 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21142	周颖 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21143	周赟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21144	周芳珍 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21145	周芳珍 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21146	周立发 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21147	周浩 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21148	周新英 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21149	周慧民 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21150	周丽芳 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21151	周丽芳 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21152	周丽芳 2013 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21153	吴辉霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21154	Wu X 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21155	吴殿龙 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21156	吴桂华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21157	吴志雄 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21158	吴开文 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21159	吴奕珉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21160	吴仁刚 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21161	吴丽 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21162	吴东 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21163	吕伟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21164	向道华 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21165	向永红 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21166	叶渊 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21167	史丽娜 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21168	卢琦 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21169	卢春爱 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21170	卢慧贤 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21171	卢慧贤 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21172	Lu 2013a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21173	卢喜金 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21174	南晓荣 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21175	刘香凤 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21176	刘顺发 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21177	刘顺兰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21178	刘锐 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21179	刘西俊 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21180	刘蕴霞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21181	刘荣芹 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21182	刘胜利 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21183	刘璇 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21184	刘玉芝 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21185	刘期文 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21186	刘期文 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21187	刘晖 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21188	刘旭 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21189	刘国强 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21190	刘利平 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21191	刘其贵 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21192	刘俐芬 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21193	刘仰 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21194	刘仰1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21195	刘书君 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21196	凌秾喜 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21197	凌洁 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21198	冯锦妹 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21199	冯莹 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21200	冯茹 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21201	兰滨 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21202	何芳梅 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21203	何娟儿 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21204	何堂礼 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21205	伍建辛 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21206	伍卫 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21207	任俊赏 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21208	任会蓉 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21209	付金芳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21210	付文娟 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21211	付拥军 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21212	亓高超 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21213	于青 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21214	于瑞 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21215	于瑞1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21216	乔颖 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21217	乔屹 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21218	严芳 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21219	丁振江 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21220	丁振江 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21221	丁婷 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21222	Brown 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21223	Cai 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21224	Fleischhacker  2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21225	Green 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21226	Happell 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21227	Ho 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21230	Perez 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21231	NCT00968513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21232	Waghorn 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21233	Chow 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21234	Reeder 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21235	Weisman 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21236	Abu 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21239	Aho 2011 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21242	Amiaz 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21245	Bademli 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21247	Bais 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21250	Barbeito 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21251	Baumgartner 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21254	Caponnetto 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21256	Carta 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21257	Casas 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21259	Clark 1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21262	Del 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21263	Detke 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21264	Dlabac 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21265	Ebrahimi 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21267	Finnegan 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21270	Gaikwad 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21271	Gerlach 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21272	Ghanizadeh 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21273	Griffin 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21274	Hanrahan 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21276	Hautamaki 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21278	Hindocha 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21279	Hjorth 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21280	Hosford 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21281	Ikai 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21282	Ising 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21283	Kedare 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21284	Khazaie 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21286	Kontio 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21287	Laties 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21290	Litman 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21292	Lu 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21293	Marx 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21295	Mondino 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21296	NCT01474395	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21298	Novak 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21299	Oertel 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21303	Percell 1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21304	NCT01781000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21305	Poulton 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21306	Ritsner 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21307	Rosenblum 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21308	Rouillon 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21310	Shoja 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21311	Singh 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21312	Sinha 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21313	Smith 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21314	Solomon 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21316	Stauffer 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21317	Steibliene 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21319	Sukegawa 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21323	Tan 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21324	Tandon 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21326	Tantirangsee 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21329	Tek 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21330	Turncliff 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21331	Ungvari 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21332	Vincenzi 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21336	Yassini 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21337	NCT02261519	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21338	NCT02274558	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21339	NCT02302209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21340	NCT02294409	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21341	NCT02283437	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21342	NCT02258737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21343	NCT02281773	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21344	NCT02282761	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21345	NCT02291861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21346	NCT02245607	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21347	NCT02264327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21348	NCT02246426	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21349	NCT02298985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21350	NCT02282085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21351	NCT02276469	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21352	NCT02287584	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21353	NCT02299492	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21354	NCT02275390	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21355	ISRCTN20328848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21356	NCT02242578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21357	ISRCTN43816889	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21358	DRKS00006878	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21360	ChiCTR-COC-14005301	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21361	ChiCTR-OPC-14005339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21362	JPRN-JapicCTI-142688	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21363	CTRI-2014-10-005144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21364	Hollister 1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21366	McNair 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21367	Dinitz 1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21369	Buchan 1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21370	Baker 1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21374	Steuber 1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21798	NCT01941251 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21799	NCT01945333 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21800	NCT01946295 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21801	NCT01948024 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21802	NCT01964092 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21803	NCT01967420 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21804	NCT01969500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21805	NCT01971073 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21806	NCT01971307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21807	NCT01973270 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21808	NCT01992393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21809	Von 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21814	Ozkan 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21817	Fernandez 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21818	Tsotsi 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21822	Kidorf 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21824	Chung 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21825	Fleischhacker W 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21828	Kane 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21829	Kocyigit 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21834	Maat 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21835	Miyaoka 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21836	Peters 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21837	Puig 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21838	Rapado 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21840	Steibliene 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21842	Wakamatsu 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21845	NCT01074632	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21849	Lee3 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21851	Valencia 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21854	Sanada 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21857	Walther 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21861	Barkhof 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21865	Hjorth 2013a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21456	Hui 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21868	Meskanen 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21869	Morrison 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21870	Kemp 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21871	Patterson1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21872	Areberg 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21874	Malla 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21877	Daly 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21880	Schneider 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21882	Chien2 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21884	Green 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21890	Baumgarten 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21891	Liang 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21892	Li 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21893	Gibson 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21894	Cavallo 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21898	Shen W 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22793	Berry 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22797	Eack 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22800	Woolley 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22802	Takeuchi 2014b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22803	Medlin 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22805	de Macedo 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22806	de 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22807	Nurenberg 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22808	Luciano 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22810	Rapado 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22813	Stockings 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22814	Quan 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22815	Taylor 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22817	Rosell  2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22818	Unterrainer 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22820	Lee 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22821	Garcia 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22822	Tomita 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22823	McClure 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22824	Martin 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22827	Kane 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22828	Gross 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22829	Sarpal 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21375	Dencker1 1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21377	Cooper 1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21380	Silver 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21383	NCT01936220 1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21385	MÃ¼ller1 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21386	Hellewell 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21387	Schmidt 1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21388	Nair 1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21389	Ogrodniczuk 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21390	Feldmann 2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21392	Dittmann 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21393	Ahn 2002 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21394	Kageyama 2002a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21395	Chengappa 2002 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21396	Simons 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21397	Smith1 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21398	Khazaie 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21400	Sacchetti1 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21401	van 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21402	TREC 2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21403	NCT01989728 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21404	Craig 2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21405	ISRCTN20556456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21407	NCT00287352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21408	Lin 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21409	Drebing 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21410	NCT01926613 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21418	John 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21420	Daneshmand 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21421	NCT01915017 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21422	Sudhakar 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21427	Hoffman 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21431	Villari 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21432	Rouillon 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21433	Gao 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21434	Kim 2009a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21435	Loze 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21437	Wass 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21438	NCT01942382 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21439	NCT01988714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21440	Shokraneh 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21441	NCT02105779 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21443	Haas1 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21444	Emmerson 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21446	Graff 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21447	Yu 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21448	Zhijuan 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21449	NCT01907282 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21451	NCT01942161 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21452	Mohammadi1 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21455	Chan 2010 c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21457	Cassella 2010 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21459	NCT02201888 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21460	ISRCTN59501939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21461	ISRCTN70185866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21462	Weng 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21463	Xu 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21464	Isbister 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21465	Rosenberg 2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21467	Chen 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21468	Tatsumi 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21469	Liu 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21470	Xu 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21471	Gao 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21474	NCT02140788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21476	NCT02210962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21479	Sledge 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21480	Rosenheck1 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21483	Eisen 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21484	NCT01024569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21485	Repo 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21486	Shahrivar 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21487	Omranifard 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21488	Navidian 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21489	Omranifard1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21492	Ihm 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21493	ISRCTN42520374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21494	Sato1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21495	Alvarez 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21496	Georgiev 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21498	Killackey1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21499	Glue 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21500	Grupp 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21501	Williams 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21502	Katagiri 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21504	Fadaii 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21505	Vadas 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21506	NCT02110771 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21507	NCT02128919 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21508	NCT02137993 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21509	NCT02144155 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21510	NCT02167347 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21511	Riedel 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21512	Thienel 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21514	Carson 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21515	Ma 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21516	Ricarte 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21517	Kane1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21519	Baker 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21520	Bersudsky 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21521	Tsai1 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21522	Pedersen 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21524	Sanchez 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21525	Potkin 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21528	Chirita 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21529	Prikrylova 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21530	NCT02192723 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21531	ISRCTN33695128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21533	ISRCTN47998710	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21534	ISRCTN88275061	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21535	NCT01568229 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21536	NCT01655680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21537	Paikkatt 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21545	Prikryl 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21547	Walker 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21551	Chen 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21552	van 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21553	Tenjin 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21554	Koren 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21555	McGinley 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21558	ISRCTN17801606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21559	ISRCTN13762819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21560	CTRI-2013-02-00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21561	SLCTR-2013-008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21562	NCT01804582 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21563	NCT01794429 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21564	NCT01793220 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21565	NCT01801787 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21566	NCT01795547 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21567	NCT01794897 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21568	NCT01793935 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21569	NCT01788774 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21570	NCT01804920 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21571	Penades 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21572	Stroup 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21573	Fischer 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21574	Fatemi 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21575	Li 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21576	Schulz 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21578	Egan 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21581	Bosch 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21583	Abhishekh 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21584	Brunelin 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21585	Hajebi 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21586	Manoach 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21587	Marx 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21588	Mathalon 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21589	Sikich 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21590	Sun 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21592	Nisenbaum 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21593	Yi 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21596	Bais 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21598	Wunderink 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21599	Woolley 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21603	Vesterager 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21604	Van1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21605	Van2 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21606	Ulloa 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21607	Takeuchi 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21608	Szeszko 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21609	Su 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21610	Subotnik 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21611	CHANGE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21613	Siever 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21614	Siever1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21615	Baker 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21616	Robinson 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21617	Reeder 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21619	Pijnenborg 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21621	Oranje 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21622	Nunes 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21623	Nuechterlein KH 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21624	Nuechterlein KH1 201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21625	Rotondi 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21626	Nienow 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21627	Bartzokis 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21628	Mueser 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21630	McGurk 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21631	Ahmed 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21632	Marder 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21633	Malchow 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21634	Lystad 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21635	Loewy 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21637	Bell 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21638	Leweke 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21639	Kurtz 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21640	ISRCTN29242879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21641	Killackey 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21642	Kern 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21643	Kasckow 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21644	Jorgensen 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21645	Jorg 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21646	Chang 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21977	Parke 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21647	Christensen 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21650	Goff 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21652	Wolfgang Fleisc 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21653	Ermer 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21654	Eack 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21655	Drake 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21656	Dlabac 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21657	Dixon 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21658	Dirks 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21659	De 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21660	Davis 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21661	Chan 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21662	Lee 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21665	Lee1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21669	Caballero 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21670	Eack 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21671	Eramo 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21673	Hansen 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21674	Hu 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21676	Kindler 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21677	Viering 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21683	Sofronov 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21687	Wang 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21688	Ainsworth 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21689	ISRCTN33306437	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21694	CTRI-2013-06-00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21695	CTRI-2013-05-00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21696	Patel 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21698	Herbild 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21699	Chen Hsing 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21701	ISRCTN37178153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21702	Loftis 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21703	IRCT201210163014N6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21704	Jayaram 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21705	Ghanizadeh 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21708	Cavezza 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21711	Manjunath 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21712	Boyer 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21713	Braehler 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21716	Neunhauserer D  2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21719	Tybura 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21720	ISRCTN26099032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21722	Adams 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21724	Pitschel 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21726	Foruzandeh 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21728	Jones 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21729	Wang 2013b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21731	Wang2 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21733	Battaglia 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21735	Potkin 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21738	ISRCTN44114663	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21739	ISRCTN65314790	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21740	Stip 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21741	ChiCTR-TRC-13003263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21742	Pontes 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21743	Holt 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21744	Usher 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21745	Bakker 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21746	Hinkelmann 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21749	Chien 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21751	Deen 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21752	Goldberg 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21753	Slade 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21756	Johnson 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21757	Varambally 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21759	Petry1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21760	Terevnikov 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21762	Lieberman 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21763	Ghafari 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21764	Hansson 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21765	Gold 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21766	ACTRN1261300097a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21767	ACTRN1261300097b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21768	ACTRN1261300112 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21769	ACTRN12613001217796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21770	ChiCTR-TRC-13003407	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21771	CTRI-2013-10-00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21772	DRKS00005200 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21773	DRKS00005346 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21774	EUCTR2013 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21775	IRCT20130819123 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21776	ISRCTN08387324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21778	JPRN-JapicCTI-111627	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21780	JPRN-UMIN000011194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21781	JPRN3 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21782	JPRN4 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21783	KCT0000873 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21784	NTR4172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21785	NCT01903707 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21786	NCT01903837 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21787	NCT01905605 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21788	NCT01908192 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21789	NCT01909466 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21790	NCT01911429	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21791	NCT01911676 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21792	NCT01913327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21793	NCT01927276 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21794	NCT01934023 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21795	NCT01939548 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21796	NCT01940159 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21797	NCT01940939 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21900	Takahashi 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21902	Ma 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21903	NCT02023736 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21905	NCT02001103 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21907	NCT02019329 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21908	JPRN5 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21909	JPRN-UMIN000012729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21910	IRCT2013091414499N3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21912	IRCT20130622208 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21913	ChiCTR-TRC-13003929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21914	ISRCTN09150095	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21915	ISRCTN78084871	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21919	NCT01234779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21920	Capdevielle 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21923	Dlabac1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21924	Farreny 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21925	Kos 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21927	Lay 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21929	Linke 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21930	Lorente 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21932	Malda 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21935	Schmidt 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21937	Watkins 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21938	Moritz1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21939	Barch 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21940	Davis2 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21941	Evins 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21942	Feifel 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21943	Fleischhacker W1 201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21944	Ghahremani 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21945	Haig1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21948	Marx1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21950	Smith1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21951	Stan 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21952	Stroup1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21953	Trampush 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21955	Turncliff 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21959	Wolf1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21960	Woolley1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21961	Youngstrom 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21962	de Beurs 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21964	Fleischhacker W2 201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21965	Walker 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21967	Vadhan 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21970	van3 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21978	IRCT201203112085N7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21979	HernÃ¡ndez 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21980	Park 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21982	Kageyama 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21983	Stant 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21984	Mousavi 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21985	Nag 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21986	Konnopka 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21988	Saleem 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21989	ISRCTN84658943	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21990	NCT02072954 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21991	NCT02121106 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21992	NCT02149823 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21993	Fleischhacker W3 201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21994	Dean 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21996	Tsang 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21999	Winseck 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22000	Weiden 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22001	Alva 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22002	Daskalakis 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22006	De3 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22008	da 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22009	Bramesfeld 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22010	Baker 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22014	Warman 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22015	Rocha 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22017	Drake1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22019	Battersby 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22020	Kindler1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22021	Farreny1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22022	de Bont 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22023	Cohen 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22024	NCT02199743	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22025	NCT02202213 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22026	NCT02202226 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22027	ISRCTN12055530	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22028	ISRCTN66900787	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22029	NCT01834638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22030	Sukegawa 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22033	Lerner 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22036	Ozkan1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22038	Cook 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22039	Lin 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22040	Amr 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22042	Lu 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22043	Fekadu 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22044	Terzian 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22046	Farokhnia 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22047	Quisenaerts 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22049	O'Brien 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22053	Jager 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22054	Palepu 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22057	Dwinger 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22058	Gaughran 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22060	Caforio 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22061	Findling 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22063	Owen 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22065	NTR10340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22066	Petretto 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22067	Ermilov 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22068	JPRN-UMIN000007942	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22069	Lane 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22071	Johnsen 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22075	Tinland 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22076	Hori 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22077	Stauffer 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22078	Garrido 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22080	Wang3 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22081	Agnihotri 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22082	McGuire 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22083	Komatsu 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22087	Ranjbar 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22089	Browning 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22090	Kelly 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22091	Bucci 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22092	Bartels 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22093	Naber 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22094	Boggs 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22095	Reeves 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22097	Ikai 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22098	Saeko 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22099	Drake2 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22100	Hatta 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22102	Sigrunarson 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22104	McEvoy 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22105	Mallikaarjun 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22108	Sanz 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22109	Perez 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22110	Park1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22112	Wing1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22113	Killackey 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22115	Jarskog 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22116	Freeman 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22118	Fischer1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22120	Amrami 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22121	Vahia 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22124	Roldan 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22126	Prikryl 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22127	Tek 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22129	Best 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22132	Lin 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22135	Goff1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22136	Cipriani 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22137	Putkonen 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22138	Deutsch 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22139	Meskanen1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22141	Chen 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22142	Lasser 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22143	Gohar 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22144	Hoeben 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22146	Brooner 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22149	Brunette 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22151	Hallak 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22154	Shao 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22155	Crespo 2013 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22158	Krakvik 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22159	Sin 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22160	Mantovani 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22162	Rezaei 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22164	Franck 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22167	Marsteller 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22168	Hu1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22172	Kukla1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22176	Egan 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22177	Matthews 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22178	Bagoien 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22180	Noroozian 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22181	McGinty 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22182	Hoffman 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22186	Ayesa 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22189	Chien3 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22190	Leff 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22191	Chien4 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22192	Meszaros 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22193	Fan 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22194	Lin 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22196	Crespo 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22197	Nasrallah 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22198	Attux 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22199	Lee4 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22201	Lozano 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22202	Janney1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22203	Hoshii 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22204	Petrovsky 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22205	Bechi 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22206	Khodaie 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22207	Tsang1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22209	Nunes1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22210	Jarskog1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22214	Naber 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22215	Warren 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22216	Poyurovsky 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22217	Lee 2013 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22218	Modabbernia 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22219	Gunduz 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22220	Jin 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22221	McGorry 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22223	Chukhin 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22224	Falkai 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22226	Leshner 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22228	McClure 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22229	Lindenmayer 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22230	Sousa 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22232	Scheewe 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22233	D'Souza 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22234	Woods 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22237	Hansen1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22240	Scheewe1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22241	Kahn 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22242	Georgieva 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22243	Fan1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22244	Ou 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22247	Ghiasi 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22248	Oranje1 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22252	Jindal 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22254	Chaudhry 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22255	Lam 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22256	Semenikhin 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22258	Zarea 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22259	NCT01964404 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22260	NCT01992913 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22261	NCT01995864 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22262	Kukla 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22263	NCT02032680 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22264	NCT02008773 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22265	NCT02006628 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22267	NCT02034474 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22268	NCT02019459 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22271	Hou 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22274	Economou 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22276	van Oosterhout 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22277	Bratu 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22280	Denia 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22282	PRIME	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22283	Rosenheck 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22284	Pijnenborg 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22286	McEvoy 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22287	Adams 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22288	Csipke 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22289	Crivelaro 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22291	Smith 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22292	Choi 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22293	Takeuchi 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22294	Schreiner 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22297	Ganguli 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22298	Cella 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22300	Sanz 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22301	MÃ¼ller 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22302	Burshtein 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22303	Hosford 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22304	Rabinowitz 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22305	Girgis 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22307	Killackey 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22310	Yu 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22313	NCT01192867	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22314	Nuechterlein KH 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22315	Reeder1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22317	Cantillon 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22319	Garrido 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22320	Vizzotto 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22321	Vanover1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22325	Michalopoulou 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22327	Pijnenborg1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22328	Yuan 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22329	Li 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22330	Bhatia 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22332	Cacciotti 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22333	CTRI-2014-07-004712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22334	Puig 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22335	Ghanizadeh 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22336	Birchwood 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22337	Mirabzadeh 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22339	NCT02098408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22341	NCT02091388 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22342	NCT02090335	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22343	NCT02088983 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22344	NCT02086786 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22345	NCT02086162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22346	NCT02085421 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22347	NCT02079844 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22348	NCT02074319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22349	NCT020370741 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22350	NCT02069392 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22351	NCT02067975 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22352	NCT02062190 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22353	NCT02054702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22354	NCT02049021 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22355	NCT02047539	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22356	NCT02040883 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22357	NCT02037581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22358	JPRN-UMIN000012949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22359	JPRN-JapicCTI-121929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22361	IRCT2013102915206N1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22362	CTRI-2014-03-00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22363	ChiCTR-TRC-14004160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22364	ChiCTR-TRC-14004186	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22365	ChiCTR-TRC-14004187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22366	ACTRN12614000175673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22367	ACTRN1261400012 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22368	ISRCTN99485756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22369	ISRCTN19447796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22370	ISRCTN06022197	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22371	ISRCTN23930628	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22372	Gumley 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22373	ISRCTN34871361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22374	ISRCTN06180958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22375	ISRCTN06815355	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22376	ISRCTN88145142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22377	ISRCTN16488358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22378	ISRCTN34966555	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22379	ACTRN1261400037 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22380	ACTRN12614000457640	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22381	CTRI-2014-04-004521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22382	ChiCTR-TRC-14004451	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22383	ChiCTR-TRC-14004854	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22384	CTRI-2014-04-00 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22385	DRKS00006091 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22387	IRCT201203129267N1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22388	IRCT20140312110 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22389	IRCT20140323170 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22390	IRCT2014041317246N1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22391	JPRN-UMIN000013746	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22392	JPRN4 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22393	ISRCTN43548483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22395	NCT02088060 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22396	NCT02095457 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22397	NCT02097563 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22398	NCT02101372 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22399	NCT02102113 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22400	NCT02104752 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22401	NCT02109562 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22402	NCT02114593 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22403	NCT02118610 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22404	NCT02124811 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22405	NCT02127879 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22407	NCT02130596 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22408	NCT02131116 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22409	NCT02131129 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22410	NCT02134418 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22411	NCT02146547 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22412	NCT02151656 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22413	NCT02155699 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22414	NCT02156908 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22415	NCT02159001 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22416	NCT02161718 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22417	NCT02164981 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22418	NCT02167620 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22419	NCT02168166 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22420	NCT02170051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22421	NCT02174510	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22422	NCT02174523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22423	NCT02175251 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22424	NCT02176044 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22425	NCT02181777 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22426	NCT02181803 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22427	NCT02186769 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22428	NCT02188121 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22429	Moritz 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22430	Salman 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22431	Palm 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22432	Nordentoft 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22433	NCT01981356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22434	Kawanishi 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22436	Chaudhry 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22437	NCT01192906	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22440	Jahanian 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22441	Zeinoddini 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22442	Zhu 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22443	Barekatain 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22444	Kantrowitz 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22445	Hatta 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22447	Fleischhacker W 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22449	Sytema 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22450	Jerome 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22452	Muller 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22453	Davis 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22454	Mayabhate 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22455	Siever 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22456	Rabany 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22457	Lopez 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22458	Fu 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22459	Ganguli1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22460	Filho 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22461	Angelo 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22462	Morozova 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22463	Gerretsen 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22464	Demanuele 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22466	Liang 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22467	Chen 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22468	Tarrier 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22469	Ostergaard 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22470	Kidd 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22471	Patterson 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22474	Detke 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22475	Beebe 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22476	Zhang 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22477	Krakowski 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22478	Tjia 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22480	Usall 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22481	Rabany1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22482	Chan 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22484	Hori 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22487	Malm 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22488	Khaleghparast 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22489	Michon 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22491	Zhou 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22492	NCT01667601	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22493	Yao 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22494	Nemoto 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22495	Gobbi 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22496	Matsuda 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22498	Smith1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22499	de 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22500	Lovell 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22502	Marvin 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22503	Miklowitz 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22504	Grocke 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22505	Tek 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22508	Leung 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22509	Quee 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22510	Kinon 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22512	Calvo 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22514	Cella 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22515	Vanover2 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22516	Bartzokis 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22517	Girgis 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22518	Brunelin 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22519	O'Brien 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22522	Van1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22523	Salzer 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22524	Romo 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22525	Woods 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22529	Tybura 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22530	Li 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22531	Davis 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22532	Barrowclough 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22533	Dang 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22534	Graham 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22537	Kianimehr 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22538	Liu 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22539	Zhao 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22540	Oshima 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22541	Umbricht 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22542	Wolwer 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22543	Prikryl 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22544	Salyers 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22546	Cleton 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22547	Fadai 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22549	Pratts 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22550	Kilbourne 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22552	Favrod 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22554	Craig 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22555	Schrank 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22557	Ma 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22558	Humm 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22560	Rosell 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22561	Velligan 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22562	NCT02194933 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22563	NCT02195700 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22564	NCT02197286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22565	NCT02204787 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22566	NCT02204956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22567	NCT02205099 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22747	Kilian 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22568	NCT02205684	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22569	NCT02222909 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22570	NCT02227160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22571	NCT02230384 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22573	NCT02237235 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22574	NCT02237417 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22575	NCT02240173 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22576	NCT02240446 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22577	NCT02188732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22578	ACTRN1261400095 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22579	CTRI-2014-07-00 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22580	CTRI-2014-07-002 201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22582	IRCT20140715155 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22583	ISRCTN02672532	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22584	ISRCTN12929657	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22585	ISRCTN47185233	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22587	JPRN6 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22588	JPRN7 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22589	NCT01920685 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22590	NTR4716 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22591	Silverstein 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22592	Garety 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22593	Pagsberg 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22595	Emsley 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22596	Li 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22597	Kaplan 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22598	Waller 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22599	Briki 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22600	Dickerson 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22601	Miyaoka 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22603	McEvoy 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22604	Gibson 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22605	Adams 2014b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22606	Kulkarni 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22608	NCT01869660	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22612	JPRN-UMIN000004511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22613	Abhishekh 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22614	von 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22615	Hasson 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22617	Larsen 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22619	Wang 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22620	Hosseini 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22621	Meltzer 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22622	Schnell 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22623	Kuokkanen 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22690	Kelly 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22624	Shen 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22625	Modabbernia 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22626	Si 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22628	Rui 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22629	Botha 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22630	NCT01297985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22633	Szeszko 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22634	Ritsner 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22635	Weiden 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22636	Stobbe 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22637	Schoemaker 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22638	Litman 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22640	Mosolov 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22641	Morrison 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22642	Gold 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22643	Liu1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22644	Happell 2014 a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22645	Ernst Nielsen 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22646	Cain 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22647	Khodaie 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22649	Bogenschutz 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22651	Druss 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22652	Gong 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22654	Preskorn 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22655	Maat 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22656	Roberts 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22657	Durgam1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22658	Ishoy 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22659	Evins 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22660	Leatherman 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22662	Boege 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22664	Huerta 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22667	Kluge 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22668	Zhou1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22669	Biedermann 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22670	Bartels 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22671	ACTRN12609001039279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22672	Kaphzan 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22675	Taveira 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22676	Smeerdijk 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22677	Muscatello 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22680	Roh 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22684	Quisenaerts 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22685	Farokhnia 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22686	Fallahi 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22687	Crespo 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22688	Happell1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22689	Rakesh 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22691	Sanchez 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22692	Chen 2014 b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22694	Pelayo 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22697	Arvidsson 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22698	Cordes 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22699	NCT02160249 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22700	NCT02214667 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22701	NCT02234258 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22702	Huang 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22703	Granholm 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22704	Jeppesen 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22705	Petersen 2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22706	Liang 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22707	Marder 1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22708	NCT01193166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22710	Wynn 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22712	Weickert 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22713	Vanover 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22714	Takeuchi 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22715	Szeszko 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22717	Smit 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22718	Silverman 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22719	Silverman 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22720	Shuang 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22721	Shrestha 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22723	Schobel 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22724	Roffman 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22725	Prinsloo 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22726	NCT02349880	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22727	NCT02342210	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22728	NCT02341131 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22729	NCT02340559 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22730	NCT02337439 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22731	NCT02336581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22732	NCT02334228 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22733	NCT02332798 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22734	NCT02329431 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22735	NCT02326389 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22736	NCT02322437 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22737	NCT02320032 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22738	NCT02319746 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22739	NCT02313493 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22740	NCT02308956 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22741	NCT02305823 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22742	NCT02304432 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22743	Marenco 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22745	Kriel 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22746	Kothari 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22748	Kelly 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22750	JPRN 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22751	ISRCTN14760638 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22752	IRCT20130907145 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22753	Hussain 2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22754	Holtzhausen 2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22755	Holtzhausen 2008a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22756	HKCTR 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22757	HKCTR-1781	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22758	HKCTR 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22759	HKCTR-1438	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22760	HKCTR 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22761	Haslett 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22762	Hard 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22763	Grunder 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22764	Girgis 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22765	Gioia 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22766	Gerretsen 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22768	Fleischhacker  2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22769	Fleischhacker 2014b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22770	Evins 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22771	EUCTR2014 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22773	Davis 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22774	Davis1 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22775	CTRI 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22776	CTRI 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22777	Correll 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22778	Correll 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22780	Cho 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22783	Botha 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22784	Botha 2013a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22786	ACTRN1261400131 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22789	Shoja 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22790	McGinty 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22830	Perez 20141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22831	Kilbourne 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22833	Welch 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22834	Moscovice 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22836	ISRCTN63162737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22837	Fornells 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22838	NCT01057849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22840	Katz 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22842	Kim 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22843	Fitzgerald 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22844	Wusthoff 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22847	Looijmans 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22849	Ayoughi 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22852	Lam 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22854	Lee 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22855	Petrides 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22931	Falkai 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22857	Aschbrenner 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22861	Marder 1994a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22862	Marder 1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22863	Zhao 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22864	Abhishekh 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22865	Adams 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22868	Alphs 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22869	Alptekin 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22870	Alvarez 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22872	Ando 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22875	Averbeck 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22876	Baandrup 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22878	Baker 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22882	Bartzokis 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22883	Bechdolf 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22884	Beebe 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22885	Bell 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22886	Berwaerts 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22887	Best 2015a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22888	Best 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22889	Bhatia 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22892	Bogers 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22894	Broussard 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22895	Brown 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22896	Brown 2015a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22897	Brunelin 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22899	Buchanan 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22901	Burshtein 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22902	Cadenhead 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22903	Calver 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22904	Cantero 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22906	Chan 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22907	Chen 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22908	Chen 2012b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22909	Chisholm 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22910	Choi 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22911	Choi 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22912	Christensen 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22913	Cihakova 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22916	Cotton 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22921	Davis 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22922	Davis 2015a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22923	De 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22924	DeMartinis 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22926	Duncan 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22927	Dunn 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22928	Dutta 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22929	Eack 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23169	Subotnik 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22932	Falkai 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22933	Falkai 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22934	Feifel 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22935	Fisher 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22938	Frohlich 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22940	Gaebel 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22941	Giesbrecht 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22944	Gleeson 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22945	Glenthoj 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22947	Goldsmith 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22948	Haig 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22949	Hallak 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22950	Harris 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22951	Hassan 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22953	Hjorth 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22954	Hjorthoj 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22955	Hjorthoj 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22956	Ho 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22957	Horan 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22958	Hoy 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22959	Hsih 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22961	Ibrahim 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22962	Iizuka 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22963	Ikai 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22964	ISRCTN11422802	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22965	ISRCTN12424842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22966	ISRCTN58327365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22967	ISRCTN86762253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22968	Johannesen 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22969	Johnsen 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22970	Jorgensen 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22971	Kahn 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22972	Kaiser 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22973	Kane 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22977	Kane 2015a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22979	Kantrowitz 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22981	Kato 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22982	Keks 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22983	Kelly 2014b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22984	Kern 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22985	Kertchok 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22986	Kidorf 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22987	Killackey 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22990	Kim 2012c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22991	Kim 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22992	Kim 2014b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22993	Kimhy 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22994	Kishore 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22995	Knegtering 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22996	Kontis 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22997	Koolaee 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22998	Koren 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22999	Kuipers 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23001	Kumar 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23002	Kurtz 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23003	Kurtz 2015a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23004	Laffont 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23005	Larr 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23006	Lassen 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23007	Lasser 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23008	Lavania 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23010	Lees 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23012	Levy 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23013	Leweke 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23014	Leweke 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23017	Lin 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23018	Lindenmayer 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23019	Lindenmayer 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23020	Lisiecka 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23021	Litman 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23022	Liu 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23026	Loewy 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23028	Lombardo 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23029	Madigan 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23030	Malhotra 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23031	Malla 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23032	Maples 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23033	Marder 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23034	Marder 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23035	Marder 2015a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23036	Marsh 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23037	Matsuda 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23038	McEwen 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23040	McGorry 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23041	McGurk 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23042	Melzer 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23043	Michalopoulou 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23047	Morrison 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23049	Morrison 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23050	Moun 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23053	Muller 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23054	Muser 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23055	Nalesnik 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23057	NCT02354001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23058	NCT02357797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23059	ditory 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23060	NCT02360319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23061	NCT02360566	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23062	NCT02360813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23063	NCT02366117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23064	NCT02377505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23065	NCT02380885	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23066	NCT02383095	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23067	NCT02386605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23068	NCT02390557	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23069	NCT02391649	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23070	NCT02392468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23071	NCT02396797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23072	NCT02398279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23073	NCT02404194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23074	NCT02407808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23075	NCT02408198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23076	NCT02413164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23077	NCT02417142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23078	NCT02418819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23079	NCT02420015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23080	NCT02421146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23081	NCT02421237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23082	NCT02421965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23083	NCT02424188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23084	NCT02426983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23085	NCT02427542	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23086	NCT02430935	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23087	NCT02431702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23088	NCT02435095	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23089	NCT02435784	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23090	Nelson 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23091	Nemoto 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23092	Newcomer 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23094	Nieman 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23095	Nienow 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23100	Nuechterlein 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23101	Nuechterlein 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23102	O'Brien 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23103	O'Connor 2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23105	Oranje 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23106	Owen 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23108	Pajonk 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23109	Palm 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23112	Park 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23113	Patino 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23114	Pedersen 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23116	Penades 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23118	Petrides 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23119	Petrides 2015a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23120	Picco 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23123	Pikalov 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23124	Pikalov 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23125	Piskulic 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23127	Pontes 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23129	Ramsay 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23131	Rapp 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23132	Redmeijer 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23133	Rinaldi 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23134	Roberts 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23135	Roder 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23136	Roffman 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23137	Ruhrmann 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23138	Russinova 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23140	Sab 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23141	Saddichha 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23142	Sato 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23144	Savitz 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23145	Scheewe 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23148	RAISE-ETP	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23152	Schulz 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23153	Shaygan 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23154	Sheikhmoonesi 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23156	Siever 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23157	Siever 2015a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23159	Silbert 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23160	Silverstein 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23163	Smith 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23164	Sommer 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23166	Stain 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23168	Steinberg 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23171	Sullivan 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23172	Takano 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23173	Takeuchi 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23175	Tanner 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23176	Tecic 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23177	Thorndike 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23178	Tikka 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23179	Tuchman 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23181	Twamley 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23182	Uher 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23183	Umbricht 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23187	Van Der Meer 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23189	Van Lutterveld 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23191	Vasfi 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23192	Velden 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23193	Velligan 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23194	Velligan 2015a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23196	Vinogradov 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23197	Vinogradov 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23198	Vizzotto 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23199	Vyas 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23200	Walther 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23201	Ward 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23203	Warren 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23204	Wehring 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23205	Wehring 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23206	Weickert 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23209	Weiser 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23210	Wenneberg 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23211	Woelwer 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23212	Wojtalik 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23213	Woolley 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23214	Wu 2012a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23216	Yamaguchi 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23217	Zvonkovic 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23218	Stralia 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23219	ChiCTR-IOR-15006278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23220	ChiCTR-IPR-15006246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23221	CTRI-2015-01-005438	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23222	CTRI-2015-01-005448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23223	CTRI-2015-02-005575	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23224	CTRI 2015b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23225	Gaweda 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23226	Harder 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23228	Jones 2013a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23230	Polo 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23232	Schrijver 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23233	Stevenson 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23235	EUCTR2014-001968-35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23236	EUCTR2014-002765-30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23237	DRKS00007888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23238	DRKS00008018	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23239	JPRN 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23240	JPRN-UMIN000017047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23241	Bendall 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23243	Chen 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23244	Deane 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23248	Habib 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23251	Hindocha 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23254	Kane 2015b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23258	Lahti 1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23260	Meltzer 2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23261	Mueller 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23262	Naeem 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23263	Nottage 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23264	Othman 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23267	Rapaport 1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23270	Schirmer 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23271	Stiekema 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23273	Volpe 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23274	Wang 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23275	Wani 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23276	Xia 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23278	Yang 2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23279	Zhang 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23283	Woolley 2015a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23284	Zhang 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23285	Ray 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23286	NTR5135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23287	Berry 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23288	Buonocore 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23291	Jenkins 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23294	Kasckow 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23296	Koren 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23297	Kurtz 2015b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23299	Lee 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23300	Li 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23302	Mendella 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23307	Ran 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23308	Uher 2014a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23309	Veldhuizen 2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23311	Peet 2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: trial2condition; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY trial2condition (trial_id, condition_id) FROM stdin;
\.


--
-- Data for Name: trial2drug; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY trial2drug (trial_id, drug_id) FROM stdin;
\.


--
-- Data for Name: trial2method; Type: TABLE DATA; Schema: clean; Owner: postgres
--

COPY trial2method (trial_id, method_id) FROM stdin;
\.


--
-- Name: trial_id_seq; Type: SEQUENCE SET; Schema: clean; Owner: postgres
--

SELECT pg_catalog.setval('trial_id_seq', 1, false);


--
-- Name: condition_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY condition
    ADD CONSTRAINT condition_pkey PRIMARY KEY (id);


--
-- Name: document_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document
    ADD CONSTRAINT document_pkey PRIMARY KEY (id);


--
-- Name: drug_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY drug
    ADD CONSTRAINT drug_pkey PRIMARY KEY (id);


--
-- Name: method_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY method
    ADD CONSTRAINT method_pkey PRIMARY KEY (id);


--
-- Name: provenance_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY provenance
    ADD CONSTRAINT provenance_pkey PRIMARY KEY (id);


--
-- Name: register_entry_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY register_entry
    ADD CONSTRAINT register_entry_pkey PRIMARY KEY (id);


--
-- Name: results_doc_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY results_doc
    ADD CONSTRAINT results_doc_pkey PRIMARY KEY (id);


--
-- Name: source_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY source
    ADD CONSTRAINT source_pkey PRIMARY KEY (id);


--
-- Name: trial2condition_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trial2condition
    ADD CONSTRAINT trial2condition_pkey PRIMARY KEY (trial_id, condition_id);


--
-- Name: trial2drug_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trial2drug
    ADD CONSTRAINT trial2drug_pkey PRIMARY KEY (trial_id, drug_id);


--
-- Name: trial2method_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trial2method
    ADD CONSTRAINT trial2method_pkey PRIMARY KEY (trial_id, method_id);


--
-- Name: trial_pkey; Type: CONSTRAINT; Schema: clean; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trial
    ADD CONSTRAINT trial_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

