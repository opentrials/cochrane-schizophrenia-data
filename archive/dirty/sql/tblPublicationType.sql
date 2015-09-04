BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblPublicationType" FROM STDIN WITH CSV HEADER;
PublicationTypeID,PublicationTypeDescription,Change
1,"Journal article",0
2,"Book",0
3,"Section of book",0
4,"Conference proceedings",0
5,"Correspondence",0
6,"Computer program",0
7,"Unpublished data",0
8,"Other",0
9,"Cochrane review",0
\.
END;
