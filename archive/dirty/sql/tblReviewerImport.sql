BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblReviewerImport" FROM STDIN WITH CSV HEADER;
RevManID,prefix,first_name,last_name,suffix,initials,contact_2nd,organisation,department,position,e_mail,url,first_1,second_1,city_1,region_1,country_1,code_1,first_2,second_2,city_2,region_2,country_2,code_2,phone_1,phone_2,phone_3,ph_ext_1,ph_ext_2,ph_ext_3,fax_1,fax_2,role,notes,description,home,restricted,date_created,date_edited,Group_ID,Selected,TempID,New
\.
END;
