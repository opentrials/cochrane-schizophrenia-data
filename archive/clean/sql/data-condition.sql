BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Data from healt condition
INSERT INTO "clean"."condition" ("id", "description")
SELECT "HealthCareConditionID", "HealthCareConditionDescription"
FROM "dirty"."tblHealthCareCondition";


END;
