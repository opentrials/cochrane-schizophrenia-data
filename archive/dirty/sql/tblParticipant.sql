BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblParticipant" FROM STDIN WITH CSV HEADER;
ParticipantsID,ParticipantDescription
7,"Male"
9,"Female"
10,"Child"
18,"Adolescent"
33,"Older Adult"
53,"Middle Aged"
56,"Adult"
62,"Student"
66,"Family"
70,"Carer"
\.
END;
