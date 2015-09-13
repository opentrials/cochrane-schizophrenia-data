BEGIN;


-- Schema
SET search_path = "clean", pg_catalog;
SET client_encoding = 'UTF-8';


-- trial.source_id
ALTER TABLE "trial" ADD CONSTRAINT "trial_source_id" FOREIGN KEY ("source_id") REFERENCES "source"("id") ON UPDATE CASCADE ON DELETE CASCADE;


-- trial.registration_id
ALTER TABLE "trial" ADD CONSTRAINT "trial_registration_id" FOREIGN KEY ("registration_id") REFERENCES "registration"("id") ON UPDATE CASCADE ON DELETE CASCADE;


-- trial2condition
ALTER TABLE "trial2condition" ADD CONSTRAINT "trial2condition_trial_id_fk" FOREIGN KEY ("trial_id") REFERENCES "trial"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "trial2condition" ADD CONSTRAINT "trial2condition_condition_id_fk" FOREIGN KEY ("condition_id") REFERENCES "condition"("id") ON UPDATE CASCADE ON DELETE CASCADE;


-- trial2method
ALTER TABLE "trial2method" ADD CONSTRAINT "trial2method_trial_id_fk" FOREIGN KEY ("trial_id") REFERENCES "trial"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "trial2method" ADD CONSTRAINT "trial2method_method_id_fk" FOREIGN KEY ("method_id") REFERENCES "method"("id") ON UPDATE CASCADE ON DELETE CASCADE;


-- trial2drug
ALTER TABLE "trial2drug" ADD CONSTRAINT "trial2drug_trial_id_fk" FOREIGN KEY ("trial_id") REFERENCES "trial"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "trial2drug" ADD CONSTRAINT "trial2drug_drug_id_fk" FOREIGN KEY ("drug_id") REFERENCES "drug"("id") ON UPDATE CASCADE ON DELETE CASCADE;


-- trial2document
ALTER TABLE "trial2document" ADD CONSTRAINT "trial2document_trial_id_fk" FOREIGN KEY ("trial_id") REFERENCES "trial"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "trial2document" ADD CONSTRAINT "trial2document_document_id_fk" FOREIGN KEY ("document_id") REFERENCES "document"("id") ON UPDATE CASCADE ON DELETE CASCADE;


-- trial2review
ALTER TABLE "trial2review" ADD CONSTRAINT "trial2review_trial_id_fk" FOREIGN KEY ("trial_id") REFERENCES "trial"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "trial2review" ADD CONSTRAINT "trial2review_review_id_fk" FOREIGN KEY ("review_id") REFERENCES "review"("id") ON UPDATE CASCADE ON DELETE CASCADE;



-- review2document
ALTER TABLE "review2document" ADD CONSTRAINT "review2document_review_id_fk" FOREIGN KEY ("review_id") REFERENCES "review"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "review2document" ADD CONSTRAINT "review2document_document_id_fk" FOREIGN KEY ("document_id") REFERENCES "document"("id") ON UPDATE CASCADE ON DELETE CASCADE;


END;
