BEGIN;
CREATE SCHEMA IF NOT EXISTS "dirty";
SET search_path = "dirty", pg_catalog;
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

SET client_encoding = 'UTF-8';

CREATE TABLE "tblCRGKeyword"
 (
	"CRGKeywordID"			SERIAL, 
	"CRGKeywordDescription"			VARCHAR (200) NOT NULL
);
COMMENT ON TABLE "tblCRGKeyword" IS 'List of CRG (i.e. user) defined keywords';

-- CREATE INDEXES ...
ALTER TABLE "tblCRGKeyword" ADD CONSTRAINT "tblCRGKeyword_pkey" PRIMARY KEY ("CRGKeywordID");

CREATE TABLE "tblDesign"
 (
	"DesignID"			SERIAL, 
	"DesignDescription"			VARCHAR (200) NOT NULL
);
COMMENT ON TABLE "tblDesign" IS 'List of study designs';

-- CREATE INDEXES ...
CREATE INDEX "tblDesign_DesignDescription_idx" ON "tblDesign" ("DesignDescription");
ALTER TABLE "tblDesign" ADD CONSTRAINT "tblDesign_pkey" PRIMARY KEY ("DesignID");

CREATE TABLE "tblExportDef"
 (
	"ExpDefId"			SERIAL, 
	"ExpDefDesc"			TEXT, 
	"ExpDefName"			VARCHAR (100) NOT NULL, 
	"DateCreated"			TIMESTAMP WITHOUT TIME ZONE, 
	"DateUpdated"			TIMESTAMP WITHOUT TIME ZONE, 
	"TitleTag"			VARCHAR (8), 
	"OTitleTag"			VARCHAR (8), 
	"AuthorTag"			VARCHAR (8), 
	"JournalTag"			VARCHAR (8), 
	"YearTag"			VARCHAR (8), 
	"VolumeTag"			VARCHAR (8), 
	"IssueTag"			VARCHAR (8), 
	"PagesTag"			VARCHAR (8), 
	"LanguageTag"			VARCHAR (8), 
	"AbstractTag"			VARCHAR (8), 
	"EditorsTag"			VARCHAR (8), 
	"PublisherTag"			VARCHAR (8), 
	"CityTag"			VARCHAR (8), 
	"EditionTag"			VARCHAR (8), 
	"TypeOfRefTag"			VARCHAR (8), 
	"KeywordTag"			VARCHAR (8), 
	"MedLineIDTag"			VARCHAR (8), 
	"OtherIDTag"			VARCHAR (8), 
	"NotesTag"			VARCHAR (8), 
	"TagEndMarker"			VARCHAR (2) NOT NULL, 
	"RecDelimChar"			VARCHAR (8), 
	"RecDelim"			BOOL NOT NULL, 
	"MediumTag"			VARCHAR (8), 
	"DesignTag"			VARCHAR (8), 
	"RegTag"			VARCHAR (8), 
	"StudyTag"			VARCHAR (8), 
	"StartTag"			VARCHAR (8), 
	"EndTag"			VARCHAR (8), 
	"StartEnd"			BOOL NOT NULL, 
	"NumSpaces1"			INTEGER, 
	"NumSpaces2"			INTEGER, 
	"Core"			BOOL NOT NULL, 
	"BlankLine"			BOOL NOT NULL, 
	"UDef1"			VARCHAR (8), 
	"UDef2"			VARCHAR (8), 
	"UDef3"			VARCHAR (8), 
	"UDef4"			VARCHAR (8), 
	"UDef5"			VARCHAR (8), 
	"ReportNumberTag"			VARCHAR (100), 
	"UDef6"			VARCHAR (8), 
	"UDef7"			VARCHAR (8), 
	"UDef8"			VARCHAR (8), 
	"UDef9"			VARCHAR (8), 
	"UDef10"			VARCHAR (8)
);
COMMENT ON COLUMN "tblExportDef"."ExpDefDesc" IS 'Description of the export definition; Notes about its use etc';
COMMENT ON COLUMN "tblExportDef"."ExpDefName" IS 'User entered descriptive name';
COMMENT ON COLUMN "tblExportDef"."TitleTag" IS 'The tag used for English title';
COMMENT ON COLUMN "tblExportDef"."OTitleTag" IS 'The tag used for the original title';
COMMENT ON COLUMN "tblExportDef"."AuthorTag" IS 'The tag used for authors';
COMMENT ON COLUMN "tblExportDef"."JournalTag" IS 'The tag used for the journal name';
COMMENT ON COLUMN "tblExportDef"."YearTag" IS 'The tag used for the year of publication';
COMMENT ON COLUMN "tblExportDef"."VolumeTag" IS 'The tag used for the volume number';
COMMENT ON COLUMN "tblExportDef"."IssueTag" IS 'The tag used for the issue number';
COMMENT ON COLUMN "tblExportDef"."PagesTag" IS 'The tag used for the start and end pages';
COMMENT ON COLUMN "tblExportDef"."LanguageTag" IS 'The tag used for the language reference in';
COMMENT ON COLUMN "tblExportDef"."AbstractTag" IS 'The tag used for the abstract';
COMMENT ON COLUMN "tblExportDef"."EditorsTag" IS 'The tag used for editors names';
COMMENT ON COLUMN "tblExportDef"."PublisherTag" IS 'The tag used for publisher name';
COMMENT ON COLUMN "tblExportDef"."CityTag" IS 'The tag used for city of publication';
COMMENT ON COLUMN "tblExportDef"."EditionTag" IS 'The tag used for edition number';
COMMENT ON COLUMN "tblExportDef"."TypeOfRefTag" IS 'The tag used for type of reference';
COMMENT ON COLUMN "tblExportDef"."KeywordTag" IS 'The tag used for keywords from external bibliographic databases e.g MeSH terms';
COMMENT ON COLUMN "tblExportDef"."MedLineIDTag" IS 'The tag used for the Medline accession number';
COMMENT ON COLUMN "tblExportDef"."OtherIDTag" IS 'The tag used for other ID''s';
COMMENT ON COLUMN "tblExportDef"."NotesTag" IS 'The tag used for notes';
COMMENT ON COLUMN "tblExportDef"."TagEndMarker" IS 'Character that ends a tag, e.g ":" or "-"';
COMMENT ON COLUMN "tblExportDef"."RecDelimChar" IS 'Record delimiter';
COMMENT ON COLUMN "tblExportDef"."RecDelim" IS 'Yes if the file has a special record delimiting string, No otherwise';
COMMENT ON COLUMN "tblExportDef"."MediumTag" IS 'The tag used for medium';
COMMENT ON COLUMN "tblExportDef"."DesignTag" IS 'The tag used for study design';
COMMENT ON COLUMN "tblExportDef"."RegTag" IS 'The tag used for register code';
COMMENT ON COLUMN "tblExportDef"."StudyTag" IS 'The tag used for study Id';
COMMENT ON COLUMN "tblExportDef"."StartTag" IS 'If record must always start with the same tag then this is the value of that tag';
COMMENT ON COLUMN "tblExportDef"."EndTag" IS 'If record must always end with the same tag then this is the value of that tag';
COMMENT ON COLUMN "tblExportDef"."StartEnd" IS 'Yes if record must always start & end with the same tag';
COMMENT ON COLUMN "tblExportDef"."NumSpaces1" IS 'Number of spaces between tag and tag end value';
COMMENT ON COLUMN "tblExportDef"."NumSpaces2" IS 'Number of spaces after tag end value';
COMMENT ON COLUMN "tblExportDef"."Core" IS 'Yes if definition is for Central export function';
COMMENT ON COLUMN "tblExportDef"."BlankLine" IS 'Yes if each record separated by a blank line';
COMMENT ON COLUMN "tblExportDef"."UDef1" IS 'Tag for reference user defined field';
COMMENT ON COLUMN "tblExportDef"."UDef6" IS 'Additional user defined fields';
COMMENT ON TABLE "tblExportDef" IS 'Reference export definitions, tagged text labels.  User defines which tags match to field.';

