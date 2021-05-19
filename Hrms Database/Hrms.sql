


---
--- drop tables
---

DROP TABLE IF EXISTS confirms_employers_by_system_employees;
DROP TABLE IF EXISTS activation_codes_employers;
DROP TABLE IF EXISTS activation_codes_job_seekers;
DROP TABLE IF EXISTS activation_codes;
DROP TABLE IF EXISTS job_positions;
DROP TABLE IF EXISTS system_employees;
DROP TABLE IF EXISTS employer_phones;
DROP TABLE IF EXISTS employers;
DROP TABLE IF EXISTS job_seekers;
DROP TABLE IF EXISTS users;



---
--- USERS TABLE (KULLANICILAR TABLOSU)
--- Name: users; Type: TABLE; Schema: public; 
---

CREATE TABLE public.users
(
    id serial NOT NULL,
    email character varying(250) NOT NULL,
    password character varying(250) NOT NULL,
    created_at date NOT NULL DEFAULT CURRENT_DATE
);



---
--- JOB SEEKERS TABLE (İŞ ARAYANLAR TABLOSU)
--- Name: job_seekers; Type: TABLE; Schema: public; 
---

CREATE TABLE public.job_seekers
(
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    nationality_id character(11) NOT NULL,
    date_of_birth date NOT NULL
);



---
--- EMPLOYERS TABLE (İŞ VERENLER TABLOSU)
--- Name: employers; Type: TABLE; Schema: public; 
---

CREATE TABLE public.employers 
(
    id integer NOT NULL,
    company_name character varying(250) NOT NULL,
    website_address character varying(250) NOT NULL
);



---
--- EMPLOYER PHONES TABLE (İŞ VEREN ŞİRKETLERİN TELEFON NUMARALARI)
--- Name: employer_phones; Type: TABLE; Schema: public; 
---
 
CREATE TABLE public.employer_phones
(
    id serial NOT NULL,
    employer_id integer NOT NULL,
    phone_number character varying(20) NOT NULL
);



---
--- SYSTEM EMPLOYEES TABLE (SİSTEM ÇALIŞANLARI TABLOSU)
--- Name: system_employees; Type: TABLE; Schema: public; 
---

CREATE TABLE public.system_employees
(
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL
);



---
--- JOB POSITIONS TABLE (İŞ POZİSYONLARI TABLOSU)
--- Name: job_positions; Type: TABLE; Schema: public; 
---

CREATE TABLE public.job_positions
(
    id serial NOT NULL,
    name character varying(100) NOT NULL
);



---
--- ACTIVATION CODES TABLE (AKTİCVASYON KODLARI TABLOSU) 
--- Name: activation_codes; Type: TABLE; Schema: public; 
---

CREATE TABLE public.activation_codes
(
    id serial NOT NULL,
    email_activation_code character varying(100) NOT NULL,
    is_confirmed boolean NOT NULL DEFAULT FALSE
);



---
--- ACTIVATION CODES FOR JOB SEEKERS TABLE 
--- (İŞ ARAYANLAR İÇİN AKTİCVASYON KODLARI TABLOSU İLE İLİŞKİLİ TABLO) 
--- Name: activation_codes_job_seekers; Type: TABLE; Schema: public; 
---

CREATE TABLE public.activation_codes_job_seekers
(
    id integer NOT NULL,
    job_seeker_user_id integer NOT NULL
);



---
--- ACTIVATION CODES EMPLOYERS TABLE 
--- (İŞ VEREN ŞİRKETLER İÇİN AKTİCVASYON KODLARI TABLOSU İLE İLİŞKİLİ TABLO) 
--- Name: activation_codes_employers; Type: TABLE; Schema: public; 
---

CREATE TABLE public.activation_codes_employers
(
    id integer NOT NULL,
    employer_user_id integer NOT NULL
);



---
--- CONFIRMS EMPLOYERS BY SYSTEM EMPLOYEES TABLE 
--- (SİSTEM ÇALIŞANLARININ İŞ VEREN ŞİRKETLERE ONAY VERDİĞİNİ TUTAN TABLO) 
--- Name: confirms_employers_by_system_employees; Type: TABLE; Schema: public; 
---

CREATE TABLE public.confirms_employers_by_system_employees
(
    id serial NOT NULL,
    system_employee_user_id integer NOT NULL,
    employer_user_id integer NOT NULL,
    is_confirmed boolean NOT NULL DEFAULT FALSE
);



---
--- Data for Name: job_positions; Type: TABLE DATA; 
---

INSERT INTO public.job_positions ("name") 
VALUES  ('Software Developer'), ('Software Architect'), ('Software Team Lead'),
		('Junior Software Engineer'), ('Senior Software Engineer'), ('Embedded Software Engineer'), 
		('Senior C# .net Developer'), ('C++ Developer'), ('Software Test Engineer'),
		('DevOps Engineer'), ('System Administrator');



