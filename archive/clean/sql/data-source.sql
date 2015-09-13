BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Data from method
INSERT INTO "clean"."source" ("id", "title", "description", "category")
VALUES (1, 'Cochrane', 'Cochrane database', 'misc');


END;
