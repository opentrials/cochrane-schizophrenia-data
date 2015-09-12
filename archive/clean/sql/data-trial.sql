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


UPDATE "clean"."trial" as t SET "outcomes" = array(
  SELECT "c"."OutcomeDescription"
  FROM "dirty"."tblOutcome" AS c, "dirty"."tblStudyOutcome" AS sc
  WHERE "sc"."CRGStudyID" = "t"."id"
  AND "sc"."OutcomeID" = "c"."OutcomeID"
);


END;
