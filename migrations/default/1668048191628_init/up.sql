SET check_function_bodies = false;
CREATE SCHEMA hagrid;
CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
CREATE TABLE hagrid.category (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL
);
CREATE TABLE hagrid.items (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    id_category uuid NOT NULL,
    id_vault uuid
);
CREATE TABLE hagrid.locales (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL
);
CREATE TABLE hagrid.vaults (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    id_locale uuid NOT NULL
);
ALTER TABLE ONLY hagrid.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
ALTER TABLE ONLY hagrid.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);
ALTER TABLE ONLY hagrid.locales
    ADD CONSTRAINT locales_pkey PRIMARY KEY (id);
ALTER TABLE ONLY hagrid.vaults
    ADD CONSTRAINT vault_pkey PRIMARY KEY (id);
