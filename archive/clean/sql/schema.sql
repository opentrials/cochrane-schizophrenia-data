BEGIN;


-- Schema
DROP SCHEMA IF EXISTS "clean" CASCADE;
CREATE SCHEMA "clean";
SET search_path = "clean", pg_catalog;
SET client_encoding = 'UTF-8';


-- Trial
CREATE TYPE sex_type AS ENUM ('Male', 'Female');
CREATE TABLE "trial"
(

    "id" serial,

    -- General
    "source_id" integer,
    "registration_id" integer,
    "public_title" text,
    "scientific_title" text,
    "condition_or_problem" text,
    "source_of_funding" text,
    "countries" text,
    "contacts" text,
    "date_from" date,
    "date_to" date,
    "notes" text,

    -- Participants
    "exclusion_criteria" text,
    "sample_size" text,
    "age_from" smallint,
    "age_to" smallint,
    "sex" sex_type[],

    -- Process
    "interventions" text[],
    "outcomes" text[]

);
ALTER TABLE "trial" ADD CONSTRAINT "trial_pkey" PRIMARY KEY ("id");


-- Registration
CREATE TABLE "registration"
(
    "id" serial,
    "central_id" integer,
    "central_status" text,
    "central_date" date,
    "contents" bytea
);
ALTER TABLE "registration" ADD CONSTRAINT "registration_pkey" PRIMARY KEY ("id");


-- Source
CREATE TABLE "source"
(
    "id" serial,
    "title" text,
    "description" text,
    "category" text
);
ALTER TABLE "source" ADD CONSTRAINT "source_pkey" PRIMARY KEY ("id");


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


-- Document
CREATE TABLE "document"
(
    "id" serial,
    "tag" text,
    "type" text,
    "contents" bytea
);
ALTER TABLE "document" ADD CONSTRAINT "document_pkey" PRIMARY KEY ("id");


-- Trial/Document
CREATE TABLE "trial2document"
(
    "trial_id" integer,
    "document_id" integer
);
ALTER TABLE "trial2document" ADD CONSTRAINT "trial2document_pkey" PRIMARY KEY ("trial_id", "document_id");


-- Review
CREATE TABLE "review"
(
    "id" serial,
    "type" text,
    "link" text,
    "title" text,
    "authors" text,
    "contacts" text,
    "publisher" text,
    "journal" text,
    "year" text,
    "volume" text,
    "issue" text,
    "pages" text,
    "language" text,
    "abstract" text,
    "notes" text
);
ALTER TABLE "review" ADD CONSTRAINT "review_pkey" PRIMARY KEY ("id");


-- Trial/Review
CREATE TABLE "trial2review"
(
    "trial_id" integer,
    "review_id" integer
);
ALTER TABLE "trial2review" ADD CONSTRAINT "trial2review_pkey" PRIMARY KEY ("trial_id", "review_id");


-- Review/Document
CREATE TABLE "review2document"
(
    "review_id" integer,
    "document_id" integer
);
ALTER TABLE "review2document" ADD CONSTRAINT "review2document_pkey" PRIMARY KEY ("review_id", "document_id");


-- Author
CREATE TABLE "author"
(
    "id" serial,
    "prefix" text,
    "first_name" text,
    "last_name" text,
    "suffix" text,
    "organisation" text,
    "department" text,
    "position" text,
    "email" text,
    "url" text
);
ALTER TABLE "author" ADD CONSTRAINT "author_pkey" PRIMARY KEY ("id");


-- Review/Author
CREATE TABLE "review2author"
(
    "review_id" integer,
    "author_id" integer
);
ALTER TABLE "review2author" ADD CONSTRAINT "review2author_pkey" PRIMARY KEY ("review_id", "author_id");


END;
