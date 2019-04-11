-- criando database
CREATE DATABASE eventodemoapp
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- tablea evento
CREATE TABLE public.evento
(
    id bigint NOT NULL,
    data character varying(255) COLLATE pg_catalog."default",
    horario character varying(255) COLLATE pg_catalog."default",
    local character varying(255) COLLATE pg_catalog."default",
    nome character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT evento_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.evento
    OWNER to postgres;

-- tabela convidado
CREATE TABLE public.convidado
(
    rg character varying(255) COLLATE pg_catalog."default" NOT NULL,
    idade integer,
    nome character varying(255) COLLATE pg_catalog."default",
    sobrenome character varying(255) COLLATE pg_catalog."default",
    evento bigint,
    CONSTRAINT convidado_pkey PRIMARY KEY (rg),
    CONSTRAINT fknjgsxyup8u54u3yjk8g378j2p FOREIGN KEY (evento)
        REFERENCES public.evento (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.convidado
    OWNER to postgres;

-- tabela de ligação
CREATE TABLE public.evento_convidados
(
    evento_id bigint NOT NULL,
    convidados character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT uk_apai2mo7q95pfb0e19c8ig5cb UNIQUE (convidados)
,
    CONSTRAINT fkbqusj1w91s5724rpm037fyj01 FOREIGN KEY (convidados)
        REFERENCES public.convidado (rg) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fknpmiqxn4c4envh675ushnsur9 FOREIGN KEY (evento_id)
        REFERENCES public.evento (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.evento_convidados
    OWNER to postgres;

-- tabela usuario
CREATE TABLE public.usuario
(
    login character varying(255) COLLATE pg_catalog."default" NOT NULL,
    pass character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT usuario_pkey PRIMARY KEY (login)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.usuario
    OWNER to postgres;

-- tabela role
CREATE TABLE public.role
(
    name_role character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT role_pkey PRIMARY KEY (name_role)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.role
    OWNER to postgres;

-- tabela de ligação
CREATE TABLE public.usuarios_roles
(
    usuario_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    role_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT fkebiaxjbamgu326glxo1fbysuh FOREIGN KEY (usuario_id)
        REFERENCES public.usuario (login) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkefntoswg8cckktsk0ha1wpm0i FOREIGN KEY (role_id)
        REFERENCES public.role (name_role) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.usuarios_roles
    OWNER to postgres;


-- inserindo dados
INSERT INTO public.evento(
	id, data, horario, local, nome)
	VALUES (1, '2019-04-07', '09:30', 'Espaço Cultural José Lins do Rego', 'Super-Con');

INSERT INTO public.convidado(
	rg, idade, nome, sobrenome, evento)
	VALUES ('1.111.111', 'Aryosvalldo', 'Cleef de Souza', 1);


INSERT INTO public.evento_convidados(
	evento_id, convidados)
	VALUES (1, 1);

INSERT INTO public.role(
	name_role)
	VALUES ('ROLE_ROOT');

INSERT INTO public.role(
	name_role)
	VALUES ('ROLE_USER');

INSERT INTO public.usuario(
	login, pass)
	VALUES ('root', '$2a$10$Q8VEH..muagnXUG3/S.22OWSoNcFaff4h7L1pg8UmjS9BwsXxaqrW');

INSERT INTO public.usuarios_roles(
	usuario_id, role_id)
	VALUES ('root', 'ROLE_ROOT');