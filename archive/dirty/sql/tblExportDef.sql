BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblExportDef" FROM STDIN WITH CSV HEADER;
ExpDefId,ExpDefDesc,ExpDefName,DateCreated,DateUpdated,TitleTag,OTitleTag,AuthorTag,JournalTag,YearTag,VolumeTag,IssueTag,PagesTag,LanguageTag,AbstractTag,EditorsTag,PublisherTag,CityTag,EditionTag,TypeOfRefTag,KeywordTag,MedLineIDTag,OtherIDTag,NotesTag,TagEndMarker,RecDelimChar,RecDelim,MediumTag,DesignTag,RegTag,StudyTag,StartTag,EndTag,StartEnd,NumSpaces1,NumSpaces2,Core,BlankLine,UDef1,UDef2,UDef3,UDef4,UDef5,ReportNumberTag,UDef6,UDef7,UDef8,UDef9,UDef10
1,"This export definition is for exporting to a TXT file that will go straight into RevMan","RevMan","2001-02-14 17:37:44","2001-02-14 17:37:44","TI","TO","AU","SO","YR","VL","NO","PG",,"AB","ED","PB","CY","EN","RT","ME","AN",,"NI",":",,1,"MD",,,,,,0,,,0,1,,,,,,"RN",,,,,
2,,"Study + number RZ","2001-06-18 13:16:29","2001-06-18 13:16:29",,,,,,,,,,,,,,,,,,,,":",,1,,,,"ST",,,0,,,0,1,,,,,"NO",,,,,,
3,,"Full reference","2001-07-04 13:36:54","2001-07-04 13:36:54","TI","OT","AU","SO","YR","VO","IS","PG","LA","AB","ED","PB","CP","EN","RT","ME","AN",,"NO",":","%%%%",1,"MD","DS",,"ST",,,0,1,1,0,0,"DB","NO","AD","IB","OH","RN",,,,,
4,"Output for reviewers that does not include information that would not help selection","BLIND output","2001-10-23 09:41:42","2001-10-23 09:41:42","TI","OT",,,"YR",,,,,"AB",,,,,,"ME",,,,":","%%%%",1,,,,,,,0,,0,0,0,,,,,"UD",,,,,,
5,,"Conference Hard Copy","2002-01-13 20:31:05","2002-01-13 20:31:05","TI","OT","AU","SO","YR","VO","IS","PG",,,,,,"ED",,,,,,":","%%%%",1,,,,,,,0,1,1,0,0,,,,,,,,,,,
6,,"Citation and Number Randomised","2003-05-15 16:27:13","2003-05-15 16:27:13","TI","OT","AU","SO","PY","VO","IS","PG",,"AB",,,,,,,"AN","ID",,":",,1,,,,,,,0,,,0,1,,,,,"OE",,,,,,
\.
END;