-- CREATE INDEXES ...
CREATE INDEX "tblExportDef_ImpDefId_idx" ON "tblExportDef" ("ExpDefId");
CREATE INDEX "tblExportDef_ImpDefName_idx" ON "tblExportDef" ("ExpDefName");
CREATE INDEX "tblExportDef_KeywordTag_idx" ON "tblExportDef" ("KeywordTag");
CREATE INDEX "tblExportDef_NumSpaces1_idx" ON "tblExportDef" ("NumSpaces1");
CREATE INDEX "tblExportDef_NumSpaces2_idx" ON "tblExportDef" ("NumSpaces2");
ALTER TABLE "tblExportDef" ADD CONSTRAINT "tblExportDef_pkey" PRIMARY KEY ("ExpDefId");

CREATE TABLE "tblHealthCareCondition"
 (
	"HealthCareConditionID"			SERIAL, 
	"HealthCareConditionDescription"			VARCHAR (200) NOT NULL
);
COMMENT ON COLUMN "tblHealthCareCondition"."HealthCareConditionID" IS 'Automatically assigned ID';
COMMENT ON COLUMN "tblHealthCareCondition"."HealthCareConditionDescription" IS 'Description of the health care condition e.g. mulitple sclerosis, prostate cancer';
COMMENT ON TABLE "tblHealthCareCondition" IS 'List of health care conditions, defined by CRG';

-- CREATE INDEXES ...
CREATE INDEX "tblHealthCareCondition_Health_Care_Condtion_ID_idx" ON "tblHealthCareCondition" ("HealthCareConditionID");
CREATE INDEX "tblHealthCareCondition_HealthCareConditionDescription_idx" ON "tblHealthCareCondition" ("HealthCareConditionDescription");
ALTER TABLE "tblHealthCareCondition" ADD CONSTRAINT "tblHealthCareCondition_pkey" PRIMARY KEY ("HealthCareConditionID");

CREATE TABLE "tblImportDef"
 (
	"ImpDefId"			SERIAL, 
	"ImpDefDesc"			TEXT, 
	"ImpDefName"			VARCHAR (100) NOT NULL, 
	"DateCreated"			TIMESTAMP WITHOUT TIME ZONE, 
	"DateUpdated"			TIMESTAMP WITHOUT TIME ZONE, 
	"TitleTag"			VARCHAR (8), 
	"OTitleTag"			VARCHAR (8), 
	"AuthorTag"			VARCHAR (8), 
	"JournalTag"			VARCHAR (8), 
	"YearTag"			VARCHAR (8), 
	"VolumeTag"			VARCHAR (8), 
	"IssueTag"			VARCHAR (8), 
	"PagesTag"			VARCHAR (8), 
	"LanguageTag"			VARCHAR (8), 
	"AbstractTag"			VARCHAR (8), 
	"EditorsTag"			VARCHAR (8), 
	"PublisherTag"			VARCHAR (8), 
	"CityTag"			VARCHAR (8), 
	"EditionTag"			VARCHAR (8), 
	"TypeOfRefTag"			VARCHAR (8), 
	"KeywordTag"			VARCHAR (8), 
	"MedLineIDTag"			VARCHAR (8), 
	"OtherIDTag"			VARCHAR (8), 
	"NotesTag"			VARCHAR (8), 
	"ParseSource"			BOOL NOT NULL, 
	"TagEndMarker"			VARCHAR (2) NOT NULL, 
	"PageTwoTag"			BOOL NOT NULL, 
	"StartPageTag"			VARCHAR (8), 
	"EndPagetag"			VARCHAR (8), 
	"RecDelimChar"			VARCHAR (8), 
	"RecDelim"			BOOL NOT NULL, 
	"MediumTag"			VARCHAR (100), 
	"DesignTag"			VARCHAR (8), 
	"BlankLine"			BOOL NOT NULL, 
	"UDef1"			VARCHAR (8), 
	"UDef2"			VARCHAR (8), 
	"UDef3"			VARCHAR (8), 
	"UDef4"			VARCHAR (8), 
	"UDef5"			VARCHAR (8), 
	"ReportNumberTag"			VARCHAR (100), 
	"UDef6"			VARCHAR (8), 
	"UDef7"			VARCHAR (8), 
	"UDef8"			VARCHAR (8), 
	"UDef9"			VARCHAR (8), 
	"UDef10"			VARCHAR (8)
);
COMMENT ON COLUMN "tblImportDef"."ImpDefId" IS 'Unique ID for the import definition.  Generated by system';
COMMENT ON COLUMN "tblImportDef"."ImpDefDesc" IS 'Description of the import definition; Notes about its use etc';
COMMENT ON COLUMN "tblImportDef"."ImpDefName" IS 'User entered descriptive name';
COMMENT ON COLUMN "tblImportDef"."TitleTag" IS 'The tag used for English title';
COMMENT ON COLUMN "tblImportDef"."OTitleTag" IS 'The tag used for the original title';
COMMENT ON COLUMN "tblImportDef"."AuthorTag" IS 'The tag used for authors';
COMMENT ON COLUMN "tblImportDef"."JournalTag" IS 'The tag used for the journal name';
COMMENT ON COLUMN "tblImportDef"."YearTag" IS 'The tag used for the date of publication';
COMMENT ON COLUMN "tblImportDef"."VolumeTag" IS 'The tag used for the volume number';
COMMENT ON COLUMN "tblImportDef"."IssueTag" IS 'The tag used for the issue number';
COMMENT ON COLUMN "tblImportDef"."PagesTag" IS 'The tag used for the start and end pages';
COMMENT ON COLUMN "tblImportDef"."LanguageTag" IS 'The tag used for the language reference in';
COMMENT ON COLUMN "tblImportDef"."AbstractTag" IS 'The tag used for the abstract';
COMMENT ON COLUMN "tblImportDef"."EditorsTag" IS 'The tag used for editors names';
COMMENT ON COLUMN "tblImportDef"."ParseSource" IS 'Yes if journal name, volume etc concatenated on one line in import file';
COMMENT ON COLUMN "tblImportDef"."TagEndMarker" IS 'Character that ends a tag';
COMMENT ON COLUMN "tblImportDef"."PageTwoTag" IS 'Yes if page numbers are tagged separately into start and end pages';
COMMENT ON COLUMN "tblImportDef"."StartPageTag" IS 'Start page tag';
COMMENT ON COLUMN "tblImportDef"."EndPagetag" IS 'End page tag';
COMMENT ON COLUMN "tblImportDef"."RecDelimChar" IS 'Record delimiter. Either the first field tag in each record or a special string for delimiting';
COMMENT ON COLUMN "tblImportDef"."RecDelim" IS 'Yes if the file has a special record delimiting string, No otherwise';
COMMENT ON COLUMN "tblImportDef"."BlankLine" IS 'Yes if record delimeter is blank line';
COMMENT ON COLUMN "tblImportDef"."UDef1" IS 'Tag for reference user defined field';
COMMENT ON COLUMN "tblImportDef"."UDef6" IS 'Additional user defined fields';
COMMENT ON TABLE "tblImportDef" IS 'Reference import definitions.  Tagged text format, user matches tag to fields.';

