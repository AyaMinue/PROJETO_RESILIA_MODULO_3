BEGIN;


CREATE TABLE IF NOT EXISTS public.tb_departaments
(
    id_departaments serial NOT NULL,
    name character varying(255),
    category character varying(255),
    PRIMARY KEY (id_departaments)
);

CREATE TABLE IF NOT EXISTS public.tb_facilitators
(
    id_facilitators serial NOT NULL,
    name character varying(255),
    type character varying(255),
    cpf character(11) NOT NULL,
    address character varying(255),
    email character varying(255),
    phone_number character varying(255),
    birthday date,
    gender character varying(255),
    id_departments serial NOT NULL,
    PRIMARY KEY (id_facilitators)
);

CREATE TABLE IF NOT EXISTS public.tb_students
(
    id_students serial NOT NULL,
    name character varying(255),
    cpf character(11) NOT NULL,
    email character varying(255),
    address character varying(255),
    phone_number character varying(255),
    birthday date,
    status character varying(255),
    gender character varying(255),
    graduated boolean,
    employed_on_field boolean,
    id_class integer,
    PRIMARY KEY (id_students)
);

CREATE TABLE IF NOT EXISTS public.tb_modules
(
    id_modules serial NOT NULL,
    description character varying(255),
    id_course serial NOT NULL,
    id_class serial NOT NULL,
    PRIMARY KEY (id_modules)
);

CREATE TABLE IF NOT EXISTS public.tb_class
(
    id_class serial NOT NULL,
    name character varying(255),
    id_course serial NOT NULL,
    PRIMARY KEY (id_class)
);

CREATE TABLE IF NOT EXISTS public.tb_course
(
    id_course serial NOT NULL,
    name character varying(255),
    modules character varying(255),
    PRIMARY KEY (id_course)
);

CREATE TABLE IF NOT EXISTS public.tb_students_module_facilitators
(
    id_students serial NOT NULL,
    id_modules serial NOT NULL,
    tech_grade character(100),
    soft_grade character(100),
    module_completed boolean,
    id_facilitator_tech serial NOT NULL,
    id_facilitator_soft serial NOT NULL
);

ALTER TABLE IF EXISTS public.tb_facilitators
    ADD FOREIGN KEY (id_departments)
    REFERENCES public.tb_departaments (id_departaments) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.tb_modules
    ADD FOREIGN KEY (id_course)
    REFERENCES public.tb_course (id_course) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.tb_modules
    ADD FOREIGN KEY (id_class)
    REFERENCES public.tb_class (id_class) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.tb_students_module_facilitators
    ADD FOREIGN KEY (id_students)
    REFERENCES public.tb_students (id_students) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.tb_students_module_facilitators
    ADD FOREIGN KEY (id_modules)
    REFERENCES public.tb_modules (id_modules) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.tb_students_module_facilitators
    ADD FOREIGN KEY (id_facilitator_tech)
    REFERENCES public.tb_facilitators (id_facilitators) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;