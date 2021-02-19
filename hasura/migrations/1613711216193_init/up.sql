CREATE TYPE public.status AS ENUM (
    'start',
    'suspend',
    'stop'
);
CREATE SEQUENCE public.todoid_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.todos (
    todoid bigint DEFAULT nextval('public.todoid_sequence'::regclass) NOT NULL,
    userid bigint,
    status public.status,
    description character varying(500)
);
CREATE SEQUENCE public.userid_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.users (
    userid bigint DEFAULT nextval('public.userid_sequence'::regclass) NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    email character varying(100),
    telephone character varying(50)
);
ALTER TABLE ONLY public.todos
    ADD CONSTRAINT todos_pkey PRIMARY KEY (todoid);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
ALTER TABLE ONLY public.todos
    ADD CONSTRAINT fk_userid FOREIGN KEY (userid) REFERENCES public.users(userid);