-- CREATE INDEXES ...
CREATE INDEX "tblImportDef_KeywordTag_idx" ON "tblImportDef" ("KeywordTag");
ALTER TABLE "tblImportDef" ADD CONSTRAINT "tblImportDef_pkey" PRIMARY KEY ("ImpDefId");

CREATE TABLE "tblImportedReports"
 (
	"Authors"			TEXT, 
	"Title"			TEXT, 
	"OriginalTitle"			TEXT, 
	"Journal"			VARCHAR (510), 
	"Year"			VARCHAR (40), 
	"Volume"			VARCHAR (40), 
	"Issue"			VARCHAR (100), 
	"Pages"			VARCHAR (20), 
	"Language"			VARCHAR (40), 
	"Abstract"			TEXT, 
	"Keywords"			TEXT, 
	"AccessionNumber"			VARCHAR (510), 
	"City"			VARCHAR (100), 
	"Editors"			TEXT, 
	"Publisher"			VARCHAR (100), 
	"Edition"			VARCHAR (100), 
	"OtherIDs"			VARCHAR (510), 
	"Medium"			VARCHAR (100), 
	"Design"			VARCHAR (100), 
	"Notes"			TEXT, 
	"ReportNumber"			VARCHAR (100), 
	"PublicationTypeDescription"			VARCHAR (100), 
	"UDef1"			VARCHAR (510), 
	"UDef2"			VARCHAR (510), 
	"UDef3"			VARCHAR (510), 
	"UDef4"			VARCHAR (510), 
	"UDef5"			TEXT, 
	"Dateentered"			TIMESTAMP WITHOUT TIME ZONE, 
	"CarryForward"			BOOL NOT NULL, 
	"CRGStudyID"			INTEGER, 
	"Duplicate"			BOOL NOT NULL, 
	"DupString"			VARCHAR (300), 
	"CENTRALReportID"			VARCHAR (100), 
	"TempReportID"			SERIAL, 
	"UDef6"			VARCHAR (8), 
	"UDef7"			VARCHAR (8), 
	"UDef8"			VARCHAR (8), 
	"UDef9"			VARCHAR (8), 
	"UDef10"			VARCHAR (8)
);
COMMENT ON COLUMN "tblImportedReports"."Authors" IS 'Author(s) of report in the format  Lastname Initials; Lastname Initials etc.';
COMMENT ON COLUMN "tblImportedReports"."Title" IS 'English translation of title';
COMMENT ON COLUMN "tblImportedReports"."OriginalTitle" IS 'Non-English title';
COMMENT ON COLUMN "tblImportedReports"."Journal" IS 'Name of journal';
COMMENT ON COLUMN "tblImportedReports"."Year" IS 'Year journal published';
COMMENT ON COLUMN "tblImportedReports"."Volume" IS 'Volume of journal report appears in';
COMMENT ON COLUMN "tblImportedReports"."Issue" IS 'Issue of journal report appears in';
COMMENT ON COLUMN "tblImportedReports"."Pages" IS 'Start and end pages of journal';
COMMENT ON COLUMN "tblImportedReports"."Language" IS 'The language the report was written in';
COMMENT ON COLUMN "tblImportedReports"."Abstract" IS 'Abstract';
COMMENT ON COLUMN "tblImportedReports"."Keywords" IS 'Indexing terms';
COMMENT ON COLUMN "tblImportedReports"."AccessionNumber" IS 'For Medline/Embase accession number';
COMMENT ON COLUMN "tblImportedReports"."City" IS 'City (of publication)';
COMMENT ON COLUMN "tblImportedReports"."Editors" IS 'Mainly for reports of books in the format Lastname Initials; Lastname Initials etc.';
COMMENT ON COLUMN "tblImportedReports"."Publisher" IS 'Publisher of book';
COMMENT ON COLUMN "tblImportedReports"."OtherIDs" IS 'Other unique Id''s than MedLine';
COMMENT ON COLUMN "tblImportedReports"."UDef1" IS 'User defined field';
COMMENT ON COLUMN "tblImportedReports"."Dateentered" IS 'Date report added to database';
COMMENT ON COLUMN "tblImportedReports"."CarryForward" IS 'Yes if Report should go into main table, No if should be discarded';
COMMENT ON COLUMN "tblImportedReports"."CRGStudyID" IS 'Link to an existing study';
COMMENT ON COLUMN "tblImportedReports"."Duplicate" IS 'Indicates if the duplicate checking routine considers the report to be a duplicate';
COMMENT ON COLUMN "tblImportedReports"."DupString" IS 'For duplicate checking';
COMMENT ON COLUMN "tblImportedReports"."CENTRALReportID" IS 'ID assigned in CENTRAL';
COMMENT ON COLUMN "tblImportedReports"."TempReportID" IS 'Locally assigned ID';
COMMENT ON COLUMN "tblImportedReports"."UDef6" IS 'Additional user defined fields';
COMMENT ON TABLE "tblImportedReports" IS 'A temporary storage area for imported references.';

-- CREATE INDEXES ...
CREATE INDEX "tblImportedReports_CENTRALReportID_idx" ON "tblImportedReports" ("CENTRALReportID");
CREATE INDEX "tblImportedReports_CRGStudyID_idx" ON "tblImportedReports" ("CRGStudyID");
ALTER TABLE "tblImportedReports" ADD CONSTRAINT "tblImportedReports_pkey" PRIMARY KEY ("TempReportID");
CREATE INDEX "tblImportedReports_TempReportID_idx" ON "tblImportedReports" ("TempReportID");

CREATE TABLE "tblMethodofAllocation"
 (
	"MethodofAllocationID"			SERIAL, 
	"MethodofAllocationDescription"			VARCHAR (200) NOT NULL
);
COMMENT ON TABLE "tblMethodofAllocation" IS 'User defined list of methods of allocation';

-- CREATE INDEXES ...
ALTER TABLE "tblMethodofAllocation" ADD CONSTRAINT "tblMethodofAllocation_pkey" PRIMARY KEY ("MethodofAllocationID");

CREATE TABLE "tblMyGroupInformation"
 (
	"SetupID"			SERIAL, 
	"GroupName"			VARCHAR (508) NOT NULL, 
	"RegisterCode"			VARCHAR (40) NOT NULL
);
COMMENT ON TABLE "tblMyGroupInformation" IS 'Information about the Cochrane Collaborative review group';

-- CREATE INDEXES ...
ALTER TABLE "tblMyGroupInformation" ADD CONSTRAINT "tblMyGroupInformation_pkey" PRIMARY KEY ("SetupID");

