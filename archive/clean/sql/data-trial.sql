BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Data from trial
INSERT INTO "clean"."trial"
(
    "id",
    "public_title",
    "countries",
    "sample_size",
    "condition_or_problem",
    "contacts",
    "notes"
)
SELECT
    "CRGStudyID",
    "ShortName",
    "UDef2",
    "UDef1",
    "UDef5",
    "TrialistContactDetails",
    "Notes"
FROM "dirty"."tblStudy";


-- Data from intervention
UPDATE "clean"."trial" as t SET "interventions" = array(
  SELECT "i"."InterventionDescription"
  FROM "dirty"."tblIntervention" AS i, "dirty"."tblStudyIntervention" AS si
  WHERE "si"."CRGStudyID" = "t"."id"
  AND "si"."InterventionID" = "i"."InterventionID"
);


END;
