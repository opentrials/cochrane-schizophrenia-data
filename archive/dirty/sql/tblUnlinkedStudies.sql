BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblUnlinkedStudies" FROM STDIN WITH CSV HEADER;
TopicDescription,StudyDescription,Problem
\.
END;
