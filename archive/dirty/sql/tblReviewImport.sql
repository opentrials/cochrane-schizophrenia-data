BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblReviewImport" FROM STDIN WITH CSV HEADER;
review_id,review_no,title,cnt_reviewer,reviewers,status
\.
END;
