BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblMyGroupInformation" FROM STDIN WITH CSV HEADER;
SetupID,GroupName,RegisterCode
1,"Cochrane Schizophrenia Group","SR-SCHIZ"
\.
END;