CREATE TABLE "tblOptions"
 (
	"DiscardDups"			BOOL NOT NULL, 
	"AuthorYearSeq"			BOOL NOT NULL, 
	"LastStudynum"			INTEGER, 
	"UDefLabel1"			VARCHAR (100), 
	"UdefLabel2"			VARCHAR (100), 
	"UdefLabel3"			VARCHAR (100), 
	"UdefLabel4"			VARCHAR (100), 
	"UdefLabel5"			VARCHAR (100), 
	"RUDefLabel1"			VARCHAR (100), 
	"RUdefLabel2"			VARCHAR (100), 
	"RUdefLabel3"			VARCHAR (100), 
	"RUdefLabel4"			VARCHAR (100), 
	"RUdefLabel5"			VARCHAR (100), 
	"UdefLabel6"			VARCHAR (100), 
	"UdefLabel7"			VARCHAR (100), 
	"UdefLabel8"			VARCHAR (100), 
	"UdefLabel9"			VARCHAR (100), 
	"UdefLabel10"			VARCHAR (100), 
	"RudefLabel6"			VARCHAR (100), 
	"RudefLabel7"			VARCHAR (100), 
	"RudefLabel8"			VARCHAR (100), 
	"RudefLabel9"			VARCHAR (100), 
	"RudefLabel10"			VARCHAR (100)
);
COMMENT ON COLUMN "tblOptions"."DiscardDups" IS 'Flag to indicate if duplicates should be discarded when transferring imported references to "live" table as default';
COMMENT ON COLUMN "tblOptions"."AuthorYearSeq" IS 'Yes if using Author year for attaching studies from import, No if using Unassessd-n format';
COMMENT ON COLUMN "tblOptions"."LastStudynum" IS 'Last number used when automatically generating study ids';
COMMENT ON COLUMN "tblOptions"."UDefLabel1" IS 'Study user defined field label';
COMMENT ON COLUMN "tblOptions"."RUDefLabel1" IS 'Reference user defined field label';
COMMENT ON COLUMN "tblOptions"."UdefLabel6" IS 'Labels for additional study user defined fields';
COMMENT ON COLUMN "tblOptions"."UdefLabel10" IS 'Labels for additional reference user defined fields';
COMMENT ON TABLE "tblOptions" IS 'User options';

-- CREATE INDEXES ...

CREATE TABLE "tblOutcome"
 (
	"OutcomeID"			SERIAL, 
	"OutcomeDescription"			VARCHAR (510) NOT NULL
);
COMMENT ON TABLE "tblOutcome" IS 'User defined list of outcomes';

-- CREATE INDEXES ...
CREATE INDEX "tblOutcome_Outcome_ID_idx" ON "tblOutcome" ("OutcomeID");
CREATE INDEX "tblOutcome_OutcomeDescription_idx" ON "tblOutcome" ("OutcomeDescription");
ALTER TABLE "tblOutcome" ADD CONSTRAINT "tblOutcome_pkey" PRIMARY KEY ("OutcomeID");

CREATE TABLE "tblParticipant"
 (
	"ParticipantsID"			SERIAL, 
	"ParticipantDescription"			VARCHAR (200) NOT NULL
);
COMMENT ON TABLE "tblParticipant" IS 'User defined list of participants';

-- CREATE INDEXES ...
ALTER TABLE "tblParticipant" ADD CONSTRAINT "tblParticipant_pkey" PRIMARY KEY ("ParticipantsID");

CREATE TABLE "tblPublicationType"
 (
	"PublicationTypeID"			SERIAL, 
	"PublicationTypeDescription"			VARCHAR (100) NOT NULL, 
	"Change"			BOOL NOT NULL
);
COMMENT ON TABLE "tblPublicationType" IS 'Valid list of reference types';

-- CREATE INDEXES ...
ALTER TABLE "tblPublicationType" ADD CONSTRAINT "tblPublicationType_pkey" PRIMARY KEY ("PublicationTypeID");

CREATE TABLE "tblReportCRGKeyword"
 (
	"CRGReportID"			INTEGER, 
	"CRGKeywordID"			INTEGER
);
COMMENT ON TABLE "tblReportCRGKeyword" IS 'Link reports to CRG defined keywords';

-- CREATE INDEXES ...
ALTER TABLE "tblReportCRGKeyword" ADD CONSTRAINT "tblReportCRGKeyword_pkey" PRIMARY KEY ("CRGReportID", "CRGKeywordID");

CREATE TABLE "tblReportExternalID"
 (
	"CRGReportID"			DOUBLE PRECISION, 
	"ExternalID"			VARCHAR (100), 
	"Description"			VARCHAR (510), 
	"URL"			VARCHAR (100), 
	"IndexingTerms"			TEXT, 
	"Medline"			BOOL NOT NULL
);
COMMENT ON COLUMN "tblReportExternalID"."Description" IS 'The name of the bibliographic database which has assigned this ID to the report';
COMMENT ON COLUMN "tblReportExternalID"."URL" IS 'Address of internet site where the source document can be found';
COMMENT ON COLUMN "tblReportExternalID"."IndexingTerms" IS 'Indexing terms assigned in the source bibliographic database';

-- CREATE INDEXES ...
CREATE INDEX "tblReportExternalID_ExternalID_idx" ON "tblReportExternalID" ("ExternalID");
CREATE INDEX "tblReportExternalID_ReportID_idx" ON "tblReportExternalID" ("CRGReportID");

CREATE TABLE "tblReportReviewer"
 (
	"CRGReportID"			INTEGER, 
	"reviewer_id"			INTEGER, 
	"DateToReviewer"			DATE, 
	"Notes"			TEXT, 
	"ReviewerResponse"			VARCHAR (100), 
	"DateResponded"			DATE, 
	"LastChased"			DATE
);
COMMENT ON TABLE "tblReportReviewer" IS 'Links studies to reviewers';

-- CREATE INDEXES ...
ALTER TABLE "tblReportReviewer" ADD CONSTRAINT "tblReportReviewer_pkey" PRIMARY KEY ("CRGReportID", "reviewer_id");
CREATE INDEX "tblReportReviewer_tblReportReviewerreviewer_id_idx" ON "tblReportReviewer" ("reviewer_id");

CREATE TABLE "tblReview"
 (
	"review_id"			VARCHAR (40), 
	"review_no"			VARCHAR (8), 
	"title"			VARCHAR (510), 
	"cnt_reviewer"			INTEGER, 
	"reviewers"			VARCHAR (508), 
	"status"			VARCHAR (2), 
	"AutoID"			SERIAL, 
	"Notes"			TEXT
);
COMMENT ON TABLE "tblReview" IS 'List of titles, reviews, protocols';

-- CREATE INDEXES ...
CREATE INDEX "tblReview_cnt_reviewer_idx" ON "tblReview" ("cnt_reviewer");
ALTER TABLE "tblReview" ADD CONSTRAINT "tblReview_pkey" PRIMARY KEY ("AutoID");

CREATE TABLE "tblReviewer"
 (
	"reviewer_id"			SERIAL, 
	"prefix"			VARCHAR (20), 
	"first_name"			VARCHAR (100), 
	"last_name"			VARCHAR (100), 
	"suffix"			VARCHAR (100), 
	"initials"			VARCHAR (20), 
	"contact_2nd"			VARCHAR (200), 
	"organisation"			VARCHAR (200), 
	"department"			VARCHAR (200), 
	"position"			VARCHAR (200), 
	"e_mail"			VARCHAR (200), 
	"url"			VARCHAR (508), 
	"first_1"			VARCHAR (200), 
	"second_1"			VARCHAR (200), 
	"city_1"			VARCHAR (100), 
	"region_1"			VARCHAR (100), 
	"country_1"			VARCHAR (100), 
	"code_1"			VARCHAR (30), 
	"first_2"			VARCHAR (200), 
	"second_2"			VARCHAR (200), 
	"city_2"			VARCHAR (100), 
	"region_2"			VARCHAR (100), 
	"country_2"			VARCHAR (100), 
	"code_2"			VARCHAR (30), 
	"phone_1"			VARCHAR (60), 
	"phone_2"			VARCHAR (60), 
	"phone_3"			VARCHAR (60), 
	"ph_ext_1"			VARCHAR (20), 
	"ph_ext_2"			VARCHAR (20), 
	"ph_ext_3"			VARCHAR (20), 
	"fax_1"			VARCHAR (60), 
	"fax_2"			VARCHAR (60), 
	"role"			VARCHAR (100), 
	"notes"			TEXT, 
	"description"			TEXT, 
	"home"			BOOL NOT NULL, 
	"restricted"			BOOL NOT NULL, 
	"date_created"			TIMESTAMP WITHOUT TIME ZONE, 
	"date_edited"			TIMESTAMP WITHOUT TIME ZONE, 
	"Group_ID"			VARCHAR (8), 
	"RevManID"			VARCHAR (8)
);
COMMENT ON TABLE "tblReviewer" IS 'Reviewers and others - contact details';

