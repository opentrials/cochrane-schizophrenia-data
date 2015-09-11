BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Import data
INSERT INTO "clean"."trial2method" ("trial_id", "method_id")
SELECT "CRGStudyID", "MethodofAllocationID"
FROM "dirty"."tblStudyMethod";


END;
