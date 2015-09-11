BEGIN;


-- Schema
DROP SCHEMA IF EXISTS "clean" CASCADE;
CREATE SCHEMA "clean";
SET search_path = "clean", pg_catalog;
SET client_encoding = 'UTF-8';


-- Trial
CREATE TYPE sex_type AS ENUM ('male', 'female');
CREATE TABLE "trial"
(

    "id" serial,

    -- General
    "public_title" text,
    "scientific_title" text,
    "condition_or_problem" text,
    "source_of_funding" text,
    "date_from" date,
    "date_to" date,

    -- Participants
    "exclusion_criteria" text,
    "sample_size" integer,
    "age_from" smallint,
    "age_to" smallint,
    "sex" sex_type,

    -- Process
    "interventions" text[],
    "outcomes" text[]

);
ALTER TABLE "trial" ADD CONSTRAINT "trial_pkey" PRIMARY KEY ("id");


-- Method
CREATE TABLE "method"
(
    "id" serial,
    "description" text
);
ALTER TABLE "method" ADD CONSTRAINT "method_pkey" PRIMARY KEY ("id");


-- Trial/Method
CREATE TABLE "trial2method"
(
    "trial_id" integer,
    "method_id" integer
);
ALTER TABLE "trial2method" ADD CONSTRAINT "trial2method_pkey" PRIMARY KEY ("trial_id", "method_id");


-- Condition
CREATE TABLE "condition"
(
    "id" serial,
    "meddra" text,
    "who_icd_10" text,
    "description" text
);
ALTER TABLE "condition" ADD CONSTRAINT "condition_pkey" PRIMARY KEY ("id");


-- Trial/Condition
CREATE TABLE "trial2condition"
(
    "trial_id" integer,
    "condition_id" integer
);
ALTER TABLE "trial2condition" ADD CONSTRAINT "trial2condition_pkey" PRIMARY KEY ("trial_id", "condition_id");


-- Drug
CREATE TABLE "drug"
(
    "id" serial,
    "technical_name" text,
    "trade_name" text,
    "who_dde" text,
    "category" text,
    "description" text
);
ALTER TABLE "drug" ADD CONSTRAINT "drug_pkey" PRIMARY KEY ("id");


-- Trial/Drug
CREATE TABLE "trial2drug"
(
    "trial_id" integer,
    "drug_id" integer
);
ALTER TABLE "trial2drug" ADD CONSTRAINT "trial2drug_pkey" PRIMARY KEY ("trial_id", "drug_id");


-- Register entry
CREATE TABLE "register_entry"
(
    "id" serial,
    "source_id"    integer,
    "register_info" jsonb
);
ALTER TABLE "register_entry" ADD CONSTRAINT "register_entry_pkey" PRIMARY KEY ("id");


-- Results doc
CREATE TABLE "results_doc"
(
    "id" serial,
    "title"    text,
    "type" text,
    "structured_data" text,
    "document_id" text,
    "link" text,
    "free_text" text,
    "authors" text,
    "source" text
);
ALTER TABLE "results_doc" ADD CONSTRAINT "results_doc_pkey" PRIMARY KEY ("id");


-- Source
CREATE TABLE "source"
(
    "id" serial,
    "title"    text,
    "descrition" text,
    "category" text,
    "cochrane" boolean
);
ALTER TABLE "source" ADD CONSTRAINT "source_pkey" PRIMARY KEY ("id");


-- Document
CREATE TABLE "document"
(
    "id" serial,
    "label" text,
    "type" text
);
ALTER TABLE "document" ADD CONSTRAINT "document_pkey" PRIMARY KEY ("id");


-- Provenance
CREATE TABLE "provenance"
(
    "id" serial,
    "timestamp"    timestamp
);
ALTER TABLE "provenance" ADD CONSTRAINT "provenance_pkey" PRIMARY KEY ("id");


END;