-- CREATE INDEXES ...
CREATE INDEX "tblReviewer_code_1_idx" ON "tblReviewer" ("code_1");
ALTER TABLE "tblReviewer" ADD CONSTRAINT "tblReviewer_pkey" PRIMARY KEY ("reviewer_id");

CREATE TABLE "tblReviewerImport"
 (
	"RevManID"			VARCHAR (8), 
	"prefix"			VARCHAR (20), 
	"first_name"			VARCHAR (100), 
	"last_name"			VARCHAR (100), 
	"suffix"			VARCHAR (100), 
	"initials"			VARCHAR (20), 
	"contact_2nd"			VARCHAR (200), 
	"organisation"			VARCHAR (200), 
	"department"			VARCHAR (200), 
	"position"			VARCHAR (200), 
	"e_mail"			VARCHAR (200), 
	"url"			VARCHAR (508), 
	"first_1"			VARCHAR (200), 
	"second_1"			VARCHAR (200), 
	"city_1"			VARCHAR (100), 
	"region_1"			VARCHAR (100), 
	"country_1"			VARCHAR (100), 
	"code_1"			VARCHAR (30), 
	"first_2"			VARCHAR (200), 
	"second_2"			VARCHAR (200), 
	"city_2"			VARCHAR (100), 
	"region_2"			VARCHAR (100), 
	"country_2"			VARCHAR (100), 
	"code_2"			VARCHAR (30), 
	"phone_1"			VARCHAR (60), 
	"phone_2"			VARCHAR (60), 
	"phone_3"			VARCHAR (60), 
	"ph_ext_1"			VARCHAR (20), 
	"ph_ext_2"			VARCHAR (20), 
	"ph_ext_3"			VARCHAR (20), 
	"fax_1"			VARCHAR (60), 
	"fax_2"			VARCHAR (60), 
	"role"			VARCHAR (100), 
	"notes"			TEXT, 
	"description"			TEXT, 
	"home"			BOOL NOT NULL, 
	"restricted"			BOOL NOT NULL, 
	"date_created"			TIMESTAMP WITHOUT TIME ZONE, 
	"date_edited"			TIMESTAMP WITHOUT TIME ZONE, 
	"Group_ID"			VARCHAR (8), 
	"Selected"			BOOL NOT NULL, 
	"TempID"			SERIAL, 
	"New"			BOOL NOT NULL
);
COMMENT ON TABLE "tblReviewerImport" IS 'Temporary table for storing imported reviewer/contact details';

-- CREATE INDEXES ...
CREATE INDEX "tblReviewerImport_code_1_idx" ON "tblReviewerImport" ("code_1");
CREATE INDEX "tblReviewerImport_code_2_idx" ON "tblReviewerImport" ("code_2");
CREATE INDEX "tblReviewerImport_Group_ID_idx" ON "tblReviewerImport" ("Group_ID");
ALTER TABLE "tblReviewerImport" ADD CONSTRAINT "tblReviewerImport_pkey" PRIMARY KEY ("TempID");
CREATE INDEX "tblReviewerImport_reviewer_id_idx" ON "tblReviewerImport" ("RevManID");
CREATE INDEX "tblReviewerImport_TempID_idx" ON "tblReviewerImport" ("TempID");

CREATE TABLE "tblReviewerKeyword"
 (
	"ReviewerKeywordID"			SERIAL, 
	"CRGKeywordID"			INTEGER NOT NULL, 
	"Reviewer_ID"			INTEGER NOT NULL
);
COMMENT ON TABLE "tblReviewerKeyword" IS 'Links reviewers to CRG keywords';

-- CREATE INDEXES ...
CREATE INDEX "tblReviewerKeyword_CRGKeywordID_idx" ON "tblReviewerKeyword" ("CRGKeywordID");
ALTER TABLE "tblReviewerKeyword" ADD CONSTRAINT "tblReviewerKeyword_pkey" PRIMARY KEY ("ReviewerKeywordID");
CREATE INDEX "tblReviewerKeyword_ReviewerID_idx" ON "tblReviewerKeyword" ("Reviewer_ID");

CREATE TABLE "tblReviewImport"
 (
	"review_id"			VARCHAR (40), 
	"review_no"			VARCHAR (8), 
	"title"			VARCHAR (500), 
	"cnt_reviewer"			VARCHAR (8), 
	"reviewers"			VARCHAR (508), 
	"status"			VARCHAR (2)
);

-- CREATE INDEXES ...
ALTER TABLE "tblReviewImport" ADD CONSTRAINT "tblReviewImport_pkey" PRIMARY KEY ("review_id");

