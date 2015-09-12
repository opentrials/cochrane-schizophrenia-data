BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Import data from method
INSERT INTO "clean"."trial2method" ("trial_id", "method_id")
SELECT "CRGStudyID", "MethodofAllocationID"
FROM "dirty"."tblStudyMethod";


-- Import data from design
INSERT INTO "clean"."trial2method" ("trial_id", "method_id")
SELECT "CRGStudyID", "DesignID"+100
FROM "dirty"."tblStudyDesign";


END;
