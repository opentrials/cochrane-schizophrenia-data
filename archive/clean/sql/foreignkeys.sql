BEGIN;


-- Schema
SET search_path = "clean", pg_catalog;
SET client_encoding = 'UTF-8';


-- Trial/Condition
ALTER TABLE "trial2condition" ADD CONSTRAINT "trial2condition_trial_id_fk" FOREIGN KEY ("trial_id") REFERENCES "trial"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "trial2condition" ADD CONSTRAINT "trial2condition_condition_id_fk" FOREIGN KEY ("condition_id") REFERENCES "condition"("id") ON UPDATE CASCADE ON DELETE CASCADE;


-- Trial/Method
ALTER TABLE "trial2method" ADD CONSTRAINT "trial2method_trial_id_fk" FOREIGN KEY ("trial_id") REFERENCES "trial"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "trial2method" ADD CONSTRAINT "trial2method_method_id_fk" FOREIGN KEY ("method_id") REFERENCES "method"("id") ON UPDATE CASCADE ON DELETE CASCADE;


END;
