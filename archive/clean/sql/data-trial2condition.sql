BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Data from method
INSERT INTO "clean"."trial2condition" ("trial_id", "condition_id")
SELECT "CRGStudyID", "HealthCareConditionID"
FROM "dirty"."tblStudyHealthCareCondition";


END;
