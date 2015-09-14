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
    "authors",
    "journal",
    "year",
    "volume",
    "issue",
    "pages",
    "contacts",
    "publisher",
    "language",
    "abstract"
)
SELECT
    "CRGReportID",
    "PublicationTypeDescription",
    "Title",
    "Notes",
    "Authors",
    "Journal",
    "Year",
    "Volume",
    "Issue",
    "Pages",
    "UDef3",
    "Publisher",
    "Language",
    "Abstract"
FROM "dirty"."tblReport" as r, "dirty"."tblPublicationType" as p
WHERE "r"."PublicationTypeID" = "p"."PublicationTypeID"
AND "r"."CRGReportID" != 147;


END;
