BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Import data
INSERT INTO "clean"."trial2review" ("trial_id", "review_id")
SELECT DISTINCT "CRGStudyID", "CRGReportID"
FROM "dirty"."tblStudyReport";


END;
