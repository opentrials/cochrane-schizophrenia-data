BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Data from trial
INSERT INTO "clean"."trial"
(
    "id",
    "source_id",
    "public_title",
    "scientific_title",
    "central_id",
    "central_status",
    "central_date",
    "countries",
    "sample_size",
    "condition_or_problem",
    "contacts",
    "notes"
)
SELECT
    "CRGStudyID",
    1,
    "ShortName",
    "ShortName",
    "CENTRALStudyID",
    "CENTRALSubmissionStatus",
    "DateToCENTRAL"::date,
    "UDef2",
    "UDef1",
    "UDef5",
    "TrialistContactDetails",
    "Notes"
FROM "dirty"."tblStudy";


-- Data from participant
UPDATE "clean"."trial" as t SET "sex" = array(
  SELECT "p"."ParticipantDescription"
  FROM "dirty"."tblParticipant" AS p, "dirty"."tblStudyParticipant" AS sp
  WHERE "sp"."CRGStudyID" = "t"."id"
  AND "sp"."ParticipantsID" = "p"."ParticipantsID"
  AND ("p"."ParticipantDescription" = 'Male' OR  "p"."ParticipantDescription" = 'Female')
)::"clean"."sex_type"[];


-- Data from intervention
UPDATE "clean"."trial" as t SET "interventions" = array(
  SELECT "i"."InterventionDescription"
  FROM "dirty"."tblIntervention" AS i, "dirty"."tblStudyIntervention" AS si
  WHERE "si"."CRGStudyID" = "t"."id"
  AND "si"."InterventionID" = "i"."InterventionID"
);


-- Data from outcome
UPDATE "clean"."trial" as t SET "outcomes" = array(
  SELECT "c"."OutcomeDescription"
  FROM "dirty"."tblOutcome" AS c, "dirty"."tblStudyOutcome" AS sc
  WHERE "sc"."CRGStudyID" = "t"."id"
  AND "sc"."OutcomeID" = "c"."OutcomeID"
);


END;
