BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblTempSearchLine" FROM STDIN WITH CSV HEADER;
NotOperatorTrue,Operator,Value,Logical,SearchType,SearchFieldDefID,SavedSearchID,SearchLineID
\.
END;
