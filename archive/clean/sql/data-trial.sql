BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Data from trial
INSERT INTO "clean"."trial" ("id", "public_title")
SELECT "CRGStudyID", "ShortName"
FROM "dirty"."tblStudy";


END;