---
--- Data for Name: users; Type: TABLE DATA; 
---

INSERT INTO public.users VALUES (DEFAULT, 'alihsanakcayy@gmail.com', '123123', '17.09.2020');
INSERT INTO public.users VALUES (DEFAULT, 'aselsann@aselsann.com', '123124', '20.11.2020');
INSERT INTO public.users VALUES (DEFAULT, 'microsoftt@microsoftt.com', '123125', '25.12.2020');
INSERT INTO public.users VALUES (DEFAULT, 'elanaz.dursun@gmail.com', '123126', '21.01.2021');
INSERT INTO public.users VALUES (DEFAULT, 'fatma.arikan@gmail.com', '123127', '14.02.2021');
INSERT INTO public.users VALUES (DEFAULT, 'lale.ege@gmail.com', '123128', '16.03.2021');
INSERT INTO public.users VALUES (DEFAULT, 'selman.erkus@gmail.com', '123129', '13.04.2021');
INSERT INTO public.users VALUES (DEFAULT, 'teknosaa@teknosaa.com', '123130', '8.04.2021');
INSERT INTO public.users VALUES (DEFAULT, 'elif.esat@gmail.com', '123131', '11.05.2021');
INSERT INTO public.users VALUES (DEFAULT, 'eyup.gonul@gmail.com', '123132', '18.05.2021');
INSERT INTO public.users VALUES (DEFAULT, 'furkan.karakan@gmail.com', '123133', DEFAULT);



---
--- Data for Name: job_seekers; Type: TABLE DATA; 
---

INSERT INTO public.job_seekers VALUES (4, 'elanaz', 'dursun', '12345678910', '1.08.1999');
INSERT INTO public.job_seekers VALUES (6, 'lale', 'ege', '12345678911', '21.02.2000');
INSERT INTO public.job_seekers VALUES (7, 'selman', 'erkuş', '12345678912', '12.07.1992');
INSERT INTO public.job_seekers VALUES (9, 'elif', 'esat', '12345678913', '8.05.1988');
INSERT INTO public.job_seekers VALUES (10, 'eyüp', 'gönül', '12345678914', '5.11.1982');
INSERT INTO public.job_seekers VALUES (11, 'furkan', 'karakan', '12345678915', '23.09.1994');



---
--- Data for Name: employers; Type: TABLE DATA; 
---

INSERT INTO public.employers VALUES (2, 'aselsann', 'aselsann.com');
INSERT INTO public.employers VALUES (3, 'microsoftt', 'microsoftt.com');
INSERT INTO public.employers VALUES (8, 'teknosaa', 'teknosaa.com');



---
--- Data for Name: employer_phones; Type: TABLE DATA; 
---

INSERT INTO public.employer_phones VALUES (DEFAULT, 2, '(0333) 592 10 00');
INSERT INTO public.employer_phones VALUES (DEFAULT, 3, '444 00 99');
INSERT INTO public.employer_phones VALUES (DEFAULT, 2, '(0666) 592 10 00');
INSERT INTO public.employer_phones VALUES (DEFAULT, 8, '(0333) 541 18 78');



---
--- Data for Name: system_employees; Type: TABLE DATA; 
---

INSERT INTO public.system_employees VALUES (1, 'ali ihsan', 'akçay');
INSERT INTO public.system_employees VALUES (5, 'fatma', 'arıkan');



---
--- Data for Name: activation_codes; Type: TABLE DATA; 
---

INSERT INTO public.activation_codes VALUES (DEFAULT, '5ef1r453r1', TRUE);
INSERT INTO public.activation_codes VALUES (DEFAULT, 'f51fdb651b', TRUE);
INSERT INTO public.activation_codes VALUES (DEFAULT, 'djj51ik512', TRUE);
INSERT INTO public.activation_codes VALUES (DEFAULT, '5k5l5t412x', TRUE);
INSERT INTO public.activation_codes VALUES (DEFAULT, '0e9t5u5j8i', TRUE);
INSERT INTO public.activation_codes VALUES (DEFAULT, '0pofewkj85', TRUE);
INSERT INTO public.activation_codes VALUES (DEFAULT, '409tqokfew', TRUE);
INSERT INTO public.activation_codes VALUES (DEFAULT, '985okrfkxs', TRUE);
INSERT INTO public.activation_codes VALUES (DEFAULT, '8651hkmsrp', TRUE);



---
--- Data for Name: activation_codes_job_seekers; Type: TABLE DATA; 
---

INSERT INTO public.activation_codes_job_seekers VALUES (1, 4);
INSERT INTO public.activation_codes_job_seekers VALUES (2, 6);
INSERT INTO public.activation_codes_job_seekers VALUES (4, 7);
INSERT INTO public.activation_codes_job_seekers VALUES (5, 9);
INSERT INTO public.activation_codes_job_seekers VALUES (6, 10);
INSERT INTO public.activation_codes_job_seekers VALUES (9, 11);



