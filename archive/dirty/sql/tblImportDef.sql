BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblImportDef" FROM STDIN WITH CSV HEADER;
ImpDefId,ImpDefDesc,ImpDefName,DateCreated,DateUpdated,TitleTag,OTitleTag,AuthorTag,JournalTag,YearTag,VolumeTag,IssueTag,PagesTag,LanguageTag,AbstractTag,EditorsTag,PublisherTag,CityTag,EditionTag,TypeOfRefTag,KeywordTag,MedLineIDTag,OtherIDTag,NotesTag,ParseSource,TagEndMarker,PageTwoTag,StartPageTag,EndPagetag,RecDelimChar,RecDelim,MediumTag,DesignTag,BlankLine,UDef1,UDef2,UDef3,UDef4,UDef5,ReportNumberTag,UDef6,UDef7,UDef8,UDef9,UDef10
1,"Designed 17/7/2000 for Meerkat Pilot Study","Tagged Text","2000-07-17 18:56:22","2000-07-17 18:56:22","TI","TT","AU","T2","PY","VL","M1","SP","LA","AB",,,,,"TY",,,,,0,"-",0,,,,1,,,1,,"DO","AD","SN",,"ST","AN",,,"KW",
\.
END;
