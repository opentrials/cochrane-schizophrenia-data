BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Data from method
INSERT INTO "clean"."method" ("id", "description")
SELECT "MethodofAllocationID", "MethodofAllocationDescription"
FROM "dirty"."tblMethodofAllocation";


-- Data from design
INSERT INTO "clean"."method" ("id", "description")
SELECT "DesignID"+100, "DesignDescription"
FROM "dirty"."tblDesign"
WHERE "DesignID" < 100;


END;
