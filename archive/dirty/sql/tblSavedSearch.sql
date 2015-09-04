BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblSavedSearch" FROM STDIN WITH CSV HEADER;
SavedSearchID,Name,Desc,DateCreated,DateEdited,SearchType
10,"Chlorpromazine","Studies not yet marked as included and excluded","2001-04-09 00:00:00","2001-04-09 00:00:00",1
12,"Blinding",,"2001-06-18 00:00:00","2001-06-18 00:00:00",2
13,"ECT","Created 20-06-2003","2001-06-20 00:00:00","2001-06-20 00:00:00",1
18,"Dissertations","Created  31-07-2001","2001-07-31 00:00:00","2001-07-31 00:00:00",2
24,"Cholinergics for TD August 01",,"2001-08-17 00:00:00","2001-08-17 00:00:00",2
30,"Cholinergics",,"2001-10-22 00:00:00","2001-10-22 00:00:00",1
31,"Cholinergics2",,"2001-10-22 00:00:00","2001-10-22 00:00:00",1
32,"Cholinergics3",,"2001-10-22 00:00:00","2001-10-22 00:00:00",1
36,"Stefan 1st Episode",,"2001-11-12 00:00:00","2001-11-12 00:00:00",2
37,"New antipsychotics for 1st Episode",,"2001-11-13 00:00:00","2001-11-13 00:00:00",2
38,"First or Early Episode of Schizophrenia",,"2001-11-13 00:00:00","2001-11-13 00:00:00",2
39,"PRN","Only in study intervention","2001-11-21 00:00:00","2001-11-21 00:00:00",1
56,"New Antipsychotics","Created 10-04-2002","2002-04-10 00:00:00","2002-04-10 00:00:00",2
57,"Low potency","Created 10-04-2004","2002-04-10 00:00:00","2002-04-10 00:00:00",2
59,"Management of sexual dysfunction","created 24-04-2002","2002-04-24 00:00:00","2002-04-24 00:00:00",1
60,"Zuclopenthixol","created 16-05-2002","2002-05-16 00:00:00","2002-05-16 00:00:00",1
63,"Glutamatergic drugs","Created 04-06-2002","2002-06-04 00:00:00","2002-06-04 00:00:00",2
67,"Benzodiazepine 1",,"2002-10-08 00:00:00","2002-10-08 00:00:00",2
68,"Benzodiazepine2","Created 08/10/02","2002-10-08 00:00:00","2002-10-08 00:00:00",2
70,"Child onset psychosis","Created 06-01-03","2003-01-06 00:00:00","2003-01-06 00:00:00",1
71,"Child onset psychosis refsearch","created 06-01-03","2003-01-06 00:00:00","2003-01-06 00:00:00",2
74,"Inpatient",,"2003-01-09 00:00:00","2003-01-09 00:00:00",2
77,"Atypical Drug names","created 15-01-2003","2003-01-15 00:00:00","2003-01-15 00:00:00",2
82,"Therapy or Behaviour","Part two of the CBT Search 07-02-03","2003-02-07 00:00:00","2003-02-07 00:00:00",2
83,"Challenge,Restu","Part three of CBT Search 7-2-03","2003-02-07 00:00:00","2003-02-07 00:00:00",2
90,"Sertindole","Created 14-04-2003","2003-04-14 00:00:00","2003-04-14 00:00:00",2
91,"Sertindole Study search","created 14-4-03","2003-04-14 00:00:00","2003-04-14 00:00:00",1
92,"Ziprasidone","Created 14-4-03","2003-04-14 00:00:00","2003-04-14 00:00:00",2
93,"Ziprasidone study search","Created 14-4-03","2003-04-14 00:00:00","2003-04-14 00:00:00",1
94,"Zuclopenthixol1","Created 14-04-2003","2003-04-14 00:00:00","2003-04-14 00:00:00",2
98,"Transcranial magnetic","Created 15-4-2003","2003-04-15 00:00:00","2003-04-15 00:00:00",2
99,"Deep brain stimulation","Created 15-4-03","2003-04-15 00:00:00","2003-04-15 00:00:00",2
100,"Vagus nerve","Created 15-4-03","2003-04-15 00:00:00","2003-04-15 00:00:00",2
101,"David Healey Search","15-5-2003","2003-05-15 00:00:00","2003-05-15 00:00:00",2
106,"Aripiprazole study search","created 30-05-2003","2003-05-30 00:00:00","2003-05-30 00:00:00",1
112,"Oestrogen","Created 23-06-2003","2003-06-23 00:00:00","2003-06-23 00:00:00",2
113,"Oestrogen Study Search","Created 23-06-2003","2003-06-23 00:00:00","2003-06-23 00:00:00",1
114,"Distraction Techniques for Schizophrenia","Created 23-06-2003","2003-06-23 00:00:00","2003-06-23 00:00:00",2
116,"Depot haloperidol decanoate for schizophrenia 1","created 8-7-2003","2003-07-08 00:00:00","2003-07-08 00:00:00",2
117,"Depot haloperidol decanoate for schizophrenia 2","Created 8-7-2003","2003-07-08 00:00:00","2003-07-08 00:00:00",2
118,"Depot haloperidol decanoate for schizophrenia 3","Created 8-7-2003","2003-07-08 00:00:00","2003-07-08 00:00:00",2
119,"Depot haloperidol decanoate for schizophrenia 4","Created 8-7-2003","2003-07-08 00:00:00","2003-07-08 00:00:00",2
120,"Depot haloperidol decanoate for schizophrenia 5","created 8-7-2003","2003-07-08 00:00:00","2003-07-08 00:00:00",2
121,"Depot haloperidol decanoate for schizophrenia 7","Created 8-7-2003","2003-07-08 00:00:00","2003-07-08 00:00:00",2
122,"Depot haloperidol decanoate for schizophrenia 6","8-7-2003","2003-07-08 00:00:00","2003-07-08 00:00:00",2
123,"Depot haloperidol decanoate for schizophrenia 8","8-7-2003","2003-07-08 00:00:00","2003-07-08 00:00:00",2
133,"Neuroleptic reduction study search","Created 14-7-2003","2003-07-14 00:00:00","2003-07-14 00:00:00",1
149,"Downs syndrome study search","created 11-8-2003","2003-08-11 00:00:00","2003-08-11 00:00:00",1
150,"Stefan new atypicals",,"2003-08-12 00:00:00","2003-08-12 00:00:00",2
151,"Older people","Created 31/08/2003","2003-08-31 00:00:00","2003-08-31 00:00:00",2
152,"Calcium channel blockers","Created 2-9-03","2003-09-02 00:00:00","2003-09-02 00:00:00",2
155,"Droperidol for schizophrenia","Created 10-9-03","2003-09-10 00:00:00","2003-09-10 00:00:00",1
159,"Coping","Part one of Distraction Techniques","2003-09-30 00:00:00","2003-09-30 00:00:00",2
163,"Akathisia","Created 05-11-2003","2003-11-05 00:00:00","2003-11-05 00:00:00",2
164,"Sodium Valporate","Created 05-11-2003","2003-11-05 00:00:00","2003-11-05 00:00:00",2
167,"Social Part 1","Created 09-12-2003","2003-12-09 00:00:00","2003-12-09 00:00:00",2
169,"Chinese Herb","Created 18-12-2003","2003-12-18 00:00:00","2003-12-18 00:00:00",2
170,"Chinese herb study","created 18-12-2003","2003-12-18 00:00:00","2003-12-18 00:00:00",1
184,"Compliance Therapy for Schizophrenia","Update Search done 07/01/04","2004-02-03 00:00:00","2004-02-03 00:00:00",2
185,"Zuclopenthixol dihydrochloride for schizophrenia","Reference search","2004-02-03 00:00:00","2004-02-03 00:00:00",2
191,"Substance abuse a","17/02/04 Pt 1 Substance abuse & Sz","2004-02-17 00:00:00","2004-02-17 00:00:00",2
192,"Substance abuse b","17/02/04 Pt 2 Substance abuse & Sz","2004-02-17 00:00:00","2004-02-17 00:00:00",2
193,"Psychosocial interventions for substance misuse and sz","Study search 17-02-04","2004-02-17 00:00:00","2004-02-17 00:00:00",1
195,"24 Hour Care for Schizophrenia","24-02-04","2004-02-24 00:00:00","2004-02-24 00:00:00",2
196,"24 Hour Care Study","Study search 24-02-04","2004-02-24 00:00:00","2004-02-24 00:00:00",1
197,"Depot b","Depot Perphenazine - 23/03/04","2004-03-23 00:00:00","2004-03-23 00:00:00",2
198,"Perphenazine Decanoate","Depot Perphenazine 23/03/04","2004-03-23 00:00:00","2004-03-23 00:00:00",2
199,"Perphenazine Only","Part of depot perphenazine 23-03-04","2004-03-24 00:00:00","2004-03-24 00:00:00",2
200,"Depot Perphenazine Study Search","24/03/2004","2004-03-24 00:00:00","2004-03-24 00:00:00",1
204,"Clotiapine for acute psychotic illness","Ref search 20-04-04","2004-04-20 00:00:00","2004-04-20 00:00:00",2
205,"Clotiapine Study Search","20-04-04","2004-04-20 00:00:00","2004-04-20 00:00:00",1
206,"Nicotine for Schizophrenia","Ref search 29-04-04","2004-04-29 00:00:00","2004-04-29 00:00:00",2
207,"Nicotine for Schizophrenia Study","Study Search 29-04-04","2004-04-29 00:00:00","2004-04-29 00:00:00",1
208,"Acupuncture for Schizophrenia","Ref search 29-04-04","2004-04-29 00:00:00","2004-04-29 00:00:00",2
209,"Acupuncture for Schizophrenia Study","Study search 29-04-04","2004-04-29 00:00:00","2004-04-29 00:00:00",1
210,"Cannabis for Schizophrenia Study search",,"2004-05-25 00:00:00","2004-05-25 00:00:00",1
217,"Adolescent study search","14-07-04","2004-07-14 00:00:00","2004-07-14 00:00:00",1
219,"Vocational Rehabilitation Refs","20-07-04","2004-07-20 00:00:00","2004-07-20 00:00:00",2
222,"Vocational Rehabilitation Study","20-07-04","2004-07-20 00:00:00","2004-07-20 00:00:00",1
224,"Depot risperidone","General depot search 20-07-04","2004-07-20 00:00:00","2004-07-20 00:00:00",2
225,"Depot Risperidone Study","20-07-04","2004-07-20 00:00:00","2004-07-20 00:00:00",1
227,"Antipsychotic combination pt c","created 17/08/04","2004-08-17 00:00:00","2004-08-17 00:00:00",2
228,"Antipsychotic combination Study","created 17/08/04","2004-08-17 00:00:00","2004-08-17 00:00:00",1
234,"Substance misuse study search","created 02-11-04","2004-11-02 00:00:00","2004-11-02 00:00:00",1
235,"Olanzapine Velotab","created 17-11-04","2004-11-17 00:00:00","2004-11-17 00:00:00",2
236,"Benperidol for Sz","30-11-04","2004-11-30 00:00:00","2004-11-30 00:00:00",2
240,"Token Economy 2005","Created 26-01-05","2005-01-26 00:00:00","2005-01-26 00:00:00",2
241,"Token Economy Study","Created 26-01-05","2005-01-26 00:00:00","2005-01-26 00:00:00",1
247,"Loxapine Study Search","created 08-02-2005","2005-02-08 00:00:00","2005-02-08 00:00:00",1
249,"Polydipsia Refs","created 09-02-05","2005-02-09 00:00:00","2005-02-09 00:00:00",2
250,"Polydipsia Studies","created 09-02-05","2005-02-09 00:00:00","2005-02-09 00:00:00",1
252,"Art Therapy","created 09-02-05","2005-02-09 00:00:00","2005-02-09 00:00:00",2
253,"Art Therapy Studies","created 09-02-05","2005-02-09 00:00:00","2005-02-09 00:00:00",1
259,"Atypical Antipsychotics for Sz & Dep Study","01-03-05","2005-03-01 00:00:00","2005-03-01 00:00:00",1
261,"Benzodiazepines for Schizophrenia","created 08-03-2005","2005-03-08 00:00:00","2005-03-08 00:00:00",2
264,"Carbamazepine pt 3","created 30-03-05","2005-03-30 00:00:00","2005-03-30 00:00:00",2
265,"Carbamazepine Study","created 30-03-05","2005-03-30 00:00:00","2005-03-30 00:00:00",1
267,"Perazine Refs","created 30-03-05","2005-03-30 00:00:00","2005-03-30 00:00:00",2
268,"Perazine Study","created 30-03-05","2005-03-30 00:00:00","2005-03-30 00:00:00",1
270,"Clozapine vs atypical antipsychotics","created 06-04-05","2005-04-06 00:00:00","2005-04-06 00:00:00",2
271,"Amisulpride","created 12-04-05","2005-04-12 00:00:00","2005-04-12 00:00:00",2
272,"Amisulpride Study","created 12-04-05","2005-04-12 00:00:00","2005-04-12 00:00:00",1
273,"Benzodiazapines alone or combined","created 12-04-05","2005-04-12 00:00:00","2005-04-12 00:00:00",2
276,"Prompt part 2","created 12-05-05","2005-05-12 00:00:00","2005-05-12 00:00:00",2
277,"Prompts part 1","use KW Appointment","2005-05-12 00:00:00","2005-05-12 00:00:00",2
278,"Prompts part 3","use KW = Letter","2005-05-12 00:00:00","2005-05-12 00:00:00",2
279,"Prompts - patients","24-05-05","2005-05-24 00:00:00","2005-05-24 00:00:00",2
280,"Prompts - patients - 2","24-05-05","2005-05-24 00:00:00","2005-05-24 00:00:00",2
281,"Prompts Study search","24-05-05","2005-05-24 00:00:00","2005-05-24 00:00:00",1
283,"Seclusion and Restraint Study search","26-05-05","2005-05-26 00:00:00","2005-05-26 00:00:00",1
285,"Hypersalivation Study Search","26-05-05","2005-05-26 00:00:00","2005-05-26 00:00:00",1
286,"Compliance Therapy","07-06-05","2005-06-07 00:00:00","2005-06-07 00:00:00",1
289,"Dose Response 1","07-06-05","2005-06-07 00:00:00","2005-06-07 00:00:00",2
290,"Dose response 2","07-06-05","2005-06-07 00:00:00","2005-06-07 00:00:00",2
291,"Dose response 3","07-06-05","2005-06-07 00:00:00","2005-06-07 00:00:00",2
292,"Dose response 4","07-06-05","2005-06-07 00:00:00","2005-06-07 00:00:00",2
293,"Dose response 5","07-06-05","2005-06-07 00:00:00","2005-06-07 00:00:00",2
298,"Haloperidol dose response Study","07-06-05","2005-06-07 00:00:00","2005-06-07 00:00:00",1
299,"Family Interventions","08-06-05","2005-06-08 00:00:00","2005-06-08 00:00:00",2
300,"Family study","08-06-05","2005-06-08 00:00:00","2005-06-08 00:00:00",1
301,"Length Title srch","14-06-05","2005-06-14 00:00:00","2005-06-14 00:00:00",2
302,"Length Abstract search","14-06-05","2005-06-14 00:00:00","2005-06-14 00:00:00",2
303,"Length Index terms search","14-06-05","2005-06-14 00:00:00","2005-06-14 00:00:00",2
307,"Hospital Title","14-06-05","2005-06-14 00:00:00","2005-06-14 00:00:00",2
308,"Hospital Abstract","14-06-05","2005-06-14 00:00:00","2005-06-14 00:00:00",2
309,"Hospital Index","14-06-05","2005-06-14 00:00:00","2005-06-14 00:00:00",2
316,"Neuroleptic reduction for tardive dyskinesia","07-07-2005","2005-07-07 00:00:00","2005-07-07 00:00:00",2
322,"Training-recurrence study","08-07-2005","2005-07-08 00:00:00","2005-07-08 00:00:00",1
323,"Depot haloperidol decanoate for schizophrenia","amended  part of 2003 srch","2005-07-11 00:00:00","2005-07-11 00:00:00",2
324,"Vitamin E for Tardive Dyskinesia","created 11-07-05","2005-07-11 00:00:00","2005-07-11 00:00:00",2
325,"Vitamin E for Tardive dyskinesia study","created 11-07-05","2005-07-11 00:00:00","2005-07-11 00:00:00",1
326,"Day Centres 1","Title search 11-07-05","2005-07-11 00:00:00","2005-07-11 00:00:00",2
327,"Day Centres 2","Abstract search 11-07-05","2005-07-11 00:00:00","2005-07-11 00:00:00",2
328,"Day Centres 3","Index term search 11-07-05","2005-07-11 00:00:00","2005-07-11 00:00:00",2
329,"Day Centres 4","Centres search","2005-07-11 00:00:00","2005-07-11 00:00:00",2
330,"Day Centres 5","Health search 11-07-05","2005-07-11 00:00:00","2005-07-11 00:00:00",2
331,"Day Centres 6","CMHC search 11-07-05","2005-07-11 00:00:00","2005-07-11 00:00:00",2
332,"Day Centre Studies","12-07-2005","2005-07-12 00:00:00","2005-07-12 00:00:00",1
334,"Pimozide","created 26-07-05","2005-07-26 00:00:00","2005-07-26 00:00:00",2
335,"Pimozide study","created 21-07-05","2005-07-26 00:00:00","2005-07-26 00:00:00",1
336,"Placebo","created 26-07-05","2005-07-26 00:00:00","2005-07-26 00:00:00",2
337,"Haloperidol vs placebo study","created 26-07-05","2005-07-26 00:00:00","2005-07-26 00:00:00",1
338,"Polyunsaturated fatty acids 1","created 27-07-05","2005-07-27 00:00:00","2005-07-27 00:00:00",2
339,"Polyunsaturated fatty acids 2","created 27-07-05","2005-07-27 00:00:00","2005-07-27 00:00:00",2
342,"Polyunsaturated fatty acids study","created 27-07-05","2005-07-27 00:00:00","2005-07-27 00:00:00",1
343,"Molindone","created 09-08-2005","2005-08-09 00:00:00","2005-08-09 00:00:00",2
344,"Molindone Study search","created 09-08-2005","2005-08-09 00:00:00","2005-08-09 00:00:00",1
345,"Dyskinesia","13-09-2005","2005-09-13 00:00:00","2005-09-13 00:00:00",2
346,"Catecholaminergic drugs 1","13-09-2005 part 1","2005-09-13 00:00:00","2005-09-13 00:00:00",2
350,"Catecholaminergic drugs 2","13-09-2005 part 2","2005-09-13 00:00:00","2005-09-13 00:00:00",2
352,"Catecholaminergic drugs 3","13-09-2005 part 3","2005-09-13 00:00:00","2005-09-13 00:00:00",2
355,"Risperidone vs Olanzapine study","created 14-09-2005","2005-09-14 00:00:00","2005-09-14 00:00:00",1
359,"Trifluoperazine part 1",,"2005-10-19 00:00:00","2005-10-19 00:00:00",2
361,"Trifluoperazine Study","19-10-05","2005-10-19 00:00:00","2005-10-19 00:00:00",1
363,"Trifluoperazine 2","created 19-10-2005","2005-10-21 00:00:00","2005-10-21 00:00:00",2
364,"Seclusion Restraint","25-10-05","2005-10-25 00:00:00","2005-10-25 00:00:00",2
365,"Penfluridol","created 03-11-2005","2005-11-03 00:00:00","2005-11-03 00:00:00",2
366,"Penfluridol study search","created 03-11-2005","2005-11-03 00:00:00","2005-11-03 00:00:00",1
367,"Prayer","08-11-2005","2005-11-08 00:00:00","2005-11-08 00:00:00",2
369,"Benzodiazepines for TD",,"2005-11-09 00:00:00","2005-11-09 00:00:00",2
370,"Benzodiazepines for TD study","09-11-2005","2005-11-09 00:00:00","2005-11-09 00:00:00",1
371,"Patient held 1","created 23/11/2005","2005-11-23 00:00:00","2005-11-23 00:00:00",2
372,"Patient held study","created 23-11-2005","2005-11-23 00:00:00","2005-11-23 00:00:00",1
373,"Anticholinergics 1","Antchol for TD 24-11-05","2005-11-24 00:00:00","2005-11-24 00:00:00",2
377,"Olanzapine Ref","30-11-2005","2005-11-30 00:00:00","2005-11-30 00:00:00",2
379,"Zotepine refs","30-11-2005","2005-11-30 00:00:00","2005-11-30 00:00:00",2
380,"Atypicals","30-11-2005","2005-11-30 00:00:00","2005-11-30 00:00:00",2
381,"Games","30-11-2005","2005-11-30 00:00:00","2005-11-30 00:00:00",2
382,"Zotepine","created 07-12-2005","2005-12-07 00:00:00","2005-12-07 00:00:00",2
383,"Zotepine study","created 09-12-2005","2005-12-09 00:00:00","2005-12-09 00:00:00",1
384,"Life skills 1","created 18-12-2005","2005-12-18 00:00:00","2005-12-18 00:00:00",2
385,"Life skills 2","created 18-12-2005","2005-12-18 00:00:00","2005-12-18 00:00:00",2
386,"Life skills 3","Daily created 18-12-2005","2005-12-18 00:00:00","2005-12-18 00:00:00",2
387,"Life skills 4","Living 18-12-2005","2005-12-18 00:00:00","2005-12-18 00:00:00",2
388,"Life skills 5","Independent 18-12-2005","2005-12-18 00:00:00","2005-12-18 00:00:00",2
389,"Life skills 6","Function 18-12-2005","2005-12-18 00:00:00","2005-12-18 00:00:00",2
390,"Life skills 7","Rehabilitation 18-12-2005","2005-12-18 00:00:00","2005-12-18 00:00:00",2
391,"Learning Difficulties 1","Cognitive part 20-12-02","2005-12-20 00:00:00","2005-12-20 00:00:00",2
392,"Learning disorder 2","Difficulty 20-12-05","2005-12-20 00:00:00","2005-12-20 00:00:00",2
393,"Learning difficulty 3","Downs part 20-12-05","2005-12-20 00:00:00","2005-12-20 00:00:00",2
394,"Learning disabilities Study search","without Retard 21-12-05","2005-12-21 00:00:00","2005-12-21 00:00:00",1
396,"Crisis 1","Acute 03-01-05","2006-01-03 00:00:00","2006-01-03 00:00:00",2
397,"Crisis 2","Community 03-01-06","2006-01-03 00:00:00","2006-01-03 00:00:00",2
398,"Crisis 3","Care pt1 03-01-06","2006-01-03 00:00:00","2006-01-03 00:00:00",2
399,"Crisis 4","care pt 2 03-01-06","2006-01-03 00:00:00","2006-01-03 00:00:00",2
400,"Antidepress for Neg Sym 1","A-b 03-01-2006","2006-01-03 00:00:00","2006-01-03 00:00:00",2
401,"Antidepress for neg sym 2","b-c 03-01-06","2006-01-03 00:00:00","2006-01-03 00:00:00",2
402,"Crisis 5 - Title","Title acute 19-01-06","2006-01-19 00:00:00","2006-01-19 00:00:00",2
403,"Crisis 6 title","Title - Community 19-01-06","2006-01-19 00:00:00","2006-01-19 00:00:00",2
404,"Crisis Study","19-01-06","2006-01-19 00:00:00","2006-01-19 00:00:00",1
405,"Containment 1","19-01-06","2006-01-19 00:00:00","2006-01-19 00:00:00",2
406,"Containment 2","19-01-06","2006-01-19 00:00:00","2006-01-19 00:00:00",2
407,"Containment 2a","19-01-06","2006-01-19 00:00:00","2006-01-19 00:00:00",2
408,"Containment 3","minute 19-01-06","2006-01-19 00:00:00","2006-01-19 00:00:00",2
409,"Containment 4","Check 19-01-06","2006-01-19 00:00:00","2006-01-19 00:00:00",2
410,"Containment study","24-01-06","2006-01-24 00:00:00","2006-01-24 00:00:00",1
411,"Negative symptoms","02-02-2006","2006-02-02 00:00:00","2006-02-02 00:00:00",2
412,"Negative symptoms 2","with antidepressants and mood disorders","2006-02-03 00:00:00","2006-02-03 00:00:00",2
413,"Lamotrigine","created 03-02-2006","2006-02-03 00:00:00","2006-02-03 00:00:00",2
414,"Lamotrigine study search","created 03-02-2006","2006-02-03 00:00:00","2006-02-03 00:00:00",1
415,"Antidepressants for Sz and Dep","created 03-03-06","2006-03-03 00:00:00","2006-03-03 00:00:00",2
416,"Antidepressants for Sz and Dep Study","created 09-03-06","2006-03-09 00:00:00","2006-03-09 00:00:00",1
417,"Clozapine versus typical neuroleptic med for sz","created 09-03-06","2006-03-09 00:00:00","2006-03-09 00:00:00",2
418,"Clozapine versus typical neuroleptic med Study","created 10-03-2006","2006-03-10 00:00:00","2006-03-10 00:00:00",1
419,"Early Intervention","created 10-03-2006","2006-03-10 00:00:00","2006-03-10 00:00:00",2
420,"CMHT-Community part","created 14-03-2006","2006-03-14 00:00:00","2006-03-14 00:00:00",2
421,"CMHT-team part","created 14-03-2006","2006-03-14 00:00:00","2006-03-14 00:00:00",2
422,"CMHT-treatment part","created 14-02-2006","2006-03-14 00:00:00","2006-03-14 00:00:00",2
423,"CMHT study","created 14-03-06","2006-03-14 00:00:00","2006-03-14 00:00:00",1
424,"Anticholinergics pt 2","Anticholinergics for TD OR Parks pt2 24-03-06","2006-03-24 00:00:00","2006-03-24 00:00:00",2
425,"Parkinsonism","created 24-03-2006","2006-03-24 00:00:00","2006-03-24 00:00:00",2
429,"Sultopride for schizophrenia","created 30-03-1006","2006-03-30 00:00:00","2006-03-30 00:00:00",2
430,"Sultopride study search","created 30-03-2006","2006-03-30 00:00:00","2006-03-30 00:00:00",1
434,"Intermittent drug techniques Study","created 30-03-2006","2006-03-30 00:00:00","2006-03-30 00:00:00",1
436,"Chlorpromazine 1","anadep - cpz created 31-03-2006","2006-03-31 00:00:00","2006-03-31 00:00:00",2
438,"Chlorpromazine 2","elmarine - klorazin 31-03-2006","2006-03-31 00:00:00","2006-03-31 00:00:00",2
439,"Chlorpromazine 3","klorpro - procalm 31-03-2006","2006-03-31 00:00:00","2006-03-31 00:00:00",2
440,"Chlorpromazine 4","proma - psylactil  31-03-2006","2006-03-31 00:00:00","2006-03-31 00:00:00",2
441,"Chlorpromazine 5","serazone - tranzine 31-03-06","2006-03-31 00:00:00","2006-03-31 00:00:00",2
444,"Cessation","pt 6 of CPZ Cessation search 31-03-06","2006-03-31 00:00:00","2006-03-31 00:00:00",2
447,"Chlorpromazine Cessation study search","31-03-06","2006-03-31 00:00:00","2006-03-31 00:00:00",1
448,"Supported housing 1","Housing part - 04-04-2006","2006-04-04 00:00:00","2006-04-04 00:00:00",2
449,"Supported housing 2","Shelter part 04-04-2006","2006-04-04 00:00:00","2006-04-04 00:00:00",2
450,"Supported housing 3","supported housing part 04-04-2006","2006-04-04 00:00:00","2006-04-04 00:00:00",2
451,"Supported housing study search","created 04-04-2006","2006-04-04 00:00:00","2006-04-04 00:00:00",1
454,"Cannabis for schizophrenia","07-04-2006","2006-04-07 00:00:00","2006-04-07 00:00:00",2
455,"Weight gain 1","created 12-04-06","2006-04-12 00:00:00","2006-04-12 00:00:00",2
456,"Weight gain 2","created 12-04-06","2006-04-12 00:00:00","2006-04-12 00:00:00",2
457,"Education","Part of psychoeducation 27-04-06","2006-04-27 00:00:00","2006-04-27 00:00:00",2
463,"Psychoeducation a",,"2006-04-27 00:00:00","2006-04-27 00:00:00",2
464,"Psychoeducation b","Patient part 27-04-06","2006-04-27 00:00:00","2006-04-27 00:00:00",2
465,"Psychoeducation c","Title for know instruc info teach","2006-04-27 00:00:00","2006-04-27 00:00:00",2
466,"Psychoeducation d","Abstract for know instru info teach","2006-04-27 00:00:00","2006-04-27 00:00:00",2
467,"Psychoeducation e","Index terms know instru info teach","2006-04-27 00:00:00","2006-04-27 00:00:00",2
468,"Psychoeducation f","Intervention/program AND with educ/family","2006-04-27 00:00:00","2006-04-27 00:00:00",2
469,"Psychoeducation study","11-05-2006","2006-05-11 00:00:00","2006-05-11 00:00:00",1
470,"Fluspirilene","Created 19-05-06","2006-05-19 00:00:00","2006-05-19 00:00:00",2
471,"Fluspirilene study","19-05-06","2006-05-19 00:00:00","2006-05-19 00:00:00",1
472,"Transcranial Magnetic Stimulation TMS","created 23-05-06","2006-05-23 00:00:00","2006-05-23 00:00:00",2
473,"Transcranial magnetic stimulation study","23-05-06","2006-05-23 00:00:00","2006-05-23 00:00:00",1
474,"Pregnancy & post partum","23-05-06","2006-05-23 00:00:00","2006-05-23 00:00:00",2
475,"Pregnancy & post partum study","23-05-06","2006-05-23 00:00:00","2006-05-23 00:00:00",1
478,"Flupenthixol Decanoate 1","Flupenthixol term 25-05-06","2006-05-25 00:00:00","2006-05-25 00:00:00",2
479,"Flupenthixol Decanoate 2","Decanoate/depot terms 25-05-06","2006-05-25 00:00:00","2006-05-25 00:00:00",2
480,"Flupenthixol decanoate study","25-05-06","2006-05-25 00:00:00","2006-05-25 00:00:00",1
481,"Sulpiride 1","created 25-05-06","2006-05-25 00:00:00","2006-05-25 00:00:00",2
482,"Sulpiride 2","25-05-06","2006-05-25 00:00:00","2006-05-25 00:00:00",2
483,"Sulpiride 3","25-05-06","2006-05-25 00:00:00","2006-05-25 00:00:00",2
484,"Sulpiride 4","25-05-06","2006-05-25 00:00:00","2006-05-25 00:00:00",2
485,"Sulpiride 5","25-05-06","2006-05-25 00:00:00","2006-05-25 00:00:00",2
486,"Sulpiride study","26-05-06","2006-05-26 00:00:00","2006-05-26 00:00:00",1
487,"Thioridazine","created 01-06-06","2006-06-01 00:00:00","2006-06-01 00:00:00",2
488,"Thioridazine study","created 01-06-06","2006-06-01 00:00:00","2006-06-01 00:00:00",1
489,"Olanzapine vs Placebo study","06-06-06","2006-06-06 00:00:00","2006-06-06 00:00:00",1
491,"Mother and baby study","06-06-06","2006-06-06 00:00:00","2006-06-06 00:00:00",1
492,"Weight and Metabolism","created 06-06-06","2006-06-06 00:00:00","2006-06-06 00:00:00",1
493,"Weight & Metabolism 1","12-06-06","2006-06-12 00:00:00","2006-06-12 00:00:00",2
494,"Weight & Metabolism 2","12-06-06","2006-06-12 00:00:00","2006-06-12 00:00:00",2
495,"Benzos for catatonia","14-06-06","2006-06-14 00:00:00","2006-06-14 00:00:00",2
505,"Sexual dysfunction 1","29-06-06","2006-06-29 00:00:00","2006-06-29 00:00:00",2
506,"Sexual Dysfunction 2","Run this search for Index terms too.","2006-06-29 00:00:00","2006-06-29 00:00:00",2
507,"Sexual Dysfunctioin 3","Run this search for index terms too","2006-06-29 00:00:00","2006-06-29 00:00:00",2
508,"Sexual Dysfunction 4","Run this search with index terms too.","2006-06-29 00:00:00","2006-06-29 00:00:00",2
509,"Sexual dysfunction Study","29-06-06","2006-06-29 00:00:00","2006-06-29 00:00:00",1
510,"Compulsory community treatment a","run this search for abstracts and index fields too","2006-06-29 00:00:00","2006-06-29 00:00:00",2
511,"Compulsory community treatment - b","run this search in Abstracts and Index fields too","2006-06-29 00:00:00","2006-06-29 00:00:00",2
512,"Compulsory community treatment c","run in abstracts and index fields too","2006-06-29 00:00:00","2006-06-29 00:00:00",2
513,"Compulsory community treatment d","run in abstracts and index fields too","2006-06-29 00:00:00","2006-06-29 00:00:00",2
514,"Compulsory community treatment e","29-06-06","2006-06-29 00:00:00","2006-06-29 00:00:00",2
515,"Compulsory community treatment - study","29-06-06","2006-06-29 00:00:00","2006-06-29 00:00:00",1
516,"Mother and baby units","Created June 2006, new term added July 06","2006-07-04 00:00:00","2006-07-04 00:00:00",2
522,"Advance directives a","27-07-06","2006-07-27 00:00:00","2006-07-27 00:00:00",2
523,"Advance directive b","27-07-06","2006-07-27 00:00:00","2006-07-27 00:00:00",2
524,"Advance directives study search","27-07-06","2006-07-27 00:00:00","2006-07-27 00:00:00",1
525,"Haloperidol 1","created 01-08-2006","2006-08-01 00:00:00","2006-08-01 00:00:00",2
526,"Haloperidol 2","dup - serena 01-08-2006","2006-08-01 00:00:00","2006-08-01 00:00:00",2
527,"Haloperidol 3","Ser-Zaf 01-08-2006","2006-08-01 00:00:00","2006-08-01 00:00:00",2
528,"Chlorpromazine 6","combine with chlorpromazine 1-5   01-08-2006","2006-08-01 00:00:00","2006-08-01 00:00:00",2
529,"Haloperidol and Chlorpromazine study","created 01-08-2006","2006-08-01 00:00:00","2006-08-01 00:00:00",1
530,"Olanzapine Dose Study","created 01-08-2006","2006-08-01 00:00:00","2006-08-01 00:00:00",1
531,"Morita Therapy","created 18-08-06","2006-08-18 00:00:00","2006-08-18 00:00:00",2
532,"Clozapine Combination","created 21-08-06","2006-08-21 00:00:00","2006-08-21 00:00:00",2
534,"Morita Therapy study search","created 18-08-06","2006-08-21 00:00:00","2006-08-21 00:00:00",1
535,"Clozapine combination Study search","created 21-08-06","2006-08-21 00:00:00","2006-08-21 00:00:00",1
536,"Oral Flupenthixol","created 06-09-06","2006-09-06 00:00:00","2006-09-06 00:00:00",2
537,"Oral flupenthixol study","created 06-09-06","2006-09-06 00:00:00","2006-09-06 00:00:00",1
538,"Fluphenazine 1","created 06-09-06","2006-09-06 00:00:00","2006-09-06 00:00:00",2
539,"Fluphenazine 2","created 06-09-06","2006-09-06 00:00:00","2006-09-06 00:00:00",2
540,"Fluphenazine vs Placebo study",,"2006-09-06 00:00:00","2006-09-06 00:00:00",1
542,"Risperidone","created 14-09-06","2006-09-14 00:00:00","2006-09-14 00:00:00",2
543,"Adolescent psychosis","created 14-09-2006","2006-09-14 00:00:00","2006-09-14 00:00:00",2
544,"Problems solving skills","created 20-09-06","2006-09-20 00:00:00","2006-09-20 00:00:00",2
545,"Problem solving skills study","created 20-09-06","2006-09-20 00:00:00","2006-09-20 00:00:00",1
546,"Testosterone","created 21-09-06","2006-09-21 00:00:00","2006-09-21 00:00:00",2
547,"Testosterone study","created 21-09-06","2006-09-21 00:00:00","2006-09-21 00:00:00",1
549,"Open general medical wards","created 27-09-06","2006-09-27 00:00:00","2006-09-27 00:00:00",2
550,"Open general medical wards study","created 28-09-06","2006-09-28 00:00:00","2006-09-28 00:00:00",1
551,"Hypnosis","created 03-10-09","2006-10-03 00:00:00","2006-10-03 00:00:00",2
552,"Hypnosis study","created 04-10-2006","2006-10-04 00:00:00","2006-10-04 00:00:00",1
553,"Drama therapy 1","created 04-10-2006","2006-10-04 00:00:00","2006-10-04 00:00:00",2
554,"Drama Therapy 2","created 04-10-2006","2006-10-04 00:00:00","2006-10-04 00:00:00",2
555,"Drama therapy study","created 04-10-2006","2006-10-04 00:00:00","2006-10-04 00:00:00",1
556,"As required meds (PRN) 1","created 11-10-2006","2006-10-11 00:00:00","2006-10-11 00:00:00",2
557,"As required meds (PRN) 2","created 11-10-2006","2006-10-11 00:00:00","2006-10-11 00:00:00",2
558,"Clotiapine for schizophrenia","created 02-11-06","2006-11-02 00:00:00","2006-11-02 00:00:00",2
560,"Periciazine","created 02-11-2006","2006-11-02 00:00:00","2006-11-02 00:00:00",2
561,"Periciazine study","created 02-11-06","2006-11-02 00:00:00","2006-11-02 00:00:00",1
562,"Clotiapine for Sz study","created 07-11-06","2006-11-07 00:00:00","2006-11-07 00:00:00",1
563,"Risperidone study","created 07-11-06","2006-11-07 00:00:00","2006-11-07 00:00:00",1
566,"Intermittent Drug Techniques for Sz","edited 08-11-06","2006-11-08 00:00:00","2006-11-08 00:00:00",2
567,"Chlorpromazine vs atypicals","created 08-11-2006","2006-11-08 00:00:00","2006-11-08 00:00:00",1
568,"Gamma-aminobutyric acid agonists for TD","created 09-11-06","2006-11-09 00:00:00","2006-11-09 00:00:00",2
569,"Gamma-aminobutyric acid agonists TD Study","created 08-11-06","2006-11-09 00:00:00","2006-11-09 00:00:00",1
570,"Misc Treatements for Tardive Dyskinesia","created 09-11-2006","2006-11-09 00:00:00","2006-11-09 00:00:00",2
571,"Amphetamines","created 14-11-2006","2006-11-14 00:00:00","2006-11-14 00:00:00",2
572,"Amphetamines study","created 14-11-2006","2006-11-14 00:00:00","2006-11-14 00:00:00",1
573,"Depot Pipothiazine palmitate","created 14-11-2006","2006-11-14 00:00:00","2006-11-14 00:00:00",2
574,"Depot Pipothiazine palmitate study","created 14-08-2006","2006-11-14 00:00:00","2006-11-14 00:00:00",1
575,"Social skills a","Pt1 KW=Personal, AND with pt 2","2006-11-15 00:00:00","2006-11-15 00:00:00",2
576,"Social Skills b","Pt 2 assign KW Skills, AND with pt 1","2006-11-15 00:00:00","2006-11-15 00:00:00",2
577,"Social Skills study","created 15-11-2006","2006-11-15 00:00:00","2006-11-15 00:00:00",1
578,"Life skills study","created 15-11-2006","2006-11-15 00:00:00","2006-11-15 00:00:00",1
580,"Aripiprazole","edited 16-11-2006","2006-11-16 00:00:00","2006-11-16 00:00:00",2
581,"Rehabilitation 1","created 23-11-06","2006-11-23 00:00:00","2006-11-23 00:00:00",2
582,"Rehabilitation 2","created 23-11-06","2006-11-23 00:00:00","2006-11-23 00:00:00",2
585,"Rehabilitation 3","created 23-11-06","2006-11-23 00:00:00","2006-11-23 00:00:00",2
587,"Carbamazepine 1","edited 29-11-2006","2006-11-29 00:00:00","2006-11-29 00:00:00",2
588,"Carbamazepine 2","edited 29-11-2006","2006-11-29 00:00:00","2006-11-29 00:00:00",2
589,"Carbamazepine 3","edited 29-11-2006","2006-11-29 00:00:00","2006-11-29 00:00:00",2
590,"Lithium 1","edited 29-11-2006","2006-11-29 00:00:00","2006-11-29 00:00:00",2
591,"Lithium 2","edited 29-11-2006","2006-11-29 00:00:00","2006-11-29 00:00:00",2
592,"Lithium study","created 29-11-2006","2006-11-29 00:00:00","2006-11-29 00:00:00",1
593,"Obsessive Compulsive Disorder","edited 16-12-06","2006-12-06 00:00:00","2006-12-06 00:00:00",2
594,"Paliperidone","created 07-12-2006","2006-12-07 00:00:00","2006-12-07 00:00:00",2
595,"Paliperidone study","created 14-12-2006","2006-12-14 00:00:00","2006-12-14 00:00:00",1
596,"ECT 1","edited 18-12-06","2006-12-18 00:00:00","2006-12-18 00:00:00",2
597,"ECT-2","edited 18-12-06","2006-12-18 00:00:00","2006-12-18 00:00:00",2
600,"Psychodyamic therapy","createdd 19-12-06","2006-12-19 00:00:00","2006-12-19 00:00:00",2
603,"Psychodynamic therapy study","created 19-12-06","2006-12-19 00:00:00","2006-12-19 00:00:00",1
606,"Cognitive rehab","Part 1, see IMS 19-12-06","2006-12-19 00:00:00","2006-12-19 00:00:00",2
607,"Depot Bromperidol 1","created 03-01-2007","2007-01-03 00:00:00","2007-01-03 00:00:00",2
608,"Depot Bromperidol 2","created 03-01-2007","2007-01-03 00:00:00","2007-01-03 00:00:00",2
609,"Depot Bromperidol Study","created 03-01-07","2007-01-03 00:00:00","2007-01-03 00:00:00",1
612,"Exercise therapy-1","Physical and therapy in ti","2007-01-17 00:00:00","2007-01-17 00:00:00",2
613,"Exercise therapy-2","Physical AND intervention ABSTRACt","2007-01-17 00:00:00","2007-01-17 00:00:00",2
614,"Exercise therapy-3","physical AND therap in INDEX TERMS","2007-01-17 00:00:00","2007-01-17 00:00:00",2
615,"Exercise therapy-4","fitness, sport…terms 17-01-07","2007-01-17 00:00:00","2007-01-17 00:00:00",2
616,"Exercise Therapy Study","created 17-01-07","2007-01-17 00:00:00","2007-01-17 00:00:00",1
617,"Perphenazine 1","created 17-01-2007","2007-01-17 00:00:00","2007-01-17 00:00:00",2
618,"Perphenazine 2","created 17-01-2007","2007-01-17 00:00:00","2007-01-17 00:00:00",2
620,"Perphenazine study","created 17-01-2007","2007-01-17 00:00:00","2007-01-17 00:00:00",1
621,"Quetiapine","edited 17-01-2007","2007-01-17 00:00:00","2007-01-17 00:00:00",2
622,"Quetiapine study","created 18-01-2007","2007-01-18 00:00:00","2007-01-18 00:00:00",1
623,"Arson","created 31-01-07","2007-01-31 00:00:00","2007-01-31 00:00:00",2
624,"Arson study search","created 31-01-07","2007-01-31 00:00:00","2007-01-31 00:00:00",1
625,"chinese dups 1",,"2007-02-06 00:00:00","2007-02-06 00:00:00",2
626,"chinese dups 2",,"2007-02-07 00:00:00","2007-02-07 00:00:00",2
627,"Valproate 1","created 08-02-07","2007-02-08 00:00:00","2007-02-08 00:00:00",2
628,"Valproate 2","created 08-02-07","2007-02-08 00:00:00","2007-02-08 00:00:00",2
629,"CBT 1","Cognitive part edited 15-02-07","2007-02-15 00:00:00","2007-02-15 00:00:00",2
630,"CBT 2","Behaviour Therapy edited 15-02-07","2007-02-15 00:00:00","2007-02-15 00:00:00",2
631,"CBT 3","Challenge part edited 15-02-07","2007-02-15 00:00:00","2007-02-15 00:00:00",2
632,"CBT 4","Self part edited 15-02-07","2007-02-15 00:00:00","2007-02-15 00:00:00",2
633,"CBT 5","Instruction part edited 15-02-07","2007-02-15 00:00:00","2007-02-15 00:00:00",2
634,"CBT 6","Rational part edited 15-02-07","2007-02-15 00:00:00","2007-02-15 00:00:00",2
635,"CBT 7","Emotiv part edited 15-02-07","2007-02-15 00:00:00","2007-02-15 00:00:00",2
636,"CBT study","edited 15-02-07","2007-02-15 00:00:00","2007-02-15 00:00:00",1
637,"Loxapine","edited 21-02-07","2007-02-21 00:00:00","2007-02-21 00:00:00",2
638,"Epilepsy","created 27-02-07","2007-02-27 00:00:00","2007-02-27 00:00:00",2
639,"Epilepsy study search","created 28-02-2007","2007-02-28 00:00:00","2007-02-28 00:00:00",1
640,"Aripiprazole vs Atypicals 1","created 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
641,"Aripiprazole vs Atypicals 2","created 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
642,"Aripiprazole vs Atypicals 3","created 28-02-2007","2007-02-28 00:00:00","2007-02-28 00:00:00",2
643,"Amisulpride vs Atypicals 1","created 28-02-2007","2007-02-28 00:00:00","2007-02-28 00:00:00",2
644,"Amisulpride vs Atypicals 2","created 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
645,"Amisulpride vs Atypicals 3","created 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
646,"Clozapine vs Atypicals 1","created 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
647,"Clozapine vs Atypicals 2","created 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
648,"Olanzapine vs Atypicals 1","created 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
649,"Olanzapine vs Atypicals 2","created 28-02-2007","2007-02-28 00:00:00","2007-02-28 00:00:00",2
650,"Quetiapine vs Atypicals 1","created 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
651,"Quetiapine vs Atypicals 2","created 28-02-2007","2007-02-28 00:00:00","2007-02-28 00:00:00",2
652,"Risperidone vs Atypicals 1","created 28-02-2007","2007-02-28 00:00:00","2007-02-28 00:00:00",2
653,"Risperidone vs Atypicals 2","created 28-02-2007","2007-02-28 00:00:00","2007-02-28 00:00:00",2
657,"Sertindole vs Atypicals 1","created 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
659,"Sertindole vs Atypicals 2","created 28-02-2007","2007-02-28 00:00:00","2007-02-28 00:00:00",2
660,"Ziprasidone vs Zotepine 1","zip vs atypicals created 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
661,"Ziprasidone vs Zotepine 2","zip vs atypicals created 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
662,"Anticholinergics for Parkinsonism 1","edited 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
663,"Anticholinergics for Parkinsonism 2","edited 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
665,"Anticholinergics for Parkinsonism 3","edited 28-02-07","2007-02-28 00:00:00","2007-02-28 00:00:00",2
666,"Clozapine induced hypersalivation 1","Cloz search edited 08-03-07","2007-03-08 00:00:00","2007-03-08 00:00:00",2
667,"Clozapine induced hypersalivation 2","hypersalivation part edited 08-03-07","2007-03-08 00:00:00","2007-03-08 00:00:00",2
670,"Ayurvedic Medicines","created 08-03-07","2007-03-08 00:00:00","2007-03-08 00:00:00",2
671,"Ayurvedic medicine study","edited 14-03-07","2007-03-14 00:00:00","2007-03-14 00:00:00",1
672,"Aripiprazole vs atypicals study","also run for Olz, Ris, Qut, Clz, Sert, Zip, Zot","2007-04-03 00:00:00","2007-04-03 00:00:00",1
673,"Amisulpride vs atypicals","Also run for other atypicals in grp. 02-04-07","2007-04-03 00:00:00","2007-04-03 00:00:00",1
674,"Quetiapine vs Atypicals study","Also run for other atypicals in group. 04-04-07","2007-04-04 00:00:00","2007-04-04 00:00:00",1
675,"Sertindole vs atypicals study","also run for sert vs zotepine. 12-04-07","2007-04-12 00:00:00","2007-04-12 00:00:00",1
676,"Ziprasidone vs atypicals study","created 12-04-07","2007-04-12 00:00:00","2007-04-12 00:00:00",1
677,"Clozapine vs Atypicals study","repeat for other atypicals in list","2007-04-12 00:00:00","2007-04-12 00:00:00",1
678,"Olanzapine vs atypicals study","repeat for other atypicals in list","2007-04-12 00:00:00","2007-04-12 00:00:00",1
679,"Antipsychotic combinations 1","keyword = drug","2007-04-18 00:00:00","2007-04-18 00:00:00",2
680,"Antipsychotic combinations 2","KW= Combination 18-04-07","2007-04-18 00:00:00","2007-04-18 00:00:00",2
681,"Antipsychotic combinations 3","KW = drug combinations 18-04-07","2007-04-18 00:00:00","2007-04-18 00:00:00",2
682,"Antipsychotic combinations 4","KW=drug combinations 18-04-07","2007-04-18 00:00:00","2007-04-18 00:00:00",2
683,"Dose response 6","edited 03-05-07","2007-05-03 00:00:00","2007-05-03 00:00:00",2
684,"Dose response 7","edited 03-05-07","2007-05-03 00:00:00","2007-05-03 00:00:00",2
685,"Dose response 8","edited 03-05-07","2007-05-03 00:00:00","2007-05-03 00:00:00",2
687,"Life skills programmes 1","Daily living -also do AB and IN fields 16-05-07","2007-05-16 00:00:00","2007-05-16 00:00:00",2
688,"Life Skills programmes 2","Independent function, do AB & IN fields.","2007-05-16 00:00:00","2007-05-16 00:00:00",2
689,"Life skills programmes 3","Rehab 16-05-07","2007-05-16 00:00:00","2007-05-16 00:00:00",2
690,"Life skills programme 4","16-05-07","2007-05-16 00:00:00","2007-05-16 00:00:00",2
692,"Life skills programme 5","16-05-07","2007-05-16 00:00:00","2007-05-16 00:00:00",2
694,"Length of hospitalisation - study","10-07-07","2007-07-10 00:00:00","2007-07-10 00:00:00",1
696,"Antipsychotics for Early Episode","created 12-07-2007","2007-07-12 00:00:00","2007-07-12 00:00:00",2
698,"Antipsychotics for early episode disorders Study","created 12-07-07","2007-07-12 00:00:00","2007-07-12 00:00:00",1
699,"Olanzapine vs typicals 1","created 18-07-2007","2007-07-18 00:00:00","2007-07-18 00:00:00",2
700,"Olanzapine vs typicals 2","created 18-07-07","2007-07-18 00:00:00","2007-07-18 00:00:00",2
701,"Olanzapine vs typicals 3","created 18-07-07","2007-07-18 00:00:00","2007-07-18 00:00:00",2
702,"Olanzapine vs typicals 4","created 18-07-2007","2007-07-18 00:00:00","2007-07-18 00:00:00",2
704,"Olanzapine vs typicals study search","Run typicals sql query search 1st.","2007-07-18 00:00:00","2007-07-18 00:00:00",1
705,"Olanzapine vs typicals 5","final search, assign kw olz vs typicals","2007-07-18 00:00:00","2007-07-18 00:00:00",2
706,"Atypicals for Sz and Depression","Edited 23-07-07","2007-07-23 00:00:00","2007-07-23 00:00:00",2
707,"Training recurrence 1","Assign kw=early sign. Edited 23-07-07","2007-07-23 00:00:00","2007-07-23 00:00:00",2
708,"Training recurrence 2","assign kw=relapse. Edited 23-07-07","2007-07-23 00:00:00","2007-07-23 00:00:00",2
709,"Training recurrence 3","assign kw=prevention. Edited 23-07-07","2007-07-23 00:00:00","2007-07-23 00:00:00",2
710,"Training recurrence 4","assign to kw=Evaluate . Edited 23-07-07","2007-07-23 00:00:00","2007-07-23 00:00:00",2
711,"Training recurrence 5","assign kw=Self.  Edited 23-07-07","2007-07-23 00:00:00","2007-07-23 00:00:00",2
712,"Training recurrence 6","Assign kw= symptom management.","2007-07-23 00:00:00","2007-07-23 00:00:00",2
713,"Dance therapy","created 24-07-07","2007-07-24 00:00:00","2007-07-24 00:00:00",2
714,"Dance therapy study","created 24-07-07","2007-07-24 00:00:00","2007-07-24 00:00:00",1
716,"Donepezil Study","created 26-07-07","2007-07-26 00:00:00","2007-07-26 00:00:00",1
718,"Donepezil for schizophrenia","created 26-07-07","2007-07-26 00:00:00","2007-07-26 00:00:00",2
719,"Distraction 1","created 13-09-07","2007-09-13 00:00:00","2007-09-13 00:00:00",2
720,"Distraction 2","created 13-09-07","2007-09-13 00:00:00","2007-09-13 00:00:00",2
721,"Distraction 3","created 13-09-07","2007-09-13 00:00:00","2007-09-13 00:00:00",2
722,"Distraction 4","created 13-09-07","2007-09-13 00:00:00","2007-09-13 00:00:00",2
723,"Distraction 5","created 13-09-07","2007-09-13 00:00:00","2007-09-13 00:00:00",2
724,"Distraction 6","13-09-07","2007-09-13 00:00:00","2007-09-13 00:00:00",2
725,"Distraction 7","13-09-07","2007-09-13 00:00:00","2007-09-13 00:00:00",2
726,"Distraction 8","13-09-07","2007-09-13 00:00:00","2007-09-13 00:00:00",2
727,"Distraction 9","13-09-07","2007-09-13 00:00:00","2007-09-13 00:00:00",2
728,"Distraction 10","13-09-07","2007-09-13 00:00:00","2007-09-13 00:00:00",2
729,"Distraction techniques study","Use with SQL study searches","2007-09-20 00:00:00","2007-09-20 00:00:00",1
731,"Antiglucocortoids","created 21-09-07","2007-09-21 00:00:00","2007-09-21 00:00:00",2
732,"Antiglucocortoids 2","created 21-09-07","2007-09-21 00:00:00","2007-09-21 00:00:00",2
733,"Antiglucocortoids 3","created 21-09-07","2007-09-21 00:00:00","2007-09-21 00:00:00",2
735,"Distraction study 1","created 01-10-07","2007-10-01 00:00:00","2007-10-01 00:00:00",1
736,"Distraction study 2","01-10-07","2007-10-01 00:00:00","2007-10-01 00:00:00",1
737,"Distraction study 3","01-10-07","2007-10-01 00:00:00","2007-10-01 00:00:00",1
738,"Distraction study 4","01-10-07","2007-10-01 00:00:00","2007-10-01 00:00:00",1
739,"Antiglucocorticoid study 1","created 08-10-07","2007-10-08 00:00:00","2007-10-08 00:00:00",1
740,"Antiglucocorticoid study 2","created 08-10-07","2007-10-08 00:00:00","2007-10-08 00:00:00",1
741,"IT Interventions 1","created 10-12-07","2007-12-10 00:00:00","2007-12-10 00:00:00",2
742,"IT Interventions 2","created 10-12-2007","2007-12-10 00:00:00","2007-12-10 00:00:00",2
743,"IT Interventions Study","created 10-12-2007","2007-12-10 00:00:00","2007-12-10 00:00:00",1
744,"Risperidone vs placebo 1","created 21-01-08","2008-01-21 00:00:00","2008-01-21 00:00:00",2
745,"Risperidone vs placebo 2","21-01-08","2008-01-21 00:00:00","2008-01-21 00:00:00",2
746,"Risperidone vs placebo 3","21-01-08","2008-01-21 00:00:00","2008-01-21 00:00:00",2
749,"Risperidone vs placebo study","21-01-08","2008-01-21 00:00:00","2008-01-21 00:00:00",1
750,"ECT study 1","edit date as required","2008-02-04 00:00:00","2008-02-04 00:00:00",1
751,"ECT study 2","edit date as required","2008-02-04 00:00:00","2008-02-04 00:00:00",1
752,"Weight gain study 1","edited 11-02-08","2008-02-11 00:00:00","2008-02-11 00:00:00",1
753,"Weight gain study 2","edited 11-02-08","2008-02-11 00:00:00","2008-02-11 00:00:00",1
754,"Obsessive-Compulsive Study search","edited 14-04-08","2008-04-14 00:00:00","2008-04-14 00:00:00",1
755,"Chinese publication","05-06-08","2008-06-04 00:00:00","2008-06-04 00:00:00",2
756,"Monetary Incentives","17-06-08 Created","2008-06-17 00:00:00","2008-06-17 00:00:00",2
757,"Monetary Incentives study","17-06-08 Created","2008-06-17 00:00:00","2008-06-17 00:00:00",1
758,"Aggression","24-06-08","2008-06-24 00:00:00","2008-06-24 00:00:00",2
761,"Music therapy update","27-10-08","2008-10-27 00:00:00","2008-10-27 00:00:00",2
765,"Maintenance treatment with antipsychotic drugs 1","12-11-08","2008-11-12 00:00:00","2008-11-12 00:00:00",2
766,"Maintenance treatment with antipsychotic drugs 2","18-11-08","2008-11-18 00:00:00","2008-11-18 00:00:00",2
767,"Cloz vs other atypicals","25-11-08","2008-11-25 00:00:00","2008-11-25 00:00:00",2
768,"Day hospital vs admission for acute 1","25-11-08","2008-11-25 00:00:00","2008-11-25 00:00:00",2
769,"Day hospital vs admission for acute 2","25-11-08","2008-11-25 00:00:00","2008-11-25 00:00:00",2
771,"Day hospital v admission for acute study","25-11-08","2008-11-25 00:00:00","2008-11-25 00:00:00",1
772,"Anticholinergics 1 2008","15-12-08","2008-12-15 00:00:00","2008-12-15 00:00:00",2
773,"Anticholinergics 2 2008","15-12-08","2008-12-15 00:00:00","2008-12-15 00:00:00",2
774,"Anticholinergics 3 2008","15-12-08","2008-12-15 00:00:00","2008-12-15 00:00:00",2
775,"Anticholinergics 4 2008","15-12-08","2008-12-15 00:00:00","2008-12-15 00:00:00",2
776,"Anticholinergics 5 2008","15-12-08","2008-12-15 00:00:00","2008-12-15 00:00:00",2
777,"Anticholinergics 6 2008","15-12-08","2008-12-15 00:00:00","2008-12-15 00:00:00",2
778,"Anticholinergics 7 2008","15-12-08","2008-12-15 00:00:00","2008-12-15 00:00:00",2
779,"Anticholinergics 8 2008","15-12-08","2008-12-15 00:00:00","2008-12-15 00:00:00",2
780,"Levomepromazine 1","13-01-09","2009-01-13 00:00:00","2009-01-13 00:00:00",2
781,"Levomepromazine 2","13-01-09","2009-01-13 00:00:00","2009-01-13 00:00:00",2
782,"Levomepromazine 3","13-01-09","2009-01-13 00:00:00","2009-01-13 00:00:00",2
783,"Levomepromazine 4","13-01-09","2009-01-13 00:00:00","2009-01-13 00:00:00",2
785,"Levomepromazine Study 1","14-01-09","2009-01-14 00:00:00","2009-01-14 00:00:00",1
786,"Levomepromazine Study 2","14-01-09","2009-01-14 00:00:00","2009-01-14 00:00:00",1
787,"Levomepromazine Study 3","14-01-09","2009-01-14 00:00:00","2009-01-14 00:00:00",1
788,"Acetylcholinesterase 1",,"2009-02-09 00:00:00","2009-02-09 00:00:00",2
789,"Acetylcholinesterase 2",,"2009-02-09 00:00:00","2009-02-09 00:00:00",2
790,"Acetylcholinesterase 3",,"2009-02-09 00:00:00","2009-02-09 00:00:00",2
791,"Acetylcholinesterase 4",,"2009-02-09 00:00:00","2009-02-09 00:00:00",2
792,"Acetylcholinesterase 5",,"2009-02-09 00:00:00","2009-02-09 00:00:00",2
793,"Acetylcholinesterase study 1",,"2009-02-09 00:00:00","2009-02-09 00:00:00",1
794,"Acetylcholinesterase study 2",,"2009-02-09 00:00:00","2009-02-09 00:00:00",1
797,"Intensive Case Management 3","18-02-09","2009-02-18 00:00:00","2009-02-18 00:00:00",2
798,"Intensive Case Management 4","18-02-09","2009-02-18 00:00:00","2009-02-18 00:00:00",2
800,"Intensive Case Management 6","18-02-09","2009-02-18 00:00:00","2009-02-18 00:00:00",2
801,"Intensive Case Management 7","18-02-09","2009-02-18 00:00:00","2009-02-18 00:00:00",2
802,"Intensive Case Management 8","18-02-09","2009-02-18 00:00:00","2009-02-18 00:00:00",2
804,"Intensive Case Management 1","18-02-09","2009-02-18 00:00:00","2009-02-18 00:00:00",2
805,"Intensive Case Management 2","18-02-09","2009-02-18 00:00:00","2009-02-18 00:00:00",2
806,"Intensive Case Management 5","18-02-09","2009-02-18 00:00:00","2009-02-18 00:00:00",2
807,"Intensive Case Management 9","18-02-09","2009-02-18 00:00:00","2009-02-18 00:00:00",2
808,"Intensive Case Management 10","18-02-09","2009-02-18 00:00:00","2009-02-18 00:00:00",2
809,"Intensive Case Management 11","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",2
810,"Intensive Case Management 12","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",2
812,"Intensive Case Management 15","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",2
813,"Intensive Case Management 13","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",2
814,"Intensive Case Management 14","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",2
815,"Intensive Case Management 20","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",2
816,"Intensive Case Management 16","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",2
817,"Intensive Case Management 17","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",2
818,"Intensive Case Management 18","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",2
819,"Intensive Case Management 19","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",2
820,"Intensive Case Management 21","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",2
821,"Intensive Case Management Study 1","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",1
822,"Intensive Case Management Study 2","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",1
823,"Intensive Case Management Study 3","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",1
824,"Intensive Case Management Study 4","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",1
825,"Intensive Case Management Study 5","19-02-09","2009-02-19 00:00:00","2009-02-19 00:00:00",1
826,"Vitamin E for tardive dyskinesia &&",,"2009-03-06 00:00:00","2009-03-06 00:00:00",2
827,"Intensive case management 22","06-03-09","2009-03-06 00:00:00","2009-03-06 00:00:00",2
828,"Intensive case management study 6","06-03-09","2009-03-06 00:00:00","2009-03-06 00:00:00",1
829,"Benzos 2009 1","09-03-09","2009-03-09 00:00:00","2009-03-09 00:00:00",2
830,"Benzos 2009 2","09-03-09","2009-03-09 00:00:00","2009-03-09 00:00:00",2
831,"Benzos 2009 3","09-03-09","2009-03-09 00:00:00","2009-03-09 00:00:00",2
832,"Benzos 2009 4","09-03-09","2009-03-09 00:00:00","2009-03-09 00:00:00",2
833,"Benzos 2009 5","09-03-09","2009-03-09 00:00:00","2009-03-09 00:00:00",2
834,"Benzos 2009 6","09-03-09","2009-03-09 00:00:00","2009-03-09 00:00:00",2
835,"Benzos 2009 7","09-03-09","2009-03-09 00:00:00","2009-03-09 00:00:00",2
836,"Benzos 2009 8","09-03-09","2009-03-09 00:00:00","2009-03-09 00:00:00",2
837,"Benzos 2009 9","09-03-09","2009-03-09 00:00:00","2009-03-09 00:00:00",2
838,"Benzos 2009 10","09-03-09","2009-03-09 00:00:00","2009-03-09 00:00:00",2
839,"Sexual dysfunction 5","10-02-09","2009-03-10 00:00:00","2009-03-10 00:00:00",2
840,"Cognitive rehab Study Search","16-03-09","2009-03-16 00:00:00","2009-03-16 00:00:00",1
841,"Benperidol for Schiz","24-03-09","2009-03-24 00:00:00","2009-03-24 00:00:00",2
842,"Benperidol study search","24-03-09","2009-03-24 00:00:00","2009-03-24 00:00:00",1
843,"depot search","23-03-09","2009-03-24 00:00:00","2009-03-24 00:00:00",2
844,"Olanzapine 2009 1","24-03-09","2009-03-24 00:00:00","2009-03-24 00:00:00",2
845,"Olanzapine 2009 2","24-03-09","2009-03-24 00:00:00","2009-03-24 00:00:00",2
846,"prompts part 3b","use KW=letter","2009-03-28 00:00:00","2009-03-28 00:00:00",2
847,"early intervention study search",,"2009-03-30 00:00:00","2009-03-30 00:00:00",1
848,"depot fluphenazine 1","29-04-09","2009-04-29 00:00:00","2009-04-29 00:00:00",2
849,"Depot Fluphenazine 2","29-04-09","2009-04-29 00:00:00","2009-04-29 00:00:00",2
850,"Depot Fluphenazine 3","29-04-2009","2009-04-29 00:00:00","2009-04-29 00:00:00",2
851,"Depot Fluphenazine 4","29-04-2009","2009-04-29 00:00:00","2009-04-29 00:00:00",2
852,"Depot Fluphenazine 5","29-04-2009","2009-04-29 00:00:00","2009-04-29 00:00:00",2
853,"Depot Fluphenazine 6","29-04-09","2009-04-29 00:00:00","2009-04-29 00:00:00",2
854,"Depot fluphenazine 7","29-04-2009","2009-04-29 00:00:00","2009-04-29 00:00:00",2
855,"Depot","29-04-2009","2009-04-29 00:00:00","2009-04-29 00:00:00",2
856,"Depot AAAA","29-04-2009","2009-04-29 00:00:00","2009-04-29 00:00:00",2
859,"Day hospital V outpatient 1","18-05-2009","2009-05-18 00:00:00","2009-05-18 00:00:00",2
860,"day hospital v outpatient 2","18-05-2009","2009-05-18 00:00:00","2009-05-18 00:00:00",2
861,"day hospital v outpatient 3","18-05-2009","2009-05-18 00:00:00","2009-05-18 00:00:00",2
862,"day hospital v outpatient 4","18-05-2009","2009-05-18 00:00:00","2009-05-18 00:00:00",2
863,"day hospital v outpatient 5","18-05-2009","2009-05-18 00:00:00","2009-05-18 00:00:00",2
864,"Day hospital v outpatient study 1","18-05-2009","2009-05-18 00:00:00","2009-05-18 00:00:00",1
865,"day hospital v outpatient study 2","18-05-2009","2009-05-18 00:00:00","2009-05-18 00:00:00",1
866,"IT Interventions 3","02-06-2009","2009-06-02 00:00:00","2009-06-02 00:00:00",2
867,"test for de-escalation",,"2009-06-15 00:00:00","2009-06-15 00:00:00",2
868,"de-escalation & aggression",,"2009-06-15 00:00:00","2009-06-15 00:00:00",2
869,"Aggression without *tranq*","16-06-09","2009-06-16 00:00:00","2009-06-16 00:00:00",2
870,"De-escalation 1","16-06-09","2009-06-16 00:00:00","2009-06-16 00:00:00",2
871,"De-escalation 2","16-06-09","2009-06-16 00:00:00","2009-06-16 00:00:00",2
872,"De-escalation 3","16-06-09","2009-06-16 00:00:00","2009-06-16 00:00:00",2
873,"Fluphenazine 3","17-06-09","2009-06-17 00:00:00","2009-06-17 00:00:00",2
874,"Dietary advice","18-06-09","2009-06-18 00:00:00","2009-06-18 00:00:00",2
875,"Dietary Advice 2","18-06-09","2009-06-18 00:00:00","2009-06-18 00:00:00",2
876,"Dietary advice 3","18-06-09 without therapy","2009-06-18 00:00:00","2009-06-18 00:00:00",2
877,"body orientated",,"2009-08-25 00:00:00","2009-08-25 00:00:00",2
878,"Misc TD PART 2a","02-09-09","2009-09-02 00:00:00","2009-09-02 00:00:00",2
879,"Misc TD Part 2b","02-09-09","2009-09-02 00:00:00","2009-09-02 00:00:00",2
880,"Misc TD Part 2c","02-09-09","2009-09-02 00:00:00","2009-09-02 00:00:00",2
881,"Chinese herbal Medicine 1","17-09-09","2009-09-17 00:00:00","2009-09-17 00:00:00",2
884,"Chinese Herbal Medicine 2",,"2009-09-17 00:00:00","2009-09-17 00:00:00",2
885,"Chinese Herbal Medicine 3","17-09-09","2009-09-17 00:00:00","2009-09-17 00:00:00",2
886,"Chinese Herbal Medicine study","17-09-09","2009-09-17 00:00:00","2009-09-17 00:00:00",1
887,"Beta blocker 1","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",2
888,"Beta blocker 2","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",2
889,"Beta blocker 3","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",2
890,"Beta blocker 4","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",2
891,"Beta blocker 5","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",2
892,"Beta blockers 7","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",2
893,"Beta blocker 8","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",2
894,"Beta Blocker 9","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",2
895,"Beta blocker 10","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",2
896,"Beta blocker 11","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",2
897,"Beta blocker study 1","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",1
898,"Beta blocker study 2","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",1
899,"Beta blocker study 3","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",1
900,"beta blocker study 4","20-10-09","2009-10-20 00:00:00","2009-10-20 00:00:00",1
901,"Physical health care monitoring study","21-10-09","2009-10-21 00:00:00","2009-10-21 00:00:00",1
902,"Physical health care","25-10-09","2009-10-25 00:00:00","2009-10-25 00:00:00",2
903,"Zotepine 2009","09-11-2009","2009-11-09 00:00:00","2009-11-09 00:00:00",2
904,"Paliperidone palmitate","25-11-09","2009-11-25 00:00:00","2009-11-25 00:00:00",2
905,"Paliperidone palitate study search","25-11-09","2009-11-25 00:00:00","2009-11-25 00:00:00",1
906,"Elderly people","20-01-2010","2010-01-20 00:00:00","2010-01-20 00:00:00",2
907,"Post partum and preganancy","25-01-2010","2010-01-25 00:00:00","2010-01-25 00:00:00",2
908,"Supported employment study","16-02-10","2010-02-16 00:00:00","2010-02-16 00:00:00",1
909,"atypicals intervention","17-05-2010","2010-05-17 00:00:00","2010-05-17 00:00:00",1
910,"Methotrimeprazine STUDY SEARCH","02-06-10","2010-06-03 00:00:00","2010-06-03 00:00:00",1
911,"POSTNATAL","02-06-10","2010-06-03 00:00:00","2010-06-03 00:00:00",2
912,"Postnatal psychosis 1st effort","10-06-10","2010-06-10 00:00:00","2010-06-10 00:00:00",2
913,"discontinuation","10-06-2010","2010-06-10 00:00:00","2010-06-10 00:00:00",2
914,"postnatal psychosis","10-06-10","2010-06-10 00:00:00","2010-06-10 00:00:00",1
915,"Collab Care 1","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
916,"Collab Care 2","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
917,"Collab Care 3","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
918,"Collab Care 4","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
919,"Collab Care 5","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
920,"Collab Care 6","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
921,"Collab Care 7","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
922,"Collab Care 12","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
923,"Collab Care 8","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
924,"Collab Care 9","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
925,"Collab Care 10","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
926,"Collab Care 11","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
927,"Collab Care 13","13-07-10","2010-07-13 00:00:00","2010-07-13 00:00:00",2
928,"gardening","05-08-10","2010-08-05 00:00:00","2010-08-05 00:00:00",2
929,"Zuclopenthixol acetate","18-08-10","2010-08-18 00:00:00","2010-08-18 00:00:00",2
930,"depot haloperidol search 10","12-10-10","2010-10-12 00:00:00","2010-10-12 00:00:00",2
931,"Depot haloperidol search 11","12-10-10","2010-10-12 00:00:00","2010-10-12 00:00:00",2
932,"early episode search 2010","28-10-2010","2010-10-28 00:00:00","2010-10-28 00:00:00",2
933,"benzo search 2010 for donna","11-11-10","2010-11-11 00:00:00","2010-11-11 00:00:00",2
934,"benzo  2010 for donna","11-11-2010","2010-11-11 00:00:00","2010-11-11 00:00:00",2
935,"switching 2010","11-11-10","2010-11-11 00:00:00","2010-11-11 00:00:00",2
936,"asenapine","11-11-10","2010-11-11 00:00:00","2010-11-11 00:00:00",2
937,"asenapine study search","11-11-10","2010-11-11 00:00:00","2010-11-11 00:00:00",1
938,"antioxidant treatments","25-11-2010","2010-11-25 00:00:00","2010-11-25 00:00:00",2
939,"Antioxidant treatments 1","25-11-10","2010-11-25 00:00:00","2010-11-25 00:00:00",2
940,"Antioxidant treatments 2","25-11-10","2010-11-25 00:00:00","2010-11-25 00:00:00",2
941,"Antioxidant study search","25-11-10","2010-11-25 00:00:00","2010-11-25 00:00:00",1
942,"Supported employment in Title",,"2010-12-15 00:00:00","2010-12-15 00:00:00",2
943,"cancer screening","first attempt 24/01/2011","2011-01-24 00:00:00","2011-01-24 00:00:00",2
944,"communication skills search strategy","first attempt","2011-01-24 00:00:00","2011-01-24 00:00:00",2
945,"Benzodiazepines for schiz","01-02-2011","2011-02-01 00:00:00","2011-02-01 00:00:00",1
946,"Benzodiazepines all 1","19-02-11","2011-02-19 00:00:00","2011-02-19 00:00:00",1
947,"Benzodiazepines all 2","19-02-11","2011-02-19 00:00:00","2011-02-19 00:00:00",1
948,"benzodiazepines all 14","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
949,"Benzodiazepines all 3","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
950,"Benzodiazepines all 4","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
951,"Benzodiazepines all 5","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
952,"Benzodiazepines all 6","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
953,"Benzodiazepines all 7","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
954,"Benzodiazepines all 8","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
955,"Benzodiazepines all 9","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
956,"benzodiazepines all 10","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
957,"Benzodiazepines all 11","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
958,"Benzodiazepines all 12","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
959,"Benzodiazepines all 13","19-02-11","2011-02-20 00:00:00","2011-02-20 00:00:00",1
960,"Horticultural therapy","23-03-11","2011-03-23 00:00:00","2011-03-23 00:00:00",2
961,"Collaborative Care final search strategy","18-04-11","2011-04-18 00:00:00","2011-04-18 00:00:00",2
962,"early episode 2011 1",,"2011-05-16 00:00:00","2011-05-16 00:00:00",2
963,"Early episode 2011 2",,"2011-05-16 00:00:00","2011-05-16 00:00:00",2
964,"Perphenazine 2011",,"2011-05-24 00:00:00","2011-05-24 00:00:00",2
965,"IT 2011 1",,"2011-05-31 00:00:00","2011-05-31 00:00:00",2
966,"IT 2011 2",,"2011-05-31 00:00:00","2011-05-31 00:00:00",2
967,"IT 2011 3",,"2011-05-31 00:00:00","2011-05-31 00:00:00",2
968,"Virtual reality","31-05-11","2011-05-31 00:00:00","2011-05-31 00:00:00",2
969,"Virtual reality 2","31-05-11","2011-05-31 00:00:00","2011-05-31 00:00:00",2
970,"Implement guidelines 1","11-06-11","2011-06-11 00:00:00","2011-06-11 00:00:00",2
971,"Implement guidelines 2",,"2011-06-11 00:00:00","2011-06-11 00:00:00",2
972,"Implement guidelines 3",,"2011-06-11 00:00:00","2011-06-11 00:00:00",2
973,"Implement guidelines 4",,"2011-06-11 00:00:00","2011-06-11 00:00:00",2
974,"Implement guidelines 6",,"2011-06-11 00:00:00","2011-06-11 00:00:00",2
975,"Implement guidelines- KW implement",,"2011-06-11 00:00:00","2011-06-11 00:00:00",2
976,"Chlorpromazine 2011",,"2011-06-15 00:00:00","2011-06-15 00:00:00",1
977,"chlorpromazine 2011 2",,"2011-06-15 00:00:00","2011-06-15 00:00:00",1
978,"Celecoxib 2011","05-07-11","2011-07-05 00:00:00","2011-07-05 00:00:00",2
979,"NICE VIOLENCE STUDY SEARCH","19-07-11","2011-07-19 00:00:00","2011-07-19 00:00:00",1
980,"NICE VIOLENCE","19-07-11","2011-07-19 00:00:00","2011-07-19 00:00:00",2
981,"Haloperidol versus first generation 1",,"2011-10-04 00:00:00","2011-10-04 00:00:00",1
982,"Haloperidol versus first generation 2",,"2011-10-04 00:00:00","2011-10-04 00:00:00",1
983,"Haloperidol versus first generation 3",,"2011-10-04 00:00:00","2011-10-04 00:00:00",1
984,"Pimozide 2011","08-12-2011","2011-12-08 00:00:00","2011-12-08 00:00:00",2
985,"DIET 1","08-12-2011","2011-12-08 00:00:00","2011-12-08 00:00:00",2
986,"Diet 2","08-12-11","2011-12-08 00:00:00","2011-12-08 00:00:00",2
987,"Diet 3","08-12-11","2011-12-08 00:00:00","2011-12-08 00:00:00",2
988,"Diet 4","08-12-11","2011-12-08 00:00:00","2011-12-08 00:00:00",2
989,"Diet 5","08-12-11","2011-12-08 00:00:00","2011-12-08 00:00:00",2
990,"Allopurinol 1","08-12-11","2011-12-08 00:00:00","2011-12-08 00:00:00",1
991,"Allopurinol 2","08-12-11","2011-12-08 00:00:00","2011-12-08 00:00:00",1
992,"Allopurinol 3","08-12-11","2011-12-08 00:00:00","2011-12-08 00:00:00",1
993,"Allopurinol 4","08-12-11","2011-12-08 00:00:00","2011-12-08 00:00:00",1
994,"Delusional disorder 1","12-12-11","2011-12-12 00:00:00","2011-12-12 00:00:00",2
995,"delusional disorder 2","12-12-11","2011-12-12 00:00:00","2011-12-12 00:00:00",2
996,"Hypersalivation","24-01-12","2012-01-24 00:00:00","2012-01-24 00:00:00",2
997,"hypersalivation study","24-01-12","2012-01-24 00:00:00","2012-01-24 00:00:00",1
998,"withdraw 1","02-02-12","2012-02-02 00:00:00","2012-02-02 00:00:00",2
999,"Withdraw 2","02-02-12","2012-02-02 00:00:00","2012-02-02 00:00:00",2
1000,"Olanzapine","02-02-12","2012-02-02 00:00:00","2012-02-02 00:00:00",1
1001,"advice","12-2-12","2012-02-12 00:00:00","2012-02-12 00:00:00",1
1002,"Relapse prevention 06-03-12",,"2012-03-06 00:00:00","2012-03-06 00:00:00",2
1003,"aggression study search",,"2012-03-10 00:00:00","2012-03-10 00:00:00",1
1004,"CVD risk management","physical first bit plus this one","2012-03-13 00:00:00","2012-03-13 00:00:00",2
1005,"CVD risk management study",,"2012-03-13 00:00:00","2012-03-13 00:00:00",1
1006,"CVD risk management study pt 2",,"2012-03-13 00:00:00","2012-03-13 00:00:00",1
1007,"seclusion & restrait 2012",,"2012-05-10 00:00:00","2012-05-10 00:00:00",1
1008,"Fluphenazine 15-05-12",,"2012-05-15 00:00:00","2012-05-15 00:00:00",1
1009,"Bromperidol study search 05-07-12",,"2012-07-05 00:00:00","2012-07-05 00:00:00",1
1010,"Preventive interventions for postnatal psychosis","05-07-2012","2012-07-05 00:00:00","2012-07-05 00:00:00",2
1011,"Carbamazeoine 1 study","06-07-12","2012-07-06 00:00:00","2012-07-06 00:00:00",1
1012,"Carbamazepine 2 study","06-07-12","2012-07-06 00:00:00","2012-07-06 00:00:00",1
1013,"carbamazepine 3 study","06-07-12","2012-07-06 00:00:00","2012-07-06 00:00:00",1
1014,"Lithium study search","06-07-12","2012-07-06 00:00:00","2012-07-06 00:00:00",1
1015,"Valproate study search","06-07-12","2012-07-06 00:00:00","2012-07-06 00:00:00",1
1016,"zuclopenthixol 2012","10-07-2012","2012-07-10 00:00:00","2012-07-10 00:00:00",1
1017,"Communication Skills 24-07-12",,"2012-07-24 00:00:00","2012-07-24 00:00:00",2
1018,"Communication skills 2 24-07-12",,"2012-07-24 00:00:00","2012-07-24 00:00:00",2
1019,"olanzapine depot","depot part 25-07-12","2012-07-25 00:00:00","2012-07-25 00:00:00",2
1020,"treatment resistant 11-09-12",,"2012-09-11 00:00:00","2012-09-11 00:00:00",2
1021,"chlorpromazine 2011 3",,"2012-10-11 00:00:00","2012-10-11 00:00:00",1
1022,"Depot terms",,"2012-10-11 00:00:00","2012-10-11 00:00:00",2
1023,"Selective noradrenaline reuptake inhibitors 1","15-11-12","2012-11-15 00:00:00","2012-11-15 00:00:00",1
1024,"Selective noradrenaline reuptake inhibitors 2","15-11-12","2012-11-15 00:00:00","2012-11-15 00:00:00",1
1025,"Selective noradrenaline reuptake inhibitors ref search","15-11-12","2012-11-15 00:00:00","2012-11-15 00:00:00",2
1026,"IM","22-11-12","2012-11-22 00:00:00","2012-11-22 00:00:00",2
1027,"Supportive therapy 28-11-2012",,"2012-11-28 00:00:00","2012-11-28 00:00:00",1
1028,"Supportive therapy 28-11-12 ref",,"2012-11-28 00:00:00","2012-11-28 00:00:00",2
1029,"sibling search 10-12-12",,"2012-12-10 00:00:00","2012-12-10 00:00:00",2
1030,"homeless 10-12-12",,"2012-12-10 00:00:00","2012-12-10 00:00:00",2
1031,"homeless study search 10-12-12",,"2012-12-10 00:00:00","2012-12-10 00:00:00",1
1032,"antidepressants study 1",,"2012-12-11 00:00:00","2012-12-11 00:00:00",1
1033,"antidepressants study 2",,"2012-12-11 00:00:00","2012-12-11 00:00:00",1
1034,"antidepressants study 4",,"2012-12-11 00:00:00","2012-12-11 00:00:00",1
1035,"antidepressants study 5",,"2012-12-11 00:00:00","2012-12-11 00:00:00",1
1036,"Lurasidone search 18-12-12",,"2012-12-18 00:00:00","2012-12-18 00:00:00",2
1037,"lurasidone study search 18-12-12",,"2012-12-18 00:00:00","2012-12-18 00:00:00",1
1038,"methylphenidate 1","14-01-13","2013-01-14 00:00:00","2013-01-14 00:00:00",2
1039,"methylphenidate 2","14-01-12","2013-01-14 00:00:00","2013-01-14 00:00:00",2
1040,"methylphenidate 3","14-01-13","2013-01-14 00:00:00","2013-01-14 00:00:00",2
1041,"methylphenidate 4","14-01-13","2013-01-14 00:00:00","2013-01-14 00:00:00",2
1042,"methylphenidate 5","14-01-13","2013-01-14 00:00:00","2013-01-14 00:00:00",2
1043,"methylphenidate 6","14-01-13","2013-01-14 00:00:00","2013-01-14 00:00:00",2
1044,"methylphenidate study 1","14-01-13","2013-01-14 00:00:00","2013-01-14 00:00:00",1
1045,"methylphenidate study 2","14-01-13","2013-01-14 00:00:00","2013-01-14 00:00:00",1
1046,"methylphenidate study 3","15-01-13","2013-01-15 00:00:00","2013-01-15 00:00:00",1
1047,"methylphenidate study 4",,"2013-01-15 00:00:00","2013-01-15 00:00:00",1
1048,"Illness mangement 17-01-13",,"2013-01-17 00:00:00","2013-01-17 00:00:00",2
1049,"illness management study 17-01-13",,"2013-01-17 00:00:00","2013-01-17 00:00:00",1
1050,"Pyridoxal 5 1","17-01-13","2013-01-17 00:00:00","2013-01-17 00:00:00",2
1051,"Pyridoxal 5 2","17-01-13","2013-01-17 00:00:00","2013-01-17 00:00:00",2
1052,"substance abuse c",,"2013-01-24 00:00:00","2013-01-24 00:00:00",2
1053,"crime 1",,"2013-01-24 00:00:00","2013-01-24 00:00:00",2
1054,"crime 2",,"2013-01-24 00:00:00","2013-01-24 00:00:00",2
1055,"crime 3",,"2013-01-24 00:00:00","2013-01-24 00:00:00",2
1056,"crime 4","kw = batter","2013-01-24 00:00:00","2013-01-24 00:00:00",2
1057,"crime 5","kw = victim","2013-01-24 00:00:00","2013-01-24 00:00:00",2
1058,"crime 6","kw = victim","2013-01-24 00:00:00","2013-01-24 00:00:00",2
1059,"Adolescent 2010 search",,"2013-01-28 00:00:00","2013-01-28 00:00:00",2
1060,"Antipsychotic Drug Treatment for Elderly People with Late-Onset",,"2014-12-12 00:00:00","2014-12-12 00:00:00",2
\.
END;
