BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Data from reviewer
INSERT INTO "clean"."author" (
    "id",
    "prefix",
    "first_name",
    "last_name",
    "suffix",
    "organisation",
    "department",
    "position",
    "email",
    "url"
)
SELECT
    "reviewer_id",
    "prefix",
    "first_name",
    "last_name",
    "suffix",
    "organisation",
    "department",
    "position",
    "e_mail",
    "url"
FROM "dirty"."tblReviewer";


END;
