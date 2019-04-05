--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2019-04-05 16:32:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 179 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 179
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 571785)
-- Name: convidado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE convidado (
    rg character varying(255) NOT NULL,
    nome character varying(255),
    evento bigint,
    idade integer,
    sobrenome character varying(255)
);


ALTER TABLE convidado OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 571775)
-- Name: evento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE evento (
    id bigint NOT NULL,
    data character varying(255),
    horario character varying(255),
    local character varying(255),
    nome character varying(255)
);


ALTER TABLE evento OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 571793)
-- Name: evento_convidados; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE evento_convidados (
    evento_id bigint NOT NULL,
    convidados character varying(255) NOT NULL
);


ALTER TABLE evento_convidados OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 571783)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 571813)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role (
    name_role character varying(255) NOT NULL
);


ALTER TABLE role OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 571818)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    login character varying(255) NOT NULL,
    pass character varying(255)
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 571826)
-- Name: usuarios_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios_roles (
    usuario_id character varying(255) NOT NULL,
    role_id character varying(255) NOT NULL
);


ALTER TABLE usuarios_roles OWNER TO postgres;

--
-- TOC entry 2031 (class 0 OID 571785)
-- Dependencies: 174
-- Data for Name: convidado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY convidado (rg, nome, evento, idade, sobrenome) FROM stdin;
aa	aaa	10	1	aa
\.


--
-- TOC entry 2029 (class 0 OID 571775)
-- Dependencies: 172
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY evento (id, data, horario, local, nome) FROM stdin;
10	2019-04-30	09:30	Espaço Cultural José Lins do Rego	Super-Con
\.


--
-- TOC entry 2032 (class 0 OID 571793)
-- Dependencies: 175
-- Data for Name: evento_convidados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY evento_convidados (evento_id, convidados) FROM stdin;
\.


--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 173
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 10, true);


--
-- TOC entry 2033 (class 0 OID 571813)
-- Dependencies: 176
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role (name_role) FROM stdin;
ROLE_ROOT
\.


--
-- TOC entry 2034 (class 0 OID 571818)
-- Dependencies: 177
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (login, pass) FROM stdin;
root	root
\.


--
-- TOC entry 2035 (class 0 OID 571826)
-- Dependencies: 178
-- Data for Name: usuarios_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarios_roles (usuario_id, role_id) FROM stdin;
root	ROLE_ROOT
\.


--
-- TOC entry 1908 (class 2606 OID 571792)
-- Name: convidado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY convidado
    ADD CONSTRAINT convidado_pkey PRIMARY KEY (rg);


--
-- TOC entry 1906 (class 2606 OID 571782)
-- Name: evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id);


--
-- TOC entry 1912 (class 2606 OID 571817)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (name_role);


--
-- TOC entry 1910 (class 2606 OID 571797)
-- Name: uk_apai2mo7q95pfb0e19c8ig5cb; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evento_convidados
    ADD CONSTRAINT uk_apai2mo7q95pfb0e19c8ig5cb UNIQUE (convidados);


--
-- TOC entry 1914 (class 2606 OID 571825)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (login);


--
-- TOC entry 1916 (class 2606 OID 571803)
-- Name: fkbqusj1w91s5724rpm037fyj01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento_convidados
    ADD CONSTRAINT fkbqusj1w91s5724rpm037fyj01 FOREIGN KEY (convidados) REFERENCES convidado(rg);


--
-- TOC entry 1919 (class 2606 OID 571837)
-- Name: fkebiaxjbamgu326glxo1fbysuh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios_roles
    ADD CONSTRAINT fkebiaxjbamgu326glxo1fbysuh FOREIGN KEY (usuario_id) REFERENCES usuario(login);


--
-- TOC entry 1918 (class 2606 OID 571832)
-- Name: fkefntoswg8cckktsk0ha1wpm0i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios_roles
    ADD CONSTRAINT fkefntoswg8cckktsk0ha1wpm0i FOREIGN KEY (role_id) REFERENCES role(name_role);


--
-- TOC entry 1915 (class 2606 OID 571798)
-- Name: fknjgsxyup8u54u3yjk8g378j2p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY convidado
    ADD CONSTRAINT fknjgsxyup8u54u3yjk8g378j2p FOREIGN KEY (evento) REFERENCES evento(id);


--
-- TOC entry 1917 (class 2606 OID 571808)
-- Name: fknpmiqxn4c4envh675ushnsur9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento_convidados
    ADD CONSTRAINT fknpmiqxn4c4envh675ushnsur9 FOREIGN KEY (evento_id) REFERENCES evento(id);


--
-- TOC entry 2042 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-04-05 16:32:05

--
-- PostgreSQL database dump complete
--