---
--- Data for Name: activation_codes_employers; Type: TABLE DATA; 
---

INSERT INTO public.activation_codes_employers VALUES (3, 2);
INSERT INTO public.activation_codes_employers VALUES (7, 3);
INSERT INTO public.activation_codes_employers VALUES (8, 8);



---
--- Data for Name: confirms_employers_by_system_employees; Type: TABLE DATA; 
---

INSERT INTO public.confirms_employers_by_system_employees VALUES (DEFAULT, 1, 2, TRUE);
INSERT INTO public.confirms_employers_by_system_employees VALUES (DEFAULT, 5, 3, TRUE);
INSERT INTO public.confirms_employers_by_system_employees VALUES (DEFAULT, 1, 8, TRUE);



--
-- Name: pk_users; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.users 
ADD CONSTRAINT pk_users PRIMARY KEY (id);



--
-- Name: pk_job_seekers; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.job_seekers 
ADD CONSTRAINT pk_job_seekers PRIMARY KEY (id);



--
-- Name: pk_employers; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.employers 
ADD CONSTRAINT pk_employers PRIMARY KEY (id);



--
-- Name: pk_employer_phones; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.employer_phones 
ADD CONSTRAINT pk_employer_phones PRIMARY KEY (id);



--
-- Name: pk_system_employees; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.system_employees 
ADD CONSTRAINT pk_system_employees PRIMARY KEY (id);



--
-- Name: pk_job_positions; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.job_positions 
ADD CONSTRAINT pk_job_positions PRIMARY KEY (id);



--
-- Name: pk_activation_codes; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.activation_codes 
ADD CONSTRAINT pk_activation_codes PRIMARY KEY (id);



--
-- Name: pk_activation_codes_job_seekers; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.activation_codes_job_seekers 
ADD CONSTRAINT pk_activation_codes_job_seekers PRIMARY KEY (id);



--
-- Name: pk_activation_codes_employers; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.activation_codes_employers 
ADD CONSTRAINT pk_activation_codes_employers PRIMARY KEY (id);



--
-- Name: pk_confirms_employers_by_system_employees; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.confirms_employers_by_system_employees 
ADD CONSTRAINT pk_confirms_employers_by_system_employees PRIMARY KEY (id);



--
-- Name: uk_users_email; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.users
ADD CONSTRAINT uk_users_email UNIQUE (email);



--
-- Name: uk_job_seekers_nationality_id; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.job_seekers
ADD CONSTRAINT uk_job_seekers_nationality_id UNIQUE (nationality_id);



--
-- Name: uk_job_positions_name; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.job_positions 
ADD CONSTRAINT uk_job_positions_name UNIQUE (name);



--
-- Name: fk_job_seekers_users; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.job_seekers 
ADD CONSTRAINT fk_job_seekers_users FOREIGN KEY (id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE;



--
-- Name: fk_employers_users; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.employers
ADD CONSTRAINT fk_employers_users FOREIGN KEY (id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE;



--
-- Name: fk_employer_phones_employers; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.employer_phones 
ADD CONSTRAINT fk_employer_phones_employers FOREIGN KEY (employer_id)
        REFERENCES public.employers (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE;



--
-- Name: fk_system_employees_users; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.system_employees 
ADD CONSTRAINT fk_system_employees_users FOREIGN KEY (id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE;



--
-- Name: fk_activation_codes_job_seekers_activation_codes; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.activation_codes_job_seekers 
ADD CONSTRAINT fk_activation_codes_job_seekers_activation_codes FOREIGN KEY (id)
        REFERENCES public.activation_codes (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE;



--
-- Name: fk_activation_codes_job_seekers_job_seekers; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.activation_codes_job_seekers 
ADD CONSTRAINT fk_activation_codes_job_seekers_job_seekers FOREIGN KEY (job_seeker_user_id)
        REFERENCES public.job_seekers (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE;



--
-- Name: fk_activation_codes_employers_activation_codes; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.activation_codes_employers 
ADD CONSTRAINT fk_activation_codes_employers_activation_codes FOREIGN KEY (id)
        REFERENCES public.activation_codes (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE;



--
-- Name: fk_activation_codes_employers_employers; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.activation_codes_employers 
ADD CONSTRAINT fk_activation_codes_employers_employers FOREIGN KEY (employer_user_id)
        REFERENCES public.employers (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE;



--
-- Name: fk_confirms_employers_by_system_employees_system_employees; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.confirms_employers_by_system_employees 
ADD CONSTRAINT fk_confirms_employers_by_system_employees_system_employees FOREIGN KEY (system_employee_user_id)
        REFERENCES public.system_employees (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE;



--
-- Name: fk_confirms_employers_by_system_employees_employers; Type: CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.confirms_employers_by_system_employees 
ADD CONSTRAINT fk_confirms_employers_by_system_employees_employers FOREIGN KEY (employer_user_id)
        REFERENCES public.employers (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE;




