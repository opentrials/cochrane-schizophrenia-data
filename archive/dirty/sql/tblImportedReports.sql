BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblImportedReports" FROM STDIN WITH CSV HEADER;
Authors,Title,OriginalTitle,Journal,Year,Volume,Issue,Pages,Language,Abstract,Keywords,AccessionNumber,City,Editors,Publisher,Edition,OtherIDs,Medium,Design,Notes,ReportNumber,PublicationTypeDescription,UDef1,UDef2,UDef3,UDef4,UDef5,Dateentered,CarryForward,CRGStudyID,Duplicate,DupString,CENTRALReportID,TempReportID,UDef6,UDef7,UDef8,UDef9,UDef10
\.
END;
