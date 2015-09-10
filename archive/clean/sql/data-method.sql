BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Data from method
INSERT INTO "clean"."method"
SELECT "MethodofAllocationID", "MethodofAllocationDescription"
FROM "dirty"."tblMethodofAllocation";


-- Data from design
--  INSERT INTO "clean"."method" ("id", "description")
--  SELECT "DesignDescription"
--  FROM "dirty"."tblDesign";


END;
