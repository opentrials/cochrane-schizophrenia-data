BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblDesign" FROM STDIN WITH CSV HEADER;
DesignID,DesignDescription
1,"RCT"
2,"CCT"
127,"Crescenzo, Franco'"
\.
END;
