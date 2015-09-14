BEGIN;


-- Prepare
SET CONSTRAINTS ALL DEFERRED;
SET client_encoding = 'UTF-8';


-- Import data
INSERT INTO "clean"."review" (
    "id",
    "type",
    "title",
    "notes",
    "contacts",
    "abstract",
    "language",

    "central_id",
    "central_status",
    "central_date",

    "authors",
    "journal",
    "year",
    "volume",
    "issue",
    "pages",
    "publisher"
)
SELECT
    "CRGReportID",
    "PublicationTypeDescription",
    "Title",
    "Notes",
    "UDef3",
    "Abstract",
    "Language",

    "CENTRALReportID",
    "CENTRALSubmissionStatus",
    "DatetoCENTRAL",

    "Authors",
    "Journal",
    "Year",
    "Volume",
    "Issue",
    "Pages",
    "Publisher"
FROM "dirty"."tblReport" as r, "dirty"."tblPublicationType" as p
WHERE "r"."PublicationTypeID" = "p"."PublicationTypeID";


END;