CREATE TABLE "tblReviewTopic"
 (
	"ReviewTopicID"			SERIAL, 
	"ReviewID"			INTEGER NOT NULL, 
	"TopicID"			INTEGER NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE "tblReviewTopic" ADD CONSTRAINT "tblReviewTopic_pkey" PRIMARY KEY ("ReviewTopicID");
CREATE INDEX "tblReviewTopic_ReviewID_idx" ON "tblReviewTopic" ("ReviewID");
CREATE INDEX "tblReviewTopic_ReviewTopicID_idx" ON "tblReviewTopic" ("ReviewTopicID");
CREATE INDEX "tblReviewTopic_RopicID_idx" ON "tblReviewTopic" ("TopicID");

CREATE TABLE "tblSavedSearch"
 (
	"SavedSearchID"			SERIAL, 
	"Name"			VARCHAR (200) NOT NULL, 
	"Desc"			VARCHAR (100), 
	"DateCreated"			TIMESTAMP WITHOUT TIME ZONE, 
	"DateEdited"			TIMESTAMP WITHOUT TIME ZONE, 
	"SearchType"			INTEGER
);
COMMENT ON COLUMN "tblSavedSearch"."Name" IS 'Unique descriptive ID - used in combo box when loading';
COMMENT ON COLUMN "tblSavedSearch"."SearchType" IS '1 = study search, 2 = reference search';
COMMENT ON TABLE "tblSavedSearch" IS 'Saved reference or study searches';

-- CREATE INDEXES ...
ALTER TABLE "tblSavedSearch" ADD CONSTRAINT "tblSavedSearch_pkey" PRIMARY KEY ("SavedSearchID");

CREATE TABLE "tblSearchFieldsDef"
 (
	"StudySearchField"			VARCHAR (100), 
	"SQLField"			VARCHAR (100), 
	"SQLMainTable"			VARCHAR (100), 
	"SQLLinkTable"			VARCHAR (100), 
	"SearchType"			INTEGER, 
	"SearchFieldID"			SERIAL, 
	"SQLString"			TEXT, 
	"ValueDelim"			VARCHAR (2), 
	"SQLDate"			BOOL NOT NULL, 
	"StudyUDef"			INTEGER
);
COMMENT ON TABLE "tblSearchFieldsDef" IS 'Search definition DATA MUST NOT BE CHANGED BY USER';

-- CREATE INDEXES ...
ALTER TABLE "tblSearchFieldsDef" ADD CONSTRAINT "tblSearchFieldsDef_pkey" PRIMARY KEY ("SearchFieldID");
CREATE INDEX "tblSearchFieldsDef_SearchFieldID_idx" ON "tblSearchFieldsDef" ("SearchFieldID");

CREATE TABLE "tblSearchLines"
 (
	"NotOperatorTrue"			BOOL NOT NULL, 
	"Operator"			VARCHAR (100) NOT NULL, 
	"Value"			VARCHAR (100) NOT NULL, 
	"Logical"			VARCHAR (100), 
	"SearchType"			INTEGER, 
	"SearchFieldDefID"			INTEGER NOT NULL, 
	"SavedSearchID"			INTEGER, 
	"SearchLineID"			SERIAL
);
COMMENT ON COLUMN "tblSearchLines"."Operator" IS 'eg "Like", "=" etc';
COMMENT ON COLUMN "tblSearchLines"."Value" IS 'Value being searched for';
COMMENT ON COLUMN "tblSearchLines"."Logical" IS 'Logical operator that joins this line with next';
COMMENT ON COLUMN "tblSearchLines"."SearchType" IS '1 = study, 2 = reference';
COMMENT ON COLUMN "tblSearchLines"."SearchFieldDefID" IS 'Link to search definition table (table hidden)';

-- CREATE INDEXES ...
ALTER TABLE "tblSearchLines" ADD CONSTRAINT "tblSearchLines_pkey" PRIMARY KEY ("SearchLineID");
CREATE INDEX "tblSearchLines_SavedSearchID_idx" ON "tblSearchLines" ("SavedSearchID");
CREATE INDEX "tblSearchLines_SearchFieldDefID_idx" ON "tblSearchLines" ("SearchFieldDefID");

CREATE TABLE "tblStudy"
 (
	"CENTRALStudyID"			INTEGER, 
	"CRGStudyID"			SERIAL, 
	"ShortName"			VARCHAR (40) NOT NULL, 
	"StatusofStudy"			VARCHAR (40), 
	"TrialistContactDetails"			TEXT, 
	"CENTRALSubmissionStatus"			VARCHAR (40) NOT NULL, 
	"Notes"			TEXT, 
	"DateEntered"			TIMESTAMP WITHOUT TIME ZONE, 
	"DateToCENTRAL"			TIMESTAMP WITHOUT TIME ZONE, 
	"DateEdited"			TIMESTAMP WITHOUT TIME ZONE, 
	"Search_Tagged"			BOOL NOT NULL, 
	"UDef1"			VARCHAR (510), 
	"UDef2"			VARCHAR (510), 
	"UDef3"			VARCHAR (510), 
	"UDef4"			VARCHAR (510), 
	"UDef5"			TEXT, 
	"ISRCTN"			VARCHAR (100), 
	"UDef6"			VARCHAR (510), 
	"UDef7"			VARCHAR (510), 
	"UDef8"			VARCHAR (510), 
	"UDef9"			VARCHAR (510), 
	"UDef10"			VARCHAR (100)
);
COMMENT ON COLUMN "tblStudy"."CENTRALStudyID" IS 'ID assigned by CENTRAL - initially unused';
COMMENT ON COLUMN "tblStudy"."CRGStudyID" IS 'Locally assigned ID';
COMMENT ON COLUMN "tblStudy"."ShortName" IS 'This should be the same as the study ID used in RevMan.  Usually the surname of the lead researcher and the year';
COMMENT ON COLUMN "tblStudy"."StatusofStudy" IS 'Indicate the current state of play for the study';
COMMENT ON COLUMN "tblStudy"."TrialistContactDetails" IS 'Name and contact details of the researcher';
COMMENT ON COLUMN "tblStudy"."CENTRALSubmissionStatus" IS 'Indicate the CRG''s judgement about the relevance of the study.';
COMMENT ON COLUMN "tblStudy"."Notes" IS 'Enter your own notes here';
COMMENT ON COLUMN "tblStudy"."DateEntered" IS 'Date added to database';
COMMENT ON COLUMN "tblStudy"."DateToCENTRAL" IS 'Date sent to CENTRAL';
COMMENT ON COLUMN "tblStudy"."DateEdited" IS 'Date the study record in this table was edited';
COMMENT ON COLUMN "tblStudy"."Search_Tagged" IS 'If the study meets criteria of a search set to yes, otherwise No';
COMMENT ON COLUMN "tblStudy"."UDef1" IS 'Number Randomized';
COMMENT ON COLUMN "tblStudy"."UDef2" IS 'Country';
COMMENT ON COLUMN "tblStudy"."UDef3" IS 'Duration';
COMMENT ON COLUMN "tblStudy"."UDef4" IS 'Translation';
COMMENT ON COLUMN "tblStudy"."UDef5" IS 'Suggested Title (Comparison)';
COMMENT ON COLUMN "tblStudy"."ISRCTN" IS 'International randomized controlled trial number';
COMMENT ON COLUMN "tblStudy"."UDef6" IS 'Additional user defined fields';
COMMENT ON COLUMN "tblStudy"."UDef9" IS 'CRS ID';
COMMENT ON TABLE "tblStudy" IS 'Studies';

-- CREATE INDEXES ...
CREATE INDEX "tblStudy_CENTRAL_Study_ID_idx" ON "tblStudy" ("CENTRALStudyID");
CREATE INDEX "tblStudy_CENTRALSubmissionStatus_idx" ON "tblStudy" ("CENTRALSubmissionStatus");
CREATE INDEX "tblStudy_CRG_Study_ID_idx" ON "tblStudy" ("CRGStudyID");
CREATE INDEX "tblStudy_DateEntered_idx" ON "tblStudy" ("DateEntered");
ALTER TABLE "tblStudy" ADD CONSTRAINT "tblStudy_pkey" PRIMARY KEY ("CRGStudyID");
CREATE INDEX "tblStudy_ShortName_idx" ON "tblStudy" ("ShortName");
CREATE INDEX "tblStudy_StatusofStudy_idx" ON "tblStudy" ("StatusofStudy");

CREATE TABLE "tblStudyCRGInterest"
 (
	"CRGStudyID"			INTEGER, 
	"CRGCode"			VARCHAR (16)
);
COMMENT ON COLUMN "tblStudyCRGInterest"."CRGCode" IS 'CRG codes as used in CENTRAL, can look up from a list but the list cannot be user-defined, must be supplied';
COMMENT ON TABLE "tblStudyCRGInterest" IS 'Records that study may be of interest to other CRG''s';

-- CREATE INDEXES ...
ALTER TABLE "tblStudyCRGInterest" ADD CONSTRAINT "tblStudyCRGInterest_pkey" PRIMARY KEY ("CRGStudyID", "CRGCode");

CREATE TABLE "tblStudyDesign"
 (
	"CRGStudyID"			INTEGER, 
	"DesignID"			INTEGER
);
COMMENT ON TABLE "tblStudyDesign" IS 'Links studies to design list';

-- CREATE INDEXES ...
ALTER TABLE "tblStudyDesign" ADD CONSTRAINT "tblStudyDesign_pkey" PRIMARY KEY ("CRGStudyID", "DesignID");

CREATE TABLE "tblStudyHealthCareCondition"
 (
	"CRGStudyID"			INTEGER, 
	"HealthCareConditionID"			INTEGER
);
COMMENT ON TABLE "tblStudyHealthCareCondition" IS 'Links health care conditions to study';

-- CREATE INDEXES ...
ALTER TABLE "tblStudyHealthCareCondition" ADD CONSTRAINT "tblStudyHealthCareCondition_pkey" PRIMARY KEY ("CRGStudyID", "HealthCareConditionID");

CREATE TABLE "tblStudyIntervention"
 (
	"CRGStudyID"			INTEGER, 
	"InterventionID"			INTEGER
);
COMMENT ON TABLE "tblStudyIntervention" IS 'Links interventions to studies';

-- CREATE INDEXES ...
ALTER TABLE "tblStudyIntervention" ADD CONSTRAINT "tblStudyIntervention_pkey" PRIMARY KEY ("CRGStudyID", "InterventionID");

CREATE TABLE "tblStudyMethod"
 (
	"CRGStudyID"			INTEGER, 
	"MethodofAllocationID"			INTEGER
);
COMMENT ON TABLE "tblStudyMethod" IS 'Link methods of allocation to studies';

-- CREATE INDEXES ...
ALTER TABLE "tblStudyMethod" ADD CONSTRAINT "tblStudyMethod_pkey" PRIMARY KEY ("CRGStudyID", "MethodofAllocationID");

CREATE TABLE "tblStudyOutcome"
 (
	"CRGStudyID"			INTEGER, 
	"OutcomeID"			INTEGER
);
COMMENT ON TABLE "tblStudyOutcome" IS 'Links studies to outcomes';

-- CREATE INDEXES ...
ALTER TABLE "tblStudyOutcome" ADD CONSTRAINT "tblStudyOutcome_pkey" PRIMARY KEY ("CRGStudyID", "OutcomeID");

CREATE TABLE "tblStudyParticipant"
 (
	"CRGStudyID"			INTEGER, 
	"ParticipantsID"			INTEGER
);
COMMENT ON TABLE "tblStudyParticipant" IS 'Links studies to participants';

-- CREATE INDEXES ...
ALTER TABLE "tblStudyParticipant" ADD CONSTRAINT "tblStudyParticipant_pkey" PRIMARY KEY ("CRGStudyID", "ParticipantsID");

CREATE TABLE "tblStudyReport"
 (
	"StudyReportID"			SERIAL, 
	"CRGStudyID"			INTEGER NOT NULL, 
	"CRGReportID"			INTEGER NOT NULL
);
COMMENT ON TABLE "tblStudyReport" IS 'Links studies to reports';

-- CREATE INDEXES ...
ALTER TABLE "tblStudyReport" ADD CONSTRAINT "tblStudyReport_pkey" PRIMARY KEY ("StudyReportID");
CREATE INDEX "tblStudyReport_Study_Report_ID_idx" ON "tblStudyReport" ("StudyReportID");

CREATE TABLE "tblStudyReview"
 (
	"CRGStudyID"			INTEGER, 
	"ReviewID"			INTEGER, 
	"SectionInReview"			VARCHAR (60), 
	"DateIntoReview"			TIMESTAMP WITHOUT TIME ZONE, 
	"Notes"			TEXT, 
	"ReviewerID"			INTEGER, 
	"ReviewNumber"			VARCHAR (8)
);
COMMENT ON COLUMN "tblStudyReview"."SectionInReview" IS 'Values currently defined in RevMan. 1 = Included, 2 = Excluded, 3 = Awaiting assessment';
COMMENT ON COLUMN "tblStudyReview"."DateIntoReview" IS 'Date the study was incorporated into the review';
COMMENT ON COLUMN "tblStudyReview"."ReviewNumber" IS 'Number visible to CRG';
COMMENT ON TABLE "tblStudyReview" IS 'Link studies to reviews';

-- CREATE INDEXES ...
ALTER TABLE "tblStudyReview" ADD CONSTRAINT "tblStudyReview_pkey" PRIMARY KEY ("CRGStudyID", "ReviewID");
CREATE INDEX "tblStudyReview_ReviewerID_idx" ON "tblStudyReview" ("ReviewerID");
CREATE INDEX "tblStudyReview_ReviewNumber_idx" ON "tblStudyReview" ("ReviewNumber");

CREATE TABLE "tblStudyTopic"
 (
	"CRGStudyID"			INTEGER, 
	"CRGTopicID"			INTEGER, 
	"StudyTopicId"			SERIAL
);
COMMENT ON TABLE "tblStudyTopic" IS 'Link studies to topic';

-- CREATE INDEXES ...
CREATE INDEX "tblStudyTopic_tblStudyTopicCRGTopicID_idx" ON "tblStudyTopic" ("CRGTopicID");
CREATE INDEX "tblStudyTopic_UniqueCombination_idx" ON "tblStudyTopic" ("CRGStudyID", "CRGTopicID");

CREATE TABLE "tblSwitchboardItems"
 (
	"SwitchboardID"			INTEGER, 
	"ItemNumber"			INTEGER, 
	"ItemText"			VARCHAR (510), 
	"Command"			INTEGER, 
	"Argument"			VARCHAR (100), 
	"Tip"			VARCHAR (200)
);

-- CREATE INDEXES ...
ALTER TABLE "tblSwitchboardItems" ADD CONSTRAINT "tblSwitchboardItems_pkey" PRIMARY KEY ("SwitchboardID", "ItemNumber");

CREATE TABLE "tblTempRefToRev"
 (
	"Reviewer_ID"			INTEGER, 
	"CRGReportID"			INTEGER, 
	"Title"			TEXT, 
	"last_name"			VARCHAR (100), 
	"first_name"			VARCHAR (100), 
	"prefix"			VARCHAR (20), 
	"Year"			VARCHAR (40), 
	"Authors"			TEXT, 
	"Accepted"			BOOL NOT NULL, 
	"Notes"			TEXT
);
COMMENT ON TABLE "tblTempRefToRev" IS 'Temp table to store results of reviewer to reference matching';

-- CREATE INDEXES ...

CREATE TABLE "tblTempSearchLine"
 (
	"NotOperatorTrue"			BOOL NOT NULL, 
	"Operator"			VARCHAR (100) NOT NULL, 
	"Value"			VARCHAR (100) NOT NULL, 
	"Logical"			VARCHAR (100), 
	"SearchType"			INTEGER, 
	"SearchFieldDefID"			INTEGER NOT NULL, 
	"SavedSearchID"			INTEGER, 
	"SearchLineID"			SERIAL
);

-- CREATE INDEXES ...
CREATE INDEX "tblTempSearchLine_SavedSearchID_idx" ON "tblTempSearchLine" ("SavedSearchID");
CREATE INDEX "tblTempSearchLine_SearchFieldDefID_idx" ON "tblTempSearchLine" ("SearchFieldDefID");

CREATE TABLE "tblTopic"
 (
	"CRGTopicID"			INTEGER, 
	"TopicDescription"			VARCHAR (510) NOT NULL, 
	"ParentID"			INTEGER, 
	"Image"			VARCHAR (2), 
	"Key_ID"			VARCHAR (100)
);
COMMENT ON TABLE "tblTopic" IS 'User defined list of topics - values imported from ModMan';

-- CREATE INDEXES ...

CREATE TABLE "tblTopicImport"
 (
	"CRGTopicID"			INTEGER, 
	"TopicDescription"			VARCHAR (510) NOT NULL, 
	"ParentID"			INTEGER, 
	"Image"			VARCHAR (2), 
	"Key_ID"			VARCHAR (100)
);
COMMENT ON TABLE "tblTopicImport" IS 'Temp table to store topic list import';

-- CREATE INDEXES ...

CREATE TABLE "tblTypeofReport"
 (
	"TypeofReportID"			SERIAL, 
	"TypeofReportDescription"			VARCHAR (100) NOT NULL
);
COMMENT ON TABLE "tblTypeofReport" IS 'List of reference types';

-- CREATE INDEXES ...
ALTER TABLE "tblTypeofReport" ADD CONSTRAINT "tblTypeofReport_pkey" PRIMARY KEY ("TypeofReportID");
CREATE INDEX "tblTypeofReport_TypeofReportID_idx" ON "tblTypeofReport" ("TypeofReportID");

CREATE TABLE "tblUnlinkedStudies"
 (
	"TopicDescription"			VARCHAR (510), 
	"StudyDescription"			VARCHAR (510), 
	"Problem"			VARCHAR (510)
);
COMMENT ON TABLE "tblUnlinkedStudies" IS 'Temp table to store results of integrity check on new topic list import';

-- CREATE INDEXES ...
CREATE INDEX "tblUnlinkedStudies_StudyID_idx" ON "tblUnlinkedStudies" ("TopicDescription");

CREATE TABLE "tblIntervention"
 (
	"InterventionID"			SERIAL, 
	"InterventionDescription"			VARCHAR (510) NOT NULL
);
COMMENT ON COLUMN "tblIntervention"."InterventionID" IS 'Automatically assigned by the system';
COMMENT ON TABLE "tblIntervention" IS 'Holds list of user-defined interventions';

-- CREATE INDEXES ...
ALTER TABLE "tblIntervention" ADD CONSTRAINT "tblIntervention_pkey" PRIMARY KEY ("InterventionID");

CREATE TABLE "tblReport"
 (
	"CENTRALReportID"			VARCHAR (100), 
	"CRGReportID"			SERIAL, 
	"Title"			TEXT, 
	"Notes"			TEXT, 
	"ReportNumber"			VARCHAR (510), 
	"OriginalTitle"			TEXT, 
	"Authors"			TEXT, 
	"Journal"			VARCHAR (510), 
	"Year"			VARCHAR (40), 
	"Volume"			VARCHAR (40), 
	"Issue"			VARCHAR (100), 
	"Pages"			VARCHAR (100), 
	"Language"			VARCHAR (40), 
	"Abstract"			TEXT, 
	"CENTRALSubmissionStatus"			VARCHAR (2), 
	"CopyStatus"			VARCHAR (100), 
	"DatetoCENTRAL"			TIMESTAMP WITHOUT TIME ZONE, 
	"Dateentered"			TIMESTAMP WITHOUT TIME ZONE, 
	"DateEdited"			TIMESTAMP WITHOUT TIME ZONE, 
	"Editors"			TEXT, 
	"Publisher"			VARCHAR (100), 
	"City"			VARCHAR (100), 
	"DupString"			VARCHAR (300), 
	"TypeofReportID"			INTEGER, 
	"PublicationTypeID"			INTEGER, 
	"Edition"			VARCHAR (100), 
	"Medium"			VARCHAR (100), 
	"UDef1"			VARCHAR (510), 
	"UDef2"			VARCHAR (510), 
	"UDef3"			VARCHAR (510), 
	"UDef4"			VARCHAR (510), 
	"UDef5"			TEXT, 
	"UDef6"			VARCHAR (510), 
	"UDef7"			VARCHAR (510), 
	"UDef8"			VARCHAR (510), 
	"UDef9"			VARCHAR (510), 
	"UDef10"			VARCHAR (510)
);
COMMENT ON COLUMN "tblReport"."CENTRALReportID" IS 'ID assigned in CENTRAL - unlikely to be used initially';
COMMENT ON COLUMN "tblReport"."CRGReportID" IS 'Locally assigned ID';
COMMENT ON COLUMN "tblReport"."Title" IS 'English translation of title';
COMMENT ON COLUMN "tblReport"."Notes" IS 'User''s notes';
COMMENT ON COLUMN "tblReport"."OriginalTitle" IS 'Non-English title';
COMMENT ON COLUMN "tblReport"."Authors" IS 'Author(s) of report in the format  Lastname Initials; Lastname Initials etc.';
COMMENT ON COLUMN "tblReport"."Journal" IS 'Name of journal';
COMMENT ON COLUMN "tblReport"."Year" IS 'Year journal published';
COMMENT ON COLUMN "tblReport"."Volume" IS 'Volume of jounal report appears in';
COMMENT ON COLUMN "tblReport"."Issue" IS 'Issue of journal report appears in';
COMMENT ON COLUMN "tblReport"."Pages" IS 'Pages of journal that the report appears in';
COMMENT ON COLUMN "tblReport"."Language" IS 'The language the report was written in';
COMMENT ON COLUMN "tblReport"."Abstract" IS 'Abstract';
COMMENT ON COLUMN "tblReport"."CENTRALSubmissionStatus" IS 'Display as Radio buttons, potential values: I (Include), E (Exclude), P (Pending)';
COMMENT ON COLUMN "tblReport"."CopyStatus" IS 'Display as Radion buttons? Potential values: Reprint ordered, Copy obtained, Seeking source etc.';
COMMENT ON COLUMN "tblReport"."DatetoCENTRAL" IS 'Date the report was sent to CENTRAL';
COMMENT ON COLUMN "tblReport"."Dateentered" IS 'Date report added to database';
COMMENT ON COLUMN "tblReport"."DateEdited" IS 'Date the record in this table was edited';
COMMENT ON COLUMN "tblReport"."Editors" IS 'Mainly for reports of books in the format Lastname Initials; Lastname Initials etc.';
COMMENT ON COLUMN "tblReport"."Publisher" IS 'Publisher of book';
COMMENT ON COLUMN "tblReport"."City" IS 'City of publication';
COMMENT ON COLUMN "tblReport"."DupString" IS 'Generated string used for duplicate checking when importing references';
COMMENT ON COLUMN "tblReport"."TypeofReportID" IS 'Choose from a list.  Examples are Full article, abstract, etc.';
COMMENT ON COLUMN "tblReport"."Edition" IS 'For a journal something like "(British ed)"; for a book, something like "2nd ed"';
COMMENT ON COLUMN "tblReport"."UDef1" IS 'Study Design';
COMMENT ON COLUMN "tblReport"."UDef2" IS 'DOI';
COMMENT ON COLUMN "tblReport"."UDef3" IS 'Contact Info';
COMMENT ON COLUMN "tblReport"."UDef4" IS 'ISSN or ID';
COMMENT ON COLUMN "tblReport"."UDef5" IS 'Duration of Trial';
COMMENT ON COLUMN "tblReport"."UDef6" IS 'PMID';
COMMENT ON COLUMN "tblReport"."UDef7" IS 'Trial Registration ID';
COMMENT ON COLUMN "tblReport"."UDef8" IS 'CRS Accession Number';
COMMENT ON COLUMN "tblReport"."UDef9" IS 'Keywords';
COMMENT ON COLUMN "tblReport"."UDef10" IS 'MeSH';
COMMENT ON TABLE "tblReport" IS 'References - In initial design called Reports hence table name';

-- CREATE INDEXES ...
CREATE INDEX "tblReport_CENTRAL_Report_ID_idx" ON "tblReport" ("CENTRALReportID");
ALTER TABLE "tblReport" ADD CONSTRAINT "tblReport_pkey" PRIMARY KEY ("CRGReportID");
CREATE INDEX "tblReport_ReferenceTypeID_idx" ON "tblReport" ("PublicationTypeID");
CREATE INDEX "tblReport_TypeofReportID_idx" ON "tblReport" ("TypeofReportID");


-- CREATE Relationships ...
-- Relationship from "tblReport" ("TypeofReportID") to "tblTypeofReport"("TypeofReportID") does not enforce integrity.
-- Relationship from "tblReport" ("CRGReportID") to "tblReport"("CRGReportID") does not enforce integrity.
-- Relationship from "tblTopic" ("CRGTopicID") to "tblTopicImport"("CRGTopicID") does not enforce integrity.
-- Relationship from "tblStudyTopic" ("CRGTopicID") to "tblTopic"("CRGTopicID") does not enforce integrity.
-- Relationship from "tblImportedReports" ("CRGStudyID") to "tblStudy"("CRGStudyID") does not enforce integrity.

END;
