BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblOptions" FROM STDIN WITH CSV HEADER;
DiscardDups,AuthorYearSeq,LastStudynum,UDefLabel1,UdefLabel2,UdefLabel3,UdefLabel4,UdefLabel5,RUDefLabel1,RUdefLabel2,RUdefLabel3,RUdefLabel4,RUdefLabel5,UdefLabel6,UdefLabel7,UdefLabel8,UdefLabel9,UdefLabel10,RudefLabel6,RudefLabel7,RudefLabel8,RudefLabel9,RudefLabel10
1,1,40,"Number randomised","Country of origin","User defined 3","Incomplete coding","Notes2","Database Import Source","Digital Object Identifier","Address","ISSN/ISBN","Other Extracted Data","User defined 6","User defined 7","User defined 8","User defined 9","User defined 10","User defined 6","User defined 7","User defined 8","User defined 9","User defined 10"
\.
END;
