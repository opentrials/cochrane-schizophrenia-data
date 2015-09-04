BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblTypeofReport" FROM STDIN WITH CSV HEADER;
TypeofReportID,TypeofReportDescription
1,"Abstract"
2,"Full paper"
3,"Other"
\.
END;
