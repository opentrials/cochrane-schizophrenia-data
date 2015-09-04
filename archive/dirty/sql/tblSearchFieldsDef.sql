BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblSearchFieldsDef" FROM STDIN WITH CSV HEADER;
StudySearchField,SQLField,SQLMainTable,SQLLinkTable,SearchType,SearchFieldID,SQLString,ValueDelim,SQLDate,StudyUDef
"Intervention","InterventionDescription","tblIntervention","tblStudyIntervention",1,14,"tblStudy.CRGStudyID In (SELECT tblStudyIntervention.CRGStudyID FROM tblIntervention INNER JOIN tblStudyIntervention ON tblIntervention.InterventionID = tblStudyIntervention.InterventionID WHERE tblIntervention.InterventionDescription Operator ""CriteriaValue"")",,0,
"Health care condition","HealthCareConditionDescription","tblHealthCareCondition","tblStudyHealthCareCondition",1,15,"tblStudy.CRGStudyID In (SELECT tblStudyHealthCareCondition.CRGStudyID FROM tblHealthCareCondition INNER JOIN tblStudyHealthCareCondition ON tblHealthCareCondition.HealthCareConditionID = tblStudyHealthCareCondition.HealthCareConditionID WHERE tblHealthCareCondition.HealthCareConditionDescription Operator ""CriteriaValue"")",,0,
"Method","MethodofAllocationDescription","tblMethodofAllocation","tblStudyMethod",1,16,"tblStudy.CRGStudyID In (SELECT tblStudyMethod.CRGStudyID FROM tblMethodofAllocation INNER JOIN tblStudyMethod ON tblMethodofAllocation.MethodofAllocationID = tblStudyMethod.MethodofAllocationID WHERE tblMethodofAllocation.MethodofAllocationDescription Operator ""CriteriaValue"")",,0,
"Outcome","OutcomeDescription","tblOutcome","tblStudyOutcome",1,17,"tblStudy.CRGStudyID In (SELECT tblStudyOutcome.CRGStudyID FROM tblOutcome INNER JOIN tblStudyOutcome ON tblOutcome.OutcomeID = tblStudyOutcome.OutcomeID WHERE tblOutcome.OutcomeDescription Operator ""CriteriaValue"")",,0,
"Design","DesignDescription","tblDesign","tblStudyDesign",1,18,"tblStudy.CRGStudyID In (SELECT tblStudyDesign.CRGStudyID FROM tblDesign INNER JOIN tblStudyDesign ON tblDesign.DesignID = tblStudyDesign.DesignID WHERE tblDesign.DesignDescription Operator ""CriteriaValue"")",,0,
"Study name","ShortName","tblStudy",,1,19,,"""",0,
"Status of study","StatusofStudy","tblStudy",,1,20,,"""",0,
"Contact details","TrialistContactDetails","tblStudy",,1,21,,"""",0,
"Register status","CENTRALSubmissionStatus","tblStudy",,1,22,,"""",0,
"Notes","Notes","tblStudy",,1,23,,"""",0,
"Participant","ParticipantDescription","tblParticipant","tblStudyParticipant",1,24,"tblStudy.CRGStudyID In (SELECT tblStudyParticipant.CRGStudyID FROM tblStudyParticipant INNER JOIN tblParticipant ON tblStudyParticipant.ParticipantsID = tblParticipant.ParticipantsID WHERE (((tblParticipant.ParticipantDescription) Operator ""CriteriaValue"" )) )",,0,
"Date entered","DateEntered","tblStudy",,1,25,,"#",1,
"Title","Title","tblReport",,2,27,,"""",0,
"Original title","OriginalTitle","tblReport",,2,28,,"""",0,
"Authors","Authors","tblReport",,2,29,,"""",0,
"Journal/book/source name","Journal","tblReport",,2,30,,"""",0,
"Date of publication","Year","tblReport",,2,31,,"""",0,
"Volume","Volume","tblReport",,2,32,,"""",0,
"Issue","Issue","tblReport",,2,33,,"""",0,
"Pages","Pages","tblReport",,2,34,,"""",0,
"Language","Language","tblReport",,2,35,,"""",0,
"Abstract","Abstract","tblReport",,2,36,,"""",0,
"Copy status","CopyStatus","tblReport",,2,37,,"""",0,
"Notes","Notes","tblReport",,2,38,,"""",0,
"Date entered","Dateentered","tblReport",,2,39,,"#",1,
"Editors","Editors","tblReport",,2,40,,"""",0,
"Publisher","Publisher","tblReport",,2,41,,"""",0,
"City of publication","City","tblReport",,2,42,,"""",0,
"Edition","Edition","tblReport",,2,43,,"""",0,
"Study name","ShortName","tblStudy","tblStudyReport",2,44,"tblReport.CRGReportID In (SELECT tblStudyReport.CRGReportID FROM tblStudy INNER JOIN tblStudyReport ON tblStudy.CRGStudyID = tblStudyReport.CRGStudyID WHERE tblStudy.ShortName Operator ""CriteriaValue"")",,0,
"Keyword","Keyword","tblCRGKeyword","tblReportCRGKeyword",2,45,"tblReport.CRGReportID In (SELECT tblReportCRGKeyword.CRGReportID FROM tblCRGKeyword INNER JOIN tblReportCRGKeyword ON tblCRGKeyword.CRGKeywordID = tblReportCRGKeyword.CRGKeywordID WHERE tblCRGKeyword.CRGKeywordDescription Operator ""CriteriaValue"")",,0,
"External database ID","ExternalID","tblReportExternalID",,2,46,"tblReport.CRGReportID In (SELECT tblReportExternalID.CRGReportID
FROM tblReportExternalID 
WHERE tblReportExternalID.ExternalID Operator ""CriteriaValue"")",,0,
"Reviewer last name","last_name","tblReviewer","tblReportReviewer",2,47,"tblReport.CRGReportID In (SELECT tblReportReviewer.CRGReportID FROM tblReviewer INNER JOIN tblReportReviewer ON tblReviewer.reviewer_id = tblReportReviewer.reviewer_id WHERE tblReviewer.last_name Operator ""CriteriaValue"")",,0,
"Type of report","TypeofReportDescription","tblTypeofReport","tblReport",2,48,"tblReport.CRGReportID In (SELECT tblReport.CRGReportID FROM tblReport INNER JOIN tblTypeofReport ON tblReport.TypeofReportID = tblTypeofReport.TypeofReportID WHERE tblTypeofReport.TypeofReportDescription Operator ""CriteriaValue"")",,0,
"Reference type","PublicationTypeDescription","tblPublicationType","tblReport",2,49,"tblReport.CRGReportID In (SELECT tblReport.CRGReportID FROM tblReport INNER JOIN tblPublicationType ON tblReport.PublicationTypeID = tblPublicationType.PublicationTypeID WHERE tblPublicationType.PublicationTypeDescription Operator ""CriteriaValue"")",,0,
"Number randomised","UDef1","tblStudy",,1,50,,"""",0,1
"Country of origin","UDef2","tblStudy",,1,51,,"""",0,2
"User defined 3","UDef3","tblStudy",,1,52,,"""",0,3
"Incomplete coding","UDef4","tblStudy",,1,53,,"""",0,4
"Notes2","UDef5","tblStudy",,1,54,,"""",0,5
"Topic list","TopicDescription","tblTopic","tblStudyTopic",1,55,"tblStudy.CRGStudyID In (SELECT tblStudyTopic.CRGStudyID FROM tblTopic INNER JOIN tblStudyTopic ON tblTopic.CRGTopicID = tblStudyTopic.CRGTopicID WHERE tblTopic.TopicDescription Operator ""CriteriaValue"")",,0,0
"Review title","title","tblReview","tblStudyReview",1,56,"tblStudy.CRGStudyID In (SELECT tblStudyReview.CRGStudyID
FROM tblReview INNER JOIN tblStudyReview ON tblReview.AutoID = tblStudyReview.ReviewID
WHERE tblReview.title Operator ""CriteriaValue"")",,0,
"Index terms","IndexingTerms","tblReportExternalID",,2,57,"tblReport.CRGReportID In (SELECT tblReportExternalID.CRGReportID
FROM tblReportExternalID 
WHERE tblReportExternalID.IndexingTerms Operator ""CriteriaValue"")",,0,0
"Section in review","SectionInReview","tblStudyReview",,1,58,"tblStudy.CRGStudyID In (SELECT tblStudyReview.CRGStudyID
FROM tblStudyReview 
WHERE tblStudyReview.SectionInReview Operator ""CriteriaValue"")",,0,
"Date assigned to reviewer","DateToReviewer","tblReportReviewer",,2,59,"tblReport.CRGReportID In (SELECT tblReportReviewer.CRGReportID FROM tblReportReviewer  WHERE tblReportReviewer.DateToReviewer Operator #CriteriaValue#)","#",1,
"Database Import Source","UDef1","tblReport",,2,60,,"""",0,6
"Digital Object Identifier","UDef2","tblReport",,2,61,,"""",0,7
"Address","UDef3","tblReport",,2,62,,"""",0,8
"ISSN/ISBN","UDef4","tblReport",,2,63,,"""",0,9
"Other Extracted Data","UDef5","tblReport",,2,64,,"""",0,10
"Report Number","ReportNumber","tblReport",,2,66,,"""",0,0
"Date edited","Dateedited","tblStudy",,1,67,,"#",1,0
"ISRCTN","ISRCTN","tblStudy",,1,68,,"""",0,0
"User defined 6","UDef6","tblReport",,2,69,,"""",0,16
"User defined 7","UDef7","tblReport",,2,70,,"""",0,17
"User defined 8","UDef8","tblReport",,2,71,,"""",0,18
"User defined 9","UDef9","tblReport",,2,72,,"""",0,19
"User defined 10","UDef10","tblReport",,2,73,,"""",0,20
"User defined 6","UDef6","tblStudy",,1,74,,"""",0,11
"User defined 7","UDef7","tblStudy",,1,75,,"""",0,12
"User defined 8","UDef8","tblStudy",,1,76,,"""",0,13
"User defined 9","UDef9","tblStudy",,1,77,,"""",0,14
"User defined 10","UDef10","tblStudy",,1,78,,"""",0,15
"External database name","Description","tblReportExternalID",,2,79,"tblReport.CRGReportID In (SELECT tblReportExternalID.Description
FROM tblReportExternalID 
WHERE tblReportExternalID.Description Operator ""CriteriaValue"")",,0,
\.
END;
