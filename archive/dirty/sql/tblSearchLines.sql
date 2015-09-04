BEGIN;
SET CONSTRAINTS ALL DEFERRED;
COPY "dirty"."tblSearchLines" FROM STDIN WITH CSV HEADER;
NotOperatorTrue,Operator,Value,Logical,SearchType,SearchFieldDefID,SavedSearchID,SearchLineID
0,"Like","chlorpromazine*","AND",1,14,10,17
0,"Like","placebo*","AND",1,14,10,18
0,"Like","*blind*","OR",2,57,12,22
0,"Like","*blind*","OR",2,27,12,23
0,"Like","*blind*","OR",2,36,12,24
0,"Like","electroconvulsive*","AND",1,14,13,27
0,"Like","*dissertation*","OR",2,36,18,53
0,"Like","*dissertation*","OR",2,27,18,54
0,"Like","*deanol*","OR",2,36,24,106
0,"Like","*arecoline*","OR",2,36,24,107
0,"Like","choline*","OR",2,36,24,108
0,"Like","*lecithin*","OR",2,36,24,109
0,"Like","*meclofenoxate*","OR",2,36,24,110
0,"Like","*physostigmine*","OR",2,36,24,111
0,"Like","*deanol*","OR",2,27,24,112
0,"Like","*arecoline*","OR",2,27,24,113
0,"Like","choline*","OR",2,27,24,114
0,"Like","*lecithin*","OR",2,27,24,115
0,"Like","*meclofenoxate*","OR",2,27,24,116
0,"Like","*physostigmine*","AND",2,27,24,117
0,"Like","cholinergic*","OR",1,14,30,142
0,"Like","arecolin*","OR",1,14,30,143
0,"Like","arecholin*","OR",1,14,30,144
0,"Like","meclofenoxat*","OR",1,14,30,145
0,"Like","meclophenoxat*","OR",1,14,30,146
0,"Like","centro*","OR",1,14,30,147
0,"Like","ANP 235*","OR",1,14,30,148
0,"Like","EN 1627*","OR",1,14,30,149
0,"Like","deanol*","OR",1,14,30,150
0,"Like","demanol*","OR",1,14,30,151
0,"Like","CR 121*","OR",1,14,30,152
0,"Like","RS 86*","OR",1,14,30,153
0,"Like","physostigmin*","OR",1,14,30,154
0,"Like","fysostigmin*","OR",1,14,30,155
0,"Like","lecit*","OR",1,14,30,156
0,"Like","cholin*","OR",1,14,30,157
0,"Like","coline*","OR",1,14,30,158
0,"Like","*tacrin*","OR",1,14,30,159
0,"Like","*takrin*","OR",1,14,30,160
0,"Like","tetrahydroamino*","OR",1,14,31,162
0,"Like","CI 970*","OR",1,14,31,163
0,"Like","THA*","OR",1,14,31,164
0,"Like","7-met*","OR",1,14,31,165
0,"Like","MEOTA*","OR",1,14,31,166
0,"Like","ipidacrin*","OR",1,14,31,167
0,"Like","amiridin*","OR",1,14,31,168
0,"Like","NIK247*","OR",1,14,31,169
0,"Like","NIK 247*","OR",1,14,31,170
0,"Like","donepezil*","OR",1,14,31,171
0,"Like","E2020*","OR",1,14,31,172
0,"Like","E 2020*","OR",1,14,31,173
0,"Like","galant*","OR",1,14,31,174
0,"Like","CGP 37267*","OR",1,14,31,175
0,"Like","rivastigmin*","OR",1,14,31,176
0,"Like","ENA713*","OR",1,14,31,177
0,"Like","ENA 713*","OR",1,14,31,178
0,"Like","212 713*","OR",1,14,31,179
0,"Like","eptastigmin*","OR",1,14,31,180
0,"Like","heptyl*","OR",1,14,31,181
0,"Like","L 693 487*","OR",1,14,31,182
0,"Like","MF201*","OR",1,14,31,183
0,"Like","MF 201*",,1,14,31,184
0,"Like","metrifonat*","OR",1,14,32,185
0,"Like","metriphonat*","OR",1,14,32,186
0,"Like","trichlor*","OR",1,14,32,187
0,"Like","L 1359*","OR",1,14,32,188
0,"Like","Bay a 9826*","OR",1,14,32,189
0,"Like","Bay 1 1359*","OR",1,14,32,190
0,"Like","xanomelin*","OR",1,14,32,191
0,"Like","LY 246708*","OR",1,14,32,192
0,"Like","FG 10232*","OR",1,14,32,193
0,"Like","cevimelin*","OR",1,14,32,194
0,"Like","cevimelin*","OR",1,14,32,195
0,"Like","AF102B*","OR",1,14,32,196
0,"Like","AF 102B*","OR",1,14,32,197
0,"Like","FKS 508*","OR",1,14,32,198
0,"Like","SND 5008*","OR",1,14,32,199
0,"Like","SNK508*","OR",1,14,32,200
0,"Like","SNI2011*","OR",1,14,32,201
0,"Like","*cp-88059*","OR",2,27,36,238
0,"Like","*9-OH-risperidone*","OR",2,27,36,239
0,"Like","*first episode*","OR",2,27,36,240
0,"Like","*untreated*","OR",2,27,36,241
0,"Like","*delayed treatment*","OR",2,27,36,242
0,"Like","*delay*","OR",2,27,36,243
0,"Like","*initial*","OR",2,27,36,244
0,"Like","*early*","OR",2,27,36,245
0,"Like","*primary*","OR",2,27,36,246
0,"Like","*ICI-204636*","OR",2,27,36,247
0,"Like","*ICI204636*","OR",2,27,36,248
0,"Like","*amisulpride*","OR",2,27,36,249
0,"Like","*amitrex*","OR",2,27,36,250
0,"Like","*deniban*","OR",2,27,36,251
0,"Like","*socian*","OR",2,27,36,252
0,"Like","*solian*","OR",2,27,36,253
0,"Like","*sulanid*","OR",2,27,36,254
0,"Like","*sulamid*","OR",2,27,36,255
0,"Like","*zyprex*","OR",2,27,36,256
0,"Like","*olanzapin*","OR",2,27,36,257
0,"Like","*risper*","OR",2,27,36,258
0,"Like","*ziprasidone*","OR",2,27,36,259
0,"Like","*zotepine*","OR",2,27,36,260
0,"Like","*lodopin*","OR",2,27,36,261
0,"Like","*nipolept*","OR",2,27,36,262
0,"Like","*zopite*","OR",2,27,36,263
0,"Like","*setous*","OR",2,27,36,264
0,"Like","*majpin*","OR",2,27,36,265
0,"Like","*cloza*","OR",2,27,36,266
0,"Like","*leponex*","OR",2,27,36,267
0,"Like","*71675-85-9*","OR",2,27,36,268
0,"Like","*cp-88059*","OR",2,36,36,269
0,"Like","*9-OH-risperidone*","OR",2,36,36,270
0,"Like","*first episode*","OR",2,36,36,271
0,"Like","*untreated*","OR",2,36,36,272
0,"Like","*delayed treatment*","OR",2,36,36,273
0,"Like","*delay*","OR",2,36,36,274
0,"Like","*initial*","OR",2,36,36,275
0,"Like","*early*","OR",2,36,36,276
0,"Like","*primary*","OR",2,36,36,277
0,"Like","*ICI-204636*","OR",2,36,36,278
0,"Like","*ICI204636*","OR",2,36,36,279
0,"Like","*amisulpride*","OR",2,36,36,280
0,"Like","*amitrex*","OR",2,36,36,281
0,"Like","*deniban*","OR",2,36,36,282
0,"Like","*socian*","OR",2,36,36,283
0,"Like","*solian*","OR",2,36,36,284
0,"Like","*sulanid*","OR",2,36,36,285
0,"Like","*sulamid*","OR",2,36,36,286
0,"Like","*zyprex*","OR",2,36,36,287
0,"Like","*olanzapin*","OR",2,36,36,288
0,"Like","*risper*","OR",2,36,36,289
0,"Like","*ziprasidone*","OR",2,36,36,290
0,"Like","*zotepine*","OR",2,36,36,291
0,"Like","*lodopin*","OR",2,36,36,292
0,"Like","*nipolept*","OR",2,36,36,293
0,"Like","*zopite*","OR",2,36,36,294
0,"Like","*setous*","OR",2,36,36,295
0,"Like","*majpin*","OR",2,36,36,296
0,"Like","*cloza*","OR",2,36,36,297
0,"Like","*leponex*","OR",2,36,36,298
0,"Like","*71675-85-9*","OR",2,36,36,299
0,"Like","*cp-88059*","OR",2,45,36,300
0,"Like","*9-OH-risperidone*","OR",2,45,36,301
0,"Like","*ICI-204636*","OR",2,45,36,302
0,"Like","*ICI204636*","OR",2,45,36,303
0,"Like","Cholinergics for TD*",,2,45,36,304
0,"Like","*amisulpride*","OR",2,45,36,305
0,"Like","*amitrex*","OR",2,45,36,306
0,"Like","*deniban*","OR",2,45,36,307
0,"Like","*socian*","OR",2,45,36,308
0,"Like","*solian*","OR",2,45,36,309
0,"Like","*sulanid*","OR",2,45,36,310
0,"Like","*sulamid*","OR",2,45,36,311
0,"Like","*zyprex*","OR",2,45,36,312
0,"Like","*olanzapin*","OR",2,45,36,313
0,"Like","*risper*","OR",2,45,36,314
0,"Like","*ziprasidone*","OR",2,45,36,315
0,"Like","*zotepine*","OR",2,45,36,316
0,"Like","*lodopin*","OR",2,45,36,317
0,"Like","*nipolept*","OR",2,45,36,318
0,"Like","*zopite*","OR",2,45,36,319
0,"Like","*setous*","OR",2,45,36,320
0,"Like","*majpin*","OR",2,45,36,321
0,"Like","*cloza*","OR",2,45,36,322
0,"Like","*leponex*",,2,45,36,323
0,"Like","*71675-85-9*","OR",2,45,36,324
0,"Like","*first episode*","OR",2,57,36,327
0,"Like","*untreated*","OR",2,57,36,328
0,"Like","*delayed treatment*","OR",2,57,36,329
0,"Like","*delay*","OR",2,57,36,330
0,"Like","*initial*","OR",2,57,36,331
0,"Like","*early*","OR",2,57,36,332
0,"Like","*primary*",,2,57,36,333
0,"Like","*cp-88059*","OR",2,27,37,335
0,"Like","*9-OH-risperidone*","OR",2,27,37,336
0,"Like","*first episode*","OR",2,27,37,337
0,"Like","*untreated*","OR",2,27,37,338
0,"Like","*delayed treatment*","OR",2,27,37,339
0,"Like","*delay*","OR",2,27,37,340
0,"Like","*initial*","OR",2,27,37,341
0,"Like","*early*","OR",2,27,37,342
0,"Like","*primary*","OR",2,27,37,343
0,"Like","*amisulpride*","OR",2,27,37,344
0,"Like","*amitrex*","OR",2,27,37,345
0,"Like","*deniban*","OR",2,27,37,346
0,"Like","*socian*","OR",2,27,37,347
0,"Like","*solian*","OR",2,27,37,348
0,"Like","*sulanid*","OR",2,27,37,349
0,"Like","*sulamid*","OR",2,27,37,350
0,"Like","*zyprex*","OR",2,27,37,351
0,"Like","*olanzapin*","OR",2,27,37,352
0,"Like","*quetiapine*","OR",2,27,37,353
0,"Like","*seroquel*","OR",2,27,37,354
0,"Like","*risper*","OR",2,27,37,355
0,"Like","*ziprasidone*","OR",2,27,37,356
0,"Like","*zotepine*","OR",2,27,37,357
0,"Like","*lodopin*","OR",2,27,37,358
0,"Like","*nipolept*","OR",2,27,37,359
0,"Like","*zopite*","OR",2,27,37,360
0,"Like","*setous*","OR",2,27,37,361
0,"Like","*ICI-204636*","OR",2,27,37,362
0,"Like","*ICI204636*","OR",2,27,37,363
0,"Like","*maj*","OR",2,27,37,364
0,"Like","*pin*","OR",2,27,37,365
0,"Like","*clozapine*","OR",2,27,37,366
0,"Like","*clozaril*","OR",2,27,37,367
0,"Like","*leponex*","OR",2,27,37,368
0,"Like","*amisulpride*","OR",2,27,37,369
0,"Like","*amitrex*","OR",2,27,37,370
0,"Like","*deniban*","OR",2,27,37,371
0,"Like","*socian*","OR",2,27,37,372
0,"Like","*solian*","OR",2,27,37,373
0,"Like","*sulanid*","OR",2,27,37,374
0,"Like","*sulamid*","OR",2,27,37,375
0,"Like","*zyprex*","OR",2,27,37,376
0,"Like","*olanzapin*","OR",2,27,37,377
0,"Like","*risper*","OR",2,27,37,378
0,"Like","*ziprasidone*","OR",2,27,37,379
0,"Like","*zotepine*","OR",2,27,37,380
0,"Like","*lodopin*","OR",2,27,37,381
0,"Like","*nipolept*","OR",2,27,37,382
0,"Like","*zopite*","OR",2,27,37,383
0,"Like","*setous*","OR",2,27,37,384
0,"Like","*majpin*","OR",2,27,37,385
0,"Like","*cloza*","OR",2,27,37,386
0,"Like","*leponex*","OR",2,27,37,387
0,"Like","*71675-85-9*","OR",2,27,37,388
0,"Like","gelenberg*",,2,29,37,389
0,"Like","*cp-88059*","OR",2,36,37,390
0,"Like","*9-OH-risperidone*","OR",2,36,37,391
0,"Like","*untreated*","OR",2,36,37,392
0,"Like","*delayed treatment*","OR",2,36,37,393
0,"Like","*initial*","OR",2,36,37,394
0,"Like","*early*","OR",2,36,37,395
0,"Like","*primary*","OR",2,36,37,396
0,"Like","*amisulpride*","OR",2,36,37,397
0,"Like","*amitrex*","OR",2,36,37,398
0,"Like","*deniban*","OR",2,36,37,399
0,"Like","*socian*","OR",2,36,37,400
0,"Like","*solian*","OR",2,36,37,401
0,"Like","*sulanid*","OR",2,36,37,402
0,"Like","*sulamid*","OR",2,36,37,403
0,"Like","*zyprex*","OR",2,36,37,404
0,"Like","*olanzapin*","OR",2,36,37,405
0,"Like","*quetiapine*","OR",2,36,37,406
0,"Like","*risper*","OR",2,36,37,407
0,"Like","*ziprasidone*","OR",2,36,37,408
0,"Like","*zotepine*","OR",2,36,37,409
0,"Like","*lodopin*","OR",2,36,37,410
0,"Like","*nipolept*","OR",2,36,37,411
0,"Like","*zopite*","OR",2,36,37,412
0,"Like","*ICI-204636*","OR",2,36,37,413
0,"Like","*ICI204636*","OR",2,36,37,414
0,"Like","*setous*","OR",2,36,37,415
0,"Like","*maj*","OR",2,36,37,416
0,"Like","*pin*","OR",2,36,37,417
0,"Like","*clozapine*","OR",2,36,37,418
0,"Like","*clozaril*","OR",2,36,37,419
0,"Like","*leponex*","OR",2,36,37,420
0,"Like","*amisulpride*","OR",2,36,37,421
0,"Like","*amitrex*","OR",2,36,37,422
0,"Like","*deniban*","OR",2,36,37,423
0,"Like","*socian*","OR",2,36,37,424
0,"Like","*solian*","OR",2,36,37,425
0,"Like","*sulanid*","OR",2,36,37,426
0,"Like","*sulamid*","OR",2,36,37,427
0,"Like","*zyprex*","OR",2,36,37,428
0,"Like","*olanzapin*","OR",2,36,37,429
0,"Like","*risper*","OR",2,36,37,430
0,"Like","*ziprasidone*","OR",2,36,37,431
0,"Like","*zotepine*","OR",2,36,37,432
0,"Like","*lodopin*","OR",2,36,37,433
0,"Like","*nipolept*","OR",2,36,37,434
0,"Like","*zopite*","OR",2,36,37,435
0,"Like","*setous*","OR",2,36,37,436
0,"Like","*majpin*","OR",2,36,37,437
0,"Like","*cloza*","OR",2,36,37,438
0,"Like","*leponex*","OR",2,36,37,439
0,"Like","*71675-85-9*","OR",2,36,37,440
0,"Like","*cp-88059*","OR",2,45,37,441
0,"Like","*9-OH-risperidone*","OR",2,45,37,442
0,"Like","*ICI-204636*","OR",2,45,37,443
0,"Like","*ICI204636*","OR",2,45,37,444
0,"Like","Cholinergics for TD*",,2,45,37,445
0,"Like","*amisulpride*","OR",2,45,37,446
0,"Like","*amitrex*","OR",2,45,37,447
0,"Like","*deniban*","OR",2,45,37,448
0,"Like","*socian*","OR",2,45,37,449
0,"Like","*solian*","OR",2,45,37,450
0,"Like","*sulanid*","OR",2,45,37,451
0,"Like","*sulamid*","OR",2,45,37,452
0,"Like","*zyprex*","OR",2,45,37,453
0,"Like","*olanzapin*","OR",2,45,37,454
0,"Like","*risper*","OR",2,45,37,455
0,"Like","*ziprasidone*","OR",2,45,37,456
0,"Like","*zotepine*","OR",2,45,37,457
0,"Like","*lodopin*","OR",2,45,37,458
0,"Like","*nipolept*","OR",2,45,37,459
0,"Like","*zopite*","OR",2,45,37,460
0,"Like","*setous*","OR",2,45,37,461
0,"Like","*majpin*","OR",2,45,37,462
0,"Like","*cloza*","OR",2,45,37,463
0,"Like","*leponex*",,2,45,37,464
0,"Like","*71675-85-9*","OR",2,45,37,465
0,"Like","*first episode*","OR",2,57,37,468
0,"Like","*untreated*","OR",2,57,37,469
0,"Like","*delayed treatment*","OR",2,57,37,470
0,"Like","*delay*","OR",2,57,37,471
0,"Like","*initial*","OR",2,57,37,472
0,"Like","*early*","OR",2,57,37,473
0,"Like","*primary*",,2,57,37,474
0,"Like","*amisulpride*","OR",2,57,37,475
0,"Like","*amitrex*","OR",2,57,37,476
0,"Like","*deniban*","OR",2,57,37,477
0,"Like","*socian*","OR",2,57,37,478
0,"Like","*solian*","OR",2,57,37,479
0,"Like","*sulanid*","OR",2,57,37,480
0,"Like","*sulamid*","OR",2,57,37,481
0,"Like","*zyprex*","OR",2,57,37,482
0,"Like","*olanzapin*","OR",2,57,37,483
0,"Like","*quetiapine*","OR",2,57,37,484
0,"Like","*seroquel*","OR",2,57,37,485
0,"Like","*risper*","OR",2,57,37,486
0,"Like","*ziprasidone*","OR",2,57,37,487
0,"Like","*zotepine*","OR",2,57,37,488
0,"Like","*lodopin*","OR",2,57,37,489
0,"Like","*nipolept*","OR",2,57,37,490
0,"Like","*zopite*","OR",2,57,37,491
0,"Like","*setous*","OR",2,57,37,492
0,"Like","*maj*","OR",2,57,37,493
0,"Like","*pin*","OR",2,57,37,494
0,"Like","*clozapine*","OR",2,57,37,495
0,"Like","*clozaril*","OR",2,57,37,496
0,"Like","*leponex*",,2,57,37,497
0,"Like","*cp-88059*","OR",2,27,38,499
0,"Like","*9-OH-risperidone*","OR",2,27,38,500
0,"Like","*first episode*","OR",2,27,38,501
0,"Like","*untreated*","OR",2,27,38,502
0,"Like","*delayed treatment*","OR",2,27,38,503
0,"Like","*delay*","OR",2,27,38,504
0,"Like","*initial*","OR",2,27,38,505
0,"Like","*early*","OR",2,27,38,506
0,"Like","*primary*","OR",2,27,38,507
0,"Like","*amisulpride*","OR",2,27,38,508
0,"Like","*amitrex*","OR",2,27,38,509
0,"Like","*deniban*","OR",2,27,38,510
0,"Like","*socian*","OR",2,27,38,511
0,"Like","*solian*","OR",2,27,38,512
0,"Like","*sulanid*","OR",2,27,38,513
0,"Like","*sulamid*","OR",2,27,38,514
0,"Like","*zyprex*","OR",2,27,38,515
0,"Like","*olanzapin*","OR",2,27,38,516
0,"Like","*quetiapine*","OR",2,27,38,517
0,"Like","*seroquel*","OR",2,27,38,518
0,"Like","*risper*","OR",2,27,38,519
0,"Like","*ziprasidone*","OR",2,27,38,520
0,"Like","*zotepine*","OR",2,27,38,521
0,"Like","*lodopin*","OR",2,27,38,522
0,"Like","*nipolept*","OR",2,27,38,523
0,"Like","*zopite*","OR",2,27,38,524
0,"Like","*setous*","OR",2,27,38,525
0,"Like","*ICI-204636*","OR",2,27,38,526
0,"Like","*ICI204636*","OR",2,27,38,527
0,"Like","*maj*","OR",2,27,38,528
0,"Like","*pin*","OR",2,27,38,529
0,"Like","*clozapine*","OR",2,27,38,530
0,"Like","*clozaril*","OR",2,27,38,531
0,"Like","*leponex*","OR",2,27,38,532
0,"Like","*first*","OR",2,27,38,533
0,"Like","*untreated*","OR",2,27,38,534
0,"Like","*delayed treatment*","OR",2,27,38,535
0,"Like","*delay*","OR",2,27,38,536
0,"Like","*initial*","OR",2,27,38,537
0,"Like","*early*","OR",2,27,38,538
0,"Like","*primary*","OR",2,27,38,539
0,"Like","*amisulpride*","OR",2,27,38,540
0,"Like","*amitrex*","OR",2,27,38,541
0,"Like","*deniban*","OR",2,27,38,542
0,"Like","*socian*","OR",2,27,38,543
0,"Like","*solian*","OR",2,27,38,544
0,"Like","*sulanid*","OR",2,27,38,545
0,"Like","*sulamid*","OR",2,27,38,546
0,"Like","*zyprex*","OR",2,27,38,547
0,"Like","*olanzapin*","OR",2,27,38,548
0,"Like","*risper*","OR",2,27,38,549
0,"Like","*ziprasidone*","OR",2,27,38,550
0,"Like","*zotepine*","OR",2,27,38,551
0,"Like","*lodopin*","OR",2,27,38,552
0,"Like","*nipolept*","OR",2,27,38,553
0,"Like","*zopite*","OR",2,27,38,554
0,"Like","*setous*","OR",2,27,38,555
0,"Like","*majpin*","OR",2,27,38,556
0,"Like","*cloza*","OR",2,27,38,557
0,"Like","*leponex*","OR",2,27,38,558
0,"Like","*71675-85-9*","OR",2,27,38,559
0,"Like","gelenberg*",,2,29,38,560
0,"Like","*cp-88059*","OR",2,36,38,561
0,"Like","*9-OH-risperidone*","OR",2,36,38,562
0,"Like","*untreated*","OR",2,36,38,563
0,"Like","*delayed treatment*","OR",2,36,38,564
0,"Like","*initial*","OR",2,36,38,565
0,"Like","*early*","OR",2,36,38,566
0,"Like","*primary*","OR",2,36,38,567
0,"Like","*amisulpride*","OR",2,36,38,568
0,"Like","*amitrex*","OR",2,36,38,569
0,"Like","*deniban*","OR",2,36,38,570
0,"Like","*socian*","OR",2,36,38,571
0,"Like","*solian*","OR",2,36,38,572
0,"Like","*sulanid*","OR",2,36,38,573
0,"Like","*sulamid*","OR",2,36,38,574
0,"Like","*zyprex*","OR",2,36,38,575
0,"Like","*olanzapin*","OR",2,36,38,576
0,"Like","*quetiapine*","OR",2,36,38,577
0,"Like","*risper*","OR",2,36,38,578
0,"Like","*ziprasidone*","OR",2,36,38,579
0,"Like","*zotepine*","OR",2,36,38,580
0,"Like","*lodopin*","OR",2,36,38,581
0,"Like","*nipolept*","OR",2,36,38,582
0,"Like","*zopite*","OR",2,36,38,583
0,"Like","*ICI-204636*","OR",2,36,38,584
0,"Like","*ICI204636*","OR",2,36,38,585
0,"Like","*setous*","OR",2,36,38,586
0,"Like","*maj*","OR",2,36,38,587
0,"Like","*pin*","OR",2,36,38,588
0,"Like","*clozapine*","OR",2,36,38,589
0,"Like","*clozaril*","OR",2,36,38,590
0,"Like","*leponex*","OR",2,36,38,591
0,"Like","*first episode*","OR",2,36,38,592
0,"Like","*untreated*","OR",2,36,38,593
0,"Like","*delayed treatment*","OR",2,36,38,594
0,"Like","*delay*","OR",2,36,38,595
0,"Like","*initial*","OR",2,36,38,596
0,"Like","*early*","OR",2,36,38,597
0,"Like","*primary*","OR",2,36,38,598
0,"Like","*amisulpride*","OR",2,36,38,599
0,"Like","*amitrex*","OR",2,36,38,600
0,"Like","*deniban*","OR",2,36,38,601
0,"Like","*socian*","OR",2,36,38,602
0,"Like","*solian*","OR",2,36,38,603
0,"Like","*sulanid*","OR",2,36,38,604
0,"Like","*sulamid*","OR",2,36,38,605
0,"Like","*zyprex*","OR",2,36,38,606
0,"Like","*olanzapin*","OR",2,36,38,607
0,"Like","*risper*","OR",2,36,38,608
0,"Like","*ziprasidone*","OR",2,36,38,609
0,"Like","*zotepine*","OR",2,36,38,610
0,"Like","*lodopin*","OR",2,36,38,611
0,"Like","*nipolept*","OR",2,36,38,612
0,"Like","*zopite*","OR",2,36,38,613
0,"Like","*setous*","OR",2,36,38,614
0,"Like","*majpin*","OR",2,36,38,615
0,"Like","*cloza*","OR",2,36,38,616
0,"Like","*leponex*","OR",2,36,38,617
0,"Like","*71675-85-9*","OR",2,36,38,618
0,"Like","*cp-88059*","OR",2,45,38,619
0,"Like","*9-OH-risperidone*","OR",2,45,38,620
0,"Like","*ICI-204636*","OR",2,45,38,621
0,"Like","*ICI204636*","OR",2,45,38,622
0,"Like","Cholinergics for TD*",,2,45,38,623
0,"Like","*amisulpride*","OR",2,45,38,624
0,"Like","*amitrex*","OR",2,45,38,625
0,"Like","*deniban*","OR",2,45,38,626
0,"Like","*socian*","OR",2,45,38,627
0,"Like","*solian*","OR",2,45,38,628
0,"Like","*sulanid*","OR",2,45,38,629
0,"Like","*sulamid*","OR",2,45,38,630
0,"Like","*zyprex*","OR",2,45,38,631
0,"Like","*olanzapin*","OR",2,45,38,632
0,"Like","*risper*","OR",2,45,38,633
0,"Like","*ziprasidone*","OR",2,45,38,634
0,"Like","*zotepine*","OR",2,45,38,635
0,"Like","*lodopin*","OR",2,45,38,636
0,"Like","*nipolept*","OR",2,45,38,637
0,"Like","*zopite*","OR",2,45,38,638
0,"Like","*setous*","OR",2,45,38,639
0,"Like","*majpin*","OR",2,45,38,640
0,"Like","*cloza*","OR",2,45,38,641
0,"Like","*leponex*",,2,45,38,642
0,"Like","*71675-85-9*","OR",2,45,38,643
0,"Like","*first episode*","OR",2,57,38,646
0,"Like","*untreated*","OR",2,57,38,647
0,"Like","*delayed treatment*","OR",2,57,38,648
0,"Like","*delay*","OR",2,57,38,649
0,"Like","*initial*","OR",2,57,38,650
0,"Like","*early*","OR",2,57,38,651
0,"Like","*primary*","OR",2,57,38,652
0,"Like","*amisulpride*","OR",2,57,38,653
0,"Like","*amitrex*","OR",2,57,38,654
0,"Like","*deniban*","OR",2,57,38,655
0,"Like","*socian*","OR",2,57,38,656
0,"Like","*solian*","OR",2,57,38,657
0,"Like","*sulanid*","OR",2,57,38,658
0,"Like","*sulamid*","OR",2,57,38,659
0,"Like","*zyprex*","OR",2,57,38,660
0,"Like","*olanzapin*","OR",2,57,38,661
0,"Like","*quetiapine*","OR",2,57,38,662
0,"Like","*seroquel*","OR",2,57,38,663
0,"Like","*risper*","OR",2,57,38,664
0,"Like","*ziprasidone*","OR",2,57,38,665
0,"Like","*zotepine*","OR",2,57,38,666
0,"Like","*lodopin*","OR",2,57,38,667
0,"Like","*nipolept*","OR",2,57,38,668
0,"Like","*zopite*","OR",2,57,38,669
0,"Like","*setous*","OR",2,57,38,670
0,"Like","*maj*","OR",2,57,38,671
0,"Like","*pin*","OR",2,57,38,672
0,"Like","*clozapine*","OR",2,57,38,673
0,"Like","*clozaril*","OR",2,57,38,674
0,"Like","*leponex*","OR",2,57,38,675
0,"Like","*first episode*","OR",2,57,38,676
0,"Like","*untreated*","OR",2,57,38,677
0,"Like","*delayed treatment*","OR",2,57,38,678
0,"Like","*delay*","OR",2,57,38,679
0,"Like","*initial*","OR",2,57,38,680
0,"Like","*early*","OR",2,57,38,681
0,"Like","*primary*","OR",2,57,38,682
0,"Like","*as required*","OR",1,14,39,684
0,"Like","*as needed*","OR",1,14,39,685
0,"Like","*as necessary*","OR",1,14,39,686
0,"Like","*as-required*","OR",1,14,39,687
0,"Like","*as-needed*","OR",1,14,39,688
0,"Like","*as-necessary*","OR",1,14,39,689
0,"Like","*as indicated*","OR",1,14,39,690
0,"Like","*PRN*","OR",1,14,39,691
0,"Like","*pro re nata*","OR",1,14,39,692
0,"Like","*drug regimens*","OR",1,14,39,693
0,"Like","*psychotropic drug regimens*","OR",1,14,39,694
0,"Like","*lithium*","OR",2,27,56,1723
0,"Like","*lithicarb*","OR",2,27,56,1724
0,"Like","*eskalith*","OR",2,27,56,1725
0,"Like","*lithobid*","OR",2,27,56,1726
0,"Like","*lithane*","OR",2,27,56,1727
0,"Like","*cibalith-s*","OR",2,27,56,1728
0,"Like","*quilonum*","OR",2,27,56,1729
0,"Like","*hypnorex*","OR",2,27,56,1730
0,"Like","*herb*","OR",2,27,56,1731
0,"Like","*Chinese*","OR",2,27,56,1732
0,"Like","*plant*","OR",2,27,56,1733
0,"Like","*complementary*","OR",2,27,56,1734
0,"Like","*alternative*","OR",2,27,56,1735
0,"Like","*yin-yang*","OR",2,27,56,1736
0,"Like","*yang*","OR",2,27,56,1737
0,"Like","*ying*","OR",2,27,56,1738
0,"Like","*traditional*","OR",2,27,56,1739
0,"Like","*oriental*","OR",2,27,56,1740
0,"Like","* neo*","OR",2,27,56,1741
0,"Like","* brotizolam*","OR",2,27,56,1742
0,"Like","* clotiazepam*","OR",2,27,56,1743
0,"Like","* dikaliumclorazepat*","OR",2,27,56,1744
0,"Like","* metaclazepam*","OR",2,27,56,1745
0,"Like","* nordazepam*","OR",2,27,56,1746
0,"Like","* prazepam*","OR",2,27,56,1747
0,"Like","* triazolam*","OR",2,27,56,1748
0,"Like","*amisulprid*","OR",2,27,56,1749
0,"Like","*clozapin*","OR",2,27,56,1750
0,"Like","*olanzapin*","OR",2,27,56,1751
0,"Like","*quetiapin*","OR",2,27,56,1752
0,"Like","*remoxiprid*","OR",2,27,56,1753
0,"Like","*risperidon*","OR",2,27,56,1754
0,"Like","*sertindol*","OR",2,27,56,1755
0,"Like","*ziprasidon*","OR",2,27,56,1756
0,"Like","*zotepin*","OR",2,27,56,1757
0,"Like","*amisulpride*","OR",2,27,56,1758
0,"Like","*clozapin*","OR",2,27,56,1759
0,"Like","*olanzapin*","OR",2,27,56,1760
0,"Like","*quetiapin*","OR",2,27,56,1761
0,"Like","*remoxiprid*","OR",2,27,56,1762
0,"Like","*risperidon*","OR",2,27,56,1763
0,"Like","*sertindol*","OR",2,27,56,1764
0,"Like","*ziprasidon*","OR",2,27,56,1765
0,"Like","*zotepin*","OR",2,27,56,1766
0,"Like","*herb*","OR",2,28,56,1767
0,"Like","*Chinese*","OR",2,28,56,1768
0,"Like","*plant*","OR",2,28,56,1769
0,"Like","*complementary*","OR",2,28,56,1770
0,"Like","*alternative*","OR",2,28,56,1771
0,"Like","*yin-yang*","OR",2,28,56,1772
0,"Like","*yang*","OR",2,28,56,1773
0,"Like","*ying*","OR",2,28,56,1774
0,"Like","*traditional*","OR",2,28,56,1775
0,"Like","*oriental*","OR",2,28,56,1776
0,"Like","Mc*",,2,29,56,1777
0,"Like","dossenbach*",,2,29,56,1778
0,"Like","Arato*",,2,29,56,1779
0,"Like","Sugano*",,2,29,56,1780
0,"Like","Samejima*",,2,29,56,1781
0,"Like","Cantillon*",,2,29,56,1782
0,"Like","wirshing*",,2,29,56,1783
0,"Like","paykel*",,2,29,56,1784
0,"Like","paul*",,2,29,56,1785
0,"Like","o'connor*",,2,29,56,1786
0,"Like","toll*",,2,29,56,1787
0,"Like","*lithium*","OR",2,36,56,1788
0,"Like","*lithicarb*","OR",2,36,56,1789
0,"Like","*eskalith*","OR",2,36,56,1790
0,"Like","*lithobid*","OR",2,36,56,1791
0,"Like","*lithane*","OR",2,36,56,1792
0,"Like","*cibalith-s*","OR",2,36,56,1793
0,"Like","*quilonum*","OR",2,36,56,1794
0,"Like","*hypnorex*","OR",2,36,56,1795
0,"Like","*herb*","OR",2,36,56,1796
0,"Like","*Chinese*","OR",2,36,56,1797
0,"Like","*plant*","OR",2,36,56,1798
0,"Like","*complementary*","OR",2,36,56,1799
0,"Like","*alternative*","OR",2,36,56,1800
0,"Like","*yin-yang*","OR",2,36,56,1801
0,"Like","*yang*","OR",2,36,56,1802
0,"Like","*ying*","OR",2,36,56,1803
0,"Like","*traditional*","OR",2,36,56,1804
0,"Like","*oriental*","OR",2,36,56,1805
0,"Like","* neo*","OR",2,36,56,1806
0,"Like","* brotizolam*","OR",2,36,56,1807
0,"Like","* clotiazepam*","OR",2,36,56,1808
0,"Like","* dikaliumclorazepat*","OR",2,36,56,1809
0,"Like","* metaclazepam*","OR",2,36,56,1810
0,"Like","* nordazepam","OR",2,36,56,1811
0,"Like","* prazepam*","OR",2,36,56,1812
0,"Like","* triazolam*","OR",2,36,56,1813
0,"Like","*amisulprid*","OR",2,36,56,1814
0,"Like","*clozapin*","OR",2,36,56,1815
0,"Like","*olanzapin*","OR",2,36,56,1816
0,"Like","*quetiapin*","OR",2,36,56,1817
0,"Like","*remoxiprid*","OR",2,36,56,1818
0,"Like","*risperidon*","OR",2,36,56,1819
0,"Like","*sertindol*","OR",2,36,56,1820
0,"Like","*ziprasidon*","OR",2,36,56,1821
0,"Like","*zotepin*","OR",2,36,56,1822
0,"Like","*amisulpride*","OR",2,36,56,1823
0,"Like","*clozapin*","OR",2,36,56,1824
0,"Like","*olanzapin*","OR",2,36,56,1825
0,"Like","*remoxiprid*","OR",2,36,56,1826
0,"Like","*risperidon*","OR",2,36,56,1827
0,"Like","*sertindol*","OR",2,36,56,1828
0,"Like","*ziprasidon*","OR",2,36,56,1829
0,"Like","*zotepin*","OR",2,36,56,1830
0,"Like","Lithium*",,2,45,56,1842
0,"Like","Lithuim*",,2,45,56,1843
0,"Like","lithium*",,2,45,56,1844
0,"Like","chinese*",,2,45,56,1845
0,"Like","benzo*",,2,45,56,1846
0,"Like","*lithium*","OR",2,57,56,1848
0,"Like","*lithicarb*","OR",2,57,56,1849
0,"Like","*eskalith*","OR",2,57,56,1850
0,"Like","*lithobid*","OR",2,57,56,1851
0,"Like","*lithane*","OR",2,57,56,1852
0,"Like","*cibalith-s*","OR",2,57,56,1853
0,"Like","*quilonum*","OR",2,57,56,1854
0,"Like","*hypnorex*",,2,57,56,1855
0,"Like","*herb*","OR",2,57,56,1856
0,"Like","*Chinese*","OR",2,57,56,1857
0,"Like","*plant*","OR",2,57,56,1858
0,"Like","*complementary*","OR",2,57,56,1859
0,"Like","*alternative*","OR",2,57,56,1860
0,"Like","*yin-yang*","OR",2,57,56,1861
0,"Like","*yang*","OR",2,57,56,1862
0,"Like","*traditional*","OR",2,57,56,1863
0,"Like","*oriental*",,2,57,56,1864
0,"Like","* neo*","OR",2,57,56,1865
0,"Like","* brotizolam*","OR",2,57,56,1866
0,"Like","* clotiazepam*","OR",2,57,56,1867
0,"Like","* dikaliumclorazepat*","OR",2,57,56,1868
0,"Like","* metaclazepam*","OR",2,57,56,1869
0,"Like","* nordazepam","OR",2,57,56,1870
0,"Like","* prazepam*","OR",2,57,56,1871
0,"Like","* triazolam*",,2,57,56,1872
0,"Like","* benzodiazep*",,2,57,56,1873
0,"Like","*amisulprid*","OR",2,57,56,1874
0,"Like","*clozapin*","OR",2,57,56,1875
0,"Like","*olanzapin*","OR",2,57,56,1876
0,"Like","*quetiapin*","OR",2,57,56,1877
0,"Like","*remoxiprid*","OR",2,57,56,1878
0,"Like","*risperidon*","OR",2,57,56,1879
0,"Like","*sertindol*","OR",2,57,56,1880
0,"Like","*ziprasidon*","OR",2,57,56,1881
0,"Like","*zotepin*",,2,57,56,1882
0,"Like","*amisulpride*","OR",2,57,56,1883
0,"Like","*clozapin*","OR",2,57,56,1884
0,"Like","*olanzapin*","OR",2,57,56,1885
0,"Like","*quetiapin*","OR",2,57,56,1886
0,"Like","*quetiapin*","OR",2,57,56,1887
0,"Like","*remoxiprid*","OR",2,57,56,1888
0,"Like","*risperidon*","OR",2,57,56,1889
0,"Like","*sertindol*","OR",2,57,56,1890
0,"Like","*ziprasidon*","OR",2,57,56,1891
0,"Like","*zotepin*",,2,57,56,1892
0,"Like","*lithium*","OR",2,27,57,1893
0,"Like","*lithicarb*","OR",2,27,57,1894
0,"Like","*eskalith*","OR",2,27,57,1895
0,"Like","*lithobid*","OR",2,27,57,1896
0,"Like","*lithane*","OR",2,27,57,1897
0,"Like","*cibalith-s*","OR",2,27,57,1898
0,"Like","*quilonum*","OR",2,27,57,1899
0,"Like","*hypnorex*","OR",2,27,57,1900
0,"Like","*herb*","OR",2,27,57,1901
0,"Like","*Chinese*","OR",2,27,57,1902
0,"Like","*plant*","OR",2,27,57,1903
0,"Like","*complementary*","OR",2,27,57,1904
0,"Like","*alternative*","OR",2,27,57,1905
0,"Like","*yin-yang*","OR",2,27,57,1906
0,"Like","*yang*","OR",2,27,57,1907
0,"Like","*ying*","OR",2,27,57,1908
0,"Like","*traditional*","OR",2,27,57,1909
0,"Like","*oriental*","OR",2,27,57,1910
0,"Like","* neo*","OR",2,27,57,1911
0,"Like","* brotizolam*","OR",2,27,57,1912
0,"Like","* clotiazepam*","OR",2,27,57,1913
0,"Like","* dikaliumclorazepat*","OR",2,27,57,1914
0,"Like","* metaclazepam*","OR",2,27,57,1915
0,"Like","* nordazepam*","OR",2,27,57,1916
0,"Like","* prazepam*","OR",2,27,57,1917
0,"Like","* triazolam*","OR",2,27,57,1918
0,"Like","*amisulprid*","OR",2,27,57,1919
0,"Like","*clozapin*","OR",2,27,57,1920
0,"Like","*olanzapin*","OR",2,27,57,1921
0,"Like","*quetiapin*","OR",2,27,57,1922
0,"Like","*remoxiprid*","OR",2,27,57,1923
0,"Like","*risperidon*","OR",2,27,57,1924
0,"Like","*sertindol*","OR",2,27,57,1925
0,"Like","*ziprasidon*","OR",2,27,57,1926
0,"Like","*zotepin*","OR",2,27,57,1927
0,"Like","*amisulpride*","OR",2,27,57,1928
0,"Like","*clozapin*","OR",2,27,57,1929
0,"Like","*olanzapin*","OR",2,27,57,1930
0,"Like","*quetiapin*","OR",2,27,57,1931
0,"Like","*remoxiprid*","OR",2,27,57,1932
0,"Like","*risperidon*","OR",2,27,57,1933
0,"Like","*sertindol*","OR",2,27,57,1934
0,"Like","*ziprasidon*","OR",2,27,57,1935
0,"Like","*zotepin*","OR",2,27,57,1936
0,"Like","*chlorpromazin*","OR",2,27,57,1937
0,"Like","*perazin*","OR",2,27,57,1938
0,"Like","*thioridazin*","OR",2,27,57,1939
0,"Like","*chlorprothixen*","OR",2,27,57,1940
0,"Like","*prothipendyl*","OR",2,27,57,1941
0,"Like","*melperon*","OR",2,27,57,1942
0,"Like","*pipamperon*","OR",2,27,57,1943
0,"Like","*fluspirilen*","OR",2,27,57,1944
0,"Like","*triflupromazin*","OR",2,27,57,1945
0,"Like","*promazin*","OR",2,27,57,1946
0,"Like","*metiapin*","OR",2,27,57,1947
0,"Like","*herb*","OR",2,28,57,1948
0,"Like","*Chinese*","OR",2,28,57,1949
0,"Like","*plant*","OR",2,28,57,1950
0,"Like","*complementary*","OR",2,28,57,1951
0,"Like","*alternative*","OR",2,28,57,1952
0,"Like","*yin-yang*","OR",2,28,57,1953
0,"Like","*yang*","OR",2,28,57,1954
0,"Like","*ying*","OR",2,28,57,1955
0,"Like","*traditional*","OR",2,28,57,1956
0,"Like","*oriental*","OR",2,28,57,1957
0,"Like","Mc*",,2,29,57,1958
0,"Like","dossenbach*",,2,29,57,1959
0,"Like","Arato*",,2,29,57,1960
0,"Like","Sugano*",,2,29,57,1961
0,"Like","Samejima*",,2,29,57,1962
0,"Like","Cantillon*",,2,29,57,1963
0,"Like","wirshing*",,2,29,57,1964
0,"Like","paykel*",,2,29,57,1965
0,"Like","paul*",,2,29,57,1966
0,"Like","o'connor*",,2,29,57,1967
0,"Like","toll*",,2,29,57,1968
0,"Like","*lithium*","OR",2,36,57,1969
0,"Like","*lithicarb*","OR",2,36,57,1970
0,"Like","*eskalith*","OR",2,36,57,1971
0,"Like","*lithobid*","OR",2,36,57,1972
0,"Like","*lithane*","OR",2,36,57,1973
0,"Like","*cibalith-s*","OR",2,36,57,1974
0,"Like","*quilonum*","OR",2,36,57,1975
0,"Like","*hypnorex*","OR",2,36,57,1976
0,"Like","*herb*","OR",2,36,57,1977
0,"Like","*Chinese*","OR",2,36,57,1978
0,"Like","*plant*","OR",2,36,57,1979
0,"Like","*complementary*","OR",2,36,57,1980
0,"Like","*alternative*","OR",2,36,57,1981
0,"Like","*yin-yang*","OR",2,36,57,1982
0,"Like","*yang*","OR",2,36,57,1983
0,"Like","*ying*","OR",2,36,57,1984
0,"Like","*traditional*","OR",2,36,57,1985
0,"Like","*oriental*","OR",2,36,57,1986
0,"Like","* neo*","OR",2,36,57,1987
0,"Like","* brotizolam*","OR",2,36,57,1988
0,"Like","* clotiazepam*","OR",2,36,57,1989
0,"Like","* dikaliumclorazepat*","OR",2,36,57,1990
0,"Like","* metaclazepam*","OR",2,36,57,1991
0,"Like","* nordazepam","OR",2,36,57,1992
0,"Like","* prazepam*","OR",2,36,57,1993
0,"Like","* triazolam*","OR",2,36,57,1994
0,"Like","*amisulprid*","OR",2,36,57,1995
0,"Like","*clozapin*","OR",2,36,57,1996
0,"Like","*olanzapin*","OR",2,36,57,1997
0,"Like","*quetiapin*","OR",2,36,57,1998
0,"Like","*remoxiprid*","OR",2,36,57,1999
0,"Like","*risperidon*","OR",2,36,57,2000
0,"Like","*sertindol*","OR",2,36,57,2001
0,"Like","*ziprasidon*","OR",2,36,57,2002
0,"Like","*zotepin*","OR",2,36,57,2003
0,"Like","*amisulpride*","OR",2,36,57,2004
0,"Like","*clozapin*","OR",2,36,57,2005
0,"Like","*olanzapin*","OR",2,36,57,2006
0,"Like","*remoxiprid*","OR",2,36,57,2007
0,"Like","*risperidon*","OR",2,36,57,2008
0,"Like","*sertindol*","OR",2,36,57,2009
0,"Like","*ziprasidon*","OR",2,36,57,2010
0,"Like","*zotepin*","OR",2,36,57,2011
0,"Like","*chlorpromazin*","OR",2,36,57,2012
0,"Like","*perazin*","OR",2,36,57,2013
0,"Like","*thioridazin*","OR",2,36,57,2014
0,"Like","*chlorprothixen*","OR",2,36,57,2015
0,"Like","*prothipendyl*","OR",2,36,57,2016
0,"Like","*melperon*","OR",2,36,57,2017
0,"Like","*pipamperon*","OR",2,36,57,2018
0,"Like","*fluspirilen*","OR",2,36,57,2019
0,"Like","*triflupromazin*","OR",2,36,57,2020
0,"Like","*promazin*","OR",2,36,57,2021
0,"Like","*metiapin*","OR",2,36,57,2022
0,"Like","Lithium*",,2,45,57,2034
0,"Like","Lithuim*",,2,45,57,2035
0,"Like","lithium*",,2,45,57,2036
0,"Like","chinese*",,2,45,57,2037
0,"Like","benzo*",,2,45,57,2038
0,"Like","*lithium*","OR",2,57,57,2040
0,"Like","*lithicarb*","OR",2,57,57,2041
0,"Like","*eskalith*","OR",2,57,57,2042
0,"Like","*lithobid*","OR",2,57,57,2043
0,"Like","*lithane*","OR",2,57,57,2044
0,"Like","*cibalith-s*","OR",2,57,57,2045
0,"Like","*quilonum*","OR",2,57,57,2046
0,"Like","*hypnorex*","OR",2,57,57,2047
0,"Like","*herb*","OR",2,57,57,2048
0,"Like","*Chinese*","OR",2,57,57,2049
0,"Like","*plant*","OR",2,57,57,2050
0,"Like","*complementary*","OR",2,57,57,2051
0,"Like","*alternative*","OR",2,57,57,2052
0,"Like","*yin-yang*","OR",2,57,57,2053
0,"Like","*yang*","OR",2,57,57,2054
0,"Like","*traditional*","OR",2,57,57,2055
0,"Like","*oriental*","OR",2,57,57,2056
0,"Like","* neo*","OR",2,57,57,2057
0,"Like","* brotizolam*","OR",2,57,57,2058
0,"Like","* clotiazepam*","OR",2,57,57,2059
0,"Like","* dikaliumclorazepat*","OR",2,57,57,2060
0,"Like","* metaclazepam*","OR",2,57,57,2061
0,"Like","* nordazepam","OR",2,57,57,2062
0,"Like","* prazepam*","OR",2,57,57,2063
0,"Like","* triazolam*","OR",2,57,57,2064
0,"Like","* benzodiazep*","OR",2,57,57,2065
0,"Like","*amisulprid*","OR",2,57,57,2066
0,"Like","*clozapin*","OR",2,57,57,2067
0,"Like","*olanzapin*","OR",2,57,57,2068
0,"Like","*quetiapin*","OR",2,57,57,2069
0,"Like","*remoxiprid*","OR",2,57,57,2070
0,"Like","*risperidon*","OR",2,57,57,2071
0,"Like","*sertindol*","OR",2,57,57,2072
0,"Like","*ziprasidon*","OR",2,57,57,2073
0,"Like","*zotepin*","OR",2,57,57,2074
0,"Like","*amisulpride*","OR",2,57,57,2075
0,"Like","*clozapin*","OR",2,57,57,2076
0,"Like","*olanzapin*","OR",2,57,57,2077
0,"Like","*quetiapin*","OR",2,57,57,2078
0,"Like","*quetiapin*","OR",2,57,57,2079
0,"Like","*remoxiprid*","OR",2,57,57,2080
0,"Like","*risperidon*","OR",2,57,57,2081
0,"Like","*sertindol*","OR",2,57,57,2082
0,"Like","*ziprasidon*","OR",2,57,57,2083
0,"Like","*zotepin*","OR",2,57,57,2084
0,"Like","*chlorpromazin*","OR",2,57,57,2085
0,"Like","*perazin*","OR",2,57,57,2086
0,"Like","*thioridazin*","OR",2,57,57,2087
0,"Like","*chlorprothixen*","OR",2,57,57,2088
0,"Like","*prothipendyl*","OR",2,57,57,2089
0,"Like","*melperon*","OR",2,57,57,2090
0,"Like","*pipamperon*","OR",2,57,57,2091
0,"Like","*fluspirilen*","OR",2,57,57,2092
0,"Like","*triflupromazin*","OR",2,57,57,2093
0,"Like","*promazin*","OR",2,57,57,2094
0,"Like","*metiapin*","OR",2,57,57,2095
0,"Like","*impotence*","OR",1,17,59,2143
0,"Like","Sex*","OR",1,17,59,2144
0,"Like","orgas*","OR",1,17,59,2145
0,"Like","*libido*",,1,17,59,2146
0,"Like","Clopenthixol*","OR",1,14,60,2147
0,"Like","0-108*","OR",1,14,60,2148
0,"Like","*cisordinol*","OR",1,14,60,2149
0,"Like","*clopixol*",,1,14,60,2150
0,"Like","zuclopenthix*","OR",1,14,60,2151
0,"Like","* art therapy*","OR",2,27,63,2341
0,"Like","*glutamate*","OR",2,27,63,2342
0,"Like","*glutamine*","OR",2,27,63,2343
0,"Like","*glutamic*","OR",2,27,63,2344
0,"Like","*aspartate*","OR",2,27,63,2345
0,"Like","*glycine*","OR",2,27,63,2346
0,"Like","*NMDA*","OR",2,27,63,2347
0,"Like","*AMPA*","OR",2,27,63,2348
0,"Like","*kainate*","OR",2,27,63,2349
0,"Like","*d-serine*","OR",2,27,63,2350
0,"Like","*cycloserine*","OR",2,27,63,2351
0,"Like","*SC 49088*","OR",2,27,63,2352
0,"Like","*(R)-4-amino-isoxazolidinone*","OR",2,27,63,2353
0,"Like","*ampakine*","OR",2,27,63,2354
0,"Like","*CX 516*","OR",2,27,63,2355
0,"Like","*CAS 154235-83-3*","OR",2,27,63,2356
0,"Like","denney*",,2,29,63,2357
0,"Like","Klotz TA*",,2,29,63,2358
0,"Like","huf*",,2,29,63,2359
0,"Like","* dikaliumclorazepat*",,2,36,63,2360
0,"Like","* dikaliumclorazepat*","OR",2,36,63,2361
0,"Like","* dikaliumclorazepat*","OR",2,36,63,2362
0,"Like","* art Therapy*","OR",2,36,63,2363
0,"Like","* drawi*","OR",2,36,63,2364
0,"Like","*glutamate*","OR",2,36,63,2365
0,"Like","*glutamine*","OR",2,36,63,2366
0,"Like","*glutamic*","OR",2,36,63,2367
0,"Like","*aspartate*","OR",2,36,63,2368
0,"Like","*glycine*","OR",2,36,63,2369
0,"Like","*NMDA*","OR",2,36,63,2370
0,"Like","*AMPA*","OR",2,36,63,2371
0,"Like","*kainate*","OR",2,36,63,2372
0,"Like","*d-serine*","OR",2,36,63,2373
0,"Like","*cycloserine*","OR",2,36,63,2374
0,"Like","*SC 49088*","OR",2,36,63,2375
0,"Like","*(R)-4-amino-isoxazolidinone*","OR",2,36,63,2376
0,"Like","*ampakine*","OR",2,36,63,2377
0,"Like","*CX 516*","OR",2,36,63,2378
0,"Like","*CAS 154235-83-3*","OR",2,36,63,2379
0,"Like","Benzodiazepines for psychosis*",,2,45,63,2385
0,"Like","* dikaliumclorazepat*","OR",2,57,63,2392
0,"Like","* dikaliumclorazepat*",,2,57,63,2393
0,"Like","* dikaliumclorazepat*",,2,57,63,2394
0,"Like","* art Therapy","OR",2,57,63,2395
0,"Like","* drawi*","OR",2,57,63,2396
0,"Like","*glutamate*","OR",2,57,63,2397
0,"Like","*glutamine*","OR",2,57,63,2398
0,"Like","*glutamic*","OR",2,57,63,2399
0,"Like","*aspartate*","OR",2,57,63,2400
0,"Like","*glycine*","OR",2,57,63,2401
0,"Like","*NMDA*","OR",2,57,63,2402
0,"Like","*AMPA*","OR",2,57,63,2403
0,"Like","*kainate*","OR",2,57,63,2404
0,"Like","*d-serine*","OR",2,57,63,2405
0,"Like","*cycloserine*","OR",2,57,63,2406
0,"Like","*SC 49088*","OR",2,57,63,2407
0,"Like","*(R)-4-amino-isoxazolidinone*","OR",2,57,63,2408
0,"Like","*ampakine*","OR",2,57,63,2409
0,"Like","*CX 516*","OR",2,57,63,2410
0,"Like","*CAS 154235-83-3*",,2,57,63,2411
0,"Like","* masturbat*","OR",2,27,67,2622
0,"Like","* exhibitionis*","OR",2,27,67,2623
0,"Like","* lewd*","OR",2,27,67,2624
0,"Like","* sadis*","OR",2,27,67,2625
0,"Like","* sadis*","OR",2,27,67,2626
0,"Like","* sadomasochis*","OR",2,27,67,2627
0,"Like","* abduct*","OR",2,27,67,2628
0,"Like","* kidnap*","OR",2,27,67,2629
0,"Like","* aggress*","OR",2,27,67,2630
0,"Like","* violen*","OR",2,27,67,2631
0,"Like","* anger*","OR",2,27,67,2632
0,"Like","* malic*","OR",2,27,67,2633
0,"Like","* hostil*","OR",2,27,67,2634
0,"Like","* dangerousness*","OR",2,27,67,2635
0,"Like","* cruel*","OR",2,27,67,2636
0,"Like","* delinquen*","OR",2,27,67,2637
0,"Like","* threaten*","OR",2,27,67,2638
0,"Like","* disorderly*","OR",2,27,67,2639
0,"Like","* affray*","OR",2,27,67,2640
0,"Like","* breach*","OR",2,27,67,2641
0,"Like","* unlawful*","OR",2,27,67,2642
0,"Like","* penol*","OR",2,27,67,2643
0,"Like","* crim*","OR",2,27,67,2644
0,"Like","* adinazolam*","OR",2,27,67,2645
0,"Like","* anthramycin*","OR",2,27,67,2646
0,"Like","* bentazepam*","OR",2,27,67,2647
0,"Like","* cinolazepam*","OR",2,27,67,2648
0,"Like","* clotiazepam*","OR",2,27,67,2649
0,"Like","* benzodiazep*","OR",2,27,67,2650
0,"Like","* alprazolam*","OR",2,27,67,2651
0,"Like","* bromazepam*","OR",2,27,67,2652
0,"Like","* chlordiazepoxide*","OR",2,27,67,2653
0,"Like","* clobazam*","OR",2,27,67,2654
0,"Like","* clonazepam*","OR",2,27,67,2655
0,"Like","* clorazepate dipotassium*","OR",2,27,67,2656
0,"Like","* diazepam*","OR",2,27,67,2657
0,"Like","* flunitrazepam*","OR",2,27,67,2658
0,"Like","* flurazepam*","OR",2,27,67,2659
0,"Like","* loprazolam*","OR",2,27,67,2660
0,"Like","* lorazepam*","OR",2,27,67,2661
0,"Like","* lormetazepam*","OR",2,27,67,2662
0,"Like","* medazepam*","OR",2,27,67,2663
0,"Like","* midazolam*","OR",2,27,67,2664
0,"Like","* nitrazepam*","OR",2,27,67,2665
0,"Like","* oxazepam*","OR",2,27,67,2666
0,"Like","* temazepam*","OR",2,27,67,2667
0,"Like","* adinazolam*","OR",2,27,67,2668
0,"Like","* anthramycin*","OR",2,27,67,2669
0,"Like","* bentazepam*","OR",2,27,67,2670
0,"Like","* cinolazepam*","OR",2,27,67,2671
0,"Like","* clotiazepam*","OR",2,27,67,2672
0,"Like","* masturbat*","OR",2,36,67,2673
0,"Like","* exhibitionis*","OR",2,36,67,2674
0,"Like","* lewd*","OR",2,36,67,2675
0,"Like","* sadis*","OR",2,36,67,2676
0,"Like","* sadomasochis*","OR",2,36,67,2677
0,"Like","* abduct*","OR",2,36,67,2678
0,"Like","* kidnap*","OR",2,36,67,2679
0,"Like","* aggress*","OR",2,36,67,2680
0,"Like","* violen*","OR",2,36,67,2681
0,"Like","* anger*","OR",2,36,67,2682
0,"Like","* malic*","OR",2,36,67,2683
0,"Like","* hostil*","OR",2,36,67,2684
0,"Like","* dangerousness*","OR",2,36,67,2685
0,"Like","* cruel*","OR",2,36,67,2686
0,"Like","* threaten*","OR",2,36,67,2687
0,"Like","* disorderly*","OR",2,36,67,2688
0,"Like","* affray*","OR",2,36,67,2689
0,"Like","* felon*","OR",2,36,67,2690
0,"Like","* unlawful*","OR",2,36,67,2691
0,"Like","* penal*","OR",2,36,67,2692
0,"Like","* penol*","OR",2,36,67,2693
0,"Like","* crim*","OR",2,36,67,2694
0,"Like","* adinazolam*","OR",2,36,67,2695
0,"Like","* anthramycin*","OR",2,36,67,2696
0,"Like","* bentazepam*","OR",2,36,67,2697
0,"Like","* cinolazepam*","OR",2,36,67,2698
0,"Like","* clotiazepam*","OR",2,36,67,2699
0,"Like","* benzodiazep*","OR",2,36,67,2700
0,"Like","* alprazolam*","OR",2,36,67,2701
0,"Like","* bromazepam*","OR",2,36,67,2702
0,"Like","* chlordiazepoxide*","OR",2,36,67,2703
0,"Like","* clobazam*","OR",2,36,67,2704
0,"Like","* clonazepam*","OR",2,36,67,2705
0,"Like","* clorazepate dipotassium*","OR",2,36,67,2706
0,"Like","* diazepam*","OR",2,36,67,2707
0,"Like","* flunitrazepam*","OR",2,36,67,2708
0,"Like","* flurazepam*","OR",2,36,67,2709
0,"Like","* loprazolam*","OR",2,36,67,2710
0,"Like","* lorazepam*","OR",2,36,67,2711
0,"Like","* lormetazepam*","OR",2,36,67,2712
0,"Like","* medazepam*","OR",2,36,67,2713
0,"Like","* midazolam*","OR",2,36,67,2714
0,"Like","* nitrazepam*","OR",2,36,67,2715
0,"Like","* oxazepam*","OR",2,36,67,2716
0,"Like","* temazepam*","OR",2,36,67,2717
0,"Like","* adinazolam*","OR",2,36,67,2718
0,"Like","* anthramycin*","OR",2,36,67,2719
0,"Like","* bentazepam*","OR",2,36,67,2720
0,"Like","* cinolazepam*","OR",2,36,67,2721
0,"Like","* clotiazepam*","OR",2,36,67,2722
0,"Like","* masturbat*","OR",2,57,67,2723
0,"Like","* exhibitionis*","OR",2,57,67,2724
0,"Like","* lewd*","OR",2,57,67,2725
0,"Like","* sadis*","OR",2,57,67,2726
0,"Like","* sadis*","OR",2,57,67,2727
0,"Like","* sadomasochis*","OR",2,57,67,2728
0,"Like","* abduct*","OR",2,57,67,2729
0,"Like","* kidnap*","OR",2,57,67,2730
0,"Like","* aggress*","OR",2,57,67,2731
0,"Like","* violen*","OR",2,57,67,2732
0,"Like","* anger*","OR",2,57,67,2733
0,"Like","* malic*","OR",2,57,67,2734
0,"Like","* hostil*","OR",2,57,67,2735
0,"Like","* dangerousness*","OR",2,57,67,2736
0,"Like","* cruel*","OR",2,57,67,2737
0,"Like","* delinquen*","OR",2,57,67,2738
0,"Like","* threaten*","OR",2,57,67,2739
0,"Like","* disorderly*","OR",2,57,67,2740
0,"Like","* affray*","OR",2,57,67,2741
0,"Like","* breach*","OR",2,57,67,2742
0,"Like","* felon*","OR",2,57,67,2743
0,"Like","* penal*","OR",2,57,67,2744
0,"Like","* penal*","OR",2,57,67,2745
0,"Like","* penol*","OR",2,57,67,2746
0,"Like","* crim*","OR",2,57,67,2747
0,"Like","* adinazolam*","OR",2,57,67,2748
0,"Like","* anthramycin*","OR",2,57,67,2749
0,"Like","* bentazepam*","OR",2,57,67,2750
0,"Like","* cinolazepam*","OR",2,57,67,2751
0,"Like","* clotiazepam*","OR",2,57,67,2752
0,"Like","* penol*","OR",2,57,67,2753
0,"Like","* benzodiazep*","OR",2,57,67,2754
0,"Like","* alprazolam*","OR",2,57,67,2755
0,"Like","* bromazepam*","OR",2,57,67,2756
0,"Like","* chlordiazepoxide*","OR",2,57,67,2757
0,"Like","* clobazam*","OR",2,57,67,2758
0,"Like","* clonazepam*","OR",2,57,67,2759
0,"Like","* clorazepate dipotassium*","OR",2,57,67,2760
0,"Like","* diazepam*","OR",2,57,67,2761
0,"Like","* flunitrazepam*","OR",2,57,67,2762
0,"Like","* flurazepam*","OR",2,57,67,2763
0,"Like","* loprazolam*","OR",2,57,67,2764
0,"Like","* lorazepam*","OR",2,57,67,2765
0,"Like","* lormetazepam*","OR",2,57,67,2766
0,"Like","* medazepam*","OR",2,57,67,2767
0,"Like","* midazolam*","OR",2,57,67,2768
0,"Like","* nitrazepam*","OR",2,57,67,2769
0,"Like","* oxazepam*","OR",2,57,67,2770
0,"Like","* temazepam*","OR",2,57,67,2771
0,"Like","* anthramycin*","OR",2,57,67,2772
0,"Like","* bentazepam*","OR",2,57,67,2773
0,"Like","* cinolazepam*","OR",2,57,67,2774
0,"Like","* clotiazepam*","OR",2,57,67,2775
0,"Like","* masturbat*","OR",2,27,68,2776
0,"Like","* exhibitionis*","OR",2,27,68,2777
0,"Like","* lewd*","OR",2,27,68,2778
0,"Like","* sadis*","OR",2,27,68,2779
0,"Like","* sadis*","OR",2,27,68,2780
0,"Like","* sadomasochis*","OR",2,27,68,2781
0,"Like","* abduct*","OR",2,27,68,2782
0,"Like","* kidnap*","OR",2,27,68,2783
0,"Like","* aggress*","OR",2,27,68,2784
0,"Like","* violen*","OR",2,27,68,2785
0,"Like","* anger*","OR",2,27,68,2786
0,"Like","* malic*","OR",2,27,68,2787
0,"Like","* hostil*","OR",2,27,68,2788
0,"Like","* dangerousness*","OR",2,27,68,2789
0,"Like","* cruel*","OR",2,27,68,2790
0,"Like","* delinquen*","OR",2,27,68,2791
0,"Like","* threaten*","OR",2,27,68,2792
0,"Like","* disorderly*","OR",2,27,68,2793
0,"Like","* affray*","OR",2,27,68,2794
0,"Like","* breach*","OR",2,27,68,2795
0,"Like","* unlawful*","OR",2,27,68,2796
0,"Like","* penol*","OR",2,27,68,2797
0,"Like","* crim*","OR",2,27,68,2798
0,"Like","* adinazolam*","OR",2,27,68,2799
0,"Like","* anthramycin*","OR",2,27,68,2800
0,"Like","* bentazepam*","OR",2,27,68,2801
0,"Like","* cinolazepam*","OR",2,27,68,2802
0,"Like","* clotiazepam*","OR",2,27,68,2803
0,"Like","* clorazepam clorazepate*","OR",2,27,68,2804
0,"Like","* cloxazolam*","OR",2,27,68,2805
0,"Like","* cyprazepam*","OR",2,27,68,2806
0,"Like","* doxefazepam*","OR",2,27,68,2807
0,"Like","* estazolam*","OR",2,27,68,2808
0,"Like","* etizolam*","OR",2,27,68,2809
0,"Like","* flutazoram*","OR",2,27,68,2810
0,"Like","* flutazoram*","OR",2,27,68,2811
0,"Like","* fosazepam*","OR",2,27,68,2812
0,"Like","* girisopam*","OR",2,27,68,2813
0,"Like","* halazepam*","OR",2,27,68,2814
0,"Like","* haloxazepam*","OR",2,27,68,2815
0,"Like","* ketazolam*","OR",2,27,68,2816
0,"Like","* meclonazepam*","OR",2,27,68,2817
0,"Like","* metaclazepam*","OR",2,27,68,2818
0,"Like","* mexazolam*","OR",2,27,68,2819
0,"Like","* midazepam*","OR",2,27,68,2820
0,"Like","* nerisopam*","OR",2,27,68,2821
0,"Like","* nordazepam*","OR",2,27,68,2822
0,"Like","* oxazolam*","OR",2,27,68,2823
0,"Like","* pinasepam*","OR",2,27,68,2824
0,"Like","* prazepam*","OR",2,27,68,2825
0,"Like","* tetrazepam*","OR",2,27,68,2826
0,"Like","* masturbat*","OR",2,36,68,2827
0,"Like","* exhibitionis*","OR",2,36,68,2828
0,"Like","* lewd*","OR",2,36,68,2829
0,"Like","* sadis*","OR",2,36,68,2830
0,"Like","* sadomasochis*","OR",2,36,68,2831
0,"Like","* abduct*","OR",2,36,68,2832
0,"Like","* kidnap*","OR",2,36,68,2833
0,"Like","* aggress*","OR",2,36,68,2834
0,"Like","* violen*","OR",2,36,68,2835
0,"Like","* anger*","OR",2,36,68,2836
0,"Like","* malic*","OR",2,36,68,2837
0,"Like","* hostil*","OR",2,36,68,2838
0,"Like","* dangerousness*","OR",2,36,68,2839
0,"Like","* cruel*","OR",2,36,68,2840
0,"Like","* threaten*","OR",2,36,68,2841
0,"Like","* disorderly*","OR",2,36,68,2842
0,"Like","* affray*","OR",2,36,68,2843
0,"Like","* felon*","OR",2,36,68,2844
0,"Like","* unlawful*","OR",2,36,68,2845
0,"Like","* penal*","OR",2,36,68,2846
0,"Like","* penol*","OR",2,36,68,2847
0,"Like","* crim*","OR",2,36,68,2848
0,"Like","* adinazolam*","OR",2,36,68,2849
0,"Like","* anthramycin*","OR",2,36,68,2850
0,"Like","* bentazepam*","OR",2,36,68,2851
0,"Like","* cinolazepam*","OR",2,36,68,2852
0,"Like","* clotiazepam*","OR",2,36,68,2853
0,"Like","* clorazepam clorazepate*","OR",2,36,68,2854
0,"Like","* cloxazolam*","OR",2,36,68,2855
0,"Like","* cyprazepam*","OR",2,36,68,2856
0,"Like","* doxefazepam*","OR",2,36,68,2857
0,"Like","* estazolam*","OR",2,36,68,2858
0,"Like","* etizolam*","OR",2,36,68,2859
0,"Like","* flutazoram*","OR",2,36,68,2860
0,"Like","* flutazoram*","OR",2,36,68,2861
0,"Like","* fosazepam*","OR",2,36,68,2862
0,"Like","* girisopam*","OR",2,36,68,2863
0,"Like","* halazepam*","OR",2,36,68,2864
0,"Like","* haloxazepam*","OR",2,36,68,2865
0,"Like","* ketazolam*","OR",2,36,68,2866
0,"Like","* meclonazepam*","OR",2,36,68,2867
0,"Like","* metaclazepam*","OR",2,36,68,2868
0,"Like","* mexazolam*","OR",2,36,68,2869
0,"Like","* midazepam*","OR",2,36,68,2870
0,"Like","* nerisopam*","OR",2,36,68,2871
0,"Like","* nordazepam*","OR",2,36,68,2872
0,"Like","* oxazolam*","OR",2,36,68,2873
0,"Like","* pinasepam*","OR",2,36,68,2874
0,"Like","* prazepam*","OR",2,36,68,2875
0,"Like","* tetrazepam*","OR",2,36,68,2876
0,"Like","* masturbat*","OR",2,57,68,2877
0,"Like","* exhibitionis*","OR",2,57,68,2878
0,"Like","* lewd*","OR",2,57,68,2879
0,"Like","* sadis*","OR",2,57,68,2880
0,"Like","* sadis*","OR",2,57,68,2881
0,"Like","* sadomasochis*","OR",2,57,68,2882
0,"Like","* abduct*","OR",2,57,68,2883
0,"Like","* kidnap*","OR",2,57,68,2884
0,"Like","* aggress*","OR",2,57,68,2885
0,"Like","* violen*","OR",2,57,68,2886
0,"Like","* anger*","OR",2,57,68,2887
0,"Like","* malic*","OR",2,57,68,2888
0,"Like","* hostil*","OR",2,57,68,2889
0,"Like","* dangerousness*","OR",2,57,68,2890
0,"Like","* cruel*","OR",2,57,68,2891
0,"Like","* delinquen*","OR",2,57,68,2892
0,"Like","* threaten*","OR",2,57,68,2893
0,"Like","* disorderly*","OR",2,57,68,2894
0,"Like","* affray*","OR",2,57,68,2895
0,"Like","* breach*","OR",2,57,68,2896
0,"Like","* felon*","OR",2,57,68,2897
0,"Like","* penal*","OR",2,57,68,2898
0,"Like","* penal*","OR",2,57,68,2899
0,"Like","* penol*","OR",2,57,68,2900
0,"Like","* crim*","OR",2,57,68,2901
0,"Like","* adinazolam*",,2,57,68,2902
0,"Like","* anthramycin*","OR",2,57,68,2903
0,"Like","* bentazepam*","OR",2,57,68,2904
0,"Like","* cinolazepam*","OR",2,57,68,2905
0,"Like","* clotiazepam*","OR",2,57,68,2906
0,"Like","* clorazepam clorazepate*","OR",2,57,68,2907
0,"Like","* cloxazolam*","OR",2,57,68,2908
0,"Like","* cyprazepam*","OR",2,57,68,2909
0,"Like","* doxefazepam*","OR",2,57,68,2910
0,"Like","* estazolam*","OR",2,57,68,2911
0,"Like","* etizolam*","OR",2,57,68,2912
0,"Like","* flutazoram*","OR",2,57,68,2913
0,"Like","* flutazoram*","OR",2,57,68,2914
0,"Like","* fosazepam*","OR",2,57,68,2915
0,"Like","* girisopam*","OR",2,57,68,2916
0,"Like","* halazepam*","OR",2,57,68,2917
0,"Like","* haloxazepam*","OR",2,57,68,2918
0,"Like","* ketazolam*","OR",2,57,68,2919
0,"Like","* meclonazepam*","OR",2,57,68,2920
0,"Like","* metaclazepam*","OR",2,57,68,2921
0,"Like","* mexazolam*","OR",2,57,68,2922
0,"Like","* midazepam*","OR",2,57,68,2923
0,"Like","* nerisopam*","OR",2,57,68,2924
0,"Like","* nordazepam*","OR",2,57,68,2925
0,"Like","* oxazolam*","OR",2,57,68,2926
0,"Like","* pinasepam*","OR",2,57,68,2927
0,"Like","* prazepam*","OR",2,57,68,2928
0,"Like","* tetrazepam*","OR",2,57,68,2929
0,"Like","child*","OR",1,24,70,2943
0,"Like","adolescent*",,1,24,70,2944
0,"Like","child*","OR",2,27,71,2945
0,"Like","child*","OR",2,57,71,2946
0,"Like","child*","OR",2,36,71,2947
0,"Like","*child*","OR",2,27,71,2948
0,"Like","*child*","OR",2,36,71,2949
0,"Like","*child*","OR",2,57,71,2950
0,"Like","adolescen*","OR",2,27,71,2951
0,"Like","adolescen*","OR",2,57,71,2952
0,"Like","adolescen*","OR",2,36,71,2953
0,"Like","*adolescen*","OR",2,27,71,2954
0,"Like","*adolescen*","OR",2,57,71,2955
0,"Like","*adolescen*","OR",2,36,71,2956
0,"Like","*naber d*",,2,29,74,2973
0,"Like","*pueperal*","OR",2,36,74,2975
0,"Like","*pueperal*","OR",2,27,74,2976
0,"Like","*pregnan*","OR",2,57,74,2977
0,"Like","*pregnan*","OR",2,27,74,2978
0,"Like","*pregnan*","OR",2,36,74,2979
0,"Like","*puerperal*","OR",2,27,74,2980
0,"Like","*puerperal*","OR",2,57,74,2981
0,"Like","*puerperal*","OR",2,36,74,2982
0,"Like","*post partum*","OR",2,57,74,2983
0,"Like","*post partum*","OR",2,27,74,2984
0,"Like","*post partum*","OR",2,36,74,2985
0,"Like","*hospit*","OR",2,27,74,2986
0,"Like","*hospit*","OR",2,36,74,2987
0,"Like","*hospit*","OR",2,57,74,2988
0,"Like","*inpatient*","OR",2,27,74,2989
0,"Like","*inpatient*","OR",2,57,74,2990
0,"Like","*inpatient*","OR",2,36,74,2991
0,"Like","*in-patient*","OR",2,27,74,2992
0,"Like","*in-patient*","OR",2,36,74,2993
0,"Like","*in-patient*",,2,57,74,2994
0,"Like","*clozapin*","OR",2,27,77,3037
0,"Like","* clozaril*","OR",2,27,77,3038
0,"Like","* leponex*","OR",2,27,77,3039
0,"Like","*aripiprazole*","OR",2,27,77,3040
0,"Like","*olanzapin*","OR",2,27,77,3041
0,"Like","*lanzac*","OR",2,27,77,3042
0,"Like","*zyprex*","OR",2,27,77,3043
0,"Like","*quetiapin*","OR",2,27,77,3044
0,"Like","*seroquel*","OR",2,27,77,3045
0,"Like","*risperidon*","OR",2,27,77,3046
0,"Like","*belivon*","OR",2,27,77,3047
0,"Like","*risperdal*","OR",2,27,77,3048
0,"Like","*risperin*","OR",2,27,77,3049
0,"Like","*rispolin*","OR",2,27,77,3050
0,"Like","*sertindol*","OR",2,27,77,3051
0,"Like","*serdolect*","OR",2,27,77,3052
0,"Like","*serlect*","OR",2,27,77,3053
0,"Like","*ziprasidon*","OR",2,27,77,3054
0,"Like","*zotepin*","OR",2,27,77,3055
0,"Like","*lodopin*","OR",2,27,77,3056
0,"Like","*nipolept*","OR",2,27,77,3057
0,"Like","*zopite*","OR",2,27,77,3058
0,"Like","*setous*","OR",2,27,77,3059
0,"Like","*majorpin*","OR",2,27,77,3060
0,"Like","*remoxiprid*","OR",2,27,77,3061
0,"Like","*roxiam*","OR",2,27,77,3062
0,"Like","*remidon*","OR",2,27,77,3063
0,"Like","*iloperidon*","OR",2,27,77,3064
0,"Like","*clozapin*","OR",2,36,77,3065
0,"Like","* clozaril*","OR",2,36,77,3066
0,"Like","* leponex*","OR",2,36,77,3067
0,"Like","*aripiprazole*","OR",2,36,77,3068
0,"Like","*olanzapin*","OR",2,36,77,3069
0,"Like","*lanzac*","OR",2,36,77,3070
0,"Like","*zyprex*","OR",2,36,77,3071
0,"Like","*quetiapin*","OR",2,36,77,3072
0,"Like","*seroquel*","OR",2,36,77,3073
0,"Like","*risperidon*","OR",2,36,77,3074
0,"Like","*belivon*","OR",2,36,77,3075
0,"Like","*risperdal*","OR",2,36,77,3076
0,"Like","*risperin*","OR",2,36,77,3077
0,"Like","*rispolin*","OR",2,36,77,3078
0,"Like","*sertindol*","OR",2,36,77,3079
0,"Like","*serdolect*","OR",2,36,77,3080
0,"Like","*serlect*","OR",2,36,77,3081
0,"Like","*ziprasidon*","OR",2,36,77,3082
0,"Like","*zotepin*","OR",2,36,77,3083
0,"Like","*lodopin*","OR",2,36,77,3084
0,"Like","*nipolept*","OR",2,36,77,3085
0,"Like","*zopite*","OR",2,36,77,3086
0,"Like","*setous*","OR",2,36,77,3087
0,"Like","*majorpin*","OR",2,36,77,3088
0,"Like","*remoxiprid*","OR",2,36,77,3089
0,"Like","*roxiam*","OR",2,36,77,3090
0,"Like","*remidon*","OR",2,36,77,3091
0,"Like","*iloperidon*","OR",2,36,77,3092
0,"Like","clozapine*",,2,45,77,3095
0,"Like","*clozapin*","OR",2,57,77,3096
0,"Like","* clozaril*","OR",2,57,77,3097
0,"Like","* leponex*",,2,57,77,3098
0,"Like","*aripiprazole*","OR",2,57,77,3099
0,"Like","*olanzapin*","OR",2,57,77,3100
0,"Like","*lanzac*","OR",2,57,77,3101
0,"Like","*zyprex*","OR",2,57,77,3102
0,"Like","*quetiapin*","OR",2,57,77,3103
0,"Like","*seroquel*","OR",2,57,77,3104
0,"Like","*risperidon*","OR",2,57,77,3105
0,"Like","*belivon*","OR",2,57,77,3106
0,"Like","*risperdal*","OR",2,57,77,3107
0,"Like","*risperin*","OR",2,57,77,3108
0,"Like","*rispolin*","OR",2,57,77,3109
0,"Like","*sertindol*","OR",2,57,77,3110
0,"Like","*serdolect*","OR",2,57,77,3111
0,"Like","*serlect*","OR",2,57,77,3112
0,"Like","*ziprasidon*","OR",2,57,77,3113
0,"Like","*zotepin*","OR",2,57,77,3114
0,"Like","*lodopin*","OR",2,57,77,3115
0,"Like","*nipolept*","OR",2,57,77,3116
0,"Like","*zopite*","OR",2,57,77,3117
0,"Like","*setous*","OR",2,57,77,3118
0,"Like","*majorpin*","OR",2,57,77,3119
0,"Like","*remoxiprid*","OR",2,57,77,3120
0,"Like","*roxiam*","OR",2,57,77,3121
0,"Like","*remidon*","OR",2,57,77,3122
0,"Like","*iloperidon*",,2,57,77,3123
0,"Like","behavio*","OR",2,27,82,3157
0,"Like","*behavio*","OR",2,27,82,3158
0,"Like","*behavio*","OR",2,36,82,3159
0,"Like","*behavio*","OR",2,57,82,3160
0,"Like","therap*","OR",2,27,82,3161
0,"Like","*therap*","OR",2,27,82,3162
0,"Like","*therap*","OR",2,36,82,3163
0,"Like","*therap*",,2,57,82,3164
0,"Like","technique*","OR",2,27,83,3165
0,"Like","*technique*","OR",2,27,83,3166
0,"Like","*technique*","OR",2,36,83,3167
0,"Like","*technique*","OR",2,57,83,3168
0,"Like","therap*","OR",2,27,83,3169
0,"Like","*therap*","OR",2,27,83,3170
0,"Like","*therap*","OR",2,57,83,3171
0,"Like","*restructur*","OR",2,27,83,3172
0,"Like","restructur*","OR",2,27,83,3173
0,"Like","*restructur*","OR",2,36,83,3174
0,"Like","*restructur*","OR",2,57,83,3175
0,"Like","challeng*","OR",2,27,83,3176
0,"Like","*challeng*","OR",2,27,83,3177
0,"Like","*challeng*","OR",2,36,83,3178
0,"Like","*challeng*",,2,57,83,3179
0,"Like","sertindole*","OR",2,27,90,3407
0,"Like","*sertindole*","OR",2,27,90,3408
0,"Like","*sertindole*","OR",2,36,90,3409
0,"Like","*sertindole*","OR",2,57,90,3410
0,"Like","serdolect*","OR",2,27,90,3411
0,"Like","*serdolect*","OR",2,27,90,3412
0,"Like","*serdolect*","OR",2,57,90,3413
0,"Like","*serdolect*","OR",2,36,90,3414
0,"Like","serlect*","OR",2,27,90,3415
0,"Like","*serlect*","OR",2,27,90,3416
0,"Like","*serlect*","OR",2,36,90,3417
0,"Like","*serlect*",,2,57,90,3418
0,"Like","sertindole*","AND",1,14,91,3419
1,"Like","Sertindole for schizophrenia*",,1,56,91,3420
0,"Like","cp-88059*","OR",2,27,92,3421
0,"Like","*cp-88059*","OR",2,27,92,3422
0,"Like","*cp-88059*","OR",2,36,92,3423
0,"Like","*cp-88059*","OR",2,57,92,3424
0,"Like","ziprasidone*","OR",2,27,92,3425
0,"Like","*ziprasidone*","OR",2,27,92,3426
0,"Like","*ziprasidone*","OR",2,36,92,3427
0,"Like","*ziprasidone*",,2,57,92,3428
0,"Like","ziprasidone*","AND",1,14,93,3429
1,"Like","Ziprasidone*",,1,56,93,3430
0,"Like","zuclopenthixol*","OR",2,27,94,3431
0,"Like","*zuclopenthixol*","OR",2,27,94,3432
0,"Like","*zuclopenthixol*","OR",2,57,94,3433
0,"Like","*zuclopenthixol*","OR",2,36,94,3434
0,"Like","ciatyl*","OR",2,27,94,3435
0,"Like","*ciatyl*","OR",2,27,94,3436
0,"Like","*ciatyl*","OR",2,57,94,3437
0,"Like","*ciatyl*","OR",2,36,94,3438
0,"Like","cisordinol*","OR",2,27,94,3439
0,"Like","*cisordinol*","OR",2,27,94,3440
0,"Like","*cisordinol*","OR",2,36,94,3441
0,"Like","*cisordinol*","OR",2,57,94,3442
0,"Like","*clopenthixol*","OR",2,27,94,3443
0,"Like","clopenthixol*","OR",2,27,94,3444
0,"Like","*clopenthixol*","OR",2,57,94,3445
0,"Like","*clopenthixol*","OR",2,36,94,3446
0,"Like","clopixol*","OR",2,27,94,3447
0,"Like","*clopixol*","OR",2,27,94,3448
0,"Like","*clopixol*","OR",2,57,94,3449
0,"Like","*clopixol*","OR",2,36,94,3450
0,"Like","sordinol*","OR",2,27,94,3451
0,"Like","*sordinol*","OR",2,27,94,3452
0,"Like","*sordinol*","OR",2,36,94,3453
0,"Like","*sordinol*",,2,57,94,3454
0,"Like","*transcranial magnetic stimulation*","OR",2,36,98,3495
0,"Like","*transcranial magnetic stimulation*","OR",2,57,98,3496
0,"Like","*transcranial magnetic stimulation*","OR",2,27,98,3497
0,"Like","transcranial magnetic stimulation*",,2,27,98,3498
0,"Like","*deep brain stimulation*","OR",2,27,99,3499
0,"Like","deep brain stimulation*","OR",2,27,99,3500
0,"Like","*deep brain stimulation*","OR",2,57,99,3501
0,"Like","*deep brain stimulation*",,2,36,99,3502
0,"Like","*vagus nerve*","OR",2,27,100,3503
0,"Like","vagus nerve*","OR",2,27,100,3504
0,"Like","*vagus nerve*","OR",2,57,100,3505
0,"Like","*vagus nerve*",,2,36,100,3506
0,"Like","*amisulprid*","OR",2,27,101,3507
0,"Like","*clozapin*","OR",2,27,101,3508
0,"Like","*olanzapin*","OR",2,27,101,3509
0,"Like","*quetiapin*","OR",2,27,101,3510
0,"Like","*remoxiprid*","OR",2,27,101,3511
0,"Like","*risperidon*","OR",2,27,101,3512
0,"Like","*sertindol*","OR",2,27,101,3513
0,"Like","*ziprasidon*","OR",2,27,101,3514
0,"Like","*zotepin*","OR",2,27,101,3515
0,"Like","*amisulpride*","OR",2,27,101,3516
0,"Like","*clozapin*","OR",2,27,101,3517
0,"Like","*olanzapin*","OR",2,27,101,3518
0,"Like","*quetiapin*","OR",2,27,101,3519
0,"Like","*remoxiprid*","OR",2,27,101,3520
0,"Like","*risperidon*","OR",2,27,101,3521
0,"Like","*sertindol*","OR",2,27,101,3522
0,"Like","*ziprasidon*","OR",2,27,101,3523
0,"Like","*zotepin*","OR",2,27,101,3524
0,"Like","*aripiprazole*","OR",2,27,101,3525
0,"Like","*aripiprazole*","OR",2,36,101,3526
0,"Like","*amisulprid*","OR",2,36,101,3527
0,"Like","*clozapin*","OR",2,36,101,3528
0,"Like","*olanzapin*","OR",2,36,101,3529
0,"Like","*quetiapin*","OR",2,36,101,3530
0,"Like","*remoxiprid*","OR",2,36,101,3531
0,"Like","*risperidon*","OR",2,36,101,3532
0,"Like","*sertindol*","OR",2,36,101,3533
0,"Like","*ziprasidon*","OR",2,36,101,3534
0,"Like","*zotepin*","OR",2,36,101,3535
0,"Like","*amisulpride*","OR",2,36,101,3536
0,"Like","*clozapin*","OR",2,36,101,3537
0,"Like","*olanzapin*","OR",2,36,101,3538
0,"Like","*remoxiprid*","OR",2,36,101,3539
0,"Like","*risperidon*","OR",2,36,101,3540
0,"Like","*sertindol*","OR",2,36,101,3541
0,"Like","*ziprasidon*","OR",2,36,101,3542
0,"Like","*zotepin*","OR",2,36,101,3543
0,"Like","*aripiprazole*",,2,57,101,3544
0,"Like","*amisulprid*","OR",2,57,101,3545
0,"Like","*clozapin*","OR",2,57,101,3546
0,"Like","*olanzapin*","OR",2,57,101,3547
0,"Like","*quetiapin*","OR",2,57,101,3548
0,"Like","*remoxiprid*","OR",2,57,101,3549
0,"Like","*risperidon*","OR",2,57,101,3550
0,"Like","*sertindol*","OR",2,57,101,3551
0,"Like","*ziprasidon*","OR",2,57,101,3552
0,"Like","*zotepin*","OR",2,57,101,3553
0,"Like","*amisulpride*","OR",2,57,101,3554
0,"Like","*clozapin*","OR",2,57,101,3555
0,"Like","*olanzapin*","OR",2,57,101,3556
0,"Like","*quetiapin*","OR",2,57,101,3557
0,"Like","*quetiapin*","OR",2,57,101,3558
0,"Like","*remoxiprid*","OR",2,57,101,3559
0,"Like","*risperidon*","OR",2,57,101,3560
0,"Like","*sertindol*","OR",2,57,101,3561
0,"Like","*ziprasidon*","OR",2,57,101,3562
0,"Like","*zotepin*","OR",2,57,101,3563
0,"Like","aripiprazole*","OR",1,14,106,3590
0,"Like","abilitat*","OR",1,14,106,3591
0,"Like","abilify*",,1,14,106,3592
0,"Like","estrogen*","OR",2,27,112,3615
0,"Like","*estrogen*","OR",2,27,112,3616
0,"Like","progesterone*","OR",2,27,112,3617
0,"Like","*progesterone*","OR",2,27,112,3618
0,"Like","ORT*","OR",2,27,112,3619
0,"Like","* ORT*","OR",2,27,112,3620
0,"Like","PORT*","OR",2,27,112,3621
0,"Like","* PORT*","OR",2,27,112,3622
0,"Like","ERT*","OR",2,27,112,3623
0,"Like","* ERT*","OR",2,27,112,3624
0,"Like","hormone*",,2,27,112,3625
0,"Like","*estrogen*","OR",2,36,112,3626
0,"Like","*progesterone*","OR",2,36,112,3627
0,"Like","* ORT*","OR",2,36,112,3628
0,"Like","* PORT*","OR",2,36,112,3629
0,"Like","* ERT*","OR",2,36,112,3630
0,"Like","*estrogen*","OR",2,57,112,3631
0,"Like","* ORT*","OR",2,57,112,3632
0,"Like","* PORT*","OR",2,57,112,3633
0,"Like","* ERT*","OR",2,57,112,3634
0,"Like","*estrogen*","OR",1,14,113,3635
0,"Like","hormone*","OR",1,14,113,3636
0,"Like","*progesterone*",,1,14,113,3637
0,"Like","*thought-stop*","OR",2,27,114,3638
0,"Like","thought-stop*","OR",2,27,114,3639
0,"Like","*coping*","OR",2,27,114,3640
0,"Like","coping*","OR",2,27,114,3641
0,"Like","*self monitoring*","OR",2,27,114,3642
0,"Like","self monitoring*","OR",2,27,114,3643
0,"Like","reading*","OR",2,27,114,3644
0,"Like","* reading*","OR",2,27,114,3645
0,"Like","earplug*","OR",2,27,114,3646
0,"Like","*earplug*","OR",2,27,114,3647
0,"Like","*stereo*","OR",2,27,114,3648
0,"Like","stereo*","OR",2,27,114,3649
0,"Like","distract*","OR",2,27,114,3650
0,"Like","*distract*","OR",2,27,114,3651
0,"Like","*thought-block*","OR",2,27,114,3652
0,"Like","thought-block*","OR",2,27,114,3653
0,"Like","*thought block*","OR",2,27,114,3654
0,"Like","*thought block*","OR",2,27,114,3655
0,"Like","*thought stop*","OR",2,27,114,3656
0,"Like","*thought stop*","OR",2,27,114,3657
0,"Like","*distract*","OR",2,36,114,3658
0,"Like","*thought-stop*","OR",2,36,114,3659
0,"Like","*coping*","OR",2,36,114,3660
0,"Like","*self monitoring*","OR",2,36,114,3661
0,"Like","* reading*","OR",2,36,114,3662
0,"Like","*earplug*","OR",2,36,114,3663
0,"Like","*stereo*","OR",2,36,114,3664
0,"Like","*thought-block*","OR",2,36,114,3665
0,"Like","*thought block*","OR",2,36,114,3666
0,"Like","*thought stop*","OR",2,36,114,3667
0,"Like","*thought-stop*","OR",2,57,114,3668
0,"Like","*coping*","OR",2,57,114,3669
0,"Like","*self monitoring*","OR",2,57,114,3670
0,"Like","*earplug*","OR",2,57,114,3671
0,"Like","*stereo*","OR",2,57,114,3672
0,"Like","*distract*","OR",2,57,114,3673
0,"Like","*thought-block*","OR",2,57,114,3674
0,"Like","*thought block*","OR",2,57,114,3675
0,"Like","*thought stop*",,2,57,114,3676
0,"Like","*hal*","AND",2,27,116,3679
0,"Like","*dec*",,2,27,116,3680
0,"Like","DEPOT*","OR",2,27,117,3681
0,"Like","*DEPOT*","OR",2,27,117,3682
0,"Like","*DEPOT*","OR",2,36,117,3683
0,"Like","*DEPOT*",,2,57,117,3684
0,"Like","*LONG*","AND",2,27,118,3685
0,"Like","*ACTING*",,2,27,118,3686
0,"Like","*LONG*","AND",2,57,119,3687
0,"Like","*ACTING*",,2,57,119,3688
0,"Like","*LONG*","AND",2,36,120,3689
0,"Like","*ACTING*",,2,36,120,3690
0,"Like","*DELAY*","AND",2,27,121,3691
0,"Like","*ACTION*",,2,27,121,3692
0,"Like","*DELAY*","AND",2,36,122,3693
0,"Like","*ACTION*",,2,36,122,3694
0,"Like","*DELAY*","AND",2,57,123,3695
0,"Like","*ACTION*",,2,57,123,3696
0,"Like","Targeted Medication*","OR",1,14,133,4084
0,"Like","Treatment Frequency*","OR",1,14,133,4085
0,"Like","Withdrawal*","OR",1,14,133,4086
0,"Like","Dosage of Drug*",,1,14,133,4087
0,"Like","Learning Disorders*",,1,15,149,4471
0,"Like","Down Syndrome*","OR",1,15,149,4472
0,"Like","*amisulprid*","OR",2,27,150,4473
0,"Like","*clozapin*","OR",2,27,150,4474
0,"Like","*olanzapin*","OR",2,27,150,4475
0,"Like","*quetiapin*","OR",2,27,150,4476
0,"Like","*remoxiprid*","OR",2,27,150,4477
0,"Like","*risperidon*","OR",2,27,150,4478
0,"Like","*sertindol*","OR",2,27,150,4479
0,"Like","*ziprasidon*","OR",2,27,150,4480
0,"Like","*zotepin*","OR",2,27,150,4481
0,"Like","*amisulpride*","OR",2,27,150,4482
0,"Like","*clozapin*","OR",2,27,150,4483
0,"Like","*olanzapin*","OR",2,27,150,4484
0,"Like","*quetiapin*","OR",2,27,150,4485
0,"Like","*remoxiprid*","OR",2,27,150,4486
0,"Like","*risperidon*","OR",2,27,150,4487
0,"Like","*sertindol*","OR",2,27,150,4488
0,"Like","*ziprasidon*","OR",2,27,150,4489
0,"Like","*zotepin*","OR",2,27,150,4490
0,"Like","aripiprazole*","OR",2,27,150,4491
0,"Like","*aripiprazole*","OR",2,27,150,4492
0,"Like","*amisulprid*","OR",2,36,150,4493
0,"Like","*clozapin*","OR",2,36,150,4494
0,"Like","*olanzapin*","OR",2,36,150,4495
0,"Like","*quetiapin*","OR",2,36,150,4496
0,"Like","*remoxiprid*","OR",2,36,150,4497
0,"Like","*risperidon*","OR",2,36,150,4498
0,"Like","*sertindol*","OR",2,36,150,4499
0,"Like","*ziprasidon*","OR",2,36,150,4500
0,"Like","*zotepin*","OR",2,36,150,4501
0,"Like","*amisulpride*","OR",2,36,150,4502
0,"Like","*clozapin*","OR",2,36,150,4503
0,"Like","*olanzapin*","OR",2,36,150,4504
0,"Like","*remoxiprid*","OR",2,36,150,4505
0,"Like","*risperidon*","OR",2,36,150,4506
0,"Like","*sertindol*","OR",2,36,150,4507
0,"Like","*ziprasidon*","OR",2,36,150,4508
0,"Like","*zotepin*","OR",2,36,150,4509
0,"Like","*aripiprazole*","OR",2,36,150,4510
0,"Like","*amisulprid*","OR",2,57,150,4511
0,"Like","*clozapin*","OR",2,57,150,4512
0,"Like","*olanzapin*","OR",2,57,150,4513
0,"Like","*quetiapin*","OR",2,57,150,4514
0,"Like","*remoxiprid*","OR",2,57,150,4515
0,"Like","*risperidon*","OR",2,57,150,4516
0,"Like","*sertindol*","OR",2,57,150,4517
0,"Like","*ziprasidon*","OR",2,57,150,4518
0,"Like","*zotepin*","OR",2,57,150,4519
0,"Like","*amisulpride*","OR",2,57,150,4520
0,"Like","*clozapin*","OR",2,57,150,4521
0,"Like","*olanzapin*","OR",2,57,150,4522
0,"Like","*quetiapin*","OR",2,57,150,4523
0,"Like","*quetiapin*","OR",2,57,150,4524
0,"Like","*remoxiprid*","OR",2,57,150,4525
0,"Like","*risperidon*","OR",2,57,150,4526
0,"Like","*sertindol*","OR",2,57,150,4527
0,"Like","*ziprasidon*","OR",2,57,150,4528
0,"Like","*zotepin*","OR",2,57,150,4529
0,"Like","*aripiprazole*",,2,57,150,4530
0,"Like","elderly*","OR",2,27,151,4531
0,"Like","* elderly*","OR",2,27,151,4532
0,"Like","* elderly*","OR",2,36,151,4533
0,"Like","* elderly*","OR",2,57,151,4534
0,"Like","old*","OR",2,27,151,4535
0,"Like","* old*","OR",2,27,151,4536
0,"Like","* old*","OR",2,36,151,4537
0,"Like","* old*","OR",2,57,151,4538
0,"Like","paraphrenia*","OR",2,27,151,4539
0,"Like","*paraphrenia*","OR",2,27,151,4540
0,"Like","*paraphrenia*","OR",2,57,151,4541
0,"Like","*paraphrenia*","OR",2,36,151,4542
0,"Like","*late onset*","OR",2,27,151,4543
0,"Like","late onset*","OR",2,27,151,4544
0,"Like","*late onset*","OR",2,57,151,4545
0,"Like","*late onset*","OR",2,36,151,4546
0,"Like","aged*",,2,57,151,4547
0,"Like","calcium*","OR",2,27,152,4548
0,"Like","*calcium*","OR",2,27,152,4549
0,"Like","diltiazem*","OR",2,27,152,4550
0,"Like","*diltiazem*","OR",2,27,152,4551
0,"Like","nifedipine*","OR",2,27,152,4552
0,"Like","*nifedipine*","OR",2,27,152,4553
0,"Like","nimodipine*","OR",2,27,152,4554
0,"Like","*nimodipine*","OR",2,27,152,4555
0,"Like","verapamil*","OR",2,27,152,4556
0,"Like","*verapamil*","OR",2,27,152,4557
0,"Like","*calcium*","OR",2,36,152,4558
0,"Like","*diltiazem*","OR",2,36,152,4559
0,"Like","*nifedipine*","OR",2,36,152,4560
0,"Like","*nimodipine*","OR",2,36,152,4561
0,"Like","*verapamil*","OR",2,36,152,4562
0,"Like","*calcium*","OR",2,57,152,4563
0,"Like","*diltiazem*","OR",2,57,152,4564
0,"Like","*nifedipine*","OR",2,57,152,4565
0,"Like","*nimodipine*","OR",2,57,152,4566
0,"Like","*verapamil*",,2,57,152,4567
0,"Like","droperidol*","OR",1,14,155,4602
0,"Like","*4749*","OR",1,14,155,4603
0,"Like","Dehydrobenzperidol*","OR",1,14,155,4604
0,"Like","Dridol*","OR",1,14,155,4605
0,"Like","Droleptan*","OR",1,14,155,4606
0,"Like","Inapsin*","OR",1,14,155,4607
0,"Like","Leptanal*","OR",1,14,155,4608
0,"Like","Leptofen*","OR",1,14,155,4609
0,"Like","Paxical*","OR",1,14,155,4610
0,"Like","Sintodian*","OR",1,14,155,4611
0,"Like","Thalamonal*",,1,14,155,4612
0,"Like","coping*","OR",2,27,159,4696
0,"Like","*coping*","OR",2,27,159,4697
0,"Like","*coping*",,2,36,159,4698
0,"Like","*coping*","OR",2,57,159,4699
0,"Like","AKATHISI*","OR",2,27,163,4728
0,"Like","*AKATHISI*","OR",2,27,163,4729
0,"Like","ACATHISI*","OR",2,27,163,4730
0,"Like","*ACATHISI*","OR",2,27,163,4731
0,"Like","*AKATHISI*","OR",2,36,163,4732
0,"Like","*ACATHISI*","OR",2,36,163,4733
0,"Like","*AKATHISI*","OR",2,57,163,4734
0,"Like","*ACATHISI*",,2,57,163,4735
0,"Like","valproat*","OR",2,27,164,4736
0,"Like","*valproat*","OR",2,27,164,4737
0,"Like","valproic acid*","OR",2,27,164,4738
0,"Like","*valproic acid*","OR",2,27,164,4739
0,"Like","sodium dipropylacetate*","OR",2,27,164,4740
0,"Like","*sodium dipropylacetate*","OR",2,27,164,4741
0,"Like","convulex*","OR",2,27,164,4742
0,"Like","*convulex*","OR",2,27,164,4743
0,"Like","depakene*","OR",2,27,164,4744
0,"Like","*depakene*","OR",2,27,164,4745
0,"Like","ergenyl*","OR",2,27,164,4746
0,"Like","*ergenyl*","OR",2,27,164,4747
0,"Like","*valproat*","OR",2,36,164,4748
0,"Like","*valproic acid*","OR",2,36,164,4749
0,"Like","*sodium dipropylacetate*","OR",2,36,164,4750
0,"Like","*convulex*","OR",2,36,164,4751
0,"Like","*depakene*","OR",2,36,164,4752
0,"Like","*ergenyl*",,2,36,164,4753
0,"Like","*valproat*","OR",2,57,164,4754
0,"Like","*valproic acid*","OR",2,57,164,4755
0,"Like","*sodium dipropylacetate*","OR",2,57,164,4756
0,"Like","*convulex*","OR",2,57,164,4757
0,"Like","*depakene*","OR",2,57,164,4758
0,"Like","community*","OR",2,27,167,4771
0,"Like","*community*","OR",2,27,167,4772
0,"Like","*community*","OR",2,36,167,4773
0,"Like","*community*","OR",2,57,167,4774
0,"Like","living*","OR",2,27,167,4775
0,"Like","*living*","OR",2,27,167,4776
0,"Like","*living*","OR",2,36,167,4777
0,"Like","*living*","OR",2,57,167,4778
0,"Like","self-care*","OR",2,27,167,4779
0,"Like","*self-care*","OR",2,27,167,4780
0,"Like","*self-care*","OR",2,36,167,4781
0,"Like","*self-care*","OR",2,57,167,4782
0,"Like","social*","OR",2,27,167,4783
0,"Like","*social*","OR",2,27,167,4784
0,"Like","*social*","OR",2,36,167,4785
0,"Like","*social*","OR",2,57,167,4786
0,"Like","life*","OR",2,27,167,4787
0,"Like","*life*","OR",2,27,167,4788
0,"Like","*life*","OR",2,36,167,4789
0,"Like","*life*",,2,57,167,4790
0,"Like","* herb*","OR",2,27,169,4815
0,"Like","* Chinese*","OR",2,27,169,4816
0,"Like","* plant*","OR",2,27,169,4817
0,"Like","* complementary*","OR",2,27,169,4818
0,"Like","* alternative*","OR",2,27,169,4819
0,"Like","* yin*","OR",2,27,169,4820
0,"Like","* yang*","OR",2,27,169,4821
0,"Like","* traditional*","OR",2,27,169,4822
0,"Like","* oriental*","OR",2,27,169,4823
0,"Like","* herb*","OR",2,27,169,4824
0,"Like","* Chinese*","OR",2,27,169,4825
0,"Like","*plant*","OR",2,27,169,4826
0,"Like","*complementary*","OR",2,27,169,4827
0,"Like","*alternative*","OR",2,27,169,4828
0,"Like","*yin-yang*","OR",2,27,169,4829
0,"Like","*yang*","OR",2,27,169,4830
0,"Like","*ying*","OR",2,27,169,4831
0,"Like","*traditional*","OR",2,27,169,4832
0,"Like","*oriental*","OR",2,27,169,4833
0,"Like","TCM*","OR",2,27,169,4834
0,"Like","* TCM*","OR",2,27,169,4835
0,"Like","TCD*","OR",2,27,169,4836
0,"Like","* TCD*","OR",2,27,169,4837
0,"Like","*herb*","OR",2,28,169,4838
0,"Like","*Chinese*","OR",2,28,169,4839
0,"Like","*plant*","OR",2,28,169,4840
0,"Like","*complementary*","OR",2,28,169,4841
0,"Like","*alternative*","OR",2,28,169,4842
0,"Like","*yin-yang*","OR",2,28,169,4843
0,"Like","*yang*","OR",2,28,169,4844
0,"Like","*ying*","OR",2,28,169,4845
0,"Like","*traditional*","OR",2,28,169,4846
0,"Like","*oriental*","OR",2,28,169,4847
0,"Like","*herb*","OR",2,28,169,4848
0,"Like","*Chinese*","OR",2,28,169,4849
0,"Like","*plant*","OR",2,28,169,4850
0,"Like","*complementary*","OR",2,28,169,4851
0,"Like","*alternative*","OR",2,28,169,4852
0,"Like","*yin-yang*","OR",2,28,169,4853
0,"Like","*yang*","OR",2,28,169,4854
0,"Like","*ying*","OR",2,28,169,4855
0,"Like","*traditional*","OR",2,28,169,4856
0,"Like","*oriental*","OR",2,28,169,4857
0,"Like","*traditional*","OR",2,36,169,4858
0,"Like","*oriental*","OR",2,36,169,4859
0,"Like","*herb*","OR",2,36,169,4860
0,"Like","*Chinese*","OR",2,36,169,4861
0,"Like","*plant*","OR",2,36,169,4862
0,"Like","*complementary*","OR",2,36,169,4863
0,"Like","*alternative*","OR",2,36,169,4864
0,"Like","*yin-yang*","OR",2,36,169,4865
0,"Like","*yang*","OR",2,36,169,4866
0,"Like","*ying*","OR",2,36,169,4867
0,"Like","*traditional*","OR",2,36,169,4868
0,"Like","*oriental*","OR",2,36,169,4869
0,"Like","*herb*","OR",2,36,169,4870
0,"Like","*Chinese*","OR",2,36,169,4871
0,"Like","*plant*","OR",2,36,169,4872
0,"Like","*complementary*","OR",2,36,169,4873
0,"Like","*alternative*","OR",2,36,169,4874
0,"Like","*yin-yang*","OR",2,36,169,4875
0,"Like","*yang*","OR",2,36,169,4876
0,"Like","*ying*","OR",2,36,169,4877
0,"Like","* TCM*","OR",2,36,169,4878
0,"Like","* TCD*","OR",2,36,169,4879
0,"Like","*herb*","OR",2,57,169,4880
0,"Like","*Chinese*","OR",2,57,169,4881
0,"Like","*plant*","OR",2,57,169,4882
0,"Like","*complementary*","OR",2,57,169,4883
0,"Like","*alternative*","OR",2,57,169,4884
0,"Like","*yin-yang*","OR",2,57,169,4885
0,"Like","*yang*","OR",2,57,169,4886
0,"Like","*traditional*","OR",2,57,169,4887
0,"Like","*oriental*","OR",2,57,169,4888
0,"Like","* TCM*","OR",2,57,169,4889
0,"Like","* TCD*",,2,57,169,4890
0,"Like","*herb*","OR",2,57,169,4891
0,"Like","*Chinese*","OR",2,57,169,4892
0,"Like","*plant*","OR",2,57,169,4893
0,"Like","*complementary*","OR",2,57,169,4894
0,"Like","*alternative*","OR",2,57,169,4895
0,"Like","*yin-yang*","OR",2,57,169,4896
0,"Like","*yang*","OR",2,57,169,4897
0,"Like","*ying*","OR",2,57,169,4898
0,"Like","*traditional*","OR",2,57,169,4899
0,"Like","*oriental*","OR",2,57,169,4900
0,"Like","herb*","OR",1,14,170,4901
0,"Like","Chinese*","OR",1,14,170,4902
0,"Like","plant*","OR",1,14,170,4903
0,"Like","complementary*","OR",1,14,170,4904
0,"Like","alternative*","OR",1,14,170,4905
0,"Like","yang*","OR",1,14,170,4906
0,"Like","yin*","OR",1,14,170,4907
0,"Like","traditional*","OR",1,14,170,4908
0,"Like","oriental*",,1,14,170,4909
0,"Like","*complian*","OR",2,27,184,5225
0,"Like","*educat*","OR",2,27,184,5226
0,"Like","*concord*","OR",2,27,184,5227
0,"Like","*adhere*","OR",2,27,184,5228
0,"Like","*psychoed*","OR",2,27,184,5229
0,"Like","*non-com*","OR",2,27,184,5230
0,"Like","*refus*","OR",2,27,184,5231
0,"Like","*complian*","OR",2,36,184,5232
0,"Like","*educat*","OR",2,36,184,5233
0,"Like","*concord*","OR",2,36,184,5234
0,"Like","*adhere*","OR",2,36,184,5235
0,"Like","*psychoed*","OR",2,36,184,5236
0,"Like","*non-com*","OR",2,36,184,5237
0,"Like","*refus*","OR",2,36,184,5238
0,"Like","*complian*","OR",2,57,184,5239
0,"Like","*educat*","OR",2,57,184,5240
0,"Like","*concord*","OR",2,57,184,5241
0,"Like","*adhere*","OR",2,57,184,5242
0,"Like","*psychoed*","OR",2,57,184,5243
0,"Like","*non-com*","OR",2,57,184,5244
0,"Like","*refus*",,2,57,184,5245
0,"Like","zuclopenthixol*","OR",2,27,185,5246
0,"Like","*zuclopenthixol*","OR",2,27,185,5247
0,"Like","ciatyl*","OR",2,27,185,5248
0,"Like","*ciatyl*","OR",2,27,185,5249
0,"Like","cisordinol*","OR",2,27,185,5250
0,"Like","*cisordinol*","OR",2,27,185,5251
0,"Like","*clopenthixol*","OR",2,27,185,5252
0,"Like","clopenthixol*","OR",2,27,185,5253
0,"Like","clopixol*","OR",2,27,185,5254
0,"Like","*clopixol*","OR",2,27,185,5255
0,"Like","sordinol*","OR",2,27,185,5256
0,"Like","*sordinol*","OR",2,27,185,5257
0,"Like","*zuclopenthixol*","OR",2,36,185,5258
0,"Like","*ciatyl*","OR",2,36,185,5259
0,"Like","*cisordinol*","OR",2,36,185,5260
0,"Like","*clopenthixol*","OR",2,36,185,5261
0,"Like","*clopixol*","OR",2,36,185,5262
0,"Like","*sordinol*","OR",2,36,185,5263
0,"Like","*zuclopenthixol*","OR",2,57,185,5264
0,"Like","*ciatyl*","OR",2,57,185,5265
0,"Like","*cisordinol*","OR",2,57,185,5266
0,"Like","*clopenthixol*","OR",2,57,185,5267
0,"Like","*clopixol*","OR",2,57,185,5268
0,"Like","*sordinol*",,2,57,185,5269
0,"Like","*substanc*","OR",2,27,191,5378
0,"Like","*POLYDRUG*","OR",2,27,191,5379
0,"Like","*alcoh*","OR",2,27,191,5380
0,"Like","*tranquiliz*","OR",2,27,191,5381
0,"Like","*narcot*","OR",2,27,191,5382
0,"Like","* abus*","OR",2,27,191,5383
0,"Like","*POLYDRUG*","OR",2,36,191,5384
0,"Like","*substance abus*","OR",2,36,191,5385
0,"Like","*alcoh*","OR",2,36,191,5386
0,"Like","*tranquiliz*","OR",2,36,191,5387
0,"Like","*narcot*","OR",2,36,191,5388
0,"Like","*POLYDRUG*","OR",2,57,191,5389
0,"Like","*substanc*","OR",2,57,191,5390
0,"Like","*alcoh*","OR",2,57,191,5391
0,"Like","*tranquiliz*","OR",2,57,191,5392
0,"Like","*narcot*","OR",2,57,191,5393
0,"Like","* abus*","OR",2,57,191,5394
0,"Like","*opiat*","OR",2,27,192,5395
0,"Like","*street drug*","OR",2,27,192,5396
0,"Like","*solvent*","OR",2,27,192,5397
0,"Like","*inhalan*","OR",2,27,192,5398
0,"Like","*intoxi*","OR",2,27,192,5399
0,"Like","*opiat*","OR",2,36,192,5400
0,"Like","*street drug*","OR",2,36,192,5401
0,"Like","*solvent*","OR",2,36,192,5402
0,"Like","*inhalan*","OR",2,36,192,5403
0,"Like","*intoxi*","OR",2,36,192,5404
0,"Like","*opiat*","OR",2,57,192,5405
0,"Like","*street drug*","OR",2,57,192,5406
0,"Like","*solvent*","OR",2,57,192,5407
0,"Like","*inhalan*","OR",2,57,192,5408
0,"Like","*intoxi*","OR",2,57,192,5409
0,"Like","substance*","OR",1,15,193,5410
0,"Like","drug abuse*","OR",1,15,193,5411
0,"Like","*alcohol*",,1,15,193,5412
0,"Like","*resid*","OR",2,27,195,5428
0,"Like","*communit*","OR",2,27,195,5429
0,"Like","*support*","OR",2,27,195,5430
0,"Like","*rehab*","OR",2,27,195,5431
0,"Like","*hosp*","OR",2,27,195,5432
0,"Like","*resid*","OR",2,36,195,5433
0,"Like","*communit*","OR",2,36,195,5434
0,"Like","*support*","OR",2,36,195,5435
0,"Like","*rehab*","OR",2,36,195,5436
0,"Like","*resid*","OR",2,57,195,5437
0,"Like","*communit*","OR",2,57,195,5438
0,"Like","*support*","OR",2,57,195,5439
0,"Like","*rehab*","OR",2,57,195,5440
0,"Like","*hosp*",,2,57,195,5441
0,"Like","*resid*","OR",1,14,196,5442
0,"Like","*communit*","OR",1,14,196,5443
0,"Like","*support*","OR",1,14,196,5444
0,"Like","*rehab*","OR",1,14,196,5445
0,"Like","*hosp*",,1,14,196,5446
0,"Like","*depot*","OR",2,27,197,5447
0,"Like","*long-act*","OR",2,27,197,5448
0,"Like","*delayed-act*","OR",2,27,197,5449
0,"Like","*depot*","OR",2,36,197,5450
0,"Like","*long-act*","OR",2,36,197,5451
0,"Like","*delayed-act*","OR",2,36,197,5452
0,"Like","*depot*","OR",2,57,197,5453
0,"Like","*long-act*","OR",2,57,197,5454
0,"Like","*delayed-act*",,2,57,197,5455
0,"Like","*perphenazine decan*","OR",2,27,198,5456
0,"Like","*perphenazine enant*","OR",2,27,198,5457
0,"Like","*trilafon*","OR",2,27,198,5458
0,"Like","*peratsin*","OR",2,27,198,5459
0,"Like","*decentan-dep*","OR",2,27,198,5460
0,"Like","*perphenazine decan*","OR",2,36,198,5461
0,"Like","*perphenazine enant*","OR",2,36,198,5462
0,"Like","*trilafon*","OR",2,36,198,5463
0,"Like","*peratsin*","OR",2,36,198,5464
0,"Like","*decentan-dep*","OR",2,36,198,5465
0,"Like","*perphenazine decan*","OR",2,57,198,5466
0,"Like","*perphenazine enant*","OR",2,57,198,5467
0,"Like","*trilafon*","OR",2,57,198,5468
0,"Like","*peratsin*","OR",2,57,198,5469
0,"Like","*decentan-dep*",,2,57,198,5470
0,"Like","*perphenazine*","OR",2,27,199,5471
0,"Like","*perphenazine*","OR",2,36,199,5472
0,"Like","*perphenazine*",,2,57,199,5473
0,"Like","*perphenazine*","AND",1,14,200,5474
0,"Like","*depot*",,1,14,200,5475
0,"Like","*clotiapin*","OR",2,27,204,5485
0,"Like","*clothiapin*","OR",2,27,204,5486
0,"Like","*etumin*","OR",2,27,204,5487
0,"Like","*etomin*","OR",2,27,204,5488
0,"Like","*2159*","OR",2,27,204,5489
0,"Like","clotiapin*","OR",2,27,204,5490
0,"Like","clothiapin*","OR",2,27,204,5491
0,"Like","etumin*","OR",2,27,204,5492
0,"Like","etomin*",,2,27,204,5493
0,"Like","*clotiapin*","OR",2,36,204,5494
0,"Like","*clothiapin*","OR",2,36,204,5495
0,"Like","*etumin*","OR",2,36,204,5496
0,"Like","*etomin*","OR",2,36,204,5497
0,"Like","*2159*","OR",2,36,204,5498
0,"Like","*clotiapin*","OR",2,57,204,5499
0,"Like","*clothiapin*","OR",2,57,204,5500
0,"Like","*etumin*","OR",2,57,204,5501
0,"Like","*etomin*","OR",2,57,204,5502
0,"Like","*2159*","OR",2,57,204,5503
0,"Like","clot*","OR",1,14,205,5504
0,"Like","*smoking*","OR",2,27,206,5505
0,"Like","*nicotiana*","OR",2,27,206,5506
0,"Like","*nicotin*","OR",2,27,206,5507
0,"Like","*smoking*","OR",2,36,206,5508
0,"Like","*nicotiana*","OR",2,36,206,5509
0,"Like","*nicotin*","OR",2,36,206,5510
0,"Like","*nicotin*","OR",2,57,206,5511
0,"Like","*smoking*","OR",2,57,206,5512
0,"Like","*nicotiana*",,2,57,206,5513
0,"Like","nicotine*","OR",1,14,207,5514
0,"Like","smoking*",,1,14,207,5515
0,"Like","*acup*","OR",2,27,208,5516
0,"Like","*moxibustion*","OR",2,27,208,5517
0,"Like","*acup*","OR",2,36,208,5518
0,"Like","*moxibustion*","OR",2,36,208,5519
0,"Like","*acup*","OR",2,57,208,5520
0,"Like","*moxibustion*",,2,57,208,5521
0,"Like","*acupuncture*","OR",1,14,209,5522
0,"Like","moxibustion*",,1,14,209,5523
0,"Like","*canna*","OR",1,14,210,5524
0,"Like","*marijuana*","OR",1,14,210,5525
0,"Like","*marihuana*",,1,14,210,5526
0,"Like","adol*","OR",1,24,217,5630
0,"Like","child*",,1,24,217,5631
0,"Like","*vocatio*","OR",2,27,219,5656
0,"Like","*employ*","OR",2,27,219,5657
0,"Like","*occupat*","OR",2,27,219,5658
0,"Like","*work reh*","OR",2,27,219,5659
0,"Like","*job*","OR",2,27,219,5660
0,"Like","*clubhouse*","OR",2,27,219,5661
0,"Like","*sheltered work*","OR",2,27,219,5662
0,"Like","*work therap*","OR",2,27,219,5663
0,"Like","*garden*","OR",2,27,219,5664
0,"Like","*vocatio*","OR",2,36,219,5665
0,"Like","*employ*","OR",2,36,219,5666
0,"Like","*occupat*","OR",2,36,219,5667
0,"Like","*work reh*","OR",2,36,219,5668
0,"Like","*job*","OR",2,36,219,5669
0,"Like","*clubhouse*","OR",2,36,219,5670
0,"Like","*sheltered work*","OR",2,36,219,5671
0,"Like","*work therap*","OR",2,36,219,5672
0,"Like","*garden*",,2,36,219,5673
0,"Like","*vocatio*","OR",2,57,219,5674
0,"Like","*employ*","OR",2,57,219,5675
0,"Like","*occupat*","OR",2,57,219,5676
0,"Like","*work reh*","OR",2,57,219,5677
0,"Like","*job*","OR",2,57,219,5678
0,"Like","*clubhouse*","OR",2,57,219,5679
0,"Like","*sheltered work*","OR",2,57,219,5680
0,"Like","*work therap*","OR",2,57,219,5681
0,"Like","*garden*","OR",2,57,219,5682
0,"Like","*vocat*","OR",1,14,222,5696
0,"Like","work*","OR",1,14,222,5697
0,"Like","employm*","OR",1,14,222,5698
0,"Like","job*","OR",1,14,222,5699
0,"Like","*occupat*","OR",1,14,222,5700
0,"Like","supportive t*","OR",1,14,222,5701
0,"Like","* placem*","OR",1,14,222,5702
0,"Like","*rehab*","OR",1,14,222,5703
0,"Like","*Microsph*","OR",2,27,224,5719
0,"Like","*long-act*","OR",2,27,224,5720
0,"Like","*depot*","OR",2,27,224,5721
0,"Like","*consta*","OR",2,27,224,5722
0,"Like","*long act*","OR",2,27,224,5723
0,"Like","*Microsph*","OR",2,36,224,5724
0,"Like","*long-act*","OR",2,36,224,5725
0,"Like","*depot*","OR",2,36,224,5726
0,"Like","*consta*","OR",2,36,224,5727
0,"Like","*long act*","OR",2,36,224,5728
0,"Like","*Microsph*","OR",2,57,224,5729
0,"Like","*long-act*","OR",2,57,224,5730
0,"Like","*depot*","OR",2,57,224,5731
0,"Like","*consta*","OR",2,57,224,5732
0,"Like","*long act*",,2,57,224,5733
0,"Like","depot*","AND",1,14,225,5734
0,"Like","risp*",,1,14,225,5735
0,"Like","*adjunctive*","OR",2,27,227,5754
0,"Like","*concurrent*","OR",2,27,227,5755
0,"Like","*concomitant*","OR",2,27,227,5756
0,"Like","*simultaneous*","OR",2,27,227,5757
0,"Like","*parallel*","OR",2,27,227,5758
0,"Like","*polypharmacy*","OR",2,27,227,5759
0,"Like","*adjunctive*","OR",2,36,227,5760
0,"Like","*concurrent*","OR",2,36,227,5761
0,"Like","*concomitant*","OR",2,36,227,5762
0,"Like","*simultaneous*","OR",2,36,227,5763
0,"Like","*parallel*","OR",2,36,227,5764
0,"Like","*polypharmacy*","OR",2,36,227,5765
0,"=","drug combination","OR",2,45,227,5766
0,"Like","*adjunctive*","OR",2,57,227,5767
0,"Like","*concurrent*","OR",2,57,227,5768
0,"Like","*concomitant*","OR",2,57,227,5769
0,"Like","*simultaneous*","OR",2,57,227,5770
0,"Like","*parallel*","OR",2,57,227,5771
0,"Like","*polypharmacy*",,2,57,227,5772
0,"Like","*polytherapy*","OR",1,14,228,5773
0,"Like","*augmentation*","OR",1,14,228,5774
0,"Like","*parallel*","OR",1,14,228,5775
0,"Like","*combined*",,1,14,228,5776
0,"Like","*substance*","OR",1,15,234,5813
0,"Like","drug abus*","OR",1,15,234,5814
0,"Like","*alcohol*","OR",1,15,234,5815
0,"Like","*cannabis*",,1,15,234,5816
0,"Like","Olanzapine*","OR",2,27,235,5817
0,"Like","*Olanzapine*","OR",2,27,235,5818
0,"Like","zyprexa*","OR",2,27,235,5819
0,"Like","*zyprexa*","OR",2,27,235,5820
0,"Like","*velotab*","OR",2,27,235,5821
0,"Like","*ly 170053*","OR",2,27,235,5822
0,"Like","*Olanzapine*","OR",2,36,235,5823
0,"Like","*zyprexa*","OR",2,36,235,5824
0,"Like","*velotab*","OR",2,36,235,5825
0,"Like","*ly 170053*","OR",2,36,235,5826
0,"Like","*Olanzapine*","OR",2,57,235,5827
0,"Like","*zyprexa*","OR",2,57,235,5828
0,"Like","*velotab*","OR",2,57,235,5829
0,"Like","*ly 170053*",,2,57,235,5830
0,"Like","*frenactyl*","OR",2,27,236,5831
0,"Like","*glianimon*","OR",2,27,236,5832
0,"Like","*phenactil*","OR",2,27,236,5833
0,"Like","*frenactil*","OR",2,27,236,5834
0,"Like","*anquil*","OR",2,27,236,5835
0,"Like","*Psichoben*","OR",2,27,236,5836
0,"Like","*CB-8089*","OR",2,27,236,5837
0,"Like","*cb 8089*","OR",2,27,236,5838
0,"Like","*8089 CB*","OR",2,27,236,5839
0,"Like","*McN-JR-4584*","OR",2,27,236,5840
0,"Like","*mcn jr 4584*","OR",2,27,236,5841
0,"Like","*R-4584*","OR",2,27,236,5842
0,"Like","*r 4584*","OR",2,27,236,5843
0,"Like","*benperido*","OR",2,27,236,5844
0,"Like","*benzperidol*","OR",2,27,236,5845
0,"Like","*frenactyl*","OR",2,36,236,5846
0,"Like","*glianimon*","OR",2,36,236,5847
0,"Like","*phenactil*","OR",2,36,236,5848
0,"Like","*frenactil*","OR",2,36,236,5849
0,"Like","*CB-8089*","OR",2,36,236,5850
0,"Like","*Psichoben*","OR",2,36,236,5851
0,"Like","*cb 8089*","OR",2,36,236,5852
0,"Like","*8089 CB*","OR",2,36,236,5853
0,"Like","*R-4584*","OR",2,36,236,5854
0,"Like","*r 4584*","OR",2,36,236,5855
0,"Like","*benperido*","OR",2,36,236,5856
0,"Like","*benzperidol*","OR",2,36,236,5857
0,"Like","*frenactyl*","OR",2,57,236,5858
0,"Like","*glianimon*","OR",2,57,236,5859
0,"Like","*phenactil*","OR",2,57,236,5860
0,"Like","*frenactil*","OR",2,57,236,5861
0,"Like","*CB-8089*","OR",2,57,236,5862
0,"Like","*cb 8089*","OR",2,57,236,5863
0,"Like","*8089 CB*","OR",2,57,236,5864
0,"Like","*mcn jr 4584*","OR",2,57,236,5865
0,"Like","*R-4584*","OR",2,57,236,5866
0,"Like","*benperido*","OR",2,57,236,5867
0,"Like","*benzperidol*","OR",2,57,236,5868
0,"Like","*token*","OR",2,27,240,5913
0,"Like","*reward*","OR",2,27,240,5914
0,"Like","*punish*","OR",2,27,240,5915
0,"Like","*milieu*","OR",2,27,240,5916
0,"Like","*reinforc*","OR",2,27,240,5917
0,"Like","*operant*","OR",2,27,240,5918
0,"Like","*modifica*","OR",2,27,240,5919
0,"Like","*conditioning*","OR",2,27,240,5920
0,"Like","*contingen*","OR",2,27,240,5921
0,"Like","*token*","OR",2,36,240,5922
0,"Like","*reward*","OR",2,36,240,5923
0,"Like","*punish*","OR",2,36,240,5924
0,"Like","*milieu*","OR",2,36,240,5925
0,"Like","*reinforc*","OR",2,36,240,5926
0,"Like","*operant*","OR",2,36,240,5927
0,"Like","*modifica*","OR",2,36,240,5928
0,"Like","*conditioning*","OR",2,36,240,5929
0,"Like","*contingen*","OR",2,36,240,5930
0,"Like","*token*","OR",2,57,240,5931
0,"Like","*reward*","OR",2,57,240,5932
0,"Like","*punish*","OR",2,57,240,5933
0,"Like","*milieu*","OR",2,57,240,5934
0,"Like","*modifica*","OR",2,57,240,5935
0,"Like","*operant*","OR",2,57,240,5936
0,"Like","*conditioning*","OR",2,57,240,5937
0,"Like","*contingen*","OR",2,57,240,5938
0,"Like","*token*","OR",1,14,241,5939
0,"Like","*reinforc*","OR",1,14,241,5940
0,"Like","*reward*","OR",1,14,241,5941
0,"Like","*punish*","OR",1,14,241,5942
0,"Like","*milieu*","OR",1,14,241,5943
0,"Like","*operant*",,1,14,241,5944
0,"Like","*loxapine*","OR",1,14,247,5988
0,"Like","*oxilapine*","OR",1,14,247,5989
0,"Like","*loxitane*","OR",1,14,247,5990
0,"Like","*amoxapine*","OR",1,14,247,5991
0,"Like","*cloxazepine*","OR",1,14,247,5992
0,"Like","*loxpac*","OR",1,14,247,5993
0,"Like","*desconex*",,1,14,247,5994
0,"Like","*water int*","OR",2,27,249,6009
0,"Like","*drink*","OR",2,27,249,6010
0,"Like","*polydipsi*","OR",2,27,249,6011
0,"Like","*fluid int*","OR",2,27,249,6012
0,"Like","*polydipsi*","OR",2,36,249,6013
0,"Like","*water int*","OR",2,36,249,6014
0,"Like","*drink*","OR",2,36,249,6015
0,"Like","*fluid int*","OR",2,36,249,6016
0,"Like","*drink*","OR",2,57,249,6017
0,"Like","*water int*","OR",2,57,249,6018
0,"Like","*fluid int*","OR",2,57,249,6019
0,"Like","*water con*","OR",2,57,249,6020
0,"Like","*polydipsi*","OR",2,57,249,6021
0,"Like","*fluid con*",,2,57,249,6022
0,"Like","fluid*","OR",1,17,250,6023
0,"Like","polydipsia*",,1,15,250,6024
0,"Like","* art *","OR",2,27,252,6044
0,"Like","*painting*","OR",2,27,252,6045
0,"Like","*milieu*","OR",2,27,252,6046
0,"Like","art *","OR",2,27,252,6047
0,"Like","*drawing*","OR",2,27,252,6048
0,"Like","*creative*","OR",2,27,252,6049
0,"Like","*projective*","OR",2,27,252,6050
0,"Like","*crafts*","OR",2,27,252,6051
0,"Like","* art *","OR",2,36,252,6052
0,"Like","*painting*","OR",2,36,252,6053
0,"Like","*milieu*","OR",2,36,252,6054
0,"Like","*drawing*","OR",2,36,252,6055
0,"Like","*creative*","OR",2,36,252,6056
0,"Like","*projective*","OR",2,36,252,6057
0,"Like","*crafts*","OR",2,36,252,6058
0,"Like","* art *","OR",2,57,252,6059
0,"Like","*painting*","OR",2,57,252,6060
0,"Like","*milieu*","OR",2,57,252,6061
0,"Like","*drawing*","OR",2,57,252,6062
0,"Like","*creative*","OR",2,57,252,6063
0,"Like","*projective*","OR",2,57,252,6064
0,"Like","*crafts*",,2,57,252,6065
0,"Like","art *","OR",1,14,253,6066
0,"Like","craft*",,1,14,253,6067
0,"Like","*depressi*",,1,14,259,6120
0,"Like","*depressi*","OR",1,15,259,6121
0,"Like","*azepam*","OR",2,27,261,6131
0,"Like","*zolam*","OR",2,27,261,6132
0,"Like","*diazep*","OR",2,27,261,6133
0,"Like","*anthramycin*","OR",2,27,261,6134
0,"Like","*clorazepat*","OR",2,27,261,6135
0,"Like","*devazepid*","OR",2,27,261,6136
0,"Like","*flumazenil*","OR",2,27,261,6137
0,"Like","*pirenzepin*","OR",2,27,261,6138
0,"Like","*clobazam*","OR",2,27,261,6139
0,"Like","*azepam*","OR",2,36,261,6140
0,"Like","*zolam*","OR",2,36,261,6141
0,"Like","*diazep*","OR",2,36,261,6142
0,"Like","*anthramycin*","OR",2,36,261,6143
0,"Like","*clorazepat*","OR",2,36,261,6144
0,"Like","*devazepid*","OR",2,36,261,6145
0,"Like","*flumazenil*","OR",2,36,261,6146
0,"Like","*pirenzepin*","OR",2,36,261,6147
0,"Like","*clobazam*",,2,36,261,6148
0,"Like","*azepam*","OR",2,57,261,6149
0,"Like","*zolam*","OR",2,57,261,6150
0,"Like","*diazep*","OR",2,57,261,6151
0,"Like","*anthramycin*","OR",2,57,261,6152
0,"Like","*clorazepat*","OR",2,57,261,6153
0,"Like","*devazepid*","OR",2,57,261,6154
0,"Like","*flumazenil*","OR",2,57,261,6155
0,"Like","*pirenzepin*","OR",2,57,261,6156
0,"Like","*sirtal*","OR",2,27,264,6205
0,"Like","*tardotol*","OR",2,27,264,6206
0,"Like","*tegret*","OR",2,27,264,6207
0,"Like","* teril*","OR",2,27,264,6208
0,"Like","*timonil*","OR",2,27,264,6209
0,"Like","*trimonil*","OR",2,27,264,6210
0,"Like","*trialeptal*","OR",2,27,264,6211
0,"Like","*trileptal*","OR",2,27,264,6212
0,"Like","*tegret*","OR",2,36,264,6213
0,"Like","* teril*","OR",2,36,264,6214
0,"Like","*timonil*","OR",2,36,264,6215
0,"Like","*trimonil*","OR",2,36,264,6216
0,"Like","*trialeptal*","OR",2,36,264,6217
0,"Like","*trileptal*","OR",2,36,264,6218
0,"Like","*tardotol*","OR",2,36,264,6219
0,"Like","*sirtal*","OR",2,36,264,6220
0,"Like","*timonil*","OR",2,57,264,6221
0,"Like","*trimonil*","OR",2,57,264,6222
0,"Like","*trialeptal*","OR",2,57,264,6223
0,"Like","*trileptal*","OR",2,57,264,6224
0,"Like","*tardotol*","OR",2,57,264,6225
0,"Like","*sirtal*","OR",2,57,264,6226
0,"Like","*tegret*","OR",2,57,264,6227
0,"Like","* teril*","OR",2,57,264,6228
0,"Like","CARBAM*","AND",1,14,265,6229
1,"Like","CARBAM*",,1,56,265,6230
0,"Like","* perazin*","OR",2,27,267,6249
0,"Like","perazin*","OR",2,27,267,6250
0,"Like","*taxilan*","OR",2,27,267,6251
0,"Like","*pernazin*","OR",2,27,267,6252
0,"Like","*phenothiazine tran*","OR",2,27,267,6253
0,"Like","* piperazin*","OR",2,27,267,6254
0,"Like","piperazin*","OR",2,27,267,6255
0,"Like","*pernazin*","OR",2,36,267,6256
0,"Like","* perazin*","OR",2,36,267,6257
0,"Like","perazin*","OR",2,36,267,6258
0,"Like","*taxilan*","OR",2,36,267,6259
0,"Like","*phenothiazine tran*","OR",2,36,267,6260
0,"Like","* piperazin*","OR",2,36,267,6261
0,"Like","piperazin*","OR",2,36,267,6262
0,"Like","*pernazin*","OR",2,57,267,6263
0,"Like","* perazin*","OR",2,57,267,6264
0,"Like","perazin*","OR",2,57,267,6265
0,"Like","*taxilan*","OR",2,57,267,6266
0,"Like","*phenothiazine tran*","OR",2,57,267,6267
0,"Like","* piperazin*","OR",2,57,267,6268
0,"Like","piperazin*",,2,57,267,6269
0,"Like","PERaZIN*","AND",1,14,268,6270
1,"Like","perazin*",,1,56,268,6271
0,"Like","clozapine*","OR",2,27,270,6287
0,"Like","*clozapine*","OR",2,27,270,6288
0,"Like","clozaril*","OR",2,27,270,6289
0,"Like","*clozaril*","OR",2,27,270,6290
0,"Like","leponex*","OR",2,27,270,6291
0,"Like","*leponex*","OR",2,27,270,6292
0,"Like","*denzapine*","OR",2,27,270,6293
0,"Like","*zaponex*","OR",2,27,270,6294
0,"Like","*clozapine*","OR",2,36,270,6295
0,"Like","*clozaril*","OR",2,36,270,6296
0,"Like","*leponex*","OR",2,36,270,6297
0,"Like","*denzapine*","OR",2,36,270,6298
0,"Like","*zaponex*","OR",2,36,270,6299
0,"Like","*clozapine*","OR",2,57,270,6300
0,"Like","*clozaril*","OR",2,57,270,6301
0,"Like","*leponex*","OR",2,57,270,6302
0,"Like","*denzapine*","OR",2,57,270,6303
0,"Like","*zaponex*",,2,57,270,6304
0,"Like","*amisulprid*","OR",2,27,271,6305
0,"Like","*amitrex*","OR",2,27,271,6306
0,"Like","*barnetil*","OR",2,27,271,6307
0,"Like","*deniban*","OR",2,27,271,6308
0,"Like","*socian*","OR",2,27,271,6309
0,"Like","*solian*","OR",2,27,271,6310
0,"Like","*sulanid*","OR",2,27,271,6311
0,"Like","*sultopride*","OR",2,27,271,6312
0,"Like","*sulamid*","OR",2,27,271,6313
0,"Like","*amisulprid*","OR",2,36,271,6314
0,"Like","*amitrex*","OR",2,36,271,6315
0,"Like","*barnetil*","OR",2,36,271,6316
0,"Like","*deniban*","OR",2,36,271,6317
0,"Like","*socian*","OR",2,36,271,6318
0,"Like","*solian*","OR",2,36,271,6319
0,"Like","*sulanid*","OR",2,36,271,6320
0,"Like","*sultopride*","OR",2,36,271,6321
0,"Like","*sulamid*",,2,36,271,6322
0,"Like","*amisulprid*","OR",2,57,271,6323
0,"Like","*amitrex*","OR",2,57,271,6324
0,"Like","*barnetil*","OR",2,57,271,6325
0,"Like","*deniban*","OR",2,57,271,6326
0,"Like","*socian*","OR",2,57,271,6327
0,"Like","*solian*","OR",2,57,271,6328
0,"Like","*sulanid*","OR",2,57,271,6329
0,"Like","*sultopride*","OR",2,57,271,6330
0,"Like","*amisulprid*","OR",1,14,272,6331
0,"Like","*sultoprid*",,1,14,272,6332
0,"Like","*azepam*","OR",2,27,273,6333
0,"Like","*zolam*","OR",2,27,273,6334
0,"Like","*diazep*","OR",2,27,273,6335
0,"Like","*anthramycin*","OR",2,27,273,6336
0,"Like","*clorazepat*","OR",2,27,273,6337
0,"Like","*devazepid*","OR",2,27,273,6338
0,"Like","*flumazenil*","OR",2,27,273,6339
0,"Like","*pirenzepin*","OR",2,27,273,6340
0,"Like","*clobazam*","OR",2,27,273,6341
0,"Like","*azepam*","OR",2,36,273,6342
0,"Like","*zolam*","OR",2,36,273,6343
0,"Like","*diazep*","OR",2,36,273,6344
0,"Like","*anthramycin*","OR",2,36,273,6345
0,"Like","*clorazepat*","OR",2,36,273,6346
0,"Like","*devazepid*","OR",2,36,273,6347
0,"Like","*flumazenil*","OR",2,36,273,6348
0,"Like","*pirenzepin*","OR",2,36,273,6349
0,"Like","*clobazam*","OR",2,36,273,6350
0,"Like","*azepam*","OR",2,57,273,6351
0,"Like","*zolam*","OR",2,57,273,6352
0,"Like","*diazep*","OR",2,57,273,6353
0,"Like","*anthramycin*","OR",2,57,273,6354
0,"Like","*clorazepat*","OR",2,57,273,6355
0,"Like","*devazepid*","OR",2,57,273,6356
0,"Like","*flumazenil*","OR",2,57,273,6357
0,"Like","*pirenzepin*",,2,57,273,6358
0,"Like","*complian*","OR",2,27,276,6377
0,"Like","*keep*","OR",2,27,276,6378
0,"Like","* miss*","OR",2,27,276,6379
0,"Like","miss*","OR",2,27,276,6380
0,"Like","*fail*","OR",2,27,276,6381
0,"Like","*schedul*","OR",2,27,276,6382
0,"Like","*timetabl*","OR",2,27,276,6383
0,"Like","*complian*","OR",2,36,276,6384
0,"Like","*keep*","OR",2,36,276,6385
0,"Like","* miss*","OR",2,36,276,6386
0,"Like","* miss*","OR",2,36,276,6387
0,"Like","*fail*","OR",2,36,276,6388
0,"Like","*schedul*","OR",2,36,276,6389
0,"Like","*timetabl*","OR",2,36,276,6390
0,"Like","*complian*","OR",2,57,276,6391
0,"Like","*keep*","OR",2,57,276,6392
0,"Like","*fail*","OR",2,57,276,6393
0,"Like","*schedul*","OR",2,57,276,6394
0,"Like","*timetabl*","OR",2,57,276,6395
0,"Like","*appointment*","OR",2,27,277,6396
0,"Like","*attend*","OR",2,27,277,6397
0,"Like","*remind*","OR",2,27,277,6398
0,"Like","*prompt*","OR",2,27,277,6399
0,"Like","*appointment*","OR",2,36,277,6400
0,"Like","*attend*","OR",2,36,277,6401
0,"Like","*remind*","OR",2,36,277,6402
0,"Like","*prompt*","OR",2,36,277,6403
0,"Like","*appointment*","OR",2,57,277,6404
0,"Like","*attend*","OR",2,57,277,6405
0,"Like","*remind*","OR",2,57,277,6406
0,"Like","*prompt*",,2,57,277,6407
0,"Like","*phone*","OR",2,27,278,6408
0,"Like","*letter*","OR",2,27,278,6409
0,"Like","*visit*","OR",2,27,278,6410
0,"Like","*call*","OR",2,27,278,6411
0,"Like","*system*","OR",2,27,278,6412
0,"Like","*phone*","OR",2,36,278,6413
0,"Like","*letter*","OR",2,36,278,6414
0,"Like","*visit*","OR",2,36,278,6415
0,"Like","*call*","OR",2,36,278,6416
0,"Like","*system*","OR",2,36,278,6417
0,"Like","*phone*","OR",2,57,278,6418
0,"Like","*letter*","OR",2,57,278,6419
0,"Like","*visit*","OR",2,57,278,6420
0,"Like","*call*","OR",2,57,278,6421
0,"Like","*system*",,2,57,278,6422
0,"Like","*patient complai*","OR",2,27,279,6423
0,"Like","*patient complai*","OR",2,36,279,6424
0,"Like","*patient complai*","OR",2,57,279,6425
0,"Like","*patient drop*","OR",2,27,279,6426
0,"Like","*patient drop*","OR",2,57,279,6427
0,"Like","*patient drop*","OR",2,36,279,6428
0,"Like","*outpatient clinic*","OR",2,27,279,6429
0,"Like","*outpatient clinic*","OR",2,36,279,6430
0,"Like","*outpatient clinic*","OR",2,57,279,6431
0,"Like","*outpatient care*","OR",2,27,279,6432
0,"Like","*outpatient care*","OR",2,36,279,6433
0,"Like","*outpatient care*","OR",2,57,279,6434
0,"Like","*outpatient servi*","OR",2,27,279,6435
0,"Like","*outpatient servi*","OR",2,36,279,6436
0,"Like","*outpatient servi*","OR",2,57,279,6437
0,"Like","*outpatient treat*","OR",2,27,279,6438
0,"Like","*outpatient treat*","OR",2,36,279,6439
0,"Like","*outpatient treat*","OR",2,57,279,6440
0,"Like","*treatment-complia*","OR",2,27,279,6441
0,"Like","*treatment-complia*","OR",2,36,279,6442
0,"Like","*treatment-complia*","OR",2,57,279,6443
0,"Like","*treatment complia*","OR",2,27,279,6444
0,"Like","*treatment complia*","OR",2,36,279,6445
0,"Like","*treatment complia*",,2,57,279,6446
0,"Like","*client character*","OR",2,27,280,6447
0,"Like","*client character*","OR",2,36,280,6448
0,"Like","*client character*","OR",2,57,280,6449
0,"Like","*motivation*","OR",2,27,280,6450
0,"Like","*motivation*","OR",2,57,280,6451
0,"Like","*motivation*","OR",2,36,280,6452
0,"Like","*absente*","OR",2,27,280,6453
0,"Like","*absente*","OR",2,36,280,6454
0,"Like","*absente*",,2,57,280,6455
0,"Like","*remind*","OR",1,14,281,6456
0,"Like","*prompt*","OR",1,14,281,6457
0,"Like","*letter*","OR",1,14,281,6458
0,"Like","*phone*","OR",1,14,281,6459
0,"Like","*appointm*","OR",1,14,281,6460
0,"Like","*coerci*","OR",1,14,283,6482
0,"Like","*compulso*","OR",1,14,283,6483
0,"Like","*involuntar*","OR",1,14,283,6484
0,"Like","*isolation*","OR",1,14,283,6485
0,"Like","*restai*","OR",1,14,283,6486
0,"Like","*seclu*",,1,14,283,6487
0,"Like","*saliva*","OR",1,17,285,6507
0,"Like","*sialorrh*","OR",1,17,285,6508
0,"Like","*sialism*","OR",1,17,285,6509
0,"Like","*ptyalism*","OR",1,17,285,6510
0,"Like","*sialosis*","OR",1,17,285,6511
0,"Like","*drool*",,1,17,285,6512
0,"Like","*complian*","OR",1,14,286,6513
0,"Like","*psychoeducat*","OR",1,14,286,6514
0,"Like","*concord*","OR",1,14,286,6515
0,"Like","*adhere*","OR",1,14,286,6516
0,"Like","*non-com*","OR",1,14,286,6517
0,"Like","*refus*","OR",1,14,286,6518
0,"Like","*educat*",,1,14,286,6519
0,"Like","*dosage-effect*","OR",2,27,289,6570
0,"Like","*dosage effect*","OR",2,27,289,6571
0,"Like","*dose-activity*","OR",2,27,289,6572
0,"Like","*dose activity*","OR",2,27,289,6573
0,"Like","*dose-dependence*","OR",2,27,289,6574
0,"Like","*dose dependence*","OR",2,27,289,6575
0,"Like","*dose effect*","OR",2,27,289,6576
0,"Like","*dose-effect*","OR",2,27,289,6577
0,"Like","*dosage-effect*","OR",2,36,289,6578
0,"Like","*dosage effect*","OR",2,36,289,6579
0,"Like","*dose-activity*","OR",2,36,289,6580
0,"Like","*dose activity*","OR",2,36,289,6581
0,"Like","*dose-dependence*","OR",2,36,289,6582
0,"Like","*dose dependence*","OR",2,36,289,6583
0,"Like","*dose effect*","OR",2,36,289,6584
0,"Like","*dose-effect*","OR",2,36,289,6585
0,"Like","*dosage-effect*","OR",2,57,289,6586
0,"Like","*dosage effect*","OR",2,57,289,6587
0,"Like","*dose-activity*","OR",2,57,289,6588
0,"Like","*dose activity*","OR",2,57,289,6589
0,"Like","*dose-dependence*","OR",2,57,289,6590
0,"Like","*dose dependence*","OR",2,57,289,6591
0,"Like","*dose-effect*","OR",2,57,289,6592
0,"Like","*dose effect*","OR",2,57,289,6593
0,"Like","*dose-rate*","OR",2,27,290,6594
0,"Like","*dose rate*","OR",2,27,290,6595
0,"Like","*dose-response*","OR",2,27,290,6596
0,"Like","*dose response*","OR",2,27,290,6597
0,"Like","*dosage-scheme*","OR",2,27,290,6598
0,"Like","*dosage scheme*","OR",2,27,290,6599
0,"Like","*drug-response*","OR",2,27,290,6600
0,"Like","*drug response*","OR",2,27,290,6601
0,"Like","*dose-rate*","OR",2,36,290,6602
0,"Like","*dose rate*","OR",2,36,290,6603
0,"Like","*dose-response*","OR",2,36,290,6604
0,"Like","*dose response*","OR",2,36,290,6605
0,"Like","*dosage-scheme*","OR",2,36,290,6606
0,"Like","*dosage scheme*","OR",2,36,290,6607
0,"Like","*drug-response*","OR",2,36,290,6608
0,"Like","*drug response*","OR",2,36,290,6609
0,"Like","*dose-rate*","OR",2,57,290,6610
0,"Like","*dose rate*","OR",2,57,290,6611
0,"Like","*dose-response*","OR",2,57,290,6612
0,"Like","*dose response*","OR",2,57,290,6613
0,"Like","*dosage-scheme*","OR",2,57,290,6614
0,"Like","*dosage scheme*","OR",2,57,290,6615
0,"Like","*drug-response*","OR",2,57,290,6616
0,"Like","*drug response*","OR",2,57,290,6617
0,"Like","*effective-dose*","OR",2,27,291,6618
0,"Like","*effective dose*","OR",2,27,291,6619
0,"Like","*dose-finding*","OR",2,27,291,6620
0,"Like","*dose finding*","OR",2,27,291,6621
0,"Like","*dose-calculation*","OR",2,27,291,6622
0,"Like","*dose calculation*","OR",2,27,291,6623
0,"Like","*therapeutic-equiv*","OR",2,27,291,6624
0,"Like","*therapeutic equiv*","OR",2,27,291,6625
0,"Like","*effective-dose*","OR",2,36,291,6626
0,"Like","*effective dose*","OR",2,36,291,6627
0,"Like","*dose-finding*","OR",2,36,291,6628
0,"Like","*dose finding*","OR",2,36,291,6629
0,"Like","*dose-calculat*","OR",2,36,291,6630
0,"Like","*dose calculat*","OR",2,36,291,6631
0,"Like","*therapeutic-equiv**","OR",2,36,291,6632
0,"Like","*therapeutic equiv*","OR",2,36,291,6633
0,"Like","*effective dose*","OR",2,57,291,6634
0,"Like","*dose-finding*","OR",2,57,291,6635
0,"Like","*dose finding*","OR",2,57,291,6636
0,"Like","*dose-calculat*","OR",2,57,291,6637
0,"Like","*dose calculat*","OR",2,57,291,6638
0,"Like","*therapeutic-equiv*","OR",2,57,291,6639
0,"Like","*therapeutic equiv*",,2,57,291,6640
0,"Like","*high-dos*","OR",2,27,292,6641
0,"Like","*high dos*","OR",2,27,292,6642
0,"Like","*low-dos*","OR",2,27,292,6643
0,"Like","*low dos*","OR",2,27,292,6644
0,"Like","*medium-dos*","OR",2,27,292,6645
0,"Like","*medium dos*","OR",2,27,292,6646
0,"Like","*standard-dos*","OR",2,27,292,6647
0,"Like","*standard dos*","OR",2,27,292,6648
0,"Like","*high-dos*","OR",2,36,292,6649
0,"Like","*high dos*","OR",2,36,292,6650
0,"Like","*low-dos*","OR",2,36,292,6651
0,"Like","*low dos*","OR",2,36,292,6652
0,"Like","*medium-dos*","OR",2,36,292,6653
0,"Like","*medium dos*","OR",2,36,292,6654
0,"Like","*standard-dos*","OR",2,36,292,6655
0,"Like","*standard dos*","OR",2,36,292,6656
0,"Like","*high-dos*","OR",2,57,292,6657
0,"Like","*high dos*","OR",2,57,292,6658
0,"Like","*low-dos*","OR",2,57,292,6659
0,"Like","*low dos*","OR",2,57,292,6660
0,"Like","*medium-dos*","OR",2,57,292,6661
0,"Like","*medium dos*","OR",2,57,292,6662
0,"Like","*standard-dos*","OR",2,57,292,6663
0,"Like","*standard dos*","OR",2,57,292,6664
0,"Like","*middle-dos*","OR",2,27,293,6665
0,"Like","*middle dos*","OR",2,27,293,6666
0,"Like","*minimum-dos*","OR",2,27,293,6667
0,"Like","*minimum dos*","OR",2,27,293,6668
0,"Like","*threshold-dos*","OR",2,27,293,6669
0,"Like","*threshold dos*","OR",2,27,293,6670
0,"Like","*maximum-dos*","OR",2,27,293,6671
0,"Like","*maximum dos*","OR",2,27,293,6672
0,"Like","*middle-dos*","OR",2,36,293,6673
0,"Like","*middle dos*","OR",2,36,293,6674
0,"Like","*maximum-dos*","OR",2,36,293,6675
0,"Like","*maximum dos*","OR",2,36,293,6676
0,"Like","*minimum-dos*","OR",2,36,293,6677
0,"Like","*minimum dos*","OR",2,36,293,6678
0,"Like","*threshold-dos*","OR",2,36,293,6679
0,"Like","*threshold dos*","OR",2,36,293,6680
0,"Like","*maximum-dos*","OR",2,57,293,6681
0,"Like","*maximum-dos*",,2,57,293,6682
0,"Like","*middle-dos*","OR",2,57,293,6683
0,"Like","*middle dos*","OR",2,57,293,6684
0,"Like","*minimum-dos*","OR",2,57,293,6685
0,"Like","*minimum dos*","OR",2,57,293,6686
0,"Like","*threshold-dos*","OR",2,57,293,6687
0,"Like","*threshold dos*","OR",2,57,293,6688
0,"Like","*dosage*",,1,14,298,6761
0,"Like","*haloperidol*","AND",1,14,298,6762
0,"Like","*family*","OR",2,27,299,6763
0,"Like","family*","OR",2,27,299,6764
0,"Like","*family*","OR",2,36,299,6765
0,"Like","*family*",,2,57,299,6766
0,"Like","*family*",,1,14,300,6767
0,"Like","*short*","OR",2,27,301,6768
0,"Like","*brief*","OR",2,27,301,6769
0,"Like","*length*","OR",2,27,301,6770
0,"Like","*short*","OR",2,36,302,6771
0,"Like","*brief*","OR",2,36,302,6772
0,"Like","*length*","OR",2,36,302,6773
0,"Like","*short*","OR",2,57,303,6774
0,"Like","*brief*","OR",2,57,303,6775
0,"Like","*length*","OR",2,57,303,6776
0,"Like","*admission*","OR",2,27,307,6783
0,"Like","*hospital*",,2,27,307,6784
0,"Like","*admission*","OR",2,36,308,6785
0,"Like","*hospital*",,2,36,308,6786
0,"Like","*admission*","OR",2,57,309,6787
0,"Like","*hospital*",,2,57,309,6788
0,"Like","*dysk*","OR",2,27,316,6861
0,"Like","dysk*","OR",2,27,316,6862
0,"Like","*diskin*","OR",2,27,316,6863
0,"Like","*dysk*","OR",2,36,316,6864
0,"Like","*diskin*","OR",2,36,316,6865
0,"Like","*dysk*","OR",2,57,316,6866
0,"Like","*diskin*",,2,57,316,6867
0,"Like","*training*","OR",1,14,322,6917
0,"Like","*relaps*","OR",1,14,322,6918
0,"Like","*consumer*","OR",1,14,322,6919
0,"Like","self*","OR",1,14,322,6920
0,"Like","early*","OR",1,14,322,6921
0,"Like","HALO*","OR",2,27,323,6922
0,"Like","*HALO*","OR",2,27,323,6923
0,"Like","*HALDOL*","OR",2,27,323,6924
0,"Like","*SEREN*","OR",2,27,323,6925
0,"Like","*SIGAPERIDOL*","OR",2,27,323,6926
0,"Like","*BROTOPON*","OR",2,27,323,6927
0,"Like","*EINALON*","OR",2,27,323,6928
0,"Like","*LINTON*","OR",2,27,323,6929
0,"Like","*PELUCES*","OR",2,27,323,6930
0,"Like","*HALO*","OR",2,36,323,6931
0,"Like","*HALDOL*","OR",2,36,323,6932
0,"Like","*SEREN*","OR",2,36,323,6933
0,"Like","*SIGAPERIDOL*","OR",2,36,323,6934
0,"Like","*BROTOPON*","OR",2,36,323,6935
0,"Like","*EINALON*","OR",2,36,323,6936
0,"Like","*LINTON*","OR",2,36,323,6937
0,"Like","*PELUCES*","OR",2,36,323,6938
0,"Like","*PELUCES*","OR",2,36,323,6939
0,"Like","*HALO*","OR",2,57,323,6940
0,"Like","*HALDOL*","OR",2,57,323,6941
0,"Like","*SEREN*","OR",2,57,323,6942
0,"Like","*SIGAPERIDOL*","OR",2,57,323,6943
0,"Like","*BROTOPON*","OR",2,57,323,6944
0,"Like","*EINALON*","OR",2,57,323,6945
0,"Like","*LINTON*","OR",2,57,323,6946
0,"Like","*PELUCES*","OR",2,57,323,6947
0,"Like","*vitamin*","OR",2,27,324,6948
0,"Like","*tocopherol*","OR",2,27,324,6949
0,"Like","*vitamin*","OR",2,36,324,6950
0,"Like","*tocopherol*","OR",2,36,324,6951
0,"Like","*vitamin*","OR",2,57,324,6952
0,"Like","*tocopherol*",,2,57,324,6953
0,"Like","*vitamin e*","OR",1,14,325,6954
0,"Like","*tocopherol*",,1,14,325,6955
0,"Like","*vitamins*","OR",1,14,325,6956
0,"Like","*day*","AND",2,27,326,6957
0,"Like","*cent*",,2,27,326,6958
0,"Like","*day*","AND",2,36,327,6959
0,"Like","*cent*",,2,36,327,6960
0,"Like","*day*","AND",2,57,328,6961
0,"Like","*cent*",,2,57,328,6962
0,"Like","*centre*","OR",2,27,329,6963
0,"Like","*center*","OR",2,27,329,6964
0,"Like","*centre*","OR",2,36,329,6965
0,"Like","*center*","OR",2,36,329,6966
0,"Like","*centre*","OR",2,57,329,6967
0,"Like","*center*",,2,57,329,6968
0,"Like","*health*","OR",2,27,330,6969
0,"Like","*health*","OR",2,36,330,6970
0,"Like","*health*","OR",2,57,330,6971
0,"Like","*CMHC*","OR",2,27,331,6972
0,"Like","*CMHC*","OR",2,36,331,6973
0,"Like","*CMHC*",,2,57,331,6974
0,"Like","*centre*","OR",1,14,332,6975
0,"Like","*center*","OR",1,14,332,6976
0,"Like","*day *",,1,14,332,6977
0,"Like","*pimozide*","OR",2,27,334,6998
0,"Like","*orap*","OR",2,27,334,6999
0,"Like","*antalon*","OR",2,27,334,7000
0,"Like","*opiran*","OR",2,27,334,7001
0,"Like","*pirium*","OR",2,27,334,7002
0,"Like","pirium*","OR",2,27,334,7003
0,"Like","pimozide*","OR",2,27,334,7004
0,"Like","orap*","OR",2,27,334,7005
0,"Like","antalon*","OR",2,27,334,7006
0,"Like","opiran*","OR",2,27,334,7007
0,"Like","*pimozide*","OR",2,36,334,7008
0,"Like","*orap*","OR",2,36,334,7009
0,"Like","*antalon*","OR",2,36,334,7010
0,"Like","*opiran*","OR",2,36,334,7011
0,"Like","*pirium*","OR",2,36,334,7012
0,"Like","*pimozide*","OR",2,57,334,7013
0,"Like","*orap*","OR",2,57,334,7014
0,"Like","*antalon*","OR",2,57,334,7015
0,"Like","*opiran*","OR",2,57,334,7016
0,"Like","*pirium*","OR",2,57,334,7017
0,"Like","*pimozide*","OR",1,14,335,7018
0,"Like","*orap*","OR",1,14,335,7019
0,"Like","*antalon*","OR",1,14,335,7020
0,"Like","*opiran*","OR",1,14,335,7021
0,"Like","*pirium*",,1,14,335,7022
0,"Like","*placeb*","OR",2,27,336,7023
0,"Like","placeb*","OR",2,27,336,7024
0,"Like","*placeb*","OR",2,36,336,7025
0,"Like","*placeb*",,2,57,336,7026
0,"Like","*haloperidol*","AND",1,14,337,7027
0,"Like","*placebo*",,1,14,337,7028
0,"Like","*polyunsaturat*","OR",2,27,338,7029
0,"Like","*phospholip*","OR",2,27,338,7030
0,"Like","* efa*","OR",2,27,338,7031
0,"Like","* epa*","OR",2,27,338,7032
0,"Like","*maxEPA*","OR",2,27,338,7033
0,"Like","* dha*","OR",2,27,338,7034
0,"Like","* ala*","OR",2,27,338,7035
0,"Like","*omega*","OR",2,27,338,7036
0,"Like","*arachi*","OR",2,27,338,7037
0,"Like","*polyunsaturat*","OR",2,36,338,7038
0,"Like","*phospholip*","OR",2,36,338,7039
0,"Like","* efa*","OR",2,36,338,7040
0,"Like","* epa*","OR",2,36,338,7041
0,"Like","*maxEPA*","OR",2,36,338,7042
0,"Like","* dha*","OR",2,36,338,7043
0,"Like","* ala*","OR",2,36,338,7044
0,"Like","*omega*","OR",2,36,338,7045
0,"Like","*arachi*",,2,36,338,7046
0,"Like","*polyunsaturat*","OR",2,57,338,7047
0,"Like","*phospholip*","OR",2,57,338,7048
0,"Like","* efa*","OR",2,57,338,7049
0,"Like","* epa*","OR",2,57,338,7050
0,"Like","*maxEPA*","OR",2,57,338,7051
0,"Like","* dha*","OR",2,57,338,7052
0,"Like","* ala*","OR",2,57,338,7053
0,"Like","*omega*","OR",2,57,338,7054
0,"Like","*docosahex*","OR",2,27,339,7055
0,"Like","*fish oil*","OR",2,27,339,7056
0,"Like","*fatty acid*","OR",2,27,339,7057
0,"Like","*evening primr*","OR",2,27,339,7058
0,"Like","*flax*","OR",2,27,339,7059
0,"Like","*linseed*","OR",2,27,339,7060
0,"Like","*eicosapentaenoic*","OR",2,27,339,7061
0,"Like","*docosahex*","OR",2,36,339,7062
0,"Like","*fish oil*","OR",2,36,339,7063
0,"Like","*fatty acid*","OR",2,36,339,7064
0,"Like","*evening primr*","OR",2,36,339,7065
0,"Like","*flax*","OR",2,36,339,7066
0,"Like","*linseed*","OR",2,36,339,7067
0,"Like","*eicosapentaenoic*","OR",2,36,339,7068
0,"Like","*docosahex*","OR",2,57,339,7069
0,"Like","*fish oil*","OR",2,57,339,7070
0,"Like","*fatty acid*","OR",2,57,339,7071
0,"Like","*evening primr*","OR",2,57,339,7072
0,"Like","*flax*","OR",2,57,339,7073
0,"Like","*linseed*","OR",2,57,339,7074
0,"Like","*eicosapentaenoic*","OR",2,57,339,7075
0,"Like","*arachi*","OR",2,57,339,7076
0,"Like","*phosphol*","OR",1,14,342,7099
0,"Like","*docosah*","OR",1,14,342,7100
0,"Like","*fish o*","OR",1,14,342,7101
0,"Like","*fatty a*","OR",1,14,342,7102
0,"Like","*evening p*","OR",1,14,342,7103
0,"Like","*eicosap*","OR",1,14,342,7104
0,"Like","*polyu*",,1,14,342,7105
0,"Like","*molind*","OR",2,27,343,7106
0,"Like","*en-1733a*","OR",2,27,343,7107
0,"Like","*lidone*","OR",2,27,343,7108
0,"Like","*moban*","OR",2,27,343,7109
0,"Like","*molind*","OR",2,36,343,7110
0,"Like","*en-1733a*","OR",2,36,343,7111
0,"Like","*lidone*","OR",2,36,343,7112
0,"Like","*moban*","OR",2,36,343,7113
0,"Like","*molind*","OR",2,57,343,7114
0,"Like","*en-1733a*","OR",2,57,343,7115
0,"Like","*lidone*","OR",2,57,343,7116
0,"Like","*moban*","OR",2,57,343,7117
0,"Like","*molind*","OR",1,14,344,7118
0,"Like","*lidone*","OR",1,14,344,7119
0,"Like","*moban*",,1,14,344,7120
0,"Like","*dyskines*","OR",2,27,345,7121
0,"Like","*dyskines*","OR",2,36,345,7122
0,"Like","*dyskines*",,2,57,345,7123
0,"Like","*amantad*","OR",2,27,346,7124
0,"Like","*ampheta*","OR",2,27,346,7125
0,"Like","*amtp*","OR",2,27,346,7126
0,"Like","*apomorp*","OR",2,27,346,7127
0,"Like","*bromocr*","OR",2,27,346,7128
0,"Like","*celiprol*","OR",2,27,346,7129
0,"Like","*clonidi*","OR",2,27,346,7130
0,"Like","*dopa*","OR",2,27,346,7131
0,"Like","*amantad*","OR",2,36,346,7132
0,"Like","*ampheta*","OR",2,36,346,7133
0,"Like","*amtp*","OR",2,36,346,7134
0,"Like","*apomorp*","OR",2,36,346,7135
0,"Like","*bromocr*","OR",2,36,346,7136
0,"Like","*celiprol*","OR",2,36,346,7137
0,"Like","*clonidi*","OR",2,36,346,7138
0,"Like","*dopa*","OR",2,36,346,7139
0,"Like","*amantad*","OR",2,57,346,7140
0,"Like","*ampheta*","OR",2,57,346,7141
0,"Like","*amtp*","OR",2,57,346,7142
0,"Like","*apomorp*","OR",2,57,346,7143
0,"Like","*bromocr*","OR",2,57,346,7144
0,"Like","*celiprol*","OR",2,57,346,7145
0,"Like","*clonidi*","OR",2,57,346,7146
0,"Like","*dopa*",,2,57,346,7147
0,"Like","*disulfir*","OR",2,27,350,7217
0,"Like","*disulfir*","OR",2,36,350,7218
0,"Like","*disulfir*","OR",2,57,350,7219
0,"Like","*fusaric*","OR",2,27,350,7220
0,"Like","*fusaric*","OR",2,36,350,7221
0,"Like","*fusaric*","OR",2,57,350,7222
0,"Like","*hydergi*","OR",2,27,350,7223
0,"Like","*hydergi*","OR",2,36,350,7224
0,"Like","*hydergi*","OR",2,57,350,7225
0,"Like","*lisurid*","OR",2,27,350,7226
0,"Like","*lisurid*","OR",2,36,350,7227
0,"Like","*lisurid*","OR",2,57,350,7228
0,"Like","*metoclop*","OR",2,27,350,7229
0,"Like","*metoclop*","OR",2,36,350,7230
0,"Like","*metoclop*","OR",2,57,350,7231
0,"Like","*oxipero*","OR",2,27,350,7232
0,"Like","*oxipero*","OR",2,36,350,7233
0,"Like","*oxipero*","OR",2,57,350,7234
0,"Like","*oxpren*","OR",2,27,350,7235
0,"Like","*oxpren*","OR",2,36,350,7236
0,"Like","*oxpren*","OR",2,57,350,7237
0,"Like","*oxypert*","OR",2,27,350,7238
0,"Like","*oxypert*","OR",2,36,350,7239
0,"Like","*oxypert*",,2,57,350,7240
0,"Like","*papaver*","OR",2,27,352,7262
0,"Like","*pindolo*","OR",2,27,352,7263
0,"Like","*proprano*","OR",2,27,352,7264
0,"Like","*reserpin*","OR",2,27,352,7265
0,"Like","*tetrabena*","OR",2,27,352,7266
0,"Like","*tiaprid*","OR",2,27,352,7267
0,"Like","*yohimb*","OR",2,27,352,7268
0,"Like","*papaver*","OR",2,36,352,7269
0,"Like","*pindolo*","OR",2,36,352,7270
0,"Like","*proprano*","OR",2,36,352,7271
0,"Like","*reserpin*","OR",2,36,352,7272
0,"Like","*tetrabena*","OR",2,36,352,7273
0,"Like","*tiaprid*","OR",2,36,352,7274
0,"Like","*yohimb*","OR",2,36,352,7275
0,"Like","*papaver*","OR",2,57,352,7276
0,"Like","*pindolo*","OR",2,57,352,7277
0,"Like","*proprano*","OR",2,57,352,7278
0,"Like","*reserpin*","OR",2,57,352,7279
0,"Like","*tetrabena*","OR",2,57,352,7280
0,"Like","*tiaprid*","OR",2,57,352,7281
0,"Like","*yohimb*",,2,57,352,7282
0,"Like","*risper*","AND",1,14,355,7301
0,"Like","*olanz*",,1,14,355,7302
0,"Like","*fluoperazin*","OR",2,27,359,7359
0,"Like","*stelazin*","OR",2,27,359,7360
0,"Like","*discimer*","OR",2,27,359,7361
0,"Like","*eskazin*","OR",2,27,359,7362
0,"Like","*foille*","OR",2,27,359,7363
0,"Like","*iremo*","OR",2,27,359,7364
0,"Like","*jatro*","OR",2,27,359,7365
0,"Like","*modalina*","OR",2,27,359,7366
0,"Like","*fluoperazin*","OR",2,36,359,7367
0,"Like","*stelazin*","OR",2,36,359,7368
0,"Like","*discimer*","OR",2,36,359,7369
0,"Like","*eskazin*","OR",2,36,359,7370
0,"Like","*foille*","OR",2,36,359,7371
0,"Like","*iremo*","OR",2,36,359,7372
0,"Like","*jatro*","OR",2,36,359,7373
0,"Like","*modalina*","OR",2,36,359,7374
0,"Like","*fluoperazin*","OR",2,57,359,7375
0,"Like","*stelazin*","OR",2,57,359,7376
0,"Like","*discimer*","OR",2,57,359,7377
0,"Like","*eskazin*","OR",2,57,359,7378
0,"Like","*foille*","OR",2,57,359,7379
0,"Like","*iremo*","OR",2,57,359,7380
0,"Like","*jatro*","OR",2,57,359,7381
0,"Like","*modalina*",,2,57,359,7382
0,"Like","*trifluperazin*","OR",1,14,361,7407
0,"Like","*trifluoperzin*","OR",1,14,361,7408
0,"Like","*stelazin*",,1,14,361,7409
0,"Like","*sedofren*","OR",2,27,363,7434
0,"Like","*sporalon*","OR",2,27,363,7435
0,"Like","*stelium*","OR",2,27,363,7436
0,"Like","*terflu*","OR",2,27,363,7437
0,"Like","*skf 5019*","OR",2,27,363,7438
0,"Like","*7623 rp*","OR",2,27,363,7439
0,"Like","*trifluperazine*","OR",2,27,363,7440
0,"Like","*oxyperazin*","OR",2,27,363,7441
0,"Like","*sedofren*","OR",2,36,363,7442
0,"Like","*sporalon*","OR",2,36,363,7443
0,"Like","*stelium*","OR",2,36,363,7444
0,"Like","*terflu*","OR",2,36,363,7445
0,"Like","*skf 5019*","OR",2,36,363,7446
0,"Like","*7623 rp*","OR",2,36,363,7447
0,"Like","*trifluperazine*","OR",2,36,363,7448
0,"Like","*oxyperazin*","OR",2,36,363,7449
0,"Like","*sedofren*","OR",2,57,363,7450
0,"Like","*sporalon*","OR",2,57,363,7451
0,"Like","*stelium*","OR",2,57,363,7452
0,"Like","*terflu*","OR",2,57,363,7453
0,"Like","*skf 5019*","OR",2,57,363,7454
0,"Like","*7623 rp*","OR",2,57,363,7455
0,"Like","*trifluperazine*","OR",2,57,363,7456
0,"Like","*oxyperazin*",,2,57,363,7457
0,"Like","*coerci*","OR",2,27,364,7458
0,"Like","*compulsor*","OR",2,27,364,7459
0,"Like","*immobili*","OR",2,27,364,7460
0,"Like","*involunta*","OR",2,27,364,7461
0,"Like","*isolation*","OR",2,27,364,7462
0,"Like","*restrai*","OR",2,27,364,7463
0,"Like","*seclu*","OR",2,27,364,7464
0,"Like","*aggress*","OR",2,27,364,7465
0,"Like","*coerci*","OR",2,36,364,7466
0,"Like","*compulsor*","OR",2,36,364,7467
0,"Like","*compulsor*","OR",2,36,364,7468
0,"Like","*involunta*","OR",2,36,364,7469
0,"Like","*isolation*","OR",2,36,364,7470
0,"Like","*restrai*","OR",2,36,364,7471
0,"Like","*seclu*","OR",2,36,364,7472
0,"Like","*aggress*","OR",2,36,364,7473
0,"Like","*coerci*","OR",2,57,364,7474
0,"Like","*compulsor*","OR",2,57,364,7475
0,"Like","*compulsor*","OR",2,57,364,7476
0,"Like","*involunta*","OR",2,57,364,7477
0,"Like","*isolation*","OR",2,57,364,7478
0,"Like","*restrai*","OR",2,57,364,7479
0,"Like","*seclu*","OR",2,57,364,7480
0,"Like","*aggress*",,2,57,364,7481
0,"Like","*penfluridol*","OR",2,27,365,7482
0,"Like","*penfluridol*","OR",2,36,365,7483
0,"Like","*penfluridol*","OR",2,57,365,7484
0,"Like","*micefal*","OR",2,27,365,7485
0,"Like","*micefal*","OR",2,36,365,7486
0,"Like","*micefal*","OR",2,57,365,7487
0,"Like","*semap*","OR",2,27,365,7488
0,"Like","*semap*","OR",2,36,365,7489
0,"Like","*semap*","OR",2,57,365,7490
0,"Like","*flupidol*","OR",2,27,365,7491
0,"Like","*flupidol*","OR",2,36,365,7492
0,"Like","*flupidol*",,2,57,365,7493
0,"Like","*penfluridol*","OR",1,14,366,7494
0,"Like","*micefal*","OR",1,14,366,7495
0,"Like","*semap*","OR",1,14,366,7496
0,"Like","*flupidol*",,1,14,366,7497
0,"Like","*pray*","OR",2,27,367,7498
0,"Like","*god*","OR",2,27,367,7499
0,"Like","*spiritual*","OR",2,27,367,7500
0,"Like","*faith*","OR",2,27,367,7501
0,"Like","*religi*","OR",2,27,367,7502
0,"Like","*pray*","OR",2,36,367,7503
0,"Like","*god*","OR",2,36,367,7504
0,"Like","*spiritual*","OR",2,36,367,7505
0,"Like","*faith*","OR",2,36,367,7506
0,"Like","*religi*","OR",2,36,367,7507
0,"Like","*pray*","OR",2,57,367,7508
0,"Like","*god*","OR",2,57,367,7509
0,"Like","*spiritual*","OR",2,57,367,7510
0,"Like","*faith*","OR",2,57,367,7511
0,"Like","*religi*",,2,57,367,7512
0,"Like","*azepam*","OR",2,27,369,7537
0,"Like","*alprazolam*","OR",2,27,369,7538
0,"Like","*chlordiazepoxide*","OR",2,27,369,7539
0,"Like","*clobazam*","OR",2,27,369,7540
0,"Like","*clorazepate dipot*","OR",2,27,369,7541
0,"Like","*azepam*","OR",2,36,369,7542
0,"Like","*alprazolam*","OR",2,36,369,7543
0,"Like","*chlordiazepoxide*","OR",2,36,369,7544
0,"Like","*clobazam*","OR",2,36,369,7545
0,"Like","*clorazepate dipot*","OR",2,36,369,7546
0,"Like","*azepam*","OR",2,57,369,7547
0,"Like","*alprazolam*","OR",2,57,369,7548
0,"Like","*chlordiazepoxide*","OR",2,57,369,7549
0,"Like","*clobazam*","OR",2,57,369,7550
0,"Like","*clorazepate dipotassium*","OR",2,57,369,7551
0,"Like","*loprazolam*","OR",2,27,369,7552
0,"Like","*loprazolam*","OR",2,57,369,7553
0,"Like","*loprazolam*","OR",2,36,369,7554
0,"Like","*midazolam*","OR",2,27,369,7555
0,"Like","*midazolam*","OR",2,36,369,7556
0,"Like","*midazolam*",,2,57,369,7557
0,"Like","*azepam*","OR",1,14,370,7558
0,"Like","*alprazolam*","OR",1,14,370,7559
0,"Like","*chlordiazepox*","OR",1,14,370,7560
0,"Like","*clobazam*","OR",1,14,370,7561
0,"Like","*clorazepate dip*","OR",1,14,370,7562
0,"Like","*loprazolam*","OR",1,14,370,7563
0,"Like","*midazolam*",,1,14,370,7564
0,"Like","*consumer?h?ld*","OR",2,27,371,7565
0,"Like","*client?h?ld*","OR",2,27,371,7566
0,"Like","*user?h?ld*","OR",2,27,371,7567
0,"Like","*patient?h?ld*","OR",2,27,371,7568
0,"Like","*consumer?particip*","OR",2,27,371,7569
0,"Like","*client?particip*","OR",2,27,371,7570
0,"Like","*user?particip*","OR",2,27,371,7571
0,"Like","*patient?particip*","OR",2,27,371,7572
0,"Like","*consumer?h?ld*","OR",2,36,371,7573
0,"Like","*client?h?ld*","OR",2,36,371,7574
0,"Like","*user?h?ld*","OR",2,36,371,7575
0,"Like","*patient?h?ld*","OR",2,36,371,7576
0,"Like","*consumer?particip*","OR",2,36,371,7577
0,"Like","*client?particip*","OR",2,36,371,7578
0,"Like","*user?particip*","OR",2,36,371,7579
0,"Like","*patient?particip*","OR",2,36,371,7580
0,"Like","*consumer?h?ld*","OR",2,57,371,7581
0,"Like","*client?h?ld*","OR",2,57,371,7582
0,"Like","*user?h?ld*","OR",2,57,371,7583
0,"Like","*patient?h?ld*","OR",2,57,371,7584
0,"Like","*consumer?particip*","OR",2,57,371,7585
0,"Like","*client?particip*","OR",2,57,371,7586
0,"Like","*user?particip*","OR",2,57,371,7587
0,"Like","*patient?particip*",,2,57,371,7588
0,"Like","*decision*","OR",1,14,372,7589
0,"Like","patient info*",,1,14,372,7590
0,"Like","medical record*","OR",1,14,372,7591
0,"Like","patient particip*","OR",1,14,372,7592
0,"Like","*anticholiner*","OR",2,27,373,7593
0,"Like","*trihexyphen*","OR",2,27,373,7594
0,"Like","*benzhex*","OR",2,27,373,7595
0,"Like","*broflex*","OR",2,27,373,7596
0,"Like","*benzatrop*","OR",2,27,373,7597
0,"Like","*cogentin*","OR",2,27,373,7598
0,"Like","*biperiden*","OR",2,27,373,7599
0,"Like","*akineto*","OR",2,27,373,7600
0,"Like","*anticholiner*","OR",2,36,373,7601
0,"Like","*trihexyphen*","OR",2,36,373,7602
0,"Like","*benzhex*","OR",2,36,373,7603
0,"Like","*broflex*","OR",2,36,373,7604
0,"Like","*benzatrop*","OR",2,36,373,7605
0,"Like","*cogentin*","OR",2,36,373,7606
0,"Like","*biperiden*","OR",2,36,373,7607
0,"Like","*akineto*","OR",2,36,373,7608
0,"Like","*anticholiner*","OR",2,57,373,7609
0,"Like","*trihexyphen*","OR",2,57,373,7610
0,"Like","*benzhex*","OR",2,57,373,7611
0,"Like","*broflex*","OR",2,57,373,7612
0,"Like","*benzatrop*","OR",2,57,373,7613
0,"Like","*cogentin*","OR",2,57,373,7614
0,"Like","*biperiden*","OR",2,57,373,7615
0,"Like","*akineto*",,2,57,373,7616
0,"Like","Olanzapine*","OR",2,27,377,7652
0,"Like","*Olanzapine*","OR",2,27,377,7653
0,"Like","*Olanzapine*","OR",2,57,377,7654
0,"Like","*Olanzapine*","OR",2,36,377,7655
0,"Like","zyprex*","OR",2,27,377,7656
0,"Like","*zyprex*","OR",2,27,377,7657
0,"Like","*zyprex*","OR",2,57,377,7658
0,"Like","*zyprex*",,2,36,377,7659
0,"Like","*zotapin*","OR",2,27,379,7678
0,"Like","*lodopin*","OR",2,27,379,7679
0,"Like","*nipolept*","OR",2,27,379,7680
0,"Like","*zopite*","OR",2,27,379,7681
0,"Like","*setous*","OR",2,27,379,7682
0,"Like","*majorpin*","OR",2,27,379,7683
0,"Like","zotepin*","OR",2,27,379,7684
0,"Like","lodopin*","OR",2,27,379,7685
0,"Like","nipolept*","OR",2,27,379,7686
0,"Like","zopite*","OR",2,27,379,7687
0,"Like","setous*","OR",2,27,379,7688
0,"Like","majorpin*",,2,27,379,7689
0,"Like","*zotapin*","OR",2,36,379,7690
0,"Like","*lodopin*","OR",2,36,379,7691
0,"Like","*nipolept*","OR",2,36,379,7692
0,"Like","*zopite*","OR",2,36,379,7693
0,"Like","*setous*","OR",2,36,379,7694
0,"Like","*majorpin*","OR",2,36,379,7695
0,"Like","zotepin*","OR",2,36,379,7696
0,"Like","*zotapin*","OR",2,57,379,7697
0,"Like","*lodopin*","OR",2,57,379,7698
0,"Like","*nipolept*","OR",2,57,379,7699
0,"Like","*zopite*","OR",2,57,379,7700
0,"Like","*setous*","OR",2,57,379,7701
0,"Like","*majorpin*","OR",2,57,379,7702
0,"Like","atypical*","OR",2,27,380,7703
0,"Like","*atypical*","OR",2,27,380,7704
0,"Like","*atypical*","OR",2,36,380,7705
0,"Like","*atypical*",,2,57,380,7706
0,"Like","game*","OR",2,27,381,7707
0,"Like","*game*","OR",2,27,381,7708
0,"Like","*game*","OR",2,36,381,7709
0,"Like","*game*",,2,57,381,7710
0,"Like","*zotapin*","OR",2,27,382,7711
0,"Like","*lodopin*","OR",2,27,382,7712
0,"Like","*nipolept*","OR",2,27,382,7713
0,"Like","*zopite*","OR",2,27,382,7714
0,"Like","*setous*","OR",2,27,382,7715
0,"Like","*majorpin*","OR",2,27,382,7716
0,"Like","zotepin*","OR",2,27,382,7717
0,"Like","lodopin*","OR",2,27,382,7718
0,"Like","nipolept*","OR",2,27,382,7719
0,"Like","zopite*","OR",2,27,382,7720
0,"Like","setous*","OR",2,27,382,7721
0,"Like","majorpin*","OR",2,27,382,7722
0,"Like","*zotapin*","OR",2,36,382,7723
0,"Like","*lodopin*","OR",2,36,382,7724
0,"Like","*nipolept*","OR",2,36,382,7725
0,"Like","*zopite*","OR",2,36,382,7726
0,"Like","*setous*","OR",2,36,382,7727
0,"Like","*majorpin*","OR",2,36,382,7728
0,"Like","zotepin*","OR",2,36,382,7729
0,"Like","*zotapin*","OR",2,57,382,7730
0,"Like","*lodopin*","OR",2,57,382,7731
0,"Like","*nipolept*","OR",2,57,382,7732
0,"Like","*zopite*","OR",2,57,382,7733
0,"Like","*setous*","OR",2,57,382,7734
0,"Like","*majorpin*","OR",2,57,382,7735
0,"Like","*zotepin*","OR",1,14,383,7736
0,"Like","*lodopin*","OR",1,14,383,7737
0,"Like","*nipolet*","OR",1,14,383,7738
0,"Like","*zopite*","OR",1,14,383,7739
0,"Like","*setous*","OR",1,14,383,7740
0,"Like","*majorpin*",,1,14,383,7741
0,"Like","life*","OR",2,27,384,7742
0,"Like","*life*","OR",2,27,384,7743
0,"Like","*social*","OR",2,27,384,7744
0,"Like","social*","OR",2,27,384,7745
0,"Like","self?care*","OR",2,27,384,7746
0,"Like","*self?care*","OR",2,27,384,7747
0,"Like","living*","OR",2,27,384,7748
0,"Like","*living*","OR",2,27,384,7749
0,"Like","community*","OR",2,27,384,7750
0,"Like","*community*","OR",2,27,384,7751
0,"Like","*life*","OR",2,36,384,7752
0,"Like","*social*","OR",2,36,384,7753
0,"Like","*self?care*","OR",2,36,384,7754
0,"Like","*living*","OR",2,36,384,7755
0,"Like","*community*","OR",2,36,384,7756
0,"Like","*life*","OR",2,57,384,7757
0,"Like","*social*","OR",2,57,384,7758
0,"Like","*self?care*","OR",2,57,384,7759
0,"Like","*living*","OR",2,57,384,7760
0,"Like","*community*",,2,57,384,7761
0,"Like","skill*","OR",2,27,385,7762
0,"Like","*skill*","OR",2,27,385,7763
0,"Like","program*","OR",2,27,385,7764
0,"Like","*program*","OR",2,27,385,7765
0,"Like","*skill*","OR",2,36,385,7766
0,"Like","*program*","OR",2,36,385,7767
0,"Like","*skill*","OR",2,57,385,7768
0,"Like","*program*",,2,57,385,7769
0,"Like","daily*","OR",2,27,386,7770
0,"Like","*daily*","OR",2,27,386,7771
0,"Like","*daily*","OR",2,36,386,7772
0,"Like","*daily*",,2,57,386,7773
0,"Like","living*","OR",2,27,387,7774
0,"Like","*living*","OR",2,27,387,7775
0,"Like","*living*","OR",2,36,387,7776
0,"Like","*living*",,2,57,387,7777
0,"Like","independent*","OR",2,27,388,7778
0,"Like","*independent*","OR",2,27,388,7779
0,"Like","*independent*","OR",2,36,388,7780
0,"Like","*independent*",,2,57,388,7781
0,"Like","function*","OR",2,27,389,7782
0,"Like","*function*","OR",2,27,389,7783
0,"Like","*function*","OR",2,36,389,7784
0,"Like","*function*",,2,57,389,7785
0,"Like","rehabilitation*","OR",2,27,390,7786
0,"Like","*rehabilitation*","OR",2,27,390,7787
0,"Like","*rehabilitation*","OR",2,36,390,7788
0,"Like","*rehabilitation*",,2,57,390,7789
0,"Like","* cognitiv*","OR",2,27,391,7790
0,"Like","cognitiv*","OR",2,27,391,7791
0,"Like","* learning*","OR",2,27,391,7792
0,"Like","learning*","OR",2,27,391,7793
0,"Like","* mental*","OR",2,27,391,7794
0,"Like","mental*","OR",2,27,391,7795
0,"Like","*intellig*","OR",2,27,391,7796
0,"Like","intellig*","OR",2,27,391,7797
0,"Like","* cognitiv*","OR",2,36,391,7798
0,"Like","*learning*","OR",2,36,391,7799
0,"Like","* mental*","OR",2,36,391,7800
0,"Like","*intellig*","OR",2,36,391,7801
0,"Like","* cognitiv*","OR",2,57,391,7802
0,"Like","*learning*","OR",2,57,391,7803
0,"Like","* mental*","OR",2,57,391,7804
0,"Like","*intellig*",,2,57,391,7805
0,"Like","*disorder*","OR",2,27,392,7806
0,"Like","*disab*","OR",2,27,392,7807
0,"Like","*defic*","OR",2,27,392,7808
0,"Like","*difficult*","OR",2,27,392,7809
0,"Like","*problem*","OR",2,27,392,7810
0,"Like","*impair*","OR",2,27,392,7811
0,"Like","*handi*","OR",2,27,392,7812
0,"Like","*retard*","OR",2,27,392,7813
0,"Like","* disorder*","OR",2,36,392,7814
0,"Like","* disab*","OR",2,36,392,7815
0,"Like","* defic*","OR",2,36,392,7816
0,"Like","* difficult*","OR",2,36,392,7817
0,"Like","* problem*","OR",2,36,392,7818
0,"Like","* impair*","OR",2,36,392,7819
0,"Like","* handi*","OR",2,36,392,7820
0,"Like","* retard*","OR",2,36,392,7821
0,"Like","*disorder*","OR",2,57,392,7822
0,"Like","*disab*","OR",2,57,392,7823
0,"Like","*defic*","OR",2,57,392,7824
0,"Like","*difficult*","OR",2,57,392,7825
0,"Like","*problem*","OR",2,57,392,7826
0,"Like","*impair*","OR",2,57,392,7827
0,"Like","*handi*","OR",2,57,392,7828
0,"Like","*retard*","OR",2,57,392,7829
0,"Like","*fragile*","OR",2,27,393,7830
0,"Like","*down syn*","OR",2,27,393,7831
0,"Like","*down's syn*","OR",2,27,393,7832
0,"Like","*down-syn*","OR",2,27,393,7833
0,"Like","*downs-syn*","OR",2,27,393,7834
0,"Like","*phenylketonuria*","OR",2,27,393,7835
0,"Like","*subnormal*","OR",2,27,393,7836
0,"Like","*oligophrenia*","OR",2,27,393,7837
0,"Like","* fragile*","OR",2,36,393,7838
0,"Like","*down syn*","OR",2,36,393,7839
0,"Like","*down's syn*","OR",2,36,393,7840
0,"Like","*down-syn*","OR",2,36,393,7841
0,"Like","*downs-syn*","OR",2,36,393,7842
0,"Like","*phenylketonuria*","OR",2,36,393,7843
0,"Like","*subnormal*","OR",2,36,393,7844
0,"Like","*oligophrenia*","OR",2,36,393,7845
0,"Like","* fragile*","OR",2,57,393,7846
0,"Like","*down syn*","OR",2,57,393,7847
0,"Like","*down's syn*","OR",2,57,393,7848
0,"Like","*down-syn*","OR",2,57,393,7849
0,"Like","*downs-syn*","OR",2,57,393,7850
0,"Like","*phenylketonuria*","OR",2,57,393,7851
0,"Like","*subnormal*","OR",2,57,393,7852
0,"Like","*oligophrenia*",,2,57,393,7853
0,"Like","Learning Disorders*","OR",1,15,394,7854
0,"Like","Down Syndrome*","OR",1,15,394,7855
0,"Like","cognition disorder*",,1,15,394,7856
0,"Like","acute*","OR",2,27,396,7861
0,"Like","*acute*","OR",2,27,396,7862
0,"Like","*acute*","OR",2,36,396,7863
0,"Like","*acute*","OR",2,57,396,7864
0,"Like","cris?s*","OR",2,27,396,7865
0,"Like","*cris?s*","OR",2,27,396,7866
0,"Like","*cris?s*","OR",2,36,396,7867
0,"Like","*cris?s*","OR",2,57,396,7868
0,"Like","emergenc*","OR",2,27,396,7869
0,"Like","*emergenc*","OR",2,27,396,7870
0,"Like","*emergenc*","OR",2,36,396,7871
0,"Like","*emergenc*","OR",2,57,396,7872
0,"Like","intensiv*","OR",2,27,396,7873
0,"Like","*intensiv*","OR",2,27,396,7874
0,"Like","*intensiv*","OR",2,36,396,7875
0,"Like","*intensiv*","OR",2,57,396,7876
0,"Like","mobile*","OR",2,27,396,7877
0,"Like","*mobile*","OR",2,27,396,7878
0,"Like","*mobile*","OR",2,57,396,7879
0,"Like","*mobile*","OR",2,36,396,7880
0,"Like","*outreach*","OR",2,27,396,7881
0,"Like","outreach*","OR",2,27,396,7882
0,"Like","*outreach*","OR",2,36,396,7883
0,"Like","*outreach*",,2,57,396,7884
0,"Like","commun*","OR",2,27,397,7885
0,"Like","*commun*","OR",2,27,397,7886
0,"Like","*commun*","OR",2,36,397,7887
0,"Like","*commun*","OR",2,57,397,7888
0,"Like","home*","OR",2,27,397,7889
0,"Like","*home*","OR",2,27,397,7890
0,"Like","*home*","OR",2,36,397,7891
0,"Like","*home*",,2,57,397,7892
0,"Like","care*","OR",2,27,398,7893
0,"Like","*care*","OR",2,27,398,7894
0,"Like","*care*","OR",2,36,398,7895
0,"Like","*care*","OR",2,57,398,7896
0,"Like","interven*","OR",2,27,398,7897
0,"Like","*interven*","OR",2,27,398,7898
0,"Like","*interven*","OR",2,36,398,7899
0,"Like","*interven*","OR",2,57,398,7900
0,"Like","treat*","OR",2,27,398,7901
0,"Like","*treat*","OR",2,36,398,7902
0,"Like","*treat*","OR",2,27,398,7903
0,"Like","*treat*","OR",2,57,398,7904
0,"Like","therap*","OR",2,27,398,7905
0,"Like","*therap*","OR",2,27,398,7906
0,"Like","*therap*","OR",2,36,398,7907
0,"Like","*therap*","OR",2,57,398,7908
0,"Like","managem*","OR",2,27,398,7909
0,"Like","*managem*","OR",2,27,398,7910
0,"Like","*managem*","OR",2,36,398,7911
0,"Like","*managem*","OR",2,57,398,7912
0,"Like","model*","OR",2,27,398,7913
0,"Like","*model*","OR",2,27,398,7914
0,"Like","*model*","OR",2,36,398,7915
0,"Like","*model*",,2,57,398,7916
0,"Like","programm*","OR",2,27,399,7917
0,"Like","*programm*","OR",2,27,399,7918
0,"Like","team*","OR",2,27,399,7919
0,"Like","*team*","OR",2,27,399,7920
0,"Like","service*","OR",2,27,399,7921
0,"Like","*service*","OR",2,27,399,7922
0,"Like","base*","OR",2,27,399,7923
0,"Like","*base*","OR",2,27,399,7924
0,"Like","*programm*","OR",2,36,399,7925
0,"Like","*team*","OR",2,36,399,7926
0,"Like","*service*","OR",2,36,399,7927
0,"Like","*base*","OR",2,36,399,7928
0,"Like","*programm*","OR",2,57,399,7929
0,"Like","*team*","OR",2,57,399,7930
0,"Like","*service*","OR",2,57,399,7931
0,"Like","*base*",,2,57,399,7932
0,"Like","*antidepress*","OR",2,27,400,7933
0,"Like","*amerser*","OR",2,27,400,7934
0,"Like","*amineptin*","OR",2,27,400,7935
0,"Like","*triptylin*","OR",2,27,400,7936
0,"Like","*amoxapin*","OR",2,27,400,7937
0,"Like","*benactyzin*","OR",2,27,400,7938
0,"Like","antidepr*","OR",2,27,400,7939
0,"Like","tripty*","OR",2,27,400,7940
0,"Like","amese*","OR",2,27,400,7941
0,"Like","aminep*","OR",2,27,400,7942
0,"Like","amoxap*","OR",2,27,400,7943
0,"Like","benact*",,2,27,400,7944
0,"Like","*antidepress*","OR",2,36,400,7945
0,"Like","*ameser*","OR",2,36,400,7946
0,"Like","*amineptie*","OR",2,36,400,7947
0,"Like","*triptylin*","OR",2,36,400,7948
0,"Like","*amoxapin*","OR",2,36,400,7949
0,"Like","*benactyzin*","OR",2,36,400,7950
0,"Like","*antidepress*","OR",2,57,400,7951
0,"Like","*ameser*","OR",2,57,400,7952
0,"Like","*amineptin*","OR",2,57,400,7953
0,"Like","*triptyline*","OR",2,57,400,7954
0,"Like","*amoxapin*","OR",2,57,400,7955
0,"Like","*benactyzin*","OR",2,57,400,7956
0,"Like","brofaro*","OR",2,27,401,7957
0,"Like","*brofaro*","OR",2,27,401,7958
0,"Like","bupropi*","OR",2,27,401,7959
0,"Like","*bupropi*","OR",2,27,401,7960
0,"Like","caroxa*","OR",2,27,401,7961
0,"Like","*caroxa*","OR",2,27,401,7962
0,"Like","*pramin*","OR",2,27,401,7963
0,"Like","citalopra*","OR",2,27,401,7964
0,"Like","*citalopra*","OR",2,27,401,7965
0,"Like","clorgy*","OR",2,27,401,7966
0,"Like","*clorgy*","OR",2,27,401,7967
0,"Like","imipram*","OR",2,27,401,7968
0,"Like","*oxamin*","OR",2,27,401,7969
0,"Like","*brofar*","OR",2,36,401,7970
0,"Like","*buprop*","OR",2,36,401,7971
0,"Like","*caroxaz*","OR",2,36,401,7972
0,"Like","*pramin*","OR",2,36,401,7973
0,"Like","*citalopr*","OR",2,36,401,7974
0,"Like","*clorgy*","OR",2,36,401,7975
0,"Like","*oxamin*","OR",2,36,401,7976
0,"Like","*brofar*","OR",2,57,401,7977
0,"Like","*caroxaz*","OR",2,57,401,7978
0,"Like","*pramin*","OR",2,57,401,7979
0,"Like","*citalopr*","OR",2,57,401,7980
0,"Like","*clorgy*","OR",2,57,401,7981
0,"Like","*oxamin*",,2,57,401,7982
0,"Like","*acute*","OR",2,27,402,7983
0,"Like","acute*","OR",2,27,402,7984
0,"Like","*cris?s*","OR",2,27,402,7985
0,"Like","cris?s","OR",2,27,402,7986
0,"Like","*emergenc*","OR",2,27,402,7987
0,"Like","emergenc*","OR",2,27,402,7988
0,"Like","intensiv*","OR",2,27,402,7989
0,"Like","*intensiv*","OR",2,27,402,7990
0,"Like","*mobile*","OR",2,27,402,7991
0,"Like","mobile*","OR",2,27,402,7992
0,"Like","outreach*","OR",2,27,402,7993
0,"Like","*outreach*","OR",2,27,402,7994
0,"Like","commun*","OR",2,27,402,7995
0,"Like","*commun*","OR",2,27,402,7996
0,"Like","*home*","OR",2,27,402,7997
0,"Like","home*",,2,27,402,7998
0,"Like","care*","OR",2,27,403,7999
0,"Like","* care*","OR",2,27,403,8000
0,"Like","*interven*","OR",2,27,403,8001
0,"Like","interven*","OR",2,27,403,8002
0,"Like","treat*","OR",2,27,403,8003
0,"Like","*treat*","OR",2,27,403,8004
0,"Like","therap*","OR",2,27,403,8005
0,"Like","*therap*","OR",2,27,403,8006
0,"Like","managem*","OR",2,27,403,8007
0,"Like","*managem*","OR",2,27,403,8008
0,"Like","model*","OR",2,27,403,8009
0,"Like","*model*","OR",2,27,403,8010
0,"Like","programm*","OR",2,27,403,8011
0,"Like","*programm*","OR",2,27,403,8012
0,"Like","team*","OR",2,27,403,8013
0,"Like","*team*","OR",2,27,403,8014
0,"Like","*service*","OR",2,27,403,8015
0,"Like","*service*","OR",2,27,403,8016
0,"Like","*base*","OR",2,27,403,8017
0,"Like","base*",,2,27,403,8018
0,"Like","crisis*","OR",1,14,404,8019
0,"Like","critical time int*","OR",1,14,404,8020
0,"Like","district psychiatric c*","OR",1,14,404,8021
0,"Like","*brief intensive*",,1,14,404,8022
0,"Like","brief hosp*","OR",1,14,404,8023
0,"Like","community mental health service, i*","OR",1,14,404,8024
0,"Like","community resid*","OR",1,14,404,8025
0,"Like","*observation*","OR",2,27,405,8026
0,"Like","*aggressi*","OR",2,27,405,8027
0,"Like","observation*","OR",2,27,405,8028
0,"Like","aggressi*","OR",2,27,405,8029
0,"Like","*suicid*","OR",2,27,405,8030
0,"Like","suicid*","OR",2,27,405,8031
0,"Like","*violen*","OR",2,27,405,8032
0,"Like","violen*","OR",2,27,405,8033
0,"Like","*de-escalat*","OR",2,27,405,8034
0,"Like","de-escalat*","OR",2,27,405,8035
0,"Like","*deescalat*","OR",2,27,405,8036
0,"Like","deescalat*",,2,27,405,8037
0,"Like","*observation*","OR",2,36,405,8038
0,"Like","*aggressi*","OR",2,36,405,8039
0,"Like","*suicid*","OR",2,36,405,8040
0,"Like","*violen*","OR",2,36,405,8041
0,"Like","*de-escalat*","OR",2,36,405,8042
0,"Like","*deescalat*","OR",2,36,405,8043
0,"Like","*observation*","OR",2,57,405,8044
0,"Like","*aggressi*","OR",2,57,405,8045
0,"Like","*suicid*","OR",2,57,405,8046
0,"Like","*violen*","OR",2,57,405,8047
0,"Like","*de-escalat*","OR",2,57,405,8048
0,"Like","*deescalat*","OR",2,57,405,8049
0,"Like","*one-to-one*","OR",2,27,406,8050
0,"Like","one-to-one*","OR",2,27,406,8051
0,"Like","*one to one*","OR",2,27,406,8052
0,"Like","one to one*","OR",2,27,406,8053
0,"Like","*one-to-one*","OR",2,36,406,8054
0,"Like","*one to one*","OR",2,36,406,8055
0,"Like","*one-to-one*","OR",2,57,406,8056
0,"Like","*one to one*","OR",2,57,406,8057
0,"Like","*one-to-one*","OR",2,27,407,8058
0,"Like","one-to-one*","OR",2,27,407,8059
0,"Like","*one to one*","OR",2,27,407,8060
0,"Like","one to one*","OR",2,27,407,8061
0,"Like","*door*","OR",2,27,407,8062
0,"Like","door*",,2,27,407,8063
0,"Like","*one-to-one*","OR",2,36,407,8064
0,"Like","*one to one*","OR",2,36,407,8065
0,"Like","*door*","OR",2,36,407,8066
0,"Like","*one-to-one*","OR",2,57,407,8067
0,"Like","*one to one*","OR",2,57,407,8068
0,"Like","*door*","OR",2,57,407,8069
0,"Like","*min*","OR",2,27,408,8070
0,"Like","min*","OR",2,27,408,8071
0,"Like","hour*","OR",2,27,408,8072
0,"Like","*hour*","OR",2,27,408,8073
0,"Like","periodic*","OR",2,27,408,8074
0,"Like","*periodic*","OR",2,27,408,8075
0,"Like","behav*","OR",2,27,408,8076
0,"Like","*behav*","OR",2,27,408,8077
0,"Like","*min*","OR",2,36,408,8078
0,"Like","*hour*","OR",2,36,408,8079
0,"Like","*periodic*","OR",2,36,408,8080
0,"Like","*behav*","OR",2,36,408,8081
0,"Like","*min*","OR",2,57,408,8082
0,"Like","*hour*","OR",2,57,408,8083
0,"Like","*periodic*","OR",2,57,408,8084
0,"Like","*behav*",,2,57,408,8085
0,"Like","*check*","OR",2,27,409,8086
0,"Like","check*","OR",2,27,409,8087
0,"Like","*check*","OR",2,36,409,8088
0,"Like","*check*",,2,57,409,8089
0,"Like","behav*","OR",1,14,410,8090
0,"Like","suicid*","OR",1,14,410,8091
0,"Like","secure w*","OR",1,14,410,8092
0,"Like","aggres*",,1,14,410,8093
0,"Like","*negative symptom*","OR",2,27,411,8094
0,"Like","*negative symptom*","OR",2,36,411,8095
0,"Like","*negative symptom*",,2,57,411,8096
0,"Like","*negative symptom*","OR",2,27,412,8097
0,"Like","negative symp*","OR",2,27,412,8098
0,"Like","*antidepress*","OR",2,27,412,8099
0,"Like","antidepress*","OR",2,27,412,8100
0,"Like","mood disorder*","OR",2,27,412,8101
0,"Like","*mood disorder*","OR",2,27,412,8102
0,"Like","*negative symptom*","OR",2,36,412,8103
0,"Like","*antidepress*","OR",2,36,412,8104
0,"Like","*mood disorder*","OR",2,36,412,8105
0,"Like","*negative symptom*","OR",2,57,412,8106
0,"Like","*antidepress*","OR",2,57,412,8107
0,"Like","*mood disorder*",,2,57,412,8108
0,"Like","Lamotrigin*","OR",2,27,413,8109
0,"Like","*lamotrigin*","OR",2,27,413,8110
0,"Like","*lamotrigin*","OR",2,36,413,8111
0,"Like","*lamotrigin*","OR",2,57,413,8112
0,"Like","Lamictal*","OR",2,27,413,8113
0,"Like","*lamictal*","OR",2,27,413,8114
0,"Like","*lamictal*","OR",2,36,413,8115
0,"Like","*lamictal*","OR",2,57,413,8116
0,"Like","*lamictin*","OR",2,27,413,8117
0,"Like","*lamictin*","OR",2,36,413,8118
0,"Like","*lamictin*","OR",2,57,413,8119
0,"Like","lamictin*","OR",2,27,413,8120
0,"Like","*labileno*","OR",2,27,413,8121
0,"Like","labileno*","OR",2,27,413,8122
0,"Like","*labileno*","OR",2,36,413,8123
0,"Like","*labileno*",,2,57,413,8124
0,"Like","*lamictal*","OR",1,14,414,8125
0,"Like","*lamictin*","OR",1,14,414,8126
0,"Like","*labileno*",,1,14,414,8127
0,"Like","*lamotrigine*","OR",1,14,414,8128
0,"Like","*depress*","OR",2,27,415,8129
0,"Like","depress*","OR",2,27,415,8130
0,"Like","affective*","OR",2,27,415,8131
0,"Like","* affective*","OR",2,27,415,8132
0,"Like","*mood disord*","OR",2,27,415,8133
0,"Like","mood disord*",,2,27,415,8134
0,"Like","*depress*","OR",2,36,415,8135
0,"Like","* affective*","OR",2,36,415,8136
0,"Like","*mood disord*","OR",2,36,415,8137
0,"Like","*depress*","OR",2,57,415,8138
0,"Like","* affective*","OR",2,57,415,8139
0,"Like","*mood disord*","OR",2,57,415,8140
0,"Like","*depressi*","OR",1,14,416,8141
0,"Like","*depressi*","OR",1,15,416,8142
0,"Like","affect*","OR",1,15,416,8143
0,"Like","mood*",,1,15,416,8144
0,"Like","clozapin*","OR",2,27,417,8145
0,"Like","*clozapin*","OR",2,27,417,8146
0,"Like","*clozapin*","OR",2,57,417,8147
0,"Like","*clozapin*","OR",2,36,417,8148
0,"Like","clozaril*","OR",2,27,417,8149
0,"Like","*clozaril*","OR",2,27,417,8150
0,"Like","*clozaril*","OR",2,57,417,8151
0,"Like","*clozaril*","OR",2,36,417,8152
0,"Like","leponex*","OR",2,27,417,8153
0,"Like","*leponex*","OR",2,27,417,8154
0,"Like","*leponex*","OR",2,36,417,8155
0,"Like","*leponex*",,2,57,417,8156
0,"Like","*clozapin*","OR",1,14,418,8157
0,"Like","*clozaril*","OR",1,14,418,8158
0,"Like","*leponex*",,1,14,418,8159
0,"Like","early*","OR",2,27,419,8160
0,"Like","*early*","OR",2,27,419,8161
0,"Like","*early*","OR",2,36,419,8162
0,"Like","*early*",,2,57,419,8163
0,"Like","*communit*","OR",2,27,420,8164
0,"Like","communit*",,2,27,420,8165
0,"Like","*communit*","OR",2,36,420,8166
0,"Like","*communit*","OR",2,57,420,8167
0,"Like","*team*","OR",2,27,421,8168
0,"Like","*cmht*","OR",2,27,421,8169
0,"Like","*home*","OR",2,27,421,8170
0,"Like","*team*","OR",2,36,421,8171
0,"Like","*cmht*","OR",2,36,421,8172
0,"Like","*home*","OR",2,36,421,8173
0,"Like","*team*","OR",2,57,421,8174
0,"Like","*cmht*","OR",2,57,421,8175
0,"Like","*home*","OR",2,57,421,8176
0,"Like","team*","OR",2,27,421,8177
0,"Like","cmht*","OR",2,27,421,8178
0,"Like","home*",,2,27,421,8179
0,"Like","*center*","OR",2,27,422,8180
0,"Like","*centre*","OR",2,27,422,8181
0,"Like","*treat*","OR",2,27,422,8182
0,"Like","center*","OR",2,27,422,8183
0,"Like","centre*","OR",2,27,422,8184
0,"Like","treat*",,2,27,422,8185
0,"Like","*center*","OR",2,36,422,8186
0,"Like","*centre*","OR",2,36,422,8187
0,"Like","*treat*","OR",2,36,422,8188
0,"Like","*center*","OR",2,57,422,8189
0,"Like","*centre*","OR",2,57,422,8190
0,"Like","*treat*","OR",2,57,422,8191
0,"Like","community*","OR",1,14,423,8192
0,"Like","home*",,1,14,423,8193
0,"Like","*orphenadr*","OR",2,27,424,8194
0,"Like","*biorphen*","OR",2,27,424,8195
0,"Like","*disipal*","OR",2,27,424,8196
0,"Like","*procyclid*","OR",2,27,424,8197
0,"Like","*arpicoli*","OR",2,27,424,8198
0,"Like","*kemadrin*","OR",2,27,424,8199
0,"Like","anticholine*",,2,27,424,8200
0,"Like","*orphenadr*","OR",2,36,424,8201
0,"Like","*biorphen*","OR",2,36,424,8202
0,"Like","*disipal*","OR",2,36,424,8203
0,"Like","*procyclid*","OR",2,36,424,8204
0,"Like","*arpicoli*","OR",2,36,424,8205
0,"Like","*kemadrin*","OR",2,36,424,8206
0,"Like","*orphenadr*","OR",2,57,424,8207
0,"Like","*biorphen*","OR",2,57,424,8208
0,"Like","*disipal*","OR",2,57,424,8209
0,"Like","*procyclid*","OR",2,57,424,8210
0,"Like","*arpicoli*","OR",2,57,424,8211
0,"Like","*kemadrin*","OR",2,57,424,8212
0,"Like","parkinson*","OR",2,27,425,8213
0,"Like","*parkinson*","OR",2,27,425,8214
0,"Like","*parkinson*","OR",2,36,425,8215
0,"Like","*parkinson*",,2,45,425,8216
0,"Like","sultoprid*","OR",2,27,429,8264
0,"Like","*sultoprid*","OR",2,27,429,8265
0,"Like","barnet*","OR",2,27,429,8266
0,"Like","*barnet*","OR",2,27,429,8267
0,"Like","barnotil*","OR",2,27,429,8268
0,"Like","*barnotil*","OR",2,27,429,8269
0,"Like","*sultoprid*","OR",2,36,429,8270
0,"Like","*barnet*","OR",2,36,429,8271
0,"Like","*barnotil*","OR",2,36,429,8272
0,"Like","*sultoprid*","OR",2,57,429,8273
0,"Like","*barnet*","OR",2,57,429,8274
0,"Like","*barnotil*",,2,57,429,8275
0,"Like","*sultoprid*","OR",1,14,430,8276
0,"Like","intermitt*","OR",1,14,434,8317
0,"Like","drug-free period*",,1,14,434,8318
0,"Like","anadep*","OR",2,27,436,8335
0,"Like","*anadep*","OR",2,27,436,8336
0,"Like","chlora*","OR",2,27,436,8337
0,"Like","* chlora*","OR",2,27,436,8338
0,"Like","chlorprom*","OR",2,27,436,8339
0,"Like","* chlorprom*","OR",2,27,436,8340
0,"Like","(chlor p-z*","OR",2,27,436,8341
0,"Like","*chlorprom*","OR",2,36,436,8342
0,"Like","* chlora*","OR",2,36,436,8343
0,"Like","*chlor p-z*","OR",2,36,436,8344
0,"Like","*chlor p-z*","OR",2,27,436,8345
0,"Like","*anadep*","OR",2,57,436,8346
0,"Like","* chlora*","OR",2,57,436,8347
0,"Like","*chlorprom*","OR",2,57,436,8348
0,"Like","*chlor p-z*","OR",2,57,436,8349
0,"Like","*anadep*","OR",2,36,436,8350
0,"Like","chromeda*","OR",2,27,436,8351
0,"Like","*chromeda*","OR",2,27,436,8352
0,"Like","*chromeda*","OR",2,36,436,8353
0,"Like","*chromeda*","OR",2,45,436,8354
0,"Like","cpz*","OR",2,27,436,8355
0,"Like","*cpz*","OR",2,27,436,8356
0,"Like","*cpz*","OR",2,36,436,8357
0,"Like","*cpz*",,2,57,436,8358
0,"Like","elmarine*","OR",2,27,438,8383
0,"Like","*elmarine*","OR",2,27,438,8384
0,"Like","*elmarine*","OR",2,36,438,8385
0,"Like","*elmarine*","OR",2,57,438,8386
0,"Like","*esmind*","OR",2,27,438,8387
0,"Like","esmind*","OR",2,27,438,8388
0,"Like","*esmind*","OR",2,36,438,8389
0,"Like","*esmind*","OR",2,57,438,8390
0,"Like","fenactil*","OR",2,27,438,8391
0,"Like","*fenactil*","OR",2,27,438,8392
0,"Like","*fenactil*","OR",2,36,438,8393
0,"Like","*fenactil*","OR",2,57,438,8394
0,"Like","hibanil*","OR",2,27,438,8395
0,"Like","*hibanil*","OR",2,27,438,8396
0,"Like","*hibanil*","OR",2,36,438,8397
0,"Like","*hibanil*","OR",2,57,438,8398
0,"Like","hibernal*","OR",2,27,438,8399
0,"Like","*hibernal*","OR",2,27,438,8400
0,"Like","*hibernal*","OR",2,36,438,8401
0,"Like","*hibernal*","OR",2,57,438,8402
0,"Like","klorazin*","OR",2,27,438,8403
0,"Like","*klorazin*","OR",2,27,438,8404
0,"Like","*klorazin*","OR",2,36,438,8405
0,"Like","*klorazin*",,2,57,438,8406
0,"Like","klorpro*","OR",2,27,439,8407
0,"Like","*klorpro*","OR",2,27,439,8408
0,"Like","*klorpro*","OR",2,36,439,8409
0,"Like","*klorpro*","OR",2,57,439,8410
0,"Like","largactil*","OR",2,27,439,8411
0,"Like","*largactil*","OR",2,27,439,8412
0,"Like","*largactil*","OR",2,36,439,8413
0,"Like","*largactil*","OR",2,57,439,8414
0,"Like","megaphen*","OR",2,27,439,8415
0,"Like","*megaphen*","OR",2,27,439,8416
0,"Like","*megaphen*","OR",2,36,439,8417
0,"Like","*megaphen*","OR",2,57,439,8418
0,"Like","neurazin*","OR",2,27,439,8419
0,"Like","*neurazin*","OR",2,27,439,8420
0,"Like","*neurazin*","OR",2,57,439,8421
0,"Like","*neurazin*","OR",2,36,439,8422
0,"Like","plegomaz*","OR",2,27,439,8423
0,"Like","*plegomaz*","OR",2,27,439,8424
0,"Like","*plegomaz*","OR",2,36,439,8425
0,"Like","*plegomaz*","OR",2,57,439,8426
0,"Like","procalm*","OR",2,27,439,8427
0,"Like","*procalm*","OR",2,27,439,8428
0,"Like","*procalm*","OR",2,36,439,8429
0,"Like","*procalm*",,2,57,439,8430
0,"Like","proma*","OR",2,27,440,8431
0,"Like","* proma*","OR",2,27,440,8432
0,"Like","* proma*","OR",2,36,440,8433
0,"Like","* proma*","OR",2,57,440,8434
0,"Like","promexin*","OR",2,27,440,8435
0,"Like","*promexin*","OR",2,27,440,8436
0,"Like","*promexin*","OR",2,36,440,8437
0,"Like","*promexin*","OR",2,57,440,8438
0,"Like","promosol*","OR",2,27,440,8439
0,"Like","*promosol*","OR",2,27,440,8440
0,"Like","*promosol*","OR",2,36,440,8441
0,"Like","*promosol*","OR",2,57,440,8442
0,"Like","prozil*","OR",2,27,440,8443
0,"Like","*prozil*","OR",2,27,440,8444
0,"Like","*prozil*","OR",2,36,440,8445
0,"Like","*prozil*","OR",2,57,440,8446
0,"Like","psychozin*","OR",2,27,440,8447
0,"Like","*psychozin*","OR",2,27,440,8448
0,"Like","*psychozin*","OR",2,36,440,8449
0,"Like","*psychozin*","OR",2,57,440,8450
0,"Like","psylactil*","OR",2,27,440,8451
0,"Like","*psylactil*","OR",2,27,440,8452
0,"Like","*psylactil*","OR",2,36,440,8453
0,"Like","*psylactil*",,2,57,440,8454
0,"Like","serazon*","OR",2,27,441,8455
0,"Like","*serazon*","OR",2,27,441,8456
0,"Like","sonazin*","OR",2,27,441,8457
0,"Like","*sonazin*","OR",2,27,441,8458
0,"Like","thoradex*","OR",2,27,441,8459
0,"Like","*thoradex*","OR",2,27,441,8460
0,"Like","tranzine*","OR",2,27,441,8461
0,"Like","*tranzine*","OR",2,27,441,8462
0,"Like","*serazon*","OR",2,36,441,8463
0,"Like","*sonazin*","OR",2,36,441,8464
0,"Like","*thoradex*","OR",2,36,441,8465
0,"Like","*tranzine*","OR",2,36,441,8466
0,"Like","*serazon*","OR",2,57,441,8467
0,"Like","*sonazin*","OR",2,57,441,8468
0,"Like","*thoradex*","OR",2,57,441,8469
0,"Like","*tranzine*",,2,57,441,8470
0,"Like","cessation*","OR",2,27,444,8509
0,"Like","*cessation*","OR",2,27,444,8510
0,"Like","withdr?w*","OR",2,27,444,8511
0,"Like","*withdr?w*","OR",2,27,444,8512
0,"Like","discontinu*","OR",2,27,444,8513
0,"Like","*disconinu*","OR",2,27,444,8514
0,"Like","stop*","OR",2,27,444,8515
0,"Like","* stop*","OR",2,27,444,8516
0,"Like","halt*","OR",2,27,444,8517
0,"Like","* halt*","OR",2,27,444,8518
0,"Like","drop?out*","OR",2,27,444,8519
0,"Like","*drop?out*","OR",2,27,444,8520
0,"Like","*dropout*","OR",2,27,444,8521
0,"Like","*cessation*","OR",2,36,444,8522
0,"Like","*withdr?w*","OR",2,36,444,8523
0,"Like","*disconinu*","OR",2,36,444,8524
0,"Like","* stop*","OR",2,36,444,8525
0,"Like","* halt*","OR",2,36,444,8526
0,"Like","*drop?out*","OR",2,36,444,8527
0,"Like","*dropou*","OR",2,36,444,8528
0,"Like","*cessation*","OR",2,57,444,8529
0,"Like","*withdr?w*`","OR",2,57,444,8530
0,"Like","*disconinu*","OR",2,57,444,8531
0,"Like","* stop*","OR",2,57,444,8532
0,"Like","* halt*","OR",2,57,444,8533
0,"Like","*drop?out*","OR",2,57,444,8534
0,"Like","withdra*","AND",1,14,447,8538
0,"Like","chlorprom*",,1,14,447,8539
0,"Like","* residen*","OR",2,27,448,8540
0,"Like","*hous*","OR",2,27,448,8541
0,"Like","*accomod*","OR",2,27,448,8542
0,"Like","*accomod*","OR",2,27,448,8543
0,"Like","*commun*","OR",2,27,448,8544
0,"Like","*comun*","OR",2,27,448,8545
0,"Like","*home*","OR",2,27,448,8546
0,"Like","home*","OR",2,27,448,8547
0,"Like","hous*","OR",2,27,448,8548
0,"Like","accomod*","OR",2,27,448,8549
0,"Like","commun*","OR",2,27,448,8550
0,"Like","* residen*","OR",2,36,448,8551
0,"Like","*hous*","OR",2,36,448,8552
0,"Like","*accomod*","OR",2,36,448,8553
0,"Like","*accomod*","OR",2,36,448,8554
0,"Like","*commun*","OR",2,36,448,8555
0,"Like","*comun*","OR",2,36,448,8556
0,"Like","*home*","OR",2,36,448,8557
0,"Like","* residen*","OR",2,57,448,8558
0,"Like","*hous*","OR",2,57,448,8559
0,"Like","*accomod*","OR",2,57,448,8560
0,"Like","*accomod*","OR",2,57,448,8561
0,"Like","*commun*","OR",2,57,448,8562
0,"Like","*comun*","OR",2,57,448,8563
0,"Like","*home*","OR",2,57,448,8564
0,"Like","*support*","OR",2,27,449,8565
0,"Like","*suport*","OR",2,27,449,8566
0,"Like","*shelter*","OR",2,27,449,8567
0,"Like","*outreach*","OR",2,27,449,8568
0,"Like","*visit*","OR",2,27,449,8569
0,"Like","*appointment*","OR",2,27,449,8570
0,"Like","support*","OR",2,27,449,8571
0,"Like","outreach*","OR",2,27,449,8572
0,"Like","visit*","OR",2,27,449,8573
0,"Like","appointm*","OR",2,27,449,8574
0,"Like","shelter*","OR",2,27,449,8575
0,"Like","*support*","OR",2,36,449,8576
0,"Like","*suport*","OR",2,36,449,8577
0,"Like","*shelter*","OR",2,36,449,8578
0,"Like","*outreach*","OR",2,36,449,8579
0,"Like","*visit*","OR",2,36,449,8580
0,"Like","*appointment*","OR",2,36,449,8581
0,"Like","*support*","OR",2,57,449,8582
0,"Like","*suport*","OR",2,57,449,8583
0,"Like","*shelter*","OR",2,57,449,8584
0,"Like","*outreach*","OR",2,57,449,8585
0,"Like","*visit*","OR",2,57,449,8586
0,"Like","*appointment*","OR",2,57,449,8587
0,"Like","*residential treatm*","OR",2,27,450,8588
0,"Like","*residential facilit*","OR",2,27,450,8589
0,"Like","residential fa*","OR",2,27,450,8590
0,"Like","residential tr*","OR",2,27,450,8591
0,"Like","supported hou*","OR",2,27,450,8592
0,"Like","public hou*","OR",2,27,450,8593
0,"Like","*residential treatm*","OR",2,36,450,8594
0,"Like","*residential facilit*","OR",2,36,450,8595
0,"Like","supported housin*","OR",2,45,450,8596
0,"Like","*residential treatm*","OR",2,57,450,8597
0,"Like","*public hous*","OR",2,57,450,8598
0,"Like","*residential facilit*","OR",2,57,450,8599
0,"Like","*housing*","OR",1,14,451,8600
0,"Like","*residen*","OR",1,14,451,8601
0,"Like","*home*","OR",1,14,451,8602
0,"Like","*outreach*","OR",1,14,451,8603
0,"Like","*accomod*","OR",1,14,451,8604
0,"Like","assertive community treat*","OR",1,14,451,8605
0,"Like","canna*","OR",2,27,454,8658
0,"Like","*canna*","OR",2,27,454,8659
0,"Like","*mari?uana*","OR",2,27,454,8660
0,"Like","mari?uana*","OR",2,27,454,8661
0,"Like","*canna*","OR",2,36,454,8662
0,"Like","*marijuana*","OR",2,36,454,8663
0,"Like","*marihuana*","OR",2,36,454,8664
0,"Like","*canna*","OR",2,57,454,8665
0,"Like","*marijuana*","OR",2,57,454,8666
0,"Like","*marihuana*",,2,57,454,8667
0,"Like","*weight*","OR",2,27,455,8668
0,"Like","*body mass*","OR",2,27,455,8669
0,"Like","*bmi*","OR",2,27,455,8670
0,"Like","* eat*","OR",2,27,455,8671
0,"Like","eat*","OR",2,27,455,8672
0,"Like","* obes*","OR",2,27,455,8673
0,"Like","obes*","OR",2,27,455,8674
0,"Like","* fat*","OR",2,27,455,8675
0,"Like","fat*","OR",2,27,455,8676
0,"Like","*weight*","OR",2,36,455,8677
0,"Like","*body mass*","OR",2,36,455,8678
0,"Like","*bmi*","OR",2,36,455,8679
0,"Like","* eat*","OR",2,36,455,8680
0,"Like","* obes*","OR",2,36,455,8681
0,"Like","* fat*","OR",2,36,455,8682
0,"Like","*weight*","OR",2,57,455,8683
0,"Like","*body mass*","OR",2,57,455,8684
0,"Like","*bmi*","OR",2,57,455,8685
0,"Like","* eat*","OR",2,57,455,8686
0,"Like","* obes*","OR",2,57,455,8687
0,"Like","* fat*","OR",2,57,455,8688
0,"Like","weight*","OR",2,27,455,8689
0,"Like","body mas*","OR",2,27,455,8690
0,"Like","bmi*",,2,27,455,8691
0,"Like","exercise*","OR",2,27,456,8692
0,"Like","diet*","OR",2,27,456,8693
0,"Like","sport*","OR",2,27,456,8694
0,"Like","physical ther*","OR",2,27,456,8695
0,"Like","physical activ*","OR",2,27,456,8696
0,"Like","*exercise*","OR",2,27,456,8697
0,"Like","*diet*","OR",2,27,456,8698
0,"Like","*sport*","OR",2,27,456,8699
0,"Like","*physical therap*","OR",2,27,456,8700
0,"Like","*physical activ*","OR",2,27,456,8701
0,"Like","*exercise*","OR",2,36,456,8702
0,"Like","*diet*","OR",2,36,456,8703
0,"Like","*sport*","OR",2,36,456,8704
0,"Like","*physical therap*","OR",2,36,456,8705
0,"Like","*physical activ*","OR",2,36,456,8706
0,"Like","*exercise*","OR",2,57,456,8707
0,"Like","*diet","OR",2,57,456,8708
0,"Like","*sport*","OR",2,57,456,8709
0,"Like","*physical therap*","OR",2,57,456,8710
0,"Like","*physical activ*","OR",2,57,456,8711
0,"Like","educat*","AND",2,27,457,8712
0,"Like","*educat*","OR",2,27,457,8713
0,"Like","*educat*","OR",2,36,457,8714
0,"Like","*educat*",,2,57,457,8715
0,"Like","psycho?educat*","OR",2,27,463,8744
0,"Like","*psycho?educat*","OR",2,27,463,8745
0,"Like","psychoeducat*","AND",2,27,463,8746
0,"Like","*psychoeducat*","OR",2,27,463,8747
0,"Like","*psycho?educat*","OR",2,36,463,8748
0,"Like","*psychoeducat*","OR",2,36,463,8749
0,"Like","*psycho?educat*","OR",2,57,463,8750
0,"Like","*psychoeducat*",,2,57,463,8751
0,"Like","patient*","OR",2,27,464,8752
0,"Like","*patient*","OR",2,27,464,8753
0,"Like","*patient*","OR",2,36,464,8754
0,"Like","*patient*",,2,57,464,8755
0,"Like","teach*","OR",2,27,465,8756
0,"Like","*teach*","OR",2,27,465,8757
0,"Like","instruction*","OR",2,27,465,8758
0,"Like","*instruction*","OR",2,27,465,8759
0,"Like","knowledg*","OR",2,27,465,8760
0,"Like","*knoweldg*","OR",2,27,465,8761
0,"Like","information*","OR",2,27,465,8762
0,"Like","*information",,2,27,465,8763
0,"Like","*teach*","OR",2,36,466,8764
0,"Like","*instruction*","OR",2,36,466,8765
0,"Like","*knoweldg*","OR",2,36,466,8766
0,"Like","*information*",,2,36,466,8767
0,"Like","*teach*","OR",2,57,467,8768
0,"Like","*instruction*","OR",2,57,467,8769
0,"Like","*knoweldg*","OR",2,57,467,8770
0,"Like","*information*",,2,57,467,8771
0,"Like","intervention*","OR",2,27,468,8772
0,"Like","*intervention*","OR",2,27,468,8773
0,"Like","program*","OR",2,27,468,8774
0,"Like","*program*","OR",2,27,468,8775
0,"Like","treatment*","OR",2,27,468,8776
0,"Like","*treatment*","OR",2,27,468,8777
0,"Like","therap*","OR",2,27,468,8778
0,"Like","*therap*","OR",2,27,468,8779
0,"Like","*intervention*","OR",2,36,468,8780
0,"Like","*program*","OR",2,36,468,8781
0,"Like","*treatment*","OR",2,36,468,8782
0,"Like","*therap*",,2,36,468,8783
0,"Like","*intervention*","OR",2,57,468,8784
0,"Like","*program*","OR",2,57,468,8785
0,"Like","*treatment*","OR",2,57,468,8786
0,"Like","*therap*","OR",2,57,468,8787
0,"Like","*educat*","OR",1,14,469,8788
0,"Like","family int*","OR",1,14,469,8789
0,"Like","patient informa*",,1,14,469,8790
0,"Like","fluspiril*","OR",2,27,470,8791
0,"Like","*fluspiril*","OR",2,27,470,8792
0,"Like","spirodifl*","OR",2,27,470,8793
0,"Like","*spirodifl*","OR",2,27,470,8794
0,"Like","redeptin*","OR",2,27,470,8795
0,"Like","*redeptin*","OR",2,27,470,8796
0,"Like","* kivat*","OR",2,27,470,8797
0,"Like","* imap *","OR",2,27,470,8798
0,"Like","*fluspiril*","OR",2,36,470,8799
0,"Like","*spirodifl*","OR",2,36,470,8800
0,"Like","*redeptin*","OR",2,36,470,8801
0,"Like","* kivat*","OR",2,36,470,8802
0,"Like","* imap *","OR",2,36,470,8803
0,"Like","*fluspiril*","OR",2,57,470,8804
0,"Like","*spirodifl*","OR",2,57,470,8805
0,"Like","*redeptin*","OR",2,57,470,8806
0,"Like","* kivat*","OR",2,57,470,8807
0,"Like","* imap *",,2,57,470,8808
0,"Like","*fluspiril*","OR",1,14,471,8809
0,"Like","*spirodifl*","OR",1,14,471,8810
0,"Like","*redeptin*","OR",1,14,471,8811
0,"Like","kivat*","OR",1,14,471,8812
0,"Like","imap*",,1,14,471,8813
0,"Like","TMS*","OR",2,27,472,8814
0,"Like","*TMS*","OR",2,27,472,8815
0,"Like","transcranial*","OR",2,27,472,8816
0,"Like","*transcranial*","OR",2,27,472,8817
0,"Like","trans?cranial*","OR",2,27,472,8818
0,"Like","*trans?cranial*","OR",2,27,472,8819
0,"Like","magnetic*","OR",2,27,472,8820
0,"Like","*magnetic*","OR",2,27,472,8821
0,"Like","*tms*","OR",2,36,472,8822
0,"Like","*transcranial*","OR",2,36,472,8823
0,"Like","*trans?cranial*","OR",2,36,472,8824
0,"Like","*magnetic*","OR",2,36,472,8825
0,"Like","*tms*","OR",2,57,472,8826
0,"Like","*transcranial*","OR",2,57,472,8827
0,"Like","*trans?cranial*","OR",2,57,472,8828
0,"Like","*magnetic*",,2,57,472,8829
0,"Like","*magnet*",,1,14,473,8830
0,"Like","puerperal*","OR",2,27,474,8831
0,"Like","pregna*","OR",2,27,474,8832
0,"Like","postpartum*","OR",2,27,474,8833
0,"Like","post?partum*","OR",2,27,474,8834
0,"Like","* puerperal*","OR",2,27,474,8835
0,"Like","*pregna*","OR",2,27,474,8836
0,"Like","*postpartum*
baby-blues*","OR",2,27,474,8837
0,"Like","*post-partum*","OR",2,27,474,8838
0,"Like","baby?blue*","OR",2,27,474,8839
0,"Like","*baby?blue*","OR",2,27,474,8840
0,"Like","* puerperal*","OR",2,36,474,8841
0,"Like","*pregna*","OR",2,36,474,8842
0,"Like","*post?partum*","OR",2,36,474,8843
0,"Like","* puerperal*","OR",2,36,474,8844
0,"Like","*pregna*","OR",2,36,474,8845
0,"Like","*postpartum*","OR",2,36,474,8846
0,"Like","*baby?blue*","OR",2,36,474,8847
0,"Like","* puerperal*","OR",2,57,474,8848
0,"Like","*post?partum*","OR",2,57,474,8849
0,"Like","*postpartum*","OR",2,57,474,8850
0,"Like","* pregna*","OR",2,57,474,8851
0,"Like","*baby?blue*",,2,57,474,8852
0,"Like","*pregnan*","OR",1,15,475,8853
0,"Like","*puerperal*",,1,15,475,8854
0,"Like","flupent*","OR",2,27,478,8891
0,"Like","*flupent*","OR",2,27,478,8892
0,"Like","fluanxol*","OR",2,27,478,8893
0,"Like","*fluanxol*","OR",2,27,478,8894
0,"Like","depixol*","OR",2,27,478,8895
0,"Like","*depixol*","OR",2,27,478,8896
0,"Like","lu 7105*","OR",2,27,478,8897
0,"Like","*lu 7105*","OR",2,27,478,8898
0,"Like","lu 5-110*","OR",2,27,478,8899
0,"Like","*lu 5-110*","OR",2,27,478,8900
0,"Like","*flupent*","OR",2,36,478,8901
0,"Like","*fluanxol*","OR",2,36,478,8902
0,"Like","*depixol*","OR",2,36,478,8903
0,"Like","*lu 7105*","OR",2,36,478,8904
0,"Like","*lu 5-110*","OR",2,36,478,8905
0,"Like","*flupentl*","OR",2,57,478,8906
0,"Like","*fluanxol*","OR",2,57,478,8907
0,"Like","*depixol*","OR",2,57,478,8908
0,"Like","*lu 7105*","OR",2,57,478,8909
0,"Like","*lu 5-110*",,2,57,478,8910
0,"Like","*depot*","OR",2,27,479,8911
0,"Like","*long?act*","OR",2,27,479,8912
0,"Like","*delayed?act*","OR",2,27,479,8913
0,"Like","depot*","OR",2,27,479,8914
0,"Like","delayed?act*","OR",2,27,479,8915
0,"Like","long?act*","OR",2,27,479,8916
0,"Like","decanoat*","OR",2,27,479,8917
0,"Like","*decanoat*","OR",2,27,479,8918
0,"Like","*depot*","OR",2,36,479,8919
0,"Like","*long?act*","OR",2,36,479,8920
0,"Like","*delayed?act*","OR",2,36,479,8921
0,"Like","*decanoat*","OR",2,36,479,8922
0,"Like","*depot*","OR",2,57,479,8923
0,"Like","*long?act*","OR",2,57,479,8924
0,"Like","*delayed?act*","OR",2,57,479,8925
0,"Like","*decanoat*",,2,57,479,8926
0,"Like","flupen*",,1,14,480,8927
0,"Like","flupentixol dec*","OR",1,14,480,8928
0,"Like","depot*","AND",1,14,480,8929
0,"Like","* abilit *","OR",2,27,481,8930
0,"Like","*championy*","OR",2,27,481,8931
0,"Like","*coolspan*","OR",2,27,481,8932
0,"Like","*col-sulpir*","OR",2,27,481,8933
0,"Like","*digton*","OR",2,27,481,8934
0,"Like","*dixibon*","OR",2,27,481,8935
0,"Like","*dobren*","OR",2,27,481,8936
0,"Like","do?matil*","OR",2,27,481,8937
0,"Like","*do?matil*","OR",2,27,481,8938
0,"Like","* abilit *","OR",2,36,481,8939
0,"Like","*championy*","OR",2,36,481,8940
0,"Like","*coolspan*","OR",2,36,481,8941
0,"Like","*col-sulpir*","OR",2,36,481,8942
0,"Like","*digton*","OR",2,36,481,8943
0,"Like","*dixibon*","OR",2,36,481,8944
0,"Like","*dobren*","OR",2,36,481,8945
0,"Like","*do?matil*","OR",2,36,481,8946
0,"Like","* abilit *","OR",2,57,481,8947
0,"Like","*championy*","OR",2,57,481,8948
0,"Like","*coolspan*","OR",2,57,481,8949
0,"Like","*col-sulpir*","OR",2,57,481,8950
0,"Like","*digton*","OR",2,57,481,8951
0,"Like","*dixibon*","OR",2,57,481,8952
0,"Like","*dobren*","OR",2,57,481,8953
0,"Like","*do?matil*",,2,57,481,8954
0,"Like","*drominet*","OR",2,27,482,8955
0,"Like","eglonyl*","OR",2,27,482,8956
0,"Like","*eglonyl*","OR",2,27,482,8957
0,"Like","*equilid*","OR",2,27,482,8958
0,"Like","*eusulpid*","OR",2,27,482,8959
0,"Like","*guastil*","OR",2,27,482,8960
0,"Like","*isnamid*","OR",2,27,482,8961
0,"Like","*kapirid*","OR",2,27,482,8962
0,"Like","*lavodina*","OR",2,27,482,8963
0,"Like","*drominet*","OR",2,36,482,8964
0,"Like","*eglonyl*","OR",2,36,482,8965
0,"Like","*equilid*","OR",2,36,482,8966
0,"Like","*eusulpid*","OR",2,36,482,8967
0,"Like","*guastil*","OR",2,36,482,8968
0,"Like","*isnamid*","OR",2,36,482,8969
0,"Like","*kapirid*","OR",2,36,482,8970
0,"Like","*lavodina*","OR",2,36,482,8971
0,"Like","*drominet*","OR",2,57,482,8972
0,"Like","*eglonyl*","OR",2,57,482,8973
0,"Like","*equilid*","OR",2,57,482,8974
0,"Like","*guastil*","OR",2,57,482,8975
0,"Like","*isnamid*","OR",2,57,482,8976
0,"Like","*kapirid*","OR",2,57,482,8977
0,"Like","*lavodina*",,2,57,482,8978
0,"Like","*leboprid*","OR",2,27,483,8979
0,"Like","*lusedan*","OR",2,27,483,8980
0,"Like","*miradol*","OR",2,27,483,8981
0,"Like","*mirbanil*","OR",2,27,483,8982
0,"Like","*misulvan*","OR",2,27,483,8983
0,"Like","*neuromyf*","OR",2,27,483,8984
0,"Like","*normum*","OR",2,27,483,8985
0,"Like","*lomperan*","OR",2,27,483,8986
0,"Like","*leboprid*","OR",2,36,483,8987
0,"Like","*lusedan*","OR",2,36,483,8988
0,"Like","*miradol*","OR",2,36,483,8989
0,"Like","*mirbanil*","OR",2,36,483,8990
0,"Like","*misulvan*","OR",2,36,483,8991
0,"Like","*neuromyf*","OR",2,36,483,8992
0,"Like","*normum*","OR",2,36,483,8993
0,"Like","*lomperan*","OR",2,36,483,8994
0,"Like","*leboprid*","OR",2,57,483,8995
0,"Like","*mirbanil*","OR",2,57,483,8996
0,"Like","*lusedan*","OR",2,57,483,8997
0,"Like","*miradol*","OR",2,57,483,8998
0,"Like","*misulvan*","OR",2,57,483,8999
0,"Like","*neuromyf*","OR",2,57,483,9000
0,"Like","*normum*","OR",2,57,483,9001
0,"Like","*lomperan*",,2,57,483,9002
0,"Like","*psicocen*","OR",2,27,484,9003
0,"Like","*quiridil*","OR",2,27,484,9004
0,"Like","* sato *","OR",2,27,484,9005
0,"Like","*sernevin*","OR",2,27,484,9006
0,"Like","*sicofren*","OR",2,27,484,9007
0,"Like","*sulp?ride*","OR",2,27,484,9008
0,"Like","*sulpised*","OR",2,27,484,9009
0,"Like","*suprium*","OR",2,27,484,9010
0,"Like","*psicocen*","OR",2,36,484,9011
0,"Like","*quiridil*","OR",2,36,484,9012
0,"Like","* sato *","OR",2,36,484,9013
0,"Like","*sernevin*","OR",2,36,484,9014
0,"Like","*sicofren*","OR",2,36,484,9015
0,"Like","*sulp?ride*","OR",2,36,484,9016
0,"Like","*sulpised*","OR",2,36,484,9017
0,"Like","*suprium*","OR",2,36,484,9018
0,"Like","*psicocen*","OR",2,57,484,9019
0,"Like","*quiridil*","OR",2,57,484,9020
0,"Like","* sato *","OR",2,57,484,9021
0,"Like","*sernevin*","OR",2,57,484,9022
0,"Like","*sicofren*","OR",2,57,484,9023
0,"Like","*sulp?ride*","OR",2,57,484,9024
0,"Like","*sulpised*","OR",2,57,484,9025
0,"Like","*suprium*",,2,57,484,9026
0,"Like","*sursumid*","OR",2,27,485,9027
0,"Like","*tepavil*","OR",2,27,485,9028
0,"Like","*tonofit*","OR",2,27,485,9029
0,"Like","* ulpir *","OR",2,27,485,9030
0,"Like","*vipral*","OR",2,27,485,9031
0,"Like","*sursumid*","OR",2,36,485,9032
0,"Like","*tepavil*","OR",2,36,485,9033
0,"Like","*tonofit*","OR",2,36,485,9034
0,"Like","* ulpir *","OR",2,36,485,9035
0,"Like","*vipral*","OR",2,36,485,9036
0,"Like","*sursumid*","OR",2,57,485,9037
0,"Like","*tepavil*","OR",2,57,485,9038
0,"Like","*tonofit*","OR",2,57,485,9039
0,"Like","* ulpir *","OR",2,57,485,9040
0,"Like","*vipral*",,2,57,485,9041
0,"Like","sulp?rid*",,1,14,486,9042
0,"Like","thiorida*","OR",2,27,487,9043
0,"Like","*thiorida*","OR",2,27,487,9044
0,"Like","tioridazin*","OR",2,27,487,9045
0,"Like","*tioridazin*","OR",2,27,487,9046
0,"Like","*sonapax*","OR",2,27,487,9047
0,"Like","* malor*","OR",2,27,487,9048
0,"Like","* mallor*","OR",2,27,487,9049
0,"Like","* meleri*","OR",2,27,487,9050
0,"Like","* mellaril*","OR",2,27,487,9051
0,"Like","* meller*","OR",2,27,487,9052
0,"Like","*thiorida*","OR",2,36,487,9053
0,"Like","*tioridazin*","OR",2,36,487,9054
0,"Like","* malor*","OR",2,36,487,9055
0,"Like","*sonapax*","OR",2,36,487,9056
0,"Like","* mallor*","OR",2,36,487,9057
0,"Like","* meleri*","OR",2,36,487,9058
0,"Like","* mellaril*","OR",2,36,487,9059
0,"Like","* meller*","OR",2,36,487,9060
0,"Like","*thiorida*","OR",2,57,487,9061
0,"Like","*tioridazin*","OR",2,57,487,9062
0,"Like","*sonapax*","OR",2,57,487,9063
0,"Like","* mallor*","OR",2,57,487,9064
0,"Like","* meleri*","OR",2,57,487,9065
0,"Like","* mellaril*","OR",2,57,487,9066
0,"Like","* meller*",,2,57,487,9067
0,"Like","thioridazin*",,1,14,488,9068
0,"Like","olanz*","AND",1,14,489,9069
0,"Like","placeb*",,1,14,489,9070
0,"Like","mother*","OR",1,14,491,9093
0,"Like","chil*","AND",1,24,491,9094
0,"Like","femal*","AND",1,24,491,9095
1,"Like","male*",,1,24,491,9096
0,"Like","*switch*","AND",1,14,492,9097
0,"Like","*weight*","OR",1,17,492,9098
0,"Like","body mass*","OR",1,17,492,9099
0,"Like","*diet*","OR",1,17,492,9100
0,"Like","eat*","OR",1,17,492,9101
0,"Like","waist*","AND",1,17,492,9102
0,"Like","*metaboli*","OR",1,17,492,9103
0,"Like","obes*",,1,17,492,9104
0,"Like","*weight*","OR",2,27,493,9105
0,"Like","*body mass*","OR",2,27,493,9106
0,"Like","*bmi*","OR",2,27,493,9107
0,"Like","* eat*","OR",2,27,493,9108
0,"Like","eat*","OR",2,27,493,9109
0,"Like","* obes*","OR",2,27,493,9110
0,"Like","obes*","OR",2,27,493,9111
0,"Like","weight*","OR",2,27,493,9112
0,"Like","body mas*","OR",2,27,493,9113
0,"Like","bmi*","OR",2,27,493,9114
0,"Like","diet*","OR",2,27,493,9115
0,"Like","*diet*","OR",2,27,493,9116
0,"Like","*weight*","OR",2,36,493,9117
0,"Like","*body mass*","OR",2,36,493,9118
0,"Like","*bmi*","OR",2,36,493,9119
0,"Like","* eat*","OR",2,36,493,9120
0,"Like","* obes*","OR",2,36,493,9121
0,"Like","*diet*","OR",2,36,493,9122
0,"Like","*weight*","OR",2,57,493,9123
0,"Like","*body mass*","OR",2,57,493,9124
0,"Like","*bmi*","OR",2,57,493,9125
0,"Like","* eat*","OR",2,57,493,9126
0,"Like","* obes*","OR",2,57,493,9127
0,"Like","*diet*",,2,57,493,9128
0,"Like","metaboli*","OR",2,27,494,9129
0,"Like","*metaboli*","OR",2,27,494,9130
0,"Like","waist*","OR",2,27,494,9131
0,"Like","*waist*","OR",2,27,494,9132
0,"Like","*metaboli*","OR",2,36,494,9133
0,"Like","*waist*","OR",2,36,494,9134
0,"Like","*metaboli*","OR",2,57,494,9135
0,"Like","*waist*",,2,57,494,9136
0,"Like","*catatoni*","OR",2,27,495,9137
0,"Like","catatoni*","OR",2,27,495,9138
0,"Like","*catatoni*","OR",2,36,495,9139
0,"Like","*catatoni*",,2,57,495,9140
0,"Like","sex*","OR",2,27,505,9186
0,"Like","* sex*","OR",2,27,505,9187
0,"Like","libido*","OR",2,27,505,9188
0,"Like","*libido*","OR",2,27,505,9189
0,"Like","orgasm*","OR",2,27,505,9190
0,"Like","*orgasm*","OR",2,27,505,9191
0,"Like","lubricat*","OR",2,27,505,9192
0,"Like","*lubricat*","OR",2,27,505,9193
0,"Like","*penile erect*","OR",2,27,505,9194
0,"Like","impoten*","OR",2,27,505,9195
0,"Like","*impoten*","OR",2,27,505,9196
0,"Like","*libido*","OR",2,36,505,9197
0,"Like","*orgasm*","OR",2,36,505,9198
0,"Like","*lubricat*","OR",2,36,505,9199
0,"Like","*sexual arous*","OR",2,36,505,9200
0,"Like","*sexual satisf*","OR",2,36,505,9201
0,"Like","*penile erect*","OR",2,36,505,9202
0,"Like","*impoten*","OR",2,36,505,9203
0,"Like","*libido*","OR",2,57,505,9204
0,"Like","*orgasm*","OR",2,57,505,9205
0,"Like","*lubricat*","OR",2,57,505,9206
0,"Like","*sexual arous*","OR",2,57,505,9207
0,"Like","*sexual satisf*","OR",2,57,505,9208
0,"Like","*penile erect*","OR",2,57,505,9209
0,"Like","*impoten*",,2,57,505,9210
0,"Like","* sex*","AND",2,36,506,9211
0,"Like","*dysfunction*",,2,36,506,9212
0,"Like","* sex*","AND",2,36,507,9213
0,"Like","*problem*",,2,36,507,9214
0,"Like","* sex*","AND",2,36,508,9215
0,"Like","*symptom*",,2,36,508,9216
0,"Like","impotence*","OR",1,15,509,9217
0,"Like","sexual dys*",,1,15,509,9218
0,"Like","erectile dys*","OR",1,17,509,9219
0,"Like","sexual function*","OR",1,17,509,9220
0,"Like","sexual dysfunction*","OR",1,17,509,9221
0,"Like","sexual arousal*","OR",1,17,509,9222
0,"Like","*libido*","OR",1,17,509,9223
0,"Like","*treatment*","AND",2,27,510,9224
0,"Like","* order*",,2,27,510,9225
0,"Like","*involuntar*","AND",2,27,511,9226
0,"Like","*outpatient*",,2,27,511,9227
0,"Like","*extend*","AND",2,27,512,9228
0,"Like","*leave*",,2,27,512,9229
0,"Like","*supervis*","AND",2,27,513,9230
0,"Like","*discharg*",,2,27,513,9231
0,"Like","*compulsor*","OR",2,27,514,9232
0,"Like","*compulsion*","OR",2,27,514,9233
0,"Like","*compulsor*","OR",2,36,514,9234
0,"Like","*compulsion*","OR",2,36,514,9235
0,"Like","*commitment of mentally ill*","OR",2,57,514,9236
0,"Like","*compulsor*","OR",2,57,514,9237
0,"Like","*compulsion*",,2,57,514,9238
0,"Like","*outpatient*","OR",1,14,515,9239
0,"Like","*involuntary*","OR",1,14,515,9240
0,"Like","puerperal*","OR",2,27,516,9241
0,"Like","pregna*","OR",2,27,516,9242
0,"Like","postpartum*","OR",2,27,516,9243
0,"Like","post?partum*","OR",2,27,516,9244
0,"Like","* puerperal*","OR",2,27,516,9245
0,"Like","*pregna*","OR",2,27,516,9246
0,"Like","*postpartum*
baby-blues*","OR",2,27,516,9247
0,"Like","*post-partum*","OR",2,27,516,9248
0,"Like","mother*","OR",2,27,516,9249
0,"Like","* mother*","OR",2,27,516,9250
0,"Like","* lactat*","OR",2,27,516,9251
0,"Like","* puerperal*","OR",2,36,516,9252
0,"Like","*pregna*","OR",2,36,516,9253
0,"Like","*post?partum*","OR",2,36,516,9254
0,"Like","* puerperal*","OR",2,36,516,9255
0,"Like","*pregna*","OR",2,36,516,9256
0,"Like","*postpartum*","OR",2,36,516,9257
0,"Like","* mother*","OR",2,36,516,9258
0,"Like","* lactat*","OR",2,36,516,9259
0,"Like","* puerperal*","OR",2,57,516,9260
0,"Like","*post?partum*","OR",2,57,516,9261
0,"Like","*postpartum*","OR",2,57,516,9262
0,"Like","* pregna*","OR",2,57,516,9263
0,"Like","* mother*","OR",2,57,516,9264
0,"Like","* lactat*",,2,57,516,9265
0,"Like","anticipat*","OR",2,27,522,9300
0,"Like","advance *","OR",2,27,522,9301
0,"Like","*advance *","OR",2,27,522,9302
0,"Like","joint *","OR",2,27,522,9303
0,"Like","*joint *","OR",2,27,522,9304
0,"Like","ulyss*","OR",2,27,522,9305
0,"Like","*ulysses*","OR",2,27,522,9306
0,"Like","*anticipat*","OR",2,27,522,9307
0,"Like","*advance *","OR",2,36,522,9308
0,"Like","*joint *","OR",2,36,522,9309
0,"Like","*ulysses*","OR",2,36,522,9310
0,"Like","*anticipat*","OR",2,36,522,9311
0,"Like","*advance *","OR",2,57,522,9312
0,"Like","*joint *`","OR",2,57,522,9313
0,"Like","*ulysses*","OR",2,57,522,9314
0,"Like","*anticipat*","OR",2,57,522,9315
0,"Like","*cris?s*","OR",2,27,523,9316
0,"Like","plan*","OR",2,27,523,9317
0,"Like","*plan*","OR",2,27,523,9318
0,"Like","directive*","OR",2,27,523,9319
0,"Like","*directive*","OR",2,27,523,9320
0,"Like","cris?s*","OR",2,27,523,9321
0,"Like","*plan*","OR",2,36,523,9322
0,"Like","*directive*","OR",2,36,523,9323
0,"Like","*cris?s*","OR",2,36,523,9324
0,"Like","*plan*","OR",2,57,523,9325
0,"Like","*directive*","OR",2,57,523,9326
0,"Like","*cris?s*","OR",2,57,523,9327
0,"Like","patient part*","OR",1,14,524,9328
0,"Like","advance dir*","OR",1,14,524,9329
0,"Like","decision of tr*",,1,14,524,9330
0,"Like","*alased*","OR",2,27,525,9331
0,"Like","*aloperidi*","OR",2,27,525,9332
0,"Like","aloperidi*","OR",2,27,525,9333
0,"Like","alased*","OR",2,27,525,9334
0,"Like","bioperido*","OR",2,27,525,9335
0,"Like","*bioperido*","OR",2,27,525,9336
0,"Like","buterid*","OR",2,27,525,9337
0,"Like","*buterid*","OR",2,27,525,9338
0,"Like","ceree*","OR",2,27,525,9339
0,"Like","*ceree*","OR",2,27,525,9340
0,"Like","dozic*","OR",2,27,525,9341
0,"Like","*dozic*","OR",2,27,525,9342
0,"Like","*alased*","OR",2,36,525,9343
0,"Like","*aloperidi*","OR",2,36,525,9344
0,"Like","*bioperido*","OR",2,36,525,9345
0,"Like","*buterid*","OR",2,36,525,9346
0,"Like","*ceree*","OR",2,36,525,9347
0,"Like","*dozic*","OR",2,36,525,9348
0,"Like","*alased*","OR",2,57,525,9349
0,"Like","*aloperidi*","OR",2,57,525,9350
0,"Like","*bioperido*","OR",2,57,525,9351
0,"Like","*buterid*","OR",2,57,525,9352
0,"Like","*ceree*","OR",2,57,525,9353
0,"Like","*dozic*","OR",2,57,525,9354
0,"Like","duraperido*","OR",2,27,526,9355
0,"Like","*duraperido*","OR",2,27,526,9356
0,"Like","*duraperido*","OR",2,36,526,9357
0,"Like","*duraperido*","OR",2,57,526,9358
0,"Like","fortuna*","OR",2,27,526,9359
0,"Like","*fortuna*","OR",2,27,526,9360
0,"Like","*fortuna*","OR",2,36,526,9361
0,"Like","*fortuna*","OR",2,57,526,9362
0,"Like","haloper*","OR",2,27,526,9363
0,"Like","*haloper*","OR",2,27,526,9364
0,"Like","*haloper*","OR",2,36,526,9365
0,"Like","*haloper*","OR",2,57,526,9366
0,"Like","haldol*","OR",2,27,526,9367
0,"Like","*haldol*","OR",2,27,526,9368
0,"Like","*haldol*","OR",2,36,526,9369
0,"Like","*haldol*","OR",2,57,526,9370
0,"Like","r-1625*","OR",2,27,526,9371
0,"Like","*r-1625*","OR",2,27,526,9372
0,"Like","*r-1625*","OR",2,36,526,9373
0,"Like","*r-1625*","OR",2,57,526,9374
0,"Like","serena*","OR",2,27,526,9375
0,"Like","*serena*","OR",2,27,526,9376
0,"Like","*serena*","OR",2,36,526,9377
0,"Like","*serena*",,2,57,526,9378
0,"Like","seren*","OR",2,27,527,9379
0,"Like","*seren*","OR",2,27,527,9380
0,"Like","seviu*","OR",2,27,527,9381
0,"Like","*seviu*","OR",2,27,527,9382
0,"Like","sigaperid*","OR",2,27,527,9383
0,"Like","*sigaperid*","OR",2,27,527,9384
0,"Like","sylad*","OR",2,27,527,9385
0,"Like","*sylad*","OR",2,27,527,9386
0,"Like","zafri*","OR",2,27,527,9387
0,"Like","*zafri*","OR",2,27,527,9388
0,"Like","*seren*","OR",2,36,527,9389
0,"Like","*seviu*","OR",2,36,527,9390
0,"Like","*sigaperid*","OR",2,36,527,9391
0,"Like","*sylad*","OR",2,36,527,9392
0,"Like","*zafri*","OR",2,36,527,9393
0,"Like","*seren*","OR",2,57,527,9394
0,"Like","*seviu*","OR",2,57,527,9395
0,"Like","*sigaperid*","OR",2,57,527,9396
0,"Like","*sylad*","OR",2,57,527,9397
0,"Like","*zafri*",,2,57,527,9398
0,"Like","*thorazine*","OR",2,27,528,9399
0,"Like","thorazine*","OR",2,27,528,9400
0,"Like","cpz*","OR",2,27,528,9401
0,"Like","*cpz*","OR",2,27,528,9402
0,"Like","*thorazine*","OR",2,36,528,9403
0,"Like","*cpz*","OR",2,36,528,9404
0,"Like","*thorazine*","OR",2,57,528,9405
0,"Like","*cpz*",,2,57,528,9406
0,"Like","*haloperidol*","AND",1,14,529,9407
0,"Like","*chlorpromazin*",,1,14,529,9408
0,"Like","olanz*","AND",1,14,530,9409
0,"Like","*dos*",,1,14,530,9410
0,"Like","*morita*","OR",2,27,531,9411
0,"Like","*morita*","OR",2,36,531,9412
0,"Like","*morita*",,2,57,531,9413
0,"Like","clozapin*","OR",2,27,532,9414
0,"Like","*clozapin*","OR",2,27,532,9415
0,"Like","clozaril*","OR",2,27,532,9416
0,"Like","*clozaril*","OR",2,27,532,9417
0,"Like","leponex*","OR",2,27,532,9418
0,"Like","*leponex*","OR",2,27,532,9419
0,"Like","*denzapin*","OR",2,27,532,9420
0,"Like","*zaponex*","OR",2,27,532,9421
0,"Like","*clozapin*","OR",2,36,532,9422
0,"Like","*clozaril*","OR",2,36,532,9423
0,"Like","*leponex*","OR",2,36,532,9424
0,"Like","*denzapin*","OR",2,36,532,9425
0,"Like","*zaponex*","OR",2,36,532,9426
0,"Like","*clozapin*","OR",2,57,532,9427
0,"Like","*clozaril*","OR",2,57,532,9428
0,"Like","*leponex*","OR",2,57,532,9429
0,"Like","*denzapin*","OR",2,57,532,9430
0,"Like","*zaponex*",,2,57,532,9431
0,"Like","*morita*",,1,14,534,9450
0,"Like","*denzapin*","OR",1,14,535,9451
0,"Like","*zaponex*",,1,14,535,9452
0,"Like","*clozapin*","OR",1,14,535,9453
0,"Like","*clozaril*","OR",1,14,535,9454
0,"Like","*leponex*","OR",1,14,535,9455
0,"Like","flupent*","OR",2,27,536,9456
0,"Like","*flupent*","OR",2,27,536,9457
0,"Like","fluanxol*","OR",2,27,536,9458
0,"Like","*fluanxol*","OR",2,27,536,9459
0,"Like","depixol*","OR",2,27,536,9460
0,"Like","*depixol*","OR",2,27,536,9461
0,"Like","lu 7105*","OR",2,27,536,9462
0,"Like","*lu 7105*","OR",2,27,536,9463
0,"Like","lu 5-110*","OR",2,27,536,9464
0,"Like","*lu 5-110*","OR",2,27,536,9465
0,"Like","emergil*","OR",2,27,536,9466
0,"Like","*emergil*","OR",2,27,536,9467
0,"Like","*flupent*","OR",2,36,536,9468
0,"Like","*fluanxol*","OR",2,36,536,9469
0,"Like","*depixol*","OR",2,36,536,9470
0,"Like","*lu 7105*","OR",2,36,536,9471
0,"Like","*lu 5-110*","OR",2,36,536,9472
0,"Like","emergil*","OR",2,36,536,9473
0,"Like","*flupentl*","OR",2,57,536,9474
0,"Like","*fluanxol*","OR",2,57,536,9475
0,"Like","*depixol*","OR",2,57,536,9476
0,"Like","*lu 7105*","OR",2,57,536,9477
0,"Like","*lu 5-110*","OR",2,57,536,9478
0,"Like","*emergil*",,2,57,536,9479
0,"Like","flupenthixol*",,1,14,537,9480
0,"Like","fluphen*","OR",2,27,538,9481
0,"Like","*fluphen*","OR",2,27,538,9482
0,"Like","flufen*","OR",2,27,538,9483
0,"Like","*flufen*","OR",2,27,538,9484
0,"Like","lyogen*","OR",2,27,538,9485
0,"Like","*lyogen*","OR",2,27,538,9486
0,"Like","prolixin*","OR",2,27,538,9487
0,"Like","*prolixin*","OR",2,27,538,9488
0,"Like","siqualon*","OR",2,27,538,9489
0,"Like","*siqualon*","OR",2,27,538,9490
0,"Like","*modec*","OR",2,27,538,9491
0,"Like","*moditen*","OR",2,27,538,9492
0,"Like","*fluphen*","OR",2,36,538,9493
0,"Like","*flufen*","OR",2,36,538,9494
0,"Like","*lyogen*","OR",2,36,538,9495
0,"Like","*prolixin*","OR",2,36,538,9496
0,"Like","*siqualon*","OR",2,36,538,9497
0,"Like","*modec*","OR",2,36,538,9498
0,"Like","*moditen*","OR",2,36,538,9499
0,"Like","*fluphen*","OR",2,57,538,9500
0,"Like","*flufen*","OR",2,57,538,9501
0,"Like","*lyogen*","OR",2,57,538,9502
0,"Like","*prolixin*","OR",2,57,538,9503
0,"Like","*siqualon*","OR",2,57,538,9504
0,"Like","*modec*","OR",2,57,538,9505
0,"Like","*moditen*",,2,57,538,9506
0,"Like","*eutimax*","OR",2,27,539,9507
0,"Like","*anaten*","OR",2,27,539,9508
0,"Like","*dapotum*","OR",2,27,539,9509
0,"Like","*decazate*","OR",2,27,539,9510
0,"Like","*lyoridan*","OR",2,27,539,9511
0,"Like","*mirenil*","OR",2,27,539,9512
0,"Like","*fludecat*","OR",2,27,539,9513
0,"Like","*decentan*","OR",2,27,539,9514
0,"Like","*decafen*","OR",2,27,539,9515
0,"Like","*eutimax*","OR",2,36,539,9516
0,"Like","*anaten*","OR",2,36,539,9517
0,"Like","*dapotum*","OR",2,36,539,9518
0,"Like","*decazate*","OR",2,36,539,9519
0,"Like","*lyoridan*","OR",2,36,539,9520
0,"Like","*mirenil*","OR",2,36,539,9521
0,"Like","*fludecat*","OR",2,36,539,9522
0,"Like","*decentan*","OR",2,36,539,9523
0,"Like","*decafen*",,2,36,539,9524
0,"Like","*eutimax*","OR",2,57,539,9525
0,"Like","*anaten*","OR",2,57,539,9526
0,"Like","*dapotum*","OR",2,57,539,9527
0,"Like","*decazate*","OR",2,57,539,9528
0,"Like","*lyoridan*","OR",2,57,539,9529
0,"Like","*mirenil*","OR",2,57,539,9530
0,"Like","*fludecat*","OR",2,57,539,9531
0,"Like","fluphenazine*",,1,14,540,9532
0,"Like","* risp*","OR",2,27,542,9542
0,"Like","risp*","OR",2,27,542,9543
0,"Like","*9-OH-risperid*","OR",2,27,542,9544
0,"Like","*risper*","OR",2,27,542,9545
0,"Like","* risp*","OR",2,36,542,9546
0,"Like","*9-OH-risperid*","OR",2,36,542,9547
0,"Like","*risper*","OR",2,36,542,9548
0,"Like","*9-OH-risperid*","OR",2,57,542,9549
0,"Like","*risper*",,2,57,542,9550
0,"Like","*youth*","OR",2,27,543,9551
0,"Like","*young*","OR",2,27,543,9552
0,"Like","*pediatri*","OR",2,27,543,9553
0,"Like","*paediatr*","OR",2,27,543,9554
0,"Like","*teenag*","OR",2,27,543,9555
0,"Like","*child*","OR",2,27,543,9556
0,"Like","*adolesce*","OR",2,27,543,9557
0,"Like","teenag*","OR",2,27,543,9558
0,"Like","child*","OR",2,27,543,9559
0,"Like","adolesc*","OR",2,27,543,9560
0,"Like","youth*","OR",2,27,543,9561
0,"Like","young*",,2,27,543,9562
0,"Like","*youth*","OR",2,36,543,9563
0,"Like","*young*","OR",2,36,543,9564
0,"Like","*pediatri*","OR",2,36,543,9565
0,"Like","*paediatr*","OR",2,36,543,9566
0,"Like","*teenag*","OR",2,36,543,9567
0,"Like","*child*","OR",2,36,543,9568
0,"Like","*adolesce*","OR",2,36,543,9569
0,"Like","*youth*","OR",2,57,543,9570
0,"Like","*young*","OR",2,57,543,9571
0,"Like","*pediatr*","OR",2,57,543,9572
0,"Like","*paediatr*","OR",2,57,543,9573
0,"Like","*teenag*","OR",2,57,543,9574
0,"Like","*child*","OR",2,57,543,9575
0,"Like","*adolesce*","OR",2,57,543,9576
0,"Like","problem*","OR",2,27,544,9577
0,"Like","*problem*","OR",2,27,544,9578
0,"Like","*problem*","OR",2,36,544,9579
0,"Like","*problem*",,2,57,544,9580
0,"Like","*problem*",,1,14,545,9581
0,"Like","dehydroepiand*","OR",2,27,546,9582
0,"Like","*dehydroepiand*","OR",2,27,546,9583
0,"Like","dehydroisoand*","OR",2,27,546,9584
0,"Like","*dehydroisoand*","OR",2,27,546,9585
0,"Like","dhea*","OR",2,27,546,9586
0,"Like","*dhea*","OR",2,27,546,9587
0,"Like","prasteron*","OR",2,27,546,9588
0,"Like","*prasteron*","OR",2,27,546,9589
0,"Like","testosteron*","OR",2,27,546,9590
0,"Like","*testosteron*","OR",2,27,546,9591
0,"Like","androsten*","OR",2,27,546,9592
0,"Like","*androsten*","OR",2,27,546,9593
0,"Like","*dehydroepiand*","OR",2,36,546,9594
0,"Like","*dehydroisoand*","OR",2,36,546,9595
0,"Like","*dhea*","OR",2,36,546,9596
0,"Like","*prasteron*","OR",2,36,546,9597
0,"Like","*testosteron*","OR",2,36,546,9598
0,"Like","*androsten*","OR",2,36,546,9599
0,"Like","*dehydroepiand*","OR",2,57,546,9600
0,"Like","*dehydroisoand*","OR",2,57,546,9601
0,"Like","*dhea*","OR",2,57,546,9602
0,"Like","*prasteron*`","OR",2,57,546,9603
0,"Like","*testosteron*","OR",2,57,546,9604
0,"Like","*androsten*",,2,57,546,9605
0,"Like","*dehydroepiandrosterone*","OR",1,14,547,9606
0,"Like","*testosterone*",,1,14,547,9607
0,"Like","* wards *","OR",2,27,549,9620
0,"Like","* ward *","OR",2,27,549,9621
0,"Like","* general*","OR",2,27,549,9622
0,"Like","* general*","OR",2,27,549,9623
0,"Like","ward *","OR",2,27,549,9624
0,"Like","wards *","OR",2,27,549,9625
0,"Like","general*","OR",2,27,549,9626
0,"Like","* wards *","OR",2,36,549,9627
0,"Like","* ward *","OR",2,36,549,9628
0,"Like","* ward *","OR",2,57,549,9629
0,"Like","* general*","OR",2,57,549,9630
0,"Like","* wards *",,2,57,549,9631
0,"Like","*general*","OR",1,14,550,9632
0,"Like","*hosp*",,1,14,550,9633
0,"Like","hypno*","OR",2,27,551,9634
0,"Like","* hypno*","OR",2,27,551,9635
0,"Like","Autogenic*","OR",2,27,551,9636
0,"Like","*Autogenic*","OR",2,27,551,9637
0,"Like","* mesmer*","OR",2,27,551,9638
0,"Like","* guided ima*","OR",2,27,551,9639
0,"Like","guided ima*","OR",2,27,551,9640
0,"Like","Mesmer*","OR",2,27,551,9641
0,"Like","* hypno*","OR",2,36,551,9642
0,"Like","*Autogenic*","OR",2,36,551,9643
0,"Like","* mesmer*","OR",2,36,551,9644
0,"Like","*guided ima*","OR",2,36,551,9645
0,"Like","* hypno*","OR",2,57,551,9646
0,"Like","*Autogenic*","OR",2,57,551,9647
0,"Like","* mesmer*","OR",2,57,551,9648
0,"Like","*guided ima*",,2,57,551,9649
0,"Like","*hypno*",,1,14,552,9650
0,"Like","drama*","OR",2,27,553,9651
0,"Like","*drama*","OR",2,27,553,9652
0,"Like","* play*","OR",2,27,553,9653
0,"Like","*improvi?ation*","OR",2,27,553,9654
0,"Like","Story*","OR",2,27,553,9655
0,"Like","* story*","OR",2,27,553,9656
0,"Like","creativ*","OR",2,27,553,9657
0,"Like","*creativ*","OR",2,27,553,9658
0,"Like","*fairy*","OR",2,27,553,9659
0,"Like","*theat*","OR",2,27,553,9660
0,"Like","theat*","OR",2,27,553,9661
0,"Like","fairy",,2,27,553,9662
0,"Like","*drama*","OR",2,36,553,9663
0,"Like","* play*","OR",2,36,553,9664
0,"Like","*improvi?ation*","OR",2,36,553,9665
0,"Like","* story*","OR",2,36,553,9666
0,"Like","*creativ*","OR",2,36,553,9667
0,"Like","*fairy*","OR",2,36,553,9668
0,"Like","*theat*","OR",2,36,553,9669
0,"Like","*drama*","OR",2,57,553,9670
0,"Like","* play*","OR",2,57,553,9671
0,"Like","*improvi?ation*","OR",2,57,553,9672
0,"Like","* story*","OR",2,57,553,9673
0,"Like","*creativ*","OR",2,57,553,9674
0,"Like","*fairy*","OR",2,57,553,9675
0,"Like","*theat*","OR",2,57,553,9676
0,"Like","role-play*","OR",2,27,554,9677
0,"Like","*role-play*","OR",2,27,554,9678
0,"Like","*ritual*","OR",2,27,554,9679
0,"Like","*myth*","OR",2,27,554,9680
0,"Like","ritual*","OR",2,27,554,9681
0,"Like","myth*","OR",2,27,554,9682
0,"Like","*role-play*","OR",2,36,554,9683
0,"Like","*ritual*","OR",2,36,554,9684
0,"Like","*myth*","OR",2,36,554,9685
0,"Like","*role-play*","OR",2,57,554,9686
0,"Like","*ritual*","OR",2,57,554,9687
0,"Like","*myth*","OR",2,57,554,9688
0,"Like","*drama*","OR",1,14,555,9689
0,"Like","role play*",,1,14,555,9690
0,"Like","* as required*","OR",2,27,556,9691
0,"Like","* as needed*","OR",2,27,556,9692
0,"Like","* as necessary*","OR",2,27,556,9693
0,"Like","* as-required*","OR",2,27,556,9694
0,"Like","* as-needed*","OR",2,27,556,9695
0,"Like","* as-necessary*","OR",2,27,556,9696
0,"Like","* as indicated*","OR",2,27,556,9697
0,"Like","as?required*","OR",2,27,556,9698
0,"Like","as?needed*","OR",2,27,556,9699
0,"Like","as?necessary*","OR",2,27,556,9700
0,"Like","as?indicated*",,2,27,556,9701
0,"Like","* as required*","OR",2,36,556,9702
0,"Like","* as needed*","OR",2,36,556,9703
0,"Like","* as necessary*","OR",2,36,556,9704
0,"Like","* as-required*","OR",2,36,556,9705
0,"Like","* as-needed*","OR",2,36,556,9706
0,"Like","* as-necessary*","OR",2,36,556,9707
0,"Like","* as indicated*","OR",2,36,556,9708
0,"Like","* as required*","OR",2,57,556,9709
0,"Like","* as needed*","OR",2,57,556,9710
0,"Like","* as necessary*","OR",2,57,556,9711
0,"Like","* as-required*","OR",2,57,556,9712
0,"Like","* as-needed*","OR",2,57,556,9713
0,"Like","* as-necessary*","OR",2,57,556,9714
0,"Like","* as indicated*","OR",2,57,556,9715
0,"Like","PRN*","OR",2,27,557,9716
0,"Like","* prn*","OR",2,27,557,9717
0,"Like","* prn*","OR",2,36,557,9718
0,"Like","* prn*","OR",2,57,557,9719
0,"Like","pro re nata*","OR",2,27,557,9720
0,"Like","*pro re nata*","OR",2,27,557,9721
0,"Like","*pro re nata*","OR",2,36,557,9722
0,"Like","*pro re nata*","OR",2,57,557,9723
0,"Like","drug regimens*","OR",2,27,557,9724
0,"Like","*drug regimens*","OR",2,27,557,9725
0,"Like","*drug regimens*","OR",2,36,557,9726
0,"Like","*drug regimens*",,2,57,557,9727
0,"Like","*clotiapin*","OR",2,27,558,9728
0,"Like","*clothiapin*","OR",2,27,558,9729
0,"Like","*etumin*","OR",2,27,558,9730
0,"Like","*etomin*","OR",2,27,558,9731
0,"Like","*2159*","OR",2,27,558,9732
0,"Like","clotiapin*","OR",2,27,558,9733
0,"Like","clothiapin*","OR",2,27,558,9734
0,"Like","etumin*","OR",2,27,558,9735
0,"Like","etomin*","OR",2,27,558,9736
0,"Like","clotiapin*","OR",2,27,558,9737
0,"Like","clothiapin*","OR",2,27,558,9738
0,"Like","et?min*","OR",2,27,558,9739
0,"Like","*clotiapin*","OR",2,36,558,9740
0,"Like","*clothiapin*","OR",2,36,558,9741
0,"Like","*etumin*","OR",2,36,558,9742
0,"Like","*etomin*","OR",2,36,558,9743
0,"Like","*2159*","OR",2,36,558,9744
0,"Like","*clotiapin*","OR",2,57,558,9745
0,"Like","*clothiapin*","OR",2,57,558,9746
0,"Like","*etumin*","OR",2,57,558,9747
0,"Like","*etomin*","OR",2,57,558,9748
0,"Like","*2159*","OR",2,57,558,9749
0,"Like","2159*",,2,57,558,9750
0,"Like","aolept*","OR",2,27,560,9752
0,"Like","*aolept*","OR",2,27,560,9753
0,"Like","nemactil*","OR",2,27,560,9754
0,"Like","*nemactil*","OR",2,27,560,9755
0,"Like","neulactil*","OR",2,27,560,9756
0,"Like","*neulactil*","OR",2,27,560,9757
0,"Like","neulept?l*","OR",2,27,560,9758
0,"Like","*neulept?l*","OR",2,27,560,9759
0,"Like","neuperil*","OR",2,27,560,9760
0,"Like","*neuperil*","OR",2,27,560,9761
0,"Like","*peric?azin*","OR",2,27,560,9762
0,"Like","peric?azin*","OR",2,27,560,9763
0,"Like","*peric?azin*","OR",2,36,560,9764
0,"Like","*aolept*","OR",2,36,560,9765
0,"Like","*nemactil*","OR",2,36,560,9766
0,"Like","*neulactil*","OR",2,36,560,9767
0,"Like","*neulept?l*","OR",2,36,560,9768
0,"Like","*neuperil*","OR",2,36,560,9769
0,"Like","*peric?azin*","OR",2,57,560,9770
0,"Like","*aolept*","OR",2,57,560,9771
0,"Like","*nemactil*","OR",2,57,560,9772
0,"Like","*neulactil*","OR",2,57,560,9773
0,"Like","*neulept?l*","OR",2,57,560,9774
0,"Like","*neuperil*",,2,57,560,9775
0,"Like","*peric?azin*",,1,14,561,9776
0,"Like","clothiapin*",,1,14,562,9777
0,"Like","*risper*",,1,14,563,9778
0,"Like","intermit*","OR",2,27,566,9817
0,"Like","*intermit*","OR",2,27,566,9818
0,"Like","drug?holiday*","OR",2,27,566,9819
0,"Like","*drug?holiday*","OR",2,27,566,9820
0,"Like","drug?free*","OR",2,27,566,9821
0,"Like","*drug?free*","OR",2,27,566,9822
0,"Like","internal?med*","OR",2,27,566,9823
0,"Like","*internal?med*","OR",2,27,566,9824
0,"Like","*intermit*","OR",2,36,566,9825
0,"Like","*drug?holiday*","OR",2,36,566,9826
0,"Like","*drug?free*","OR",2,36,566,9827
0,"Like","*internal?med*","OR",2,36,566,9828
0,"Like","*intermit*","OR",2,57,566,9829
0,"Like","*drug?holiday*","OR",2,57,566,9830
0,"Like","*drug?free*","OR",2,57,566,9831
0,"Like","*internal?med*",,2,57,566,9832
0,"Like","*chlorprom*",,1,14,567,9833
0,"Like","* GABA*","OR",2,27,568,9834
0,"Like","GABA*","OR",2,27,568,9835
0,"Like","baclofen*","OR",2,27,568,9836
0,"Like","*baclofen*","OR",2,27,568,9837
0,"Like","*-GABA*","OR",2,27,568,9838
0,"Like","muscimol*","OR",2,27,568,9839
0,"Like","*muscimol*","OR",2,27,568,9840
0,"Like","progabide*","OR",2,27,568,9841
0,"Like","*progabide*","OR",2,27,568,9842
0,"Like","valproate*","OR",2,27,568,9843
0,"Like","*valproate*","OR",2,27,568,9844
0,"Like","*THIP*","OR",2,27,568,9845
0,"Like","* GABA*","OR",2,36,568,9846
0,"Like","*baclofen*","OR",2,36,568,9847
0,"Like","*-GABA*","OR",2,36,568,9848
0,"Like","*muscimol*","OR",2,36,568,9849
0,"Like","*progabide*","OR",2,36,568,9850
0,"Like","*valproate*","OR",2,36,568,9851
0,"Like","*THIP*","OR",2,36,568,9852
0,"Like","* GABA*","OR",2,57,568,9853
0,"Like","*baclofen*","OR",2,57,568,9854
0,"Like","*-GABA*","OR",2,57,568,9855
0,"Like","*muscimol*","OR",2,57,568,9856
0,"Like","*progabide*","OR",2,57,568,9857
0,"Like","*valproate*","OR",2,57,568,9858
0,"Like","*THIP*",,2,57,568,9859
0,"Like","*baclofen*","OR",1,14,569,9860
0,"Like","*muscimol*","OR",1,14,569,9861
0,"Like","*progabide*","OR",1,14,569,9862
0,"Like","*valproate*","OR",1,14,569,9863
0,"Like","thip*",,1,14,569,9864
0,"Like","*gaba*","OR",1,14,569,9865
0,"Like","*dyskines*","OR",2,27,570,9866
0,"Like","*dyskines*","OR",2,36,570,9867
0,"Like","*dyskines*",,2,57,570,9868
0,"Like","*amphetamine*","OR",2,27,571,9869
0,"Like","amphetamine*","OR",2,27,571,9870
0,"Like","methylph*","OR",2,27,571,9871
0,"Like","*methylph*","OR",2,27,571,9872
0,"Like","*methylph*","OR",2,36,571,9873
0,"Like","*amphetamine*","OR",2,36,571,9874
0,"Like","*methylph*","OR",2,57,571,9875
0,"Like","*amphetamine*",,2,57,571,9876
0,"Like","amphetamine*","OR",1,14,572,9877
0,"Like","methylph*",,1,14,572,9878
0,"Like","pipothiaz*","OR",2,27,573,9879
0,"Like","*pipothiaz*","OR",2,27,573,9880
0,"Like","pipotiaz*","OR",2,27,573,9881
0,"Like","*pipotiaz*","OR",2,27,573,9882
0,"Like","piportil*","OR",2,27,573,9883
0,"Like","*piportil*","OR",2,27,573,9884
0,"Like","*pipothiaz*","OR",2,36,573,9885
0,"Like","*pipotiaz*","OR",2,36,573,9886
0,"Like","*piportil*","OR",2,36,573,9887
0,"Like","*pipothiaz*","OR",2,57,573,9888
0,"Like","*pipotiaz*","OR",2,57,573,9889
0,"Like","*piportil*",,2,57,573,9890
0,"Like","pipot*",,1,14,574,9891
0,"Like","*social*","OR",2,27,575,9892
0,"Like","*personal*","OR",2,27,575,9893
0,"Like","social*","OR",2,27,575,9894
0,"Like","personal*",,2,27,575,9895
0,"Like","*social*","OR",2,36,575,9896
0,"Like","*personal*","OR",2,36,575,9897
0,"Like","*social*","OR",2,57,575,9898
0,"Like","*personal*","OR",2,57,575,9899
0,"Like","*skill*","OR",2,27,576,9900
0,"Like","*program*","OR",2,27,576,9901
0,"Like","*training*","OR",2,27,576,9902
0,"Like","skill*","OR",2,27,576,9903
0,"Like","program*","OR",2,27,576,9904
0,"Like","training*",,2,27,576,9905
0,"Like","*skill*","OR",2,36,576,9906
0,"Like","*program*","OR",2,36,576,9907
0,"Like","*training*","OR",2,36,576,9908
0,"Like","*skill*","OR",2,57,576,9909
0,"Like","*program*","OR",2,57,576,9910
0,"Like","*training*","OR",2,57,576,9911
0,"Like","social skill*","OR",1,14,577,9912
0,"Like","*interpersonal*","OR",1,14,577,9913
0,"Like","*socioth*","OR",1,14,577,9914
0,"Like","*socioenvi*","OR",1,14,577,9915
0,"Like","social support*",,1,14,577,9916
0,"Like","*life*","OR",1,14,578,9917
0,"Like","*living*",,1,14,578,9918
0,"Like","Aripiprazole*","OR",2,27,580,9931
0,"Like","*Aripiprazole*","OR",2,27,580,9932
0,"Like","abilitat*","OR",2,27,580,9933
0,"Like","* abilitat*","OR",2,27,580,9934
0,"Like","abilify*","OR",2,27,580,9935
0,"Like","*abilify*","OR",2,27,580,9936
0,"Like","*Aripiprazole*","OR",2,36,580,9937
0,"Like","* abilitat*","OR",2,36,580,9938
0,"Like","*abilify*","OR",2,36,580,9939
0,"Like","*Aripiprazole*","OR",2,57,580,9940
0,"Like","* abilitat*","OR",2,57,580,9941
0,"Like","*abilify*",,2,57,580,9942
0,"Like","rehabilitat*","OR",2,27,581,9943
0,"Like","*rehabilitat*","OR",2,27,581,9944
0,"Like","continuing treatment and rec*","OR",2,27,581,9945
0,"Like","*continuing treatment and rec*","OR",2,27,581,9946
0,"Like","vocatio*","OR",2,27,581,9947
0,"Like","* vocatio*","OR",2,27,581,9948
0,"Like","employ*","OR",2,27,581,9949
0,"Like","*emply*","OR",2,27,581,9950
0,"Like","occupat*","OR",2,27,581,9951
0,"Like","*occupat*","OR",2,27,581,9952
0,"Like","job*","OR",2,27,581,9953
0,"Like","* job*","OR",2,27,581,9954
0,"Like","*rehabilitat*","OR",2,36,581,9955
0,"Like","*continuing treatment and rec*","OR",2,36,581,9956
0,"Like","* vocatio*","OR",2,36,581,9957
0,"Like","*emply*","OR",2,36,581,9958
0,"Like","*occupat*","OR",2,36,581,9959
0,"Like","* job*","OR",2,36,581,9960
0,"Like","*rehabilitat*","OR",2,57,581,9961
0,"Like","*continuing treatment and rec*","OR",2,57,581,9962
0,"Like","* vocatio*","OR",2,57,581,9963
0,"Like","*emply*","OR",2,57,581,9964
0,"Like","*occupat*","OR",2,57,581,9965
0,"Like","* job*",,2,57,581,9966
0,"Like","educat*","OR",2,27,582,9967
0,"Like","*educat*","OR",2,27,582,9968
0,"Like","training*","OR",2,27,582,9969
0,"Like","*training*","OR",2,27,582,9970
0,"Like","memory ther*","OR",2,27,582,9971
0,"Like","*memory ther*","OR",2,27,582,9972
0,"Like","supportive ther*","OR",2,27,582,9973
0,"Like","*supportive ther*","OR",2,27,582,9974
0,"Like","cognitive ther*","OR",2,27,582,9975
0,"Like","*cognitive ther*","OR",2,27,582,9976
0,"Like","garden*","OR",2,27,582,9977
0,"Like","*garden*","OR",2,27,582,9978
0,"Like","*educat*","OR",2,36,582,9979
0,"Like","*training*","OR",2,36,582,9980
0,"Like","*memory ther*","OR",2,36,582,9981
0,"Like","*supportive ther*","OR",2,36,582,9982
0,"Like","*cognitive ther*","OR",2,36,582,9983
0,"Like","*garden*","OR",2,36,582,9984
0,"Like","*educat*","OR",2,57,582,9985
0,"Like","*training*","OR",2,57,582,9986
0,"Like","*memory ther*","OR",2,57,582,9987
0,"Like","*supportive ther*","OR",2,57,582,9988
0,"Like","*cognitive ther*","OR",2,57,582,9989
0,"Like","*garden*",,2,57,582,9990
0,"Like","*work ther*","OR",2,27,585,10031
0,"Like","work ther*","OR",2,27,585,10032
0,"Like","sheltered work*","OR",2,27,585,10033
0,"Like","*sheltered work*","OR",2,27,585,10034
0,"Like","clubhouse*","OR",2,27,585,10035
0,"Like","*clubhouse*","OR",2,27,585,10036
0,"Like","club?house*","OR",2,27,585,10037
0,"Like","*club?house*","OR",2,27,585,10038
0,"Like","fountain house*","OR",2,27,585,10039
0,"Like","*fountain house*","OR",2,27,585,10040
0,"Like","*work ther*","OR",2,36,585,10041
0,"Like","*sheltered work*","OR",2,36,585,10042
0,"Like","*clubhouse*","OR",2,36,585,10043
0,"Like","*club?house*","OR",2,36,585,10044
0,"Like","*fountain house*","OR",2,36,585,10045
0,"Like","*work ther*","OR",2,57,585,10046
0,"Like","*sheltered work*","OR",2,57,585,10047
0,"Like","*clubhouse*","OR",2,57,585,10048
0,"Like","*club?house*","OR",2,57,585,10049
0,"Like","*fountain house*",,2,57,585,10050
0,"Like","*carbama*","OR",2,27,587,10062
0,"Like","*amizipin*","OR",2,27,587,10063
0,"Like","*carbag*","OR",2,27,587,10064
0,"Like","*carbymal*","OR",2,27,587,10065
0,"Like","*carpaz*","OR",2,27,587,10066
0,"Like","*carbap*","OR",2,27,587,10067
0,"Like","*cephalon*","OR",2,27,587,10068
0,"Like","*carbaz*","OR",2,27,587,10069
0,"Like","*carbama*","OR",2,36,587,10070
0,"Like","*amizipin*","OR",2,36,587,10071
0,"Like","*carbag*","OR",2,36,587,10072
0,"Like","*carbymal*","OR",2,36,587,10073
0,"Like","*carpaz*","OR",2,36,587,10074
0,"Like","*carbap*","OR",2,36,587,10075
0,"Like","*cephalon*","OR",2,36,587,10076
0,"Like","*carbaz*","OR",2,36,587,10077
0,"Like","*carbama*","OR",2,57,587,10078
0,"Like","*amizipin*","OR",2,57,587,10079
0,"Like","*carbag*","OR",2,57,587,10080
0,"Like","*carbymal*","OR",2,57,587,10081
0,"Like","*carpaz*","OR",2,57,587,10082
0,"Like","*carbap*","OR",2,57,587,10083
0,"Like","*cephalon*","OR",2,57,587,10084
0,"Like","*carbaz*","OR",2,57,587,10085
0,"Like","*degranol*","OR",2,27,588,10086
0,"Like","*epitol*","OR",2,27,588,10087
0,"Like","*finlepsin*","OR",2,27,588,10088
0,"Like","*fokalepsin*","OR",2,27,588,10089
0,"Like","*hermolepsin*","OR",2,27,588,10090
0,"Like","*neurotol*","OR",2,27,588,10091
0,"Like","*neurotop*","OR",2,27,588,10092
0,"Like","*norditol*","OR",2,27,588,10093
0,"Like","carbam*",,2,27,588,10094
0,"Like","*finlepsin*","OR",2,36,588,10095
0,"Like","*fokalepsin*","OR",2,36,588,10096
0,"Like","*hermolepsin*","OR",2,36,588,10097
0,"Like","*neurotol*","OR",2,36,588,10098
0,"Like","*neurotop*","OR",2,36,588,10099
0,"Like","*norditol*","OR",2,36,588,10100
0,"Like","*degranol*","OR",2,36,588,10101
0,"Like","*epitol*","OR",2,36,588,10102
0,"Like","*epitol*","OR",2,57,588,10103
0,"Like","*degranol*","OR",2,57,588,10104
0,"Like","*norditol*","OR",2,57,588,10105
0,"Like","*neurotop*","OR",2,57,588,10106
0,"Like","*neurotol*","OR",2,57,588,10107
0,"Like","*hermolepsin*","OR",2,57,588,10108
0,"Like","*fokalepsin*","OR",2,57,588,10109
0,"Like","*finlepsin*","OR",2,57,588,10110
0,"Like","*sirtal*","OR",2,27,589,10111
0,"Like","*tardotol*","OR",2,27,589,10112
0,"Like","*tegret*","OR",2,27,589,10113
0,"Like","* teril*","OR",2,27,589,10114
0,"Like","*timonil*","OR",2,27,589,10115
0,"Like","*trimonil*","OR",2,27,589,10116
0,"Like","*trialeptal*","OR",2,27,589,10117
0,"Like","*trileptal*","OR",2,27,589,10118
0,"Like","*tegret*","OR",2,36,589,10119
0,"Like","* teril*","OR",2,36,589,10120
0,"Like","*timonil*","OR",2,36,589,10121
0,"Like","*trimonil*","OR",2,36,589,10122
0,"Like","*trialeptal*","OR",2,36,589,10123
0,"Like","*trileptal*","OR",2,36,589,10124
0,"Like","*tardotol*","OR",2,36,589,10125
0,"Like","*sirtal*","OR",2,36,589,10126
0,"Like","*timonil*","OR",2,57,589,10127
0,"Like","*trimonil*","OR",2,57,589,10128
0,"Like","*trialeptal*","OR",2,57,589,10129
0,"Like","*trileptal*","OR",2,57,589,10130
0,"Like","*tardotol*","OR",2,57,589,10131
0,"Like","*sirtal*","OR",2,57,589,10132
0,"Like","*tegret*","OR",2,57,589,10133
0,"Like","* teril*","OR",2,57,589,10134
0,"Like","*lithium*","OR",2,27,590,10135
0,"Like","*lithicarb*","OR",2,27,590,10136
0,"Like","*eskalith*","OR",2,27,590,10137
0,"Like","*lithobid*","OR",2,27,590,10138
0,"Like","*lithane*","OR",2,27,590,10139
0,"Like","*cibalith-s*","OR",2,27,590,10140
0,"Like","*quilonum*","OR",2,27,590,10141
0,"Like","*hypnorex*","OR",2,27,590,10142
0,"Like","*lithium*","OR",2,36,590,10143
0,"Like","*lithicarb*","OR",2,36,590,10144
0,"Like","*eskalith*","OR",2,36,590,10145
0,"Like","*lithobid*","OR",2,36,590,10146
0,"Like","*lithane*","OR",2,36,590,10147
0,"Like","*cibalith-s*","OR",2,36,590,10148
0,"Like","*quilonum*","OR",2,36,590,10149
0,"Like","*hypnorex*","OR",2,36,590,10150
0,"Like","*lithium*","OR",2,57,590,10151
0,"Like","*lithicarb*","OR",2,57,590,10152
0,"Like","*eskalith*","OR",2,57,590,10153
0,"Like","*lithobid*","OR",2,57,590,10154
0,"Like","*lithane*","OR",2,57,590,10155
0,"Like","*cibalith-s*","OR",2,57,590,10156
0,"Like","*quilonum*","OR",2,57,590,10157
0,"Like","*hypnorex*",,2,57,590,10158
0,"Like","lithium*","OR",2,27,591,10159
0,"Like","lithicarb*","OR",2,27,591,10160
0,"Like","eskalith*","OR",2,27,591,10161
0,"Like","lithobid*","OR",2,27,591,10162
0,"Like","lithane*","OR",2,27,591,10163
0,"Like","cibalith-s*","OR",2,27,591,10164
0,"Like","quilonum*","OR",2,27,591,10165
0,"Like","hypnorex*",,2,27,591,10166
0,"Like","lithium*",,1,14,592,10167
0,"Like","*obsessi*","OR",2,27,593,10168
0,"Like","*compulsi*","OR",2,27,593,10169
0,"Like","*ybocs*","OR",2,27,593,10170
0,"Like","*y-bocs*","OR",2,27,593,10171
0,"Like","* ocd*","OR",2,27,593,10172
0,"Like","ocd*","OR",2,27,593,10173
0,"Like","obsess*","OR",2,27,593,10174
0,"Like","compulsi*","OR",2,27,593,10175
0,"Like","yboc*","OR",2,27,593,10176
0,"Like","y-boc*",,2,27,593,10177
0,"Like","*obsessi*","OR",2,36,593,10178
0,"Like","*compulsi*","OR",2,36,593,10179
0,"Like","*ybocs*","OR",2,36,593,10180
0,"Like","*y-bocs*","OR",2,36,593,10181
0,"Like","* ocd *","OR",2,36,593,10182
0,"Like","*obsessi*","OR",2,57,593,10183
0,"Like","*compulsi*","OR",2,57,593,10184
0,"Like","*ybocs*","OR",2,57,593,10185
0,"Like","*y-bocs*","OR",2,57,593,10186
0,"Like","* ocd*","OR",2,57,593,10187
0,"Like","*9-OH-risper*","OR",2,27,594,10188
0,"Like","9-OH-risper*","OR",2,27,594,10189
0,"Like","paliperid*","OR",2,27,594,10190
0,"Like","*paliperid*","OR",2,27,594,10191
0,"Like","*9-OH-risper*","OR",2,36,594,10192
0,"Like","*paliperid*","OR",2,36,594,10193
0,"Like","*9-OH-risper*","OR",2,57,594,10194
0,"Like","*paliperid*",,2,57,594,10195
0,"Like","*paliperid*","OR",1,14,595,10196
0,"Like","*9-OH-risper*",,1,14,595,10197
0,"Like","* ect*","OR",2,27,596,10198
0,"Like","ect *","OR",2,27,596,10199
0,"Like","electroconv*","OR",2,27,596,10200
0,"Like","*electroconv*","OR",2,27,596,10201
0,"Like","electro-con*","OR",2,27,596,10202
0,"Like","*electro-con*","OR",2,27,596,10203
0,"Like","electroshoc*","OR",2,27,596,10204
0,"Like","*electroshoc*","OR",2,27,596,10205
0,"Like","electro-shoc*","OR",2,27,596,10206
0,"Like","*electro-shoc*","OR",2,27,596,10207
0,"Like","*electroacup*","OR",2,27,596,10208
0,"Like","*electro-acup*","OR",2,27,596,10209
0,"Like","* ect *","OR",2,36,596,10210
0,"Like","*electroconv*","OR",2,36,596,10211
0,"Like","*electro-con*","OR",2,36,596,10212
0,"Like","*electroshoc*","OR",2,36,596,10213
0,"Like","*electro-shoc*","OR",2,36,596,10214
0,"Like","*electroacup*","OR",2,36,596,10215
0,"Like","*electro-acup*","OR",2,36,596,10216
0,"Like","* ect *","OR",2,57,596,10217
0,"Like","*electroconv*","OR",2,57,596,10218
0,"Like","*electro-con*","OR",2,57,596,10219
0,"Like","*electroshoc*","OR",2,57,596,10220
0,"Like","*electro-shoc*","OR",2,57,596,10221
0,"Like","*electroacup*","OR",2,57,596,10222
0,"Like","*electro-acup*",,2,57,596,10223
0,"Like","*deep brain*","OR",2,27,597,10224
0,"Like","deep brain*","OR",2,27,597,10225
0,"Like","vagus nerve*","OR",2,27,597,10226
0,"Like","*vagus nerve*","OR",2,27,597,10227
0,"Like","*deep brain*","OR",2,36,597,10228
0,"Like","*vagus nerve*","OR",2,36,597,10229
0,"Like","*deep brain*","OR",2,57,597,10230
0,"Like","*vagus nerve*","OR",2,57,597,10231
0,"Like","psychodynam*","OR",2,27,600,10259
0,"Like","*psychodynam*","OR",2,27,600,10260
0,"Like","psychoanal*","OR",2,27,600,10261
0,"Like","*psychoanal*","OR",2,27,600,10262
0,"Like","insight?orient*","OR",2,27,600,10263
0,"Like","*insight?orient*","OR",2,27,600,10264
0,"Like","reality?adap*","OR",2,27,600,10265
0,"Like","*reality?adap*","OR",2,27,600,10266
0,"Like","* EIO*","OR",2,27,600,10267
0,"Like","*analytic*","OR",2,27,600,10268
0,"Like","*dynamic*","OR",2,27,600,10269
0,"Like","*psychodynam*","OR",2,36,600,10270
0,"Like","*psychoanal*","OR",2,36,600,10271
0,"Like","*insight?orient*","OR",2,36,600,10272
0,"Like","*reality?adap*","OR",2,36,600,10273
0,"Like","* EIO*","OR",2,36,600,10274
0,"Like","*analytic*","OR",2,36,600,10275
0,"Like","*dynamic*","OR",2,36,600,10276
0,"Like","*psychoanal*","OR",2,57,600,10277
0,"Like","*psychodynam*","OR",2,57,600,10278
0,"Like","*insight?orient*","OR",2,57,600,10279
0,"Like","*reality?adap*","OR",2,57,600,10280
0,"Like","* EIO*","OR",2,57,600,10281
0,"Like","*analytic*","OR",2,57,600,10282
0,"Like","*dynamic*",,2,57,600,10283
0,"Like","*psychodyn*","OR",1,14,603,10293
0,"Like","*psychoanal*","OR",1,14,603,10294
0,"Like","*insight?orient*","OR",1,14,603,10295
0,"Like","*reality?adap*",,1,14,603,10296
0,"Like","*cognit*","AND",2,27,606,10309
0,"Like","*rehab*",,2,27,606,10310
0,"Like","bromperi*","OR",2,27,607,10311
0,"Like","*bromperi*","OR",2,27,607,10312
0,"Like","bromop*","OR",2,27,607,10313
0,"Like","*bromop*","OR",2,27,607,10314
0,"Like","azuren*","OR",2,27,607,10315
0,"Like","*azuren*","OR",2,27,607,10316
0,"Like","bridel*","OR",2,27,607,10317
0,"Like","*bridel*","OR",2,27,607,10318
0,"Like","bromidol*","OR",2,27,607,10319
0,"Like","*bromidol*","OR",2,27,607,10320
0,"Like","erodium*","OR",2,27,607,10321
0,"Like","*erodium*","OR",2,27,607,10322
0,"Like","*bromperi*","OR",2,36,607,10323
0,"Like","*bromop*","OR",2,36,607,10324
0,"Like","*azuren*","OR",2,36,607,10325
0,"Like","*bridel*","OR",2,36,607,10326
0,"Like","*bromidol*","OR",2,36,607,10327
0,"Like","*erodium*","OR",2,36,607,10328
0,"Like","*bromperi*","OR",2,57,607,10329
0,"Like","*bromop*","OR",2,57,607,10330
0,"Like","*azuren*","OR",2,57,607,10331
0,"Like","*bridel*","OR",2,57,607,10332
0,"Like","*bromidol*","OR",2,57,607,10333
0,"Like","*erodium*",,2,57,607,10334
0,"Like","impromen*","OR",2,27,608,10335
0,"Like","*impromen*","OR",2,27,608,10336
0,"Like","lunapron*","OR",2,27,608,10337
0,"Like","*lunapron*","OR",2,27,608,10338
0,"Like","prindil*","OR",2,27,608,10339
0,"Like","*prindil*","OR",2,27,608,10340
0,"Like","ropel*","OR",2,27,608,10341
0,"Like","*ropel*","OR",2,27,608,10342
0,"Like","*r 46541*","OR",2,27,608,10343
0,"Like","*tesoprel*","OR",2,27,608,10344
0,"Like","*r 11?333*","OR",2,27,608,10345
0,"Like","*impromen*","OR",2,36,608,10346
0,"Like","*lunapron*","OR",2,36,608,10347
0,"Like","*prindil*","OR",2,36,608,10348
0,"Like","*ropel*","OR",2,36,608,10349
0,"Like","*tesoprel*","OR",2,36,608,10350
0,"Like","*r 11?333*","OR",2,36,608,10351
0,"Like","*r 46541*","OR",2,36,608,10352
0,"Like","*impromen*","OR",2,57,608,10353
0,"Like","*lunapron*","OR",2,57,608,10354
0,"Like","*prindil*","OR",2,57,608,10355
0,"Like","*ropel*","OR",2,57,608,10356
0,"Like","*tesoprel*","OR",2,57,608,10357
0,"Like","*r 11?333*","OR",2,57,608,10358
0,"Like","*r 46541*",,2,57,608,10359
0,"Like","*bromperidol*",,1,14,609,10360
0,"Like","physical*","AND",2,27,612,10370
0,"Like","*therapy*",,2,27,612,10371
0,"Like","*physical*","AND",2,36,613,10372
0,"Like","*intervention*",,2,36,613,10373
0,"Like","*physical*","AND",2,57,614,10374
0,"Like","*therap*",,2,57,614,10375
0,"Like","fitnes*","OR",2,27,615,10376
0,"Like","*fitnes*","OR",2,27,615,10377
0,"Like","sport*","OR",2,27,615,10378
0,"Like","*sport*","OR",2,27,615,10379
0,"Like","gym*","OR",2,27,615,10380
0,"Like","*gym*","OR",2,27,615,10381
0,"Like","exercis*","OR",2,27,615,10382
0,"Like","*exercis*","OR",2,27,615,10383
0,"Like","danc*","OR",2,27,615,10384
0,"Like","* danc*","OR",2,27,615,10385
0,"Like","*fitnes*","OR",2,36,615,10386
0,"Like","*sport*","OR",2,36,615,10387
0,"Like","*gym*","OR",2,36,615,10388
0,"Like","*exercis*","OR",2,36,615,10389
0,"Like","* danc*","OR",2,36,615,10390
0,"Like","*fitnes*","OR",2,57,615,10391
0,"Like","*sport*","OR",2,57,615,10392
0,"Like","*gym*","OR",2,57,615,10393
0,"Like","*exercis*","OR",2,57,615,10394
0,"Like","* danc*",,2,57,615,10395
0,"Like","*exercise*","OR",1,14,616,10396
0,"Like","dance*","OR",1,14,616,10397
0,"Like","physical activ*",,1,14,616,10398
0,"Like","aethaperaz*","OR",2,27,617,10399
0,"Like","*aethaperaz*","OR",2,27,617,10400
0,"Like","perphenazi*","OR",2,27,617,10401
0,"Like","*perphenazi*","OR",2,27,617,10402
0,"Like","perfenazi*","OR",2,27,617,10403
0,"Like","*perfenazi*","OR",2,27,617,10404
0,"Like","decentran*","OR",2,27,617,10405
0,"Like","*decentran*","OR",2,27,617,10406
0,"Like","fentazin*","OR",2,27,617,10407
0,"Like","*fentazin*","OR",2,27,617,10408
0,"Like","f-mon*","OR",2,27,617,10409
0,"Like","*f-mon*","OR",2,27,617,10410
0,"Like","*aethaperaz*","OR",2,36,617,10411
0,"Like","*perphenazi*","OR",2,36,617,10412
0,"Like","*perfenazi*","OR",2,36,617,10413
0,"Like","*decentran*","OR",2,36,617,10414
0,"Like","*fentazin*","OR",2,36,617,10415
0,"Like","*f-mon*","OR",2,36,617,10416
0,"Like","*aethaperaz*","OR",2,57,617,10417
0,"Like","*perphenazi*","OR",2,57,617,10418
0,"Like","*perfenazi*","OR",2,57,617,10419
0,"Like","*decentran*","OR",2,57,617,10420
0,"Like","*fentazin*","OR",2,57,617,10421
0,"Like","*f-mon*",,2,57,617,10422
0,"Like","peratsin*","OR",2,27,618,10423
0,"Like","*peratsin*","OR",2,27,618,10424
0,"Like","triptafen*","OR",2,27,618,10425
0,"Like","*triptafen*","OR",2,27,618,10426
0,"Like","trilaf?n*","OR",2,27,618,10427
0,"Like","*trilaf?n*","OR",2,27,618,10428
0,"Like","chlorpiprazin*","OR",2,27,618,10429
0,"Like","*chlorpiprazin*","OR",2,27,618,10430
0,"Like","chlorphenothiaz*","OR",2,27,618,10431
0,"Like","*chlorphenothiaz*","OR",2,27,618,10432
0,"Like","*peratsin*","OR",2,36,618,10433
0,"Like","*triptafen*","OR",2,36,618,10434
0,"Like","*trilaf?n*","OR",2,36,618,10435
0,"Like","*chlorpiprazin*","OR",2,36,618,10436
0,"Like","*chlorphenothiaz*","OR",2,36,618,10437
0,"Like","*peratsin*","OR",2,57,618,10438
0,"Like","*triptafen*","OR",2,57,618,10439
0,"Like","*trilaf?n*","OR",2,57,618,10440
0,"Like","*chlorpiprazin*","OR",2,57,618,10441
0,"Like","*chlorphenothiaz*",,2,57,618,10442
0,"Like","*perphenazin*","AND",1,14,620,10445
0,">=","10-07-2001",,1,67,620,10446
0,"Like","*quetiapine*","OR",2,27,621,10447
0,"Like","quetiapine*","OR",2,27,621,10448
0,"Like","seroquel*","OR",2,27,621,10449
0,"Like","*seroquel*","OR",2,27,621,10450
0,"Like","ICI?204636*","OR",2,27,621,10451
0,"Like","*ICI?204636*","OR",2,27,621,10452
0,"Like","ICI204636*","OR",2,27,621,10453
0,"Like","*ICI204636*","OR",2,27,621,10454
0,"Like","ici 204?636*","OR",2,27,621,10455
0,"Like","*ici 204?636*","OR",2,27,621,10456
0,"Like","*quetiapine*","OR",2,36,621,10457
0,"Like","*seroquel*","OR",2,36,621,10458
0,"Like","*ICI?204636*","OR",2,36,621,10459
0,"Like","*ICI204636*","OR",2,36,621,10460
0,"Like","*ici 204?636*","OR",2,36,621,10461
0,"Like","*quetiapine*","OR",2,57,621,10462
0,"Like","*seroquel*","OR",2,57,621,10463
0,"Like","*ICI?204636*","OR",2,57,621,10464
0,"Like","*ICI204636*","OR",2,57,621,10465
0,"Like","*ici 204?636*",,2,57,621,10466
0,"Like","Quetiap*","AND",1,14,622,10467
0,">=","27-01-2003",,1,67,622,10468
0,"Like","*fire*","OR",2,27,623,10469
0,"Like","fire*","OR",2,27,623,10470
0,"Like","arson*","OR",2,27,623,10471
0,"Like","*arson*","OR",2,27,623,10472
0,"Like","pyromani*","OR",2,27,623,10473
0,"Like","*pyromani*","OR",2,27,623,10474
0,"Like","*fire*","OR",2,36,623,10475
0,"Like","*arson*","OR",2,36,623,10476
0,"Like","*pyromani*","OR",2,36,623,10477
0,"Like","*fire*","OR",2,57,623,10478
0,"Like","*arson*","OR",2,57,623,10479
0,"Like","*pyromani*",,2,57,623,10480
0,"Like","*fire*","OR",1,15,624,10481
0,"Like","*fire*","OR",1,17,624,10482
0,"Like","*arson*",,1,17,624,10483
0,"Like","09121*","OR",2,66,625,10484
0,"=","07268","OR",2,66,625,10485
0,"=","07265","OR",2,66,625,10486
0,"=","07429","OR",2,66,625,10487
0,"=","07270","OR",2,66,625,10488
0,"=","07271","OR",2,66,625,10489
0,"=","07272","OR",2,66,625,10490
0,"=","07273","OR",2,66,625,10491
0,"=","07279","OR",2,66,625,10492
0,"=","07285","OR",2,66,625,10493
0,"=","07292","OR",2,66,625,10494
0,"=","07294","OR",2,66,625,10495
0,"=","07296","OR",2,66,625,10496
0,"=","07304","OR",2,66,625,10497
0,"=","07305","OR",2,66,625,10498
0,"=","07336","OR",2,66,625,10499
0,"=","07306","OR",2,66,625,10500
0,"=","07302","OR",2,66,625,10501
0,"=","07303","OR",2,66,625,10502
0,"=","07369","OR",2,66,625,10503
0,"=","07370","OR",2,66,625,10504
0,"=","07376","OR",2,66,625,10505
0,"=","07427","OR",2,66,625,10506
0,"=","07428","OR",2,66,625,10507
0,"=","07539","OR",2,66,625,10508
0,"=","07582",,2,66,625,10509
0,"=","07586","OR",2,66,626,10510
0,"=","07592","OR",2,66,626,10511
0,"=","07616","OR",2,66,626,10512
0,"=","07647","OR",2,66,626,10513
0,"=","07697","OR",2,66,626,10514
0,"=","07705","OR",2,66,626,10515
0,"=","07742","OR",2,66,626,10516
0,"=","07743","OR",2,66,626,10517
0,"=","07747","OR",2,66,626,10518
0,"=","07748","OR",2,66,626,10519
0,"=","07781","OR",2,66,626,10520
0,"=","07789","OR",2,66,626,10521
0,"=","07790","OR",2,66,626,10522
0,"=","09121","OR",2,66,626,10523
0,"Like","valproat*","OR",2,27,627,10524
0,"Like","*valproat*","OR",2,27,627,10525
0,"Like","valproic acid*","OR",2,27,627,10526
0,"Like","*valproic acid*","OR",2,27,627,10527
0,"Like","sodium dipropyl*","OR",2,27,627,10528
0,"Like","*sodium dipropyl*","OR",2,27,627,10529
0,"Like","convulex*","OR",2,27,627,10530
0,"Like","*convulex*","OR",2,27,627,10531
0,"Like","depak?ne*","OR",2,27,627,10532
0,"Like","*depa?ene*","OR",2,27,627,10533
0,"Like","ergenyl*","OR",2,27,627,10534
0,"Like","*ergenyl*","OR",2,27,627,10535
0,"Like","*depakot*","OR",2,27,627,10536
0,"Like","*valproat*","OR",2,36,627,10537
0,"Like","*valproic acid*","OR",2,36,627,10538
0,"Like","*sodium dipropyl*","OR",2,36,627,10539
0,"Like","*convulex*","OR",2,36,627,10540
0,"Like","*depak?ne*","OR",2,36,627,10541
0,"Like","*ergenyl*","OR",2,36,627,10542
0,"Like","*depakot*","OR",2,36,627,10543
0,"Like","*valproat*","OR",2,57,627,10544
0,"Like","*valproic acid*","OR",2,57,627,10545
0,"Like","*sodium dipropyl*","OR",2,57,627,10546
0,"Like","*convulex*","OR",2,57,627,10547
0,"Like","*depak?ne*","OR",2,57,627,10548
0,"Like","*depakot*",,2,57,627,10549
0,"Like","dipropyl acet*","OR",2,27,628,10550
0,"Like","*dipropyl acet*","OR",2,27,628,10551
0,"Like","divalproex*","OR",2,27,628,10552
0,"Like","*divalproex*","OR",2,27,628,10553
0,"Like","propylpent*","OR",2,27,628,10554
0,"Like","*propylpent*","OR",2,27,628,10555
0,"Like","confulsof*","OR",2,27,628,10556
0,"Like","*confulsof*","OR",2,27,628,10557
0,"Like","vupral*","OR",2,27,628,10558
0,"Like","*vupral*","OR",2,27,628,10559
0,"Like","ergenyl*","OR",2,27,628,10560
0,"Like","*ergenyl*","OR",2,27,628,10561
0,"Like","*dipropyl acet*","OR",2,36,628,10562
0,"Like","*divalproex*","OR",2,36,628,10563
0,"Like","*propylpent*","OR",2,36,628,10564
0,"Like","*confulsof*","OR",2,36,628,10565
0,"Like","*vupral*","OR",2,36,628,10566
0,"Like","*ergenyl*","OR",2,36,628,10567
0,"Like","*dipropyl acet*","OR",2,57,628,10568
0,"Like","*divalproex*","OR",2,57,628,10569
0,"Like","*propylpent*","OR",2,57,628,10570
0,"Like","*confulsof*","OR",2,57,628,10571
0,"Like","*vupral*",,2,57,628,10572
0,"Like","cognitiv*","OR",2,27,629,10573
0,"Like","*cognitiv*","OR",2,27,629,10574
0,"Like","cognitiv*","OR",2,36,629,10575
0,"Like","*cognitiv*","OR",2,36,629,10576
0,"Like","cognitive*","OR",2,57,629,10577
0,"Like","*cognitiv*",,2,57,629,10578
0,"Like","behavio*","OR",2,27,630,10579
0,"Like","*behavio*","OR",2,27,630,10580
0,"Like","therap*","OR",2,27,630,10581
0,"Like","* therap*","OR",2,27,630,10582
0,"Like","*behavio*","OR",2,36,630,10583
0,"Like","* therap*","OR",2,36,630,10584
0,"Like","*behavio*","OR",2,57,630,10585
0,"Like","* therap*",,2,57,630,10586
0,"Like","technique*","OR",2,27,631,10587
0,"Like","*technique*","OR",2,27,631,10588
0,"Like","restructur*","OR",2,27,631,10589
0,"Like","*restructur*","OR",2,27,631,10590
0,"Like","challenge*","OR",2,27,631,10591
0,"Like","*challenge*","OR",2,27,631,10592
0,"Like","*technique*","OR",2,36,631,10593
0,"Like","*restructur*","OR",2,36,631,10594
0,"Like","*challenge*","OR",2,36,631,10595
0,"Like","*technique*","OR",2,57,631,10596
0,"Like","*restructur*","OR",2,57,631,10597
0,"Like","*challenge*",,2,57,631,10598
0,"Like","self*","OR",2,27,632,10599
0,"Like","*self*","OR",2,27,632,10600
0,"Like","*self*","OR",2,36,632,10601
0,"Like","*self*",,2,57,632,10602
0,"Like","instruct*","OR",2,27,633,10603
0,"Like","*instruct*","OR",2,27,633,10604
0,"Like","management*","OR",2,27,633,10605
0,"Like","*management*","OR",2,27,633,10606
0,"Like","*attribution*","OR",2,27,633,10607
0,"Like","*instruct*","OR",2,36,633,10608
0,"Like","*management*","OR",2,36,633,10609
0,"Like","*attribution*","OR",2,36,633,10610
0,"Like","*instruct*","OR",2,57,633,10611
0,"Like","*management*","OR",2,57,633,10612
0,"Like","*attribution*",,2,57,633,10613
0,"Like","Rational*","OR",2,27,634,10614
0,"Like","*Rational*","OR",2,27,634,10615
0,"Like","*Rational*",,2,36,634,10616
0,"Like","*Rational*","OR",2,57,634,10617
0,"Like","emotiv*","OR",2,27,635,10618
0,"Like","*emotiv*","OR",2,27,635,10619
0,"Like","*emotiv*",,2,36,635,10620
0,"Like","*emotiv*","OR",2,57,635,10621
0,"Like","*cognitiv*","AND",1,14,636,10622
0,">=","29-01-2004",,1,67,636,10623
0,"Like","*loxapin*","OR",2,27,637,10624
0,"Like","*oxilapin*","OR",2,27,637,10625
0,"Like","*loxpac*","OR",2,27,637,10626
0,"Like","*loxitane*","OR",2,27,637,10627
0,"Like","*desconex*","OR",2,27,637,10628
0,"Like","*cloxazepin*","OR",2,27,637,10629
0,"Like","*amoxapin*","OR",2,27,637,10630
0,"Like","*cl-71*","OR",2,27,637,10631
0,"Like","loxapin*","OR",2,27,637,10632
0,"Like","amoxapin*",,2,27,637,10633
0,"Like","*loxapin*","OR",2,36,637,10634
0,"Like","*oxilapin*","OR",2,36,637,10635
0,"Like","*loxpac*","OR",2,36,637,10636
0,"Like","*loxitane*","OR",2,36,637,10637
0,"Like","*desconex*","OR",2,36,637,10638
0,"Like","*cloxazepin*","OR",2,36,637,10639
0,"Like","*amoxapin*","OR",2,36,637,10640
0,"Like","*cl-71*","OR",2,36,637,10641
0,"Like","*loxapin*","OR",2,57,637,10642
0,"Like","*oxilapin*","OR",2,57,637,10643
0,"Like","*loxpac*","OR",2,57,637,10644
0,"Like","*loxitane*","OR",2,57,637,10645
0,"Like","*desconex*","OR",2,57,637,10646
0,"Like","*cloxazepin*","OR",2,57,637,10647
0,"Like","*amoxapin*","OR",2,57,637,10648
0,"Like","*cl-71*","OR",2,57,637,10649
0,"Like","epilep*","OR",2,27,638,10650
0,"Like","*epilep*","OR",2,27,638,10651
0,"Like","seizure*","OR",2,27,638,10652
0,"Like","*seizure*","OR",2,27,638,10653
0,"Like","*epilep*","OR",2,36,638,10654
0,"Like","*seizure*","OR",2,36,638,10655
0,"Like","*epilep*","OR",2,57,638,10656
0,"Like","*seizure*",,2,57,638,10657
0,"Like","*epilep*",,1,14,639,10658
0,"Like","aripiprazol*","OR",2,27,640,10659
0,"Like","*aripiprazol*","OR",2,27,640,10660
0,"Like","*aripiprazol*","OR",2,36,640,10661
0,"Like","*aripiprazol*",,2,57,640,10662
0,"Like","clozapin*","OR",2,27,641,10663
0,"Like","*clozapin*","OR",2,27,641,10664
0,"Like","olanzapin*","OR",2,27,641,10665
0,"Like","*olanzapin*","OR",2,27,641,10666
0,"Like","quetiapin*","OR",2,27,641,10667
0,"Like","*quetiapin*","OR",2,27,641,10668
0,"Like","risperidon*","OR",2,27,641,10669
0,"Like","*risperidon*","OR",2,27,641,10670
0,"Like","sertindol*","OR",2,27,641,10671
0,"Like","*sertindol*","OR",2,27,641,10672
0,"Like","ziprasidon*","OR",2,27,641,10673
0,"Like","*ziprasidon*","OR",2,27,641,10674
0,"Like","*clozapin*","OR",2,36,641,10675
0,"Like","*olanzapin*","OR",2,36,641,10676
0,"Like","*quetiapin*","OR",2,36,641,10677
0,"Like","*risperidon*","OR",2,36,641,10678
0,"Like","*sertindol*","OR",2,36,641,10679
0,"Like","*ziprasidon*","OR",2,36,641,10680
0,"Like","*clozapin*","OR",2,57,641,10681
0,"Like","*olanzapin*","OR",2,57,641,10682
0,"Like","*quetiapin*","OR",2,57,641,10683
0,"Like","*risperidon*","OR",2,57,641,10684
0,"Like","*sertindol*","OR",2,57,641,10685
0,"Like","*ziprasidon*",,2,57,641,10686
0,"Like","zotepin*","OR",2,27,642,10687
0,"Like","*zotepin*","OR",2,27,642,10688
0,"Like","*zotepin*","OR",2,36,642,10689
0,"Like","*zotepin*",,2,57,642,10690
0,"Like","*amisulprid","OR",2,27,643,10691
0,"Like","*amisulprid*","OR",2,27,643,10692
0,"Like","*amisulprid*","OR",2,36,643,10693
0,"Like","*amisulprid*",,2,57,643,10694
0,"Like","clozapin*","OR",2,27,644,10695
0,"Like","*clozapin*","OR",2,27,644,10696
0,"Like","olanzapin*","OR",2,27,644,10697
0,"Like","*olanzapin*","OR",2,27,644,10698
0,"Like","quetiapin*","OR",2,27,644,10699
0,"Like","*quetiapin*","OR",2,27,644,10700
0,"Like","risperidon*","OR",2,27,644,10701
0,"Like","*risperidon*","OR",2,27,644,10702
0,"Like","sertindol*","OR",2,27,644,10703
0,"Like","*sertindol*","OR",2,27,644,10704
0,"Like","amisulprid*","OR",2,27,644,10705
0,"Like","*amisulprid*","OR",2,27,644,10706
0,"Like","*clozapin*","OR",2,36,644,10707
0,"Like","*olanzapin*","OR",2,36,644,10708
0,"Like","*quetiapin*","OR",2,36,644,10709
0,"Like","*risperidon*","OR",2,36,644,10710
0,"Like","*sertindol*","OR",2,36,644,10711
0,"Like","*amisulprid*","OR",2,36,644,10712
0,"Like","*clozapin*","OR",2,57,644,10713
0,"Like","*olanzapin*","OR",2,57,644,10714
0,"Like","*quetiapin*","OR",2,57,644,10715
0,"Like","*risperidon*","OR",2,57,644,10716
0,"Like","*sertindol*","OR",2,57,644,10717
0,"Like","*amisulprid*",,2,57,644,10718
0,"Like","zotepin*","OR",2,27,645,10719
0,"Like","*zotepin*","OR",2,27,645,10720
0,"Like","ziprasidon*","OR",2,27,645,10721
0,"Like","*ziprasidon*","OR",2,27,645,10722
0,"Like","*zotepin*","OR",2,36,645,10723
0,"Like","*ziprasidon*","OR",2,36,645,10724
0,"Like","*zotepin*","OR",2,57,645,10725
0,"Like","*ziprasidon*",,2,57,645,10726
0,"Like","clozapin*","OR",2,27,646,10727
0,"Like","*clozapin*","OR",2,27,646,10728
0,"Like","*clozapin*","OR",2,36,646,10729
0,"Like","*clozapin*",,2,57,646,10730
0,"Like","zotepin*","OR",2,27,647,10731
0,"Like","*zotepin*","OR",2,27,647,10732
0,"Like","olanzapin*","OR",2,27,647,10733
0,"Like","*olanzapin*","OR",2,27,647,10734
0,"Like","quetiapin*","OR",2,27,647,10735
0,"Like","*quetiapin*","OR",2,27,647,10736
0,"Like","risperidon*","OR",2,27,647,10737
0,"Like","*risperidon*","OR",2,27,647,10738
0,"Like","sertindol*","OR",2,27,647,10739
0,"Like","*sertindol*","OR",2,27,647,10740
0,"Like","ziprasidon*","OR",2,27,647,10741
0,"Like","*ziprasidon*","OR",2,27,647,10742
0,"Like","*zotepin*","OR",2,36,647,10743
0,"Like","*olanzapin*","OR",2,36,647,10744
0,"Like","*quetiapin*","OR",2,36,647,10745
0,"Like","*risperidon*","OR",2,36,647,10746
0,"Like","*sertindol*","OR",2,36,647,10747
0,"Like","*ziprasidon*","OR",2,36,647,10748
0,"Like","*zotepin*","OR",2,57,647,10749
0,"Like","*olanzapin*","OR",2,57,647,10750
0,"Like","*quetiapin*","OR",2,57,647,10751
0,"Like","*risperidon*","OR",2,57,647,10752
0,"Like","*sertindol*","OR",2,57,647,10753
0,"Like","*ziprasidon*",,2,57,647,10754
0,"Like","Olanzapin*","OR",2,27,648,10755
0,"Like","*olanzapin*","OR",2,27,648,10756
0,"Like","*olanzapin*","OR",2,36,648,10757
0,"Like","*olanzapin*",,2,57,648,10758
0,"Like","zotepin*","OR",2,27,649,10759
0,"Like","*zotepin*","OR",2,27,649,10760
0,"Like","quetiapin*","OR",2,27,649,10761
0,"Like","*quetiapin*","OR",2,27,649,10762
0,"Like","risperidon*","OR",2,27,649,10763
0,"Like","*risperidon*","OR",2,27,649,10764
0,"Like","sertindol*","OR",2,27,649,10765
0,"Like","*sertindol*","OR",2,27,649,10766
0,"Like","ziprasidon*","OR",2,27,649,10767
0,"Like","*ziprasidon*","OR",2,27,649,10768
0,"Like","*zotepin*","OR",2,36,649,10769
0,"Like","*quetiapin*","OR",2,36,649,10770
0,"Like","*risperidon*","OR",2,36,649,10771
0,"Like","*sertindol*","OR",2,36,649,10772
0,"Like","*ziprasidon*","OR",2,36,649,10773
0,"Like","*zotepin*","OR",2,57,649,10774
0,"Like","*quetiapin*","OR",2,57,649,10775
0,"Like","*risperidon*","OR",2,57,649,10776
0,"Like","*sertindol*","OR",2,57,649,10777
0,"Like","*ziprasidon*",,2,57,649,10778
0,"Like","quetiapin*","OR",2,27,650,10779
0,"Like","*quetiapin*","OR",2,27,650,10780
0,"Like","*quetiapin*","OR",2,36,650,10781
0,"Like","*quetiapin*",,2,57,650,10782
0,"Like","zotepin*","OR",2,27,651,10783
0,"Like","*zotepin*","OR",2,27,651,10784
0,"Like","risperidon*","OR",2,27,651,10785
0,"Like","*risperidon*","OR",2,27,651,10786
0,"Like","sertindol*","OR",2,27,651,10787
0,"Like","*sertindol*","OR",2,27,651,10788
0,"Like","ziprasidon*","OR",2,27,651,10789
0,"Like","*ziprasidon*","OR",2,27,651,10790
0,"Like","*zotepin*","OR",2,36,651,10791
0,"Like","*risperidon*","OR",2,36,651,10792
0,"Like","*sertindol*","OR",2,36,651,10793
0,"Like","*ziprasidon*","OR",2,36,651,10794
0,"Like","*zotepin*","OR",2,57,651,10795
0,"Like","*risperidon*","OR",2,57,651,10796
0,"Like","*sertindol*","OR",2,57,651,10797
0,"Like","*ziprasidon*",,2,57,651,10798
0,"Like","risperidon*","OR",2,27,652,10799
0,"Like","*risperidon*","OR",2,27,652,10800
0,"Like","*risperidon*","OR",2,36,652,10801
0,"Like","*risperidon*",,2,57,652,10802
0,"Like","zotepin*","OR",2,27,653,10803
0,"Like","*zotepin*","OR",2,27,653,10804
0,"Like","sertindol*","OR",2,27,653,10805
0,"Like","*sertindol*","OR",2,27,653,10806
0,"Like","ziprasidon*","OR",2,27,653,10807
0,"Like","*ziprasidon*","OR",2,27,653,10808
0,"Like","*zotepin*","OR",2,36,653,10809
0,"Like","*sertindol*","OR",2,36,653,10810
0,"Like","*ziprasidon*","OR",2,36,653,10811
0,"Like","*zotepin*","OR",2,57,653,10812
0,"Like","*sertindol*","OR",2,57,653,10813
0,"Like","*ziprasidon*",,2,57,653,10814
0,"Like","sertindol*","OR",2,27,657,10831
0,"Like","*sertindol*","OR",2,27,657,10832
0,"Like","*sertindol*","OR",2,36,657,10833
0,"Like","*sertindol*",,2,57,657,10834
0,"Like","zotepin*","OR",2,27,659,10843
0,"Like","*zotepin*","OR",2,27,659,10844
0,"Like","ziprasidon*","OR",2,27,659,10845
0,"Like","*ziprasidon*","OR",2,27,659,10846
0,"Like","*zotepin*","OR",2,36,659,10847
0,"Like","*ziprasidon*","OR",2,36,659,10848
0,"Like","*zotepin*","OR",2,57,659,10849
0,"Like","*ziprasidon*",,2,57,659,10850
0,"Like","ziprasidon*","OR",2,27,660,10851
0,"Like","*ziprasidon*","OR",2,27,660,10852
0,"Like","*ziprasidon*","OR",2,36,660,10853
0,"Like","*ziprasidon*",,2,57,660,10854
0,"Like","zotepin*","OR",2,27,661,10855
0,"Like","*zotepin*","OR",2,27,661,10856
0,"Like","*zotepin*","OR",2,36,661,10857
0,"Like","*zotepin*",,2,57,661,10858
0,"Like","benzhexol*","OR",2,27,662,10859
0,"Like","*benzhexol*","OR",2,27,662,10860
0,"Like","broflex*","OR",2,27,662,10861
0,"Like","*broflex*","OR",2,27,662,10862
0,"Like","benzatrop*","OR",2,27,662,10863
0,"Like","*benzatrop*","OR",2,27,662,10864
0,"Like","*cogentin*","OR",2,27,662,10865
0,"Like","*biperiden*","OR",2,27,662,10866
0,"Like","*akineton*","OR",2,27,662,10867
0,"Like","trihexyphen*","OR",2,27,662,10868
0,"Like","*trihexyphen*","OR",2,27,662,10869
0,"Like","*benzhexol*","OR",2,36,662,10870
0,"Like","*broflex*","OR",2,36,662,10871
0,"Like","*benzatrop*","OR",2,36,662,10872
0,"Like","*cogentin*","OR",2,36,662,10873
0,"Like","*biperiden*","OR",2,36,662,10874
0,"Like","*akineton*","OR",2,36,662,10875
0,"Like","*trihexyphen*","OR",2,36,662,10876
0,"Like","*benzhexol*","OR",2,57,662,10877
0,"Like","*broflex*","OR",2,57,662,10878
0,"Like","*benzatrop*","OR",2,57,662,10879
0,"Like","*cogentin*","OR",2,57,662,10880
0,"Like","*biperiden*","OR",2,57,662,10881
0,"Like","*akineton*",,2,57,662,10882
0,"Like","*trihexyphen*","OR",2,57,662,10883
0,"Like","*orphenadr*","OR",2,27,663,10884
0,"Like","*biorphen*","OR",2,27,663,10885
0,"Like","*disipal*","OR",2,27,663,10886
0,"Like","*procyclid*","OR",2,27,663,10887
0,"Like","*arpicoli*","OR",2,27,663,10888
0,"Like","*kemadrin*","OR",2,27,663,10889
0,"Like","anticholine*","OR",2,27,663,10890
0,"Like","*orphenadr*","OR",2,36,663,10891
0,"Like","*biorphen*","OR",2,36,663,10892
0,"Like","*disipal*","OR",2,36,663,10893
0,"Like","*procyclid*","OR",2,36,663,10894
0,"Like","*arpicoli*","OR",2,36,663,10895
0,"Like","*kemadrin*","OR",2,36,663,10896
0,"Like","*orphenadr*","OR",2,57,663,10897
0,"Like","*biorphen*","OR",2,57,663,10898
0,"Like","*disipal*","OR",2,57,663,10899
0,"Like","*procyclid*","OR",2,57,663,10900
0,"Like","*arpicoli*","OR",2,57,663,10901
0,"Like","*kemadrin*",,2,57,663,10902
0,"Like","parkinson*","OR",2,27,665,10922
0,"Like","*parkinson*","OR",2,27,665,10923
0,"Like","movem*","OR",2,27,665,10924
0,"Like","*movem*","OR",2,27,665,10925
0,"Like","*pyramid*","OR",2,27,665,10926
0,"Like","eps *","OR",2,27,665,10927
0,"Like","* eps*","OR",2,27,665,10928
0,"Like","esrs *","OR",2,27,665,10929
0,"Like","* esrs*","OR",2,27,665,10930
0,"Like","*parkinson*","OR",2,36,665,10931
0,"Like","*movem*","OR",2,36,665,10932
0,"Like","*pyramid*","OR",2,36,665,10933
0,"Like","* eps*","OR",2,36,665,10934
0,"Like","* esrs*","OR",2,36,665,10935
0,"Like","*parkinson*","OR",2,45,665,10936
0,"Like","*movem*","OR",2,57,665,10937
0,"Like","*pyramid*","OR",2,57,665,10938
0,"Like","* eps*","OR",2,57,665,10939
0,"Like","* esrs*",,2,57,665,10940
0,"Like","clozapin*","OR",2,27,666,10941
0,"Like","*clozapin*","OR",2,27,666,10942
0,"Like","clozaril*","OR",2,27,666,10943
0,"Like","*clozaril*","OR",2,27,666,10944
0,"Like","*denzapin*","OR",2,27,666,10945
0,"Like","*zaponex*","OR",2,27,666,10946
0,"Like","denzapin*","OR",2,27,666,10947
0,"Like","zaponex*",,2,27,666,10948
0,"Like","*clozapin*","OR",2,36,666,10949
0,"Like","*clozaril*","OR",2,36,666,10950
0,"Like","*denzapin*","OR",2,36,666,10951
0,"Like","*zaponex*","OR",2,36,666,10952
0,"Like","*clozapin*","OR",2,57,666,10953
0,"Like","*clozaril*","OR",2,57,666,10954
0,"Like","*denzapin*","OR",2,57,666,10955
0,"Like","*zaponex*","OR",2,57,666,10956
0,"Like","*hypersaliva*","OR",2,27,667,10957
0,"Like","* saliva*","OR",2,27,667,10958
0,"Like","saliva*","OR",2,27,667,10959
0,"Like","*ptyalism*","OR",2,27,667,10960
0,"Like","*sialism*","OR",2,27,667,10961
0,"Like","*sialorr*","OR",2,27,667,10962
0,"Like","*drool*","OR",2,27,667,10963
0,"Like","hypersaliv*",,2,27,667,10964
0,"Like","*hypersaliva*","OR",2,36,667,10965
0,"Like","* saliva*","OR",2,36,667,10966
0,"Like","*ptyalism*","OR",2,36,667,10967
0,"Like","*sialism*","OR",2,36,667,10968
0,"Like","*sialorr*","OR",2,36,667,10969
0,"Like","*drool*","OR",2,36,667,10970
0,"Like","*hypersaliva*","OR",2,57,667,10971
0,"Like","* saliva*","OR",2,57,667,10972
0,"Like","*ptyalism*","OR",2,57,667,10973
0,"Like","*sialism*","OR",2,57,667,10974
0,"Like","*sialorr*","OR",2,57,667,10975
0,"Like","*drool*","OR",2,57,667,10976
0,"Like","hindu*","OR",2,27,670,10993
0,"Like","*hindu*","OR",2,27,670,10994
0,"Like","siddha*","OR",2,27,670,10995
0,"Like","*siddha*","OR",2,27,670,10996
0,"Like","ayurvedic*","OR",2,27,670,10997
0,"Like","*ayurvedic*","OR",2,27,670,10998
0,"Like","brahm*","OR",2,27,670,10999
0,"Like","*brahm*","OR",2,27,670,11000
0,"Like","*unmada*","OR",2,27,670,11001
0,"Like","*hindu*","OR",2,36,670,11002
0,"Like","*siddha*","OR",2,36,670,11003
0,"Like","*ayurvedic*","OR",2,36,670,11004
0,"Like","*brahm*","OR",2,36,670,11005
0,"Like","*unmada*","OR",2,36,670,11006
0,"Like","*hindu*","OR",2,57,670,11007
0,"Like","*siddha*","OR",2,57,670,11008
0,"Like","*ayurvedic*","OR",2,57,670,11009
0,"Like","*brahm*","OR",2,57,670,11010
0,"Like","*unmada*",,2,57,670,11011
0,"Like","*ayurved*","OR",1,14,671,11012
0,"Like","*hindu*","OR",1,14,671,11013
0,"Like","*siddha*","OR",1,14,671,11014
0,"Like","*bhootmantra*","OR",1,14,671,11015
0,"Like","*brahm*",,1,14,671,11016
0,"Like","aripiprazol*","AND",1,14,672,11017
0,"Like","clozapin*",,1,14,672,11018
0,"Like","amisulprid*","AND",1,14,673,11019
0,"Like","aripiprazol*",,1,14,673,11020
0,"Like","quetiapin*","AND",1,14,674,11021
0,"Like","risperidon*",,1,14,674,11022
0,"Like","sertindol*","AND",1,14,675,11023
0,"Like","ziprasidon*",,1,14,675,11024
0,"Like","ziprasidon*","AND",1,14,676,11025
0,"Like","zotepin*",,1,14,676,11026
0,"Like","clozapin*","AND",1,14,677,11027
0,"Like","olanzapin*",,1,14,677,11028
0,"Like","olanzapin*","AND",1,14,678,11029
0,"Like","quetiapin*",,1,14,678,11030
0,"Like","*antipsychot*","OR",2,27,679,11031
0,"Like","*neuroleptic*","OR",2,27,679,11032
0,"Like","*drug*","OR",2,27,679,11033
0,"Like","antipsychot*","OR",2,27,679,11034
0,"Like","neuroleptic*","OR",2,27,679,11035
0,"Like","drug*",,2,27,679,11036
0,"Like","combin*","OR",2,27,680,11037
0,"Like","*combin*",,2,27,680,11038
0,"Like","*enhancement*","OR",2,27,681,11039
0,"Like","*augmentation*","OR",2,27,681,11040
0,"Like","*add-on*","OR",2,27,681,11041
0,"Like","*addition*","OR",2,27,681,11042
0,"Like","*supplement*","OR",2,27,681,11043
0,"Like","*cotreatment*","OR",2,27,681,11044
0,"Like","*co-treatment*","OR",2,27,681,11045
0,"Like","augmentation*","OR",2,27,681,11046
0,"Like","enhancement*","OR",2,27,681,11047
0,"Like","add-on*","OR",2,27,681,11048
0,"Like","addition*","OR",2,27,681,11049
0,"Like","supplement*","OR",2,27,681,11050
0,"Like","Cotreatment*","OR",2,27,681,11051
0,"Like","co-treatment*",,2,27,681,11052
0,"Like","*add-on*","OR",2,36,681,11053
0,"Like","*addition*","OR",2,36,681,11054
0,"Like","*supplement*","OR",2,36,681,11055
0,"Like","*cotreatment*","OR",2,36,681,11056
0,"Like","*co-treatment*","OR",2,36,681,11057
0,"=","drug combination","OR",2,45,681,11058
0,"Like","*add-on*","OR",2,57,681,11059
0,"Like","*addition*","OR",2,57,681,11060
0,"Like","*supplement*","OR",2,57,681,11061
0,"Like","*cotreatment*","OR",2,57,681,11062
0,"Like","*co-treatment*","OR",2,57,681,11063
0,"Like","*adjunctive*","OR",2,27,682,11064
0,"Like","*concurrent*","OR",2,27,682,11065
0,"Like","*concomitant*","OR",2,27,682,11066
0,"Like","*simultaneous*","OR",2,27,682,11067
0,"Like","*parallel*","OR",2,27,682,11068
0,"Like","*polypharmacy*","OR",2,27,682,11069
0,"Like","adjunctive*","OR",2,27,682,11070
0,"Like","concurrent*","OR",2,27,682,11071
0,"Like","concomitant*","OR",2,27,682,11072
0,"Like","simultaneous*","OR",2,27,682,11073
0,"Like","parallel*","OR",2,27,682,11074
0,"Like","polypharmacy*",,2,27,682,11075
0,"Like","*adjunctive*","OR",2,36,682,11076
0,"Like","*concurrent*","OR",2,36,682,11077
0,"Like","*concomitant*","OR",2,36,682,11078
0,"Like","*simultaneous*","OR",2,36,682,11079
0,"Like","*parallel*","OR",2,36,682,11080
0,"Like","*polypharmacy*","OR",2,36,682,11081
0,"=","drug combination","OR",2,45,682,11082
0,"Like","*adjunctive*","OR",2,57,682,11083
0,"Like","*concurrent*","OR",2,57,682,11084
0,"Like","*concomitant*","OR",2,57,682,11085
0,"Like","*simultaneous*","OR",2,57,682,11086
0,"Like","*parallel*","OR",2,57,682,11087
0,"Like","*polypharmacy*","OR",2,57,682,11088
0,"Like","*blood-level*","OR",2,27,683,11089
0,"Like","*blood level*","OR",2,27,683,11090
0,"Like","*blood-drug*","OR",2,27,683,11091
0,"Like","*blood drug*","OR",2,27,683,11092
0,"Like","*serum-level*","OR",2,27,683,11093
0,"Like","*serum level*","OR",2,27,683,11094
0,"Like","*serum-drug*","OR",2,27,683,11095
0,"Like","*serum drug*","OR",2,27,683,11096
0,"Like","*blood-level*","OR",2,36,683,11097
0,"Like","*blood level*","OR",2,36,683,11098
0,"Like","*blood-drug*","OR",2,36,683,11099
0,"Like","*blood drug*","OR",2,36,683,11100
0,"Like","*serum-level*","OR",2,36,683,11101
0,"Like","*serum level*","OR",2,36,683,11102
0,"Like","*serum-drug*","OR",2,36,683,11103
0,"Like","*serum drug*","OR",2,36,683,11104
0,"Like","*blood-level*","OR",2,57,683,11105
0,"Like","*blood level*","OR",2,57,683,11106
0,"Like","*blood-drug*","OR",2,57,683,11107
0,"Like","*blood drug*","OR",2,57,683,11108
0,"Like","*serum-level*","OR",2,57,683,11109
0,"Like","*serum level*","OR",2,57,683,11110
0,"Like","*serum-drug*","OR",2,57,683,11111
0,"Like","*serum drug*","OR",2,57,683,11112
0,"Like","blood?level*","OR",2,27,684,11113
0,"Like","blood?drug*","OR",2,27,684,11114
0,"Like","serum?level*","OR",2,27,684,11115
0,"Like","serum?drug*","OR",2,27,684,11116
0,"Like","dose*","OR",2,27,684,11117
0,"Like","dosage*","OR",2,27,684,11118
0,"Like","drug?respon*","OR",2,27,684,11119
0,"Like","effective?dos*","OR",2,27,684,11120
0,"Like","therapeutic?equiv*","OR",2,27,684,11121
0,"Like","high?dos*","OR",2,27,684,11122
0,"Like","medium?dos*","OR",2,27,684,11123
0,"Like","low?dos*","OR",2,27,684,11124
0,"Like","standard?dos*","OR",2,27,684,11125
0,"Like","maximum?dos*","OR",2,27,684,11126
0,"Like","minimum?dos*","OR",2,27,684,11127
0,"Like","plasma?level*","OR",2,27,684,11128
0,"Like","plasma?drug*","OR",2,27,684,11129
0,"Like","middle?dos*","OR",2,27,684,11130
0,"Like","threshold?dos?",,2,27,684,11131
0,"Like","*plasma?level*","OR",2,27,685,11132
0,"Like","*plasma?drug*","OR",2,27,685,11133
0,"Like","*threshold?level*","OR",2,27,685,11134
0,"Like","*plasma?level*","OR",2,36,685,11135
0,"Like","*plasma?drug*","OR",2,36,685,11136
0,"Like","*high?dose*","OR",2,36,685,11137
0,"Like","*threshold?level*","OR",2,36,685,11138
0,"Like","*plasma?level*","OR",2,57,685,11139
0,"Like","*plasma?drug*","OR",2,57,685,11140
0,"Like","*threshold?level*",,2,57,685,11141
0,"Like","daily*","AND",2,27,687,11142
0,"Like","living*",,2,27,687,11143
0,"Like","*independen*","AND",2,27,688,11144
0,"Like","*function*",,2,27,688,11145
0,"Like","rehabilit*","AND",2,27,689,11146
0,"Like","*rehabilit*","OR",2,27,689,11147
0,"Like","*rehabilit*","OR",2,36,689,11148
0,"Like","*rehabilit*",,2,57,689,11149
0,"Like","life?program*","OR",2,27,690,11150
0,"Like","*life?program*","OR",2,27,690,11151
0,"Like","social?skill*","OR",2,27,690,11152
0,"Like","*social?skill*","OR",2,27,690,11153
0,"Like","social?program*","OR",2,27,690,11154
0,"Like","*social?program*","OR",2,27,690,11155
0,"Like","self?care skill*","OR",2,27,690,11156
0,"Like","*self?care skill*","OR",2,27,690,11157
0,"Like","self?care program*","OR",2,27,690,11158
0,"Like","*self?care program*","OR",2,27,690,11159
0,"Like","life?skill*","OR",2,27,690,11160
0,"Like","*life?skill*","OR",2,27,690,11161
0,"Like","*life?skill*","OR",2,36,690,11162
0,"Like","*life?program*","OR",2,36,690,11163
0,"Like","*social?skill*","OR",2,36,690,11164
0,"Like","*social?program*","OR",2,36,690,11165
0,"Like","*self?care skill*","OR",2,36,690,11166
0,"Like","*self?care program*","OR",2,36,690,11167
0,"Like","*life?skill*`","OR",2,57,690,11168
0,"Like","*life?program*","OR",2,57,690,11169
0,"Like","*social?skill*","OR",2,57,690,11170
0,"Like","*social?program*","OR",2,57,690,11171
0,"Like","*self?care skill*","OR",2,57,690,11172
0,"Like","*self?care program*",,2,57,690,11173
0,"Like","living?program*","OR",2,27,692,11190
0,"Like","*living?program*","OR",2,27,692,11191
0,"Like","community?skill*","OR",2,27,692,11192
0,"Like","*community?skill*","OR",2,27,692,11193
0,"Like","community?program*","OR",2,27,692,11194
0,"Like","*community?program*","OR",2,27,692,11195
0,"Like","living?skill*","OR",2,27,692,11196
0,"Like","*living?skill*","OR",2,27,692,11197
0,"Like","ADL*","OR",2,27,692,11198
0,"Like","*ADL*","OR",2,27,692,11199
0,"Like","*living?skill*","OR",2,36,692,11200
0,"Like","*living?program*","OR",2,36,692,11201
0,"Like","*community?skill*","OR",2,36,692,11202
0,"Like","*community?program*","OR",2,36,692,11203
0,"Like","*ADL*","OR",2,36,692,11204
0,"Like","*living?skill*","OR",2,57,692,11205
0,"Like","*living?program*","OR",2,57,692,11206
0,"Like","*community?skill*","OR",2,57,692,11207
0,"Like","*community?program*","OR",2,57,692,11208
0,"Like","*ADL*",,2,57,692,11209
0,"Like","*hospitali*",,1,14,694,11211
0,"Like","early*","OR",2,27,696,11236
0,"Like","*early*","OR",2,27,696,11237
0,"Like","prodrom*","OR",2,27,696,11238
0,"Like","*prodrom*","OR",2,27,696,11239
0,"Like","first?episo*","OR",2,27,696,11240
0,"Like","*first?episo*","OR",2,27,696,11241
0,"Like","second?episo*","OR",2,27,696,11242
0,"Like","*second?episo*","OR",2,27,696,11243
0,"Like","primary?episo*","OR",2,27,696,11244
0,"Like","*primary?episo?","OR",2,27,696,11245
0,"Like","secondary?episo*","OR",2,27,696,11246
0,"Like","*secondary?episo*","OR",2,27,696,11247
0,"Like","*early?episo*","OR",2,36,696,11248
0,"Like","*prodrom*","OR",2,36,696,11249
0,"Like","*first?episo*","OR",2,36,696,11250
0,"Like","*second?episo*","OR",2,36,696,11251
0,"Like","*primary?episo*","OR",2,36,696,11252
0,"Like","*secondary?episo*","OR",2,36,696,11253
0,"Like","*early?symtom*","OR",2,36,696,11254
0,"Like","*early?interv*",,2,36,696,11255
0,"Like","*early*","OR",2,57,696,11256
0,"Like","*prodrom*","OR",2,57,696,11257
0,"Like","*first?episo*","OR",2,57,696,11258
0,"Like","*second?episo*","OR",2,57,696,11259
0,"Like","*primary?episo*","OR",2,57,696,11260
0,"Like","*secondary?episo*","OR",2,57,696,11261
0,"Like","*episode*","OR",1,15,698,11266
0,"Like","*prodrom*","OR",1,15,698,11267
0,"Like","*recent onset*",,1,15,698,11268
0,"Like","Olanzapin*","OR",2,27,699,11269
0,"Like","*olanzapin*","OR",2,27,699,11270
0,"Like","zyprexa*","OR",2,27,699,11271
0,"Like","*zyprexa*","OR",2,27,699,11272
0,"Like","*olanzapin*","OR",2,36,699,11273
0,"Like","*zyprexa*","OR",2,36,699,11274
0,"Like","*olanzapin*","OR",2,57,699,11275
0,"Like","*zyprexa*",,2,57,699,11276
0,"Like","azeperon*","OR",2,27,700,11277
0,"Like","*azeperon*","OR",2,27,700,11278
0,"Like","benperid*","OR",2,27,700,11279
0,"Like","*benperid*","OR",2,27,700,11280
0,"Like","chlorpromaz*","OR",2,27,700,11281
0,"Like","*chlorpromaz*","OR",2,27,700,11282
0,"Like","droperid*","OR",2,27,700,11283
0,"Like","*droperid*","OR",2,27,700,11284
0,"Like","flupent*","OR",2,27,700,11285
0,"Like","*flupent*","OR",2,27,700,11286
0,"Like","fluphena*","OR",2,27,700,11287
0,"Like","*fluphena*","OR",2,27,700,11288
0,"Like","*azeperon*","OR",2,36,700,11289
0,"Like","*benperid*","OR",2,36,700,11290
0,"Like","*chlorpromaz*","OR",2,36,700,11291
0,"Like","*droperid*","OR",2,36,700,11292
0,"Like","*flupent*","OR",2,36,700,11293
0,"Like","*fluphena*","OR",2,36,700,11294
0,"Like","*azeperon*","OR",2,57,700,11295
0,"Like","*benperid*","OR",2,57,700,11296
0,"Like","*chlorpromaz*","OR",2,57,700,11297
0,"Like","*droperid*","OR",2,57,700,11298
0,"Like","*flupent*","OR",2,57,700,11299
0,"Like","*fluphena*",,2,57,700,11300
0,"Like","haloperi*","OR",2,27,701,11301
0,"Like","*haloperi*","OR",2,27,701,11302
0,"Like","molindon*","OR",2,27,701,11303
0,"Like","*molindon*","OR",2,27,701,11304
0,"Like","loxapin*","OR",2,27,701,11305
0,"Like","*loxapin*","OR",2,27,701,11306
0,"Like","pimozid*","OR",2,27,701,11307
0,"Like","*pimozid*","OR",2,27,701,11308
0,"Like","perphenaz*","OR",2,27,701,11309
0,"Like","*perphenaz*","OR",2,27,701,11310
0,"Like","prochloperaz*","OR",2,27,701,11311
0,"Like","*prochloperaz*","OR",2,27,701,11312
0,"Like","*haloperi*","OR",2,36,701,11313
0,"Like","*molindon*","OR",2,36,701,11314
0,"Like","*loxapin*","OR",2,36,701,11315
0,"Like","*pimozid*","OR",2,36,701,11316
0,"Like","*perphenaz*","OR",2,36,701,11317
0,"Like","*prochloperaz*","OR",2,36,701,11318
0,"Like","*haloperi*","OR",2,57,701,11319
0,"Like","*molindon*","OR",2,57,701,11320
0,"Like","*loxapin*","OR",2,57,701,11321
0,"Like","*pimozid*","OR",2,57,701,11322
0,"Like","*perphenaz*","OR",2,57,701,11323
0,"Like","*prochloperaz*",,2,57,701,11324
0,"Like","zuclopent*","OR",2,27,702,11325
0,"Like","*zuclopent*","OR",2,27,702,11326
0,"Like","*clopixol*","OR",2,27,702,11327
0,"Like","*largactil*","OR",2,27,702,11328
0,"Like","*thorazin*","OR",2,27,702,11329
0,"Like","*prolixin*","OR",2,27,702,11330
0,"Like","*haldol*","OR",2,27,702,11331
0,"Like","*serenac*","OR",2,27,702,11332
0,"Like","*stelazin*","OR",2,27,702,11333
0,"Like","zuclopent*","OR",2,36,702,11334
0,"Like","*clopixol*","OR",2,36,702,11335
0,"Like","*largactil*","OR",2,36,702,11336
0,"Like","*thorazin*","OR",2,36,702,11337
0,"Like","*prolixin*","OR",2,36,702,11338
0,"Like","*haldol*","OR",2,36,702,11339
0,"Like","*serenac*","OR",2,36,702,11340
0,"Like","*stelazin*","OR",2,36,702,11341
0,"Like","zuclopent*","OR",2,57,702,11342
0,"Like","*clopixol*","OR",2,57,702,11343
0,"Like","*largactil*","OR",2,57,702,11344
0,"Like","*thorazin*","OR",2,57,702,11345
0,"Like","*prolixin*","OR",2,57,702,11346
0,"Like","*haldol*","OR",2,57,702,11347
0,"Like","*serenac*","OR",2,57,702,11348
0,"Like","*stelazin*",,2,57,702,11349
0,"Like","olanzapin*",,1,14,704,11365
0,"=","olanzapine","AND",2,45,705,11366
0,"=","typicals",,2,45,705,11367
0,"Like","*depress*","OR",2,27,706,11368
0,"Like","*depress*","OR",2,36,706,11369
0,"Like","*depress*","OR",2,57,706,11370
0,"Like","depress*",,2,27,706,11371
0,"Like","sign*","OR",2,27,707,11372
0,"Like","*early sign*","OR",2,27,707,11373
0,"Like","*signs of earl*","OR",2,27,707,11374
0,"Like","*intervention*","OR",2,27,707,11375
0,"Like","*detect*","OR",2,27,707,11376
0,"Like","early sign*","OR",2,27,707,11377
0,"Like","signs of earl*","OR",2,27,707,11378
0,"Like","intervention*","OR",2,27,707,11379
0,"Like","detect*",,2,27,707,11380
0,"Like","*early sign*","OR",2,36,707,11381
0,"Like","*signs of earl*","OR",2,36,707,11382
0,"Like","*intervention*","OR",2,36,707,11383
0,"Like","*detect*","OR",2,36,707,11384
0,"Like","*early sign*","OR",2,57,707,11385
0,"Like","*signs of earl*","OR",2,57,707,11386
0,"Like","*intervention*","OR",2,57,707,11387
0,"Like","*detect*","OR",2,57,707,11388
0,"Like","*relaps*","OR",2,27,708,11389
0,"Like","*recurren*","OR",2,27,708,11390
0,"Like","relaps*","OR",2,27,708,11391
0,"Like","recurren*",,2,27,708,11392
0,"Like","*relaps*","OR",2,36,708,11393
0,"Like","*recurren*","OR",2,36,708,11394
0,"Like","*relaps*","OR",2,57,708,11395
0,"Like","*recurren*","OR",2,57,708,11396
0,"Like","*prevent*","OR",2,27,709,11397
0,"Like","*predict*","OR",2,27,709,11398
0,"Like","*reduc*","OR",2,27,709,11399
0,"Like","*control*","OR",2,27,709,11400
0,"Like","prevent*","OR",2,27,709,11401
0,"Like","reduc*","OR",2,27,709,11402
0,"Like","predict*","OR",2,27,709,11403
0,"Like","control*",,2,27,709,11404
0,"Like","*prevent*","OR",2,36,709,11405
0,"Like","*predict*","OR",2,36,709,11406
0,"Like","*reduc*","OR",2,36,709,11407
0,"Like","*control*","OR",2,36,709,11408
0,"Like","*prevent*","OR",2,57,709,11409
0,"Like","*predict*","OR",2,57,709,11410
0,"Like","*reduc*","OR",2,57,709,11411
0,"Like","*control*","OR",2,57,709,11412
0,"Like","*monitor*","OR",2,27,710,11413
0,"Like","*help*","OR",2,27,710,11414
0,"Like","*evaluat*","OR",2,27,710,11415
0,"Like","monitor*","OR",2,27,710,11416
0,"Like","help*","OR",2,27,710,11417
0,"Like","evaluat*",,2,27,710,11418
0,"Like","*monitor*","OR",2,36,710,11419
0,"Like","*help*","OR",2,36,710,11420
0,"Like","*evaluat*","OR",2,36,710,11421
0,"Like","*monitor*","OR",2,57,710,11422
0,"Like","*help*","OR",2,57,710,11423
0,"Like","*evaluat*","OR",2,57,710,11424
0,"Like","*self*","OR",2,27,711,11425
0,"Like","*family*","OR",2,27,711,11426
0,"Like","self*","OR",2,27,711,11427
0,"Like","family*",,2,27,711,11428
0,"Like","*self*","OR",2,36,711,11429
0,"Like","*family*","OR",2,36,711,11430
0,"Like","*self*","OR",2,57,711,11431
0,"Like","*family*","OR",2,57,711,11432
0,"Like","*symptom manag*","OR",2,27,712,11433
0,"Like","*manage symptom*","OR",2,27,712,11434
0,"Like","*aware*","OR",2,27,712,11435
0,"Like","*prodrom*","OR",2,27,712,11436
0,"Like","*re-occur*","OR",2,27,712,11437
0,"Like","*reoccur*","OR",2,27,712,11438
0,"Like","symptom manag*","OR",2,27,712,11439
0,"Like","manage symptom*","OR",2,27,712,11440
0,"Like","prodrom*","OR",2,27,712,11441
0,"Like","re-occur*","OR",2,27,712,11442
0,"Like","reoccur*",,2,27,712,11443
0,"Like","*symptom manag*","OR",2,36,712,11444
0,"Like","*manage symptom*","OR",2,36,712,11445
0,"Like","*aware*","OR",2,36,712,11446
0,"Like","*prodrom*","OR",2,36,712,11447
0,"Like","*re-occur*","OR",2,36,712,11448
0,"Like","*reoccur*","OR",2,36,712,11449
0,"Like","self evalu*","OR",2,45,712,11450
0,"Like","*symptom manag*","OR",2,57,712,11451
0,"Like","*manage symptom*","OR",2,57,712,11452
0,"Like","*aware*","OR",2,57,712,11453
0,"Like","*prodrom*","OR",2,57,712,11454
0,"Like","*re-occur*","OR",2,57,712,11455
0,"Like","*reoccur*","OR",2,57,712,11456
0,"Like","danc*","OR",2,27,713,11457
0,"Like","* danc*","OR",2,27,713,11458
0,"Like","* danc*","OR",2,36,713,11459
0,"Like","* danc*",,2,57,713,11460
0,"Like","danc*",,1,14,714,11461
0,"Like","*donepezil*","OR",1,14,716,11482
0,"Like","*eranz*","OR",1,14,716,11483
0,"Like","*aricept*","OR",1,14,716,11484
0,"Like","*memac*","OR",1,14,716,11485
0,"Like","*e2020*","OR",1,14,716,11486
0,"Like","*e?2020*",,1,14,716,11487
0,"Like","donepez*","OR",2,27,718,11512
0,"Like","*donepez*","OR",2,27,718,11513
0,"Like","eranz*","OR",2,27,718,11514
0,"Like","*eranz*","OR",2,27,718,11515
0,"Like","memac*","OR",2,27,718,11516
0,"Like","*memac*","OR",2,27,718,11517
0,"Like","e?2020*","OR",2,27,718,11518
0,"Like","*e?2020*","OR",2,27,718,11519
0,"Like","e2020*","OR",2,27,718,11520
0,"Like","*e2020*","OR",2,27,718,11521
0,"Like","aricept*","OR",2,27,718,11522
0,"Like","*aricept*","OR",2,27,718,11523
0,"Like","*donepez*","OR",2,36,718,11524
0,"Like","*eranz*","OR",2,36,718,11525
0,"Like","*memac*","OR",2,36,718,11526
0,"Like","*e?2020*","OR",2,36,718,11527
0,"Like","*e2020*","OR",2,36,718,11528
0,"Like","*aricept*","OR",2,36,718,11529
0,"Like","*donepez*","OR",2,57,718,11530
0,"Like","*eranz*","OR",2,57,718,11531
0,"Like","*memac*","OR",2,57,718,11532
0,"Like","*e?2020*","OR",2,57,718,11533
0,"Like","*e2020*","OR",2,57,718,11534
0,"Like","*aricept*",,2,57,718,11535
0,"Like","*coping*","OR",2,27,719,11536
0,"Like","*self?monitor*","OR",2,27,719,11537
0,"Like","coping*","OR",2,27,719,11538
0,"Like","self?monitor*","OR",2,27,719,11539
0,"Like","reading*","OR",2,27,719,11540
0,"Like","*reading*","OR",2,27,719,11541
0,"Like","earplug*","OR",2,27,719,11542
0,"Like","*earplug*","OR",2,27,719,11543
0,"Like","stereo*","OR",2,27,719,11544
0,"Like","*stereo*","OR",2,27,719,11545
0,"Like","distract*","OR",2,27,719,11546
0,"Like","*distract*","OR",2,27,719,11547
0,"Like","*self?monitor*","OR",2,36,719,11548
0,"Like","*reading*","OR",2,36,719,11549
0,"Like","*earplug*","OR",2,36,719,11550
0,"Like","*stereo*","OR",2,36,719,11551
0,"Like","*distract*","OR",2,36,719,11552
0,"Like","*self?monitor*","OR",2,57,719,11553
0,"Like","*reading*","OR",2,57,719,11554
0,"Like","*earplug*","OR",2,57,719,11555
0,"Like","*stereo*","OR",2,57,719,11556
0,"Like","*distract*","OR",2,57,719,11557
0,"Like","ear?plug*","OR",2,27,720,11558
0,"Like","*ear?plug*","OR",2,27,720,11559
0,"Like","headphone*","OR",2,27,720,11560
0,"Like","*headphone*","OR",2,27,720,11561
0,"Like","head?phone*","OR",2,27,720,11562
0,"Like","*head?phone*","OR",2,27,720,11563
0,"Like","socialis*","OR",2,27,720,11564
0,"Like","*socialis*","OR",2,27,720,11565
0,"Like","diversion*","OR",2,27,720,11566
0,"Like","*diversion*","OR",2,27,720,11567
0,"Like","suppre*","OR",2,27,720,11568
0,"Like","*suppre*","OR",2,27,720,11569
0,"Like","*headphone*","OR",2,36,720,11570
0,"Like","*head?phone*","OR",2,36,720,11571
0,"Like","*socialis*","OR",2,36,720,11572
0,"Like","*diversion*","OR",2,36,720,11573
0,"Like","*suppre*","OR",2,36,720,11574
0,"Like","*ear?plug*","OR",2,36,720,11575
0,"Like","*headphone*","OR",2,57,720,11576
0,"Like","*head?phone*","OR",2,57,720,11577
0,"Like","*socialis*","OR",2,57,720,11578
0,"Like","*diversion*","OR",2,57,720,11579
0,"Like","*suppre*","OR",2,57,720,11580
0,"Like","*ear?plug*",,2,57,720,11581
0,"Like","*coping*","AND",2,36,721,11582
0,"Like","*strateg*",,2,36,721,11583
0,"Like","*coping*","AND",2,57,722,11584
0,"Like","*strateg*",,2,57,722,11585
0,"Like","*thought*","AND",2,27,723,11586
0,"Like","*block*",,2,27,723,11587
0,"Like","*thought*","AND",2,36,724,11588
0,"Like","*block*",,2,36,724,11589
0,"Like","*thought*","AND",2,57,725,11590
0,"Like","*block*",,2,57,725,11591
0,"Like","*thought*","AND",2,57,726,11592
0,"Like","*stop*",,2,57,726,11593
0,"Like","*thought*","AND",2,36,727,11594
0,"Like","*stop*",,2,36,727,11595
0,"Like","*thought*","AND",2,57,728,11596
0,"Like","*stop*",,2,57,728,11597
0,"Like","*garden*","OR",1,14,729,11598
0,"Like","*relax*","OR",1,14,729,11599
0,"Like","*comedy*",,1,14,729,11600
0,"Like","steroid*","OR",2,27,731,11625
0,"Like","*steroid*","OR",2,27,731,11626
0,"Like","cocorticoid*","OR",2,27,731,11627
0,"Like","*cocorticoid*","OR",2,27,731,11628
0,"Like","cort?cotrop*","OR",2,27,731,11629
0,"Like","*cort?cotrop*","OR",2,27,731,11630
0,"Like","dexamethason*","OR",2,27,731,11631
0,"Like","*dexamethason*","OR",2,27,731,11632
0,"Like","hydrocortison*","OR",2,27,731,11633
0,"Like","*hydrocortison*","OR",2,27,731,11634
0,"Like","R?121919*","OR",2,27,731,11635
0,"Like","*R?121919*","OR",2,27,731,11636
0,"Like","*steroid*","OR",2,36,731,11637
0,"Like","*cocorticoid*","OR",2,36,731,11638
0,"Like","*cort?cotrop*","OR",2,36,731,11639
0,"Like","*dexamethason*","OR",2,36,731,11640
0,"Like","*hydrocortison*","OR",2,36,731,11641
0,"Like","*R?121919*","OR",2,36,731,11642
0,"Like","*steroid*","OR",2,57,731,11643
0,"Like","*cocorticoid*","OR",2,57,731,11644
0,"Like","*cort?cotrop*","OR",2,57,731,11645
0,"Like","*dexamethason*","OR",2,57,731,11646
0,"Like","*hydrocortison*","OR",2,57,731,11647
0,"Like","*R?121919*",,2,57,731,11648
0,"Like","ORG?34116*","OR",2,27,732,11649
0,"Like","*ORG?34116*","OR",2,27,732,11650
0,"Like","3-acetoxyandrost*","OR",2,27,732,11651
0,"Like","*3-acetoxyandrost*","OR",2,27,732,11652
0,"Like","dehydroepiandrosteron*","OR",2,27,732,11653
0,"Like","*dehydroepiandrosteron*","OR",2,27,732,11654
0,"Like","mifepristone*","OR",2,27,732,11655
0,"Like","*mifepristone*","OR",2,27,732,11656
0,"Like","mitot?ne*","OR",2,27,732,11657
0,"Like","*mitot?ne*","OR",2,27,732,11658
0,"Like","aminoglutethimi*","OR",2,27,732,11659
0,"Like","*aminoglutethimi*","OR",2,27,732,11660
0,"Like","*ORG?34116*","OR",2,36,732,11661
0,"Like","*3-acetoxyandrost*","OR",2,36,732,11662
0,"Like","*dehydroepiandrosteron*","OR",2,36,732,11663
0,"Like","*mifepristone*","OR",2,36,732,11664
0,"Like","*mitot?ne*","OR",2,36,732,11665
0,"Like","*aminoglutethimi*","OR",2,36,732,11666
0,"Like","*ORG?34116*","OR",2,57,732,11667
0,"Like","*3-acetoxyandrost*","OR",2,57,732,11668
0,"Like","*dehydroepiandrosteron*","OR",2,57,732,11669
0,"Like","*mifepristone*","OR",2,57,732,11670
0,"Like","*mitot?ne*","OR",2,57,732,11671
0,"Like","*aminoglutethimi*",,2,57,732,11672
0,"Like","spironolactone*","OR",2,27,733,11673
0,"Like","*spironolactone*","OR",2,27,733,11674
0,"Like","ketoconazole*","OR",2,27,733,11675
0,"Like","*ketoconazole*","OR",2,27,733,11676
0,"Like","metyrapone*","OR",2,27,733,11677
0,"Like","*metyrapone*","OR",2,27,733,11678
0,"Like","etomidate*","OR",2,27,733,11679
0,"Like","*etomidate*","OR",2,27,733,11680
0,"Like","RU-486**","OR",2,27,733,11681
0,"Like","*RU-486**","OR",2,27,733,11682
0,"Like","*spironolactone*","OR",2,36,733,11683
0,"Like","*ketoconazole*","OR",2,36,733,11684
0,"Like","*metyrapone*","OR",2,36,733,11685
0,"Like","*etomidate*","OR",2,36,733,11686
0,"Like","*RU-486**","OR",2,36,733,11687
0,"Like","*spironolactone*","OR",2,57,733,11688
0,"Like","*ketoconazole*","OR",2,57,733,11689
0,"Like","*metyrapone*","OR",2,57,733,11690
0,"Like","*etomidate*","OR",2,57,733,11691
0,"Like","*RU-486*",,2,57,733,11692
0,"Like","art*","OR",1,14,735,11706
0,"Like","befrien*","OR",1,14,735,11707
0,"Like","copin*","OR",1,14,735,11708
0,"Like","danc*","OR",1,14,735,11709
0,"Like","*exerci*","OR",1,14,735,11710
0,"Like","film in*","OR",1,14,735,11711
0,"Like","game*","OR",1,14,735,11712
0,"Like","hors*","OR",1,14,735,11713
0,"Like","interpers*","OR",1,14,736,11714
0,"Like","leisu*","OR",1,14,736,11715
0,"Like","multimed*","OR",1,14,736,11716
0,"Like","musi*","OR",1,14,736,11717
0,"Like","morit*","OR",1,14,736,11718
0,"Like","physi*","OR",1,14,736,11719
0,"Like","play*","OR",1,14,736,11720
0,"Like","readi*","OR",1,14,736,11721
0,"Like","recrea*","OR",1,14,737,11722
0,"Like","relax*","OR",1,14,737,11723
0,"Like","relig*","OR",1,14,737,11724
0,"Like","sing*","OR",1,14,737,11725
0,"Like","thought s*","OR",1,14,737,11726
0,"Like","video r*","OR",1,14,737,11727
0,"Like","spirit*","OR",1,14,737,11728
0,"Like","comdey*","OR",1,14,738,11729
0,"Like","garden*",,1,14,738,11730
0,"Like","*spironol*","OR",1,14,739,11731
0,"Like","*dehydroepian*","OR",1,14,739,11732
0,"Like","mifepriston*","OR",1,14,739,11733
0,"Like","etomidat*","OR",1,14,739,11734
0,"Like","corticotrop*","OR",1,14,739,11735
0,"Like","hydrocortis*","OR",1,14,739,11736
0,"Like","*steroid*","OR",1,14,739,11737
0,"Like","aminogluteth*","OR",1,14,740,11738
0,"Like","ketoconaz*","OR",1,14,740,11739
0,"Like","glucocorticoid r*","OR",1,14,740,11740
0,"Like","mitotan*","OR",1,14,740,11741
0,"Like","dexameth*","OR",1,14,740,11742
0,"Like","metyrap*","OR",1,14,740,11743
0,"Like","information*","OR",2,27,741,11744
0,"Like","*information*","OR",2,27,741,11745
0,"Like","communicat*","OR",2,27,741,11746
0,"Like","*communicat*","OR",2,27,741,11747
0,"Like","computer*","OR",2,27,741,11748
0,"Like","*computer*","OR",2,27,741,11749
0,"Like","technolog*","OR",2,27,741,11750
0,"Like","*technolog*","OR",2,27,741,11751
0,"Like","tele*","OR",2,27,741,11752
0,"Like","* tele*","OR",2,27,741,11753
0,"Like","phone*","OR",2,27,741,11754
0,"Like","*phone*","OR",2,27,741,11755
0,"Like","internet*","OR",2,27,741,11756
0,"Like","*internet*","OR",2,27,741,11757
0,"Like","*computer*","OR",2,36,741,11758
0,"Like","*technolog*","OR",2,36,741,11759
0,"Like","* tele*","OR",2,36,741,11760
0,"Like","*phone*","OR",2,36,741,11761
0,"Like","*internet*","OR",2,36,741,11762
0,"Like","*computer*","OR",2,57,741,11763
0,"Like","*technolog*","OR",2,57,741,11764
0,"Like","* tele*","OR",2,57,741,11765
0,"Like","*phone*","OR",2,57,741,11766
0,"Like","*internet*",,2,57,741,11767
0,"Like","*e-pres*","OR",2,27,742,11768
0,"Like","*e-book*","OR",2,27,742,11769
0,"Like","digital*","OR",2,27,742,11770
0,"Like","*digital*","OR",2,27,742,11771
0,"Like","electronic*","OR",2,27,742,11772
0,"Like","*electronic*","OR",2,27,742,11773
0,"Like","database*","OR",2,27,742,11774
0,"Like","*database*","OR",2,27,742,11775
0,"Like","e-health*","OR",2,27,742,11776
0,"Like","*e-health*","OR",2,27,742,11777
0,"Like","e-med*","OR",2,27,742,11778
0,"Like","*e-med*","OR",2,27,742,11779
0,"Like","*e-book*","OR",2,36,742,11780
0,"Like","*e-pres*","OR",2,36,742,11781
0,"Like","*digital*","OR",2,36,742,11782
0,"Like","*electronic*","OR",2,36,742,11783
0,"Like","*database*","OR",2,36,742,11784
0,"Like","*e-health*","OR",2,36,742,11785
0,"Like","*e-med*","OR",2,36,742,11786
0,"Like","*e-book*","OR",2,57,742,11787
0,"Like","*e-pres*",,2,57,742,11788
0,"Like","*digital*","OR",2,57,742,11789
0,"Like","*electronic*","OR",2,57,742,11790
0,"Like","*database*","OR",2,57,742,11791
0,"Like","*e-health*","OR",2,57,742,11792
0,"Like","*e-med*","OR",2,57,742,11793
0,"Like","*computer*","OR",1,14,743,11794
0,"Like","tele*","OR",1,14,743,11795
0,"Like","*technolog*","OR",1,14,743,11796
0,"Like","*internet*","OR",1,14,743,11797
0,"Like","*electronic*",,1,14,743,11798
0,"Like","* risp*","OR",2,27,744,11799
0,"Like","risp*","OR",2,27,744,11800
0,"Like","*9-OH-risperid*","OR",2,27,744,11801
0,"Like","*risper*","OR",2,27,744,11802
0,"Like","* risp*","OR",2,36,744,11803
0,"Like","*9-OH-risperid*","OR",2,36,744,11804
0,"Like","*risper*","OR",2,36,744,11805
0,"Like","*9-OH-risperid*","OR",2,57,744,11806
0,"Like","*risper*",,2,57,744,11807
0,"Like","*placeb*","OR",2,27,745,11808
0,"Like","placeb*","OR",2,27,745,11809
0,"Like","*placeb*","OR",2,36,745,11810
0,"Like","*placeb*",,2,57,745,11811
0,"=","risperidone","AND",2,45,746,11812
0,"=","placebo",,2,45,746,11813
0,"Like","*risperidone*","AND",1,14,749,11818
0,"Like","*placebo*",,1,14,749,11819
0,"Like","*electroconvulsive*","AND",1,14,750,11820
0,">","02-05-07",,1,67,750,11821
0,"Like","* ect*","AND",1,14,751,11822
0,">","02-05-07",,1,67,751,11823
0,"Like","*diet*","OR",1,14,752,11824
0,"Like","*nutrition*","OR",1,14,752,11825
0,"Like","*exercise*",,1,14,752,11826
0,"Like","*weight*","OR",1,17,753,11827
0,"Like","obes*","OR",1,17,753,11828
0,"Like","body mass*","OR",1,17,753,11829
0,"Like","*diet*","OR",1,17,753,11830
0,"Like","eat*","OR",1,17,753,11831
0,"Like","waist*",,1,17,753,11832
0,"Like","Obsessive-Compulsive*",,1,15,754,11833
0,"Like","*obsessi*","OR",1,17,754,11834
0,"Like","*compulsi*","OR",1,17,754,11835
0,"Like","*chinese*","OR",2,30,755,11836
0,"=","chinese","OR",2,35,755,11837
0,"Like","*vip*",,2,60,755,11838
0,"Like","*chinese*","OR",2,60,755,11839
0,"Like","*china*","OR",2,60,755,11840
0,"Like","*caj*","OR",2,60,755,11841
0,"Like","*wanfang*","OR",2,60,755,11842
0,"Like","*monetary*","OR",2,27,756,11843
0,"Like","*Contingency management*","OR",2,27,756,11844
0,"Like","*money*","OR",2,27,756,11845
0,"Like","*financial*","OR",2,27,756,11846
0,"Like","*payment*","OR",2,27,756,11847
0,"Like","*monetary*","OR",2,36,756,11848
0,"Like","*Contingency management*","OR",2,36,756,11849
0,"Like","*money*","OR",2,36,756,11850
0,"Like","*financial*","OR",2,36,756,11851
0,"Like","*payment*","OR",2,36,756,11852
0,"Like","*monetary*","OR",2,45,756,11853
0,"Like","*Contingency management*","OR",2,45,756,11854
0,"Like","*money*","OR",2,45,756,11855
0,"Like","*financial*","OR",2,45,756,11856
0,"Like","*payment*","OR",2,45,756,11857
0,"Like","*monetary*","OR",2,57,756,11858
0,"Like","*Contingency management*","OR",2,57,756,11859
0,"Like","*money*","OR",2,57,756,11860
0,"Like","*payment*","OR",2,57,756,11861
0,"Like","*financial*",,2,57,756,11862
0,"Like","*monetary*",,1,14,757,11863
0,"Like","*monetary*","OR",2,27,757,11864
0,"Like","*Contingency management*","OR",2,27,757,11865
0,"Like","*money*","OR",2,27,757,11866
0,"Like","*financial*","OR",2,27,757,11867
0,"Like","*payment*","OR",2,27,757,11868
0,"Like","*monetary*","OR",2,36,757,11869
0,"Like","*Contingency management*","OR",2,36,757,11870
0,"Like","*money*","OR",2,36,757,11871
0,"Like","*financial*","OR",2,36,757,11872
0,"Like","*payment*","OR",2,36,757,11873
0,"Like","*monetary*","OR",2,45,757,11874
0,"Like","*Contingency management*","OR",2,45,757,11875
0,"Like","*money*","OR",2,45,757,11876
0,"Like","*financial*","OR",2,45,757,11877
0,"Like","*payment*","OR",2,45,757,11878
0,"Like","*monetary*","OR",2,57,757,11879
0,"Like","*Contingency management*","OR",2,57,757,11880
0,"Like","*money*","OR",2,57,757,11881
0,"Like","*payment*","OR",2,57,757,11882
0,"Like","*financial*",,2,57,757,11883
0,"Like","aggress*","OR",2,27,758,11884
0,"Like","*aggress*","OR",2,27,758,11885
0,"Like","agitation*","OR",2,27,758,11886
0,"Like","*agitation*","OR",2,27,758,11887
0,"Like","violen*","OR",2,27,758,11888
0,"Like","*violen*","OR",2,27,758,11889
0,"Like","tranq*","OR",2,27,758,11890
0,"Like","*tranq*","OR",2,27,758,11891
0,"Like","*aggress*","OR",2,36,758,11892
0,"Like","*agitation*","OR",2,36,758,11893
0,"Like","*violen*","OR",2,36,758,11894
0,"Like","*tranq*","OR",2,36,758,11895
0,"Like","*aggress*","OR",2,57,758,11896
0,"Like","*agitation*","OR",2,57,758,11897
0,"Like","*violen*","OR",2,57,758,11898
0,"Like","*tranq*",,2,57,758,11899
0,"Like","* musi*","OR",2,27,761,11933
0,"Like","* musi*","OR",2,36,761,11934
0,"Like","* musi*","OR",2,57,761,11935
0,"Like","musi*","OR",2,27,761,11936
0,"Like","musi*","OR",2,36,761,11937
0,"Like","musi*","OR",2,57,761,11938
0,"Like","song*","OR",2,27,761,11939
0,"Like","song*","OR",2,36,761,11940
0,"Like","song*","OR",2,57,761,11941
0,"Like","sing*","OR",2,27,761,11942
0,"Like","sing*","OR",2,36,761,11943
0,"Like","sing*","OR",2,57,761,11944
0,"Like","improvis*","OR",2,27,761,11945
0,"Like","improvis*","OR",2,36,761,11946
0,"Like","improvis*",,2,57,761,11947
0,"Like","*cessation*","OR",2,27,765,12018
0,"Like","*withdr?w*","OR",2,27,765,12019
0,"Like","*discontinu*","OR",2,27,765,12020
0,"Like","halt*","OR",2,27,765,12021
0,"Like","*stop*","OR",2,27,765,12022
0,"Like","*drop?out*","OR",2,27,765,12023
0,"Like","*dropout*","OR",2,27,765,12024
0,"Like","stop*","OR",2,36,765,12025
0,"Like","halt*","OR",2,36,765,12026
0,"Like","cessation*","OR",2,36,765,12027
0,"Like","discontinu*","OR",2,36,765,12028
0,"Like","withdr?w*","OR",2,36,765,12029
0,"Like","drop?out*","OR",2,36,765,12030
0,"Like","dropout*","OR",2,36,765,12031
0,"Like","stop*","OR",2,57,765,12032
0,"Like","halt*","OR",2,57,765,12033
0,"Like","cessation*","OR",2,57,765,12034
0,"Like","discontinu*","OR",2,57,765,12035
0,"Like","withdr?w*","OR",2,57,765,12036
0,"Like","drop?out*","OR",2,57,765,12037
0,"Like","dropout*",,2,57,765,12038
0,"Like","*relaps*","OR",2,27,766,12039
0,"Like","*maintain*","OR",2,27,766,12040
0,"Like","*rehospitalis*","OR",2,27,766,12041
0,"Like","*maintenance*","OR",2,27,766,12042
0,"Like","*recur*","OR",2,27,766,12043
0,"Like","relaps*","OR",2,36,766,12044
0,"Like","maintain*","OR",2,36,766,12045
0,"Like","rehospitalis*","OR",2,36,766,12046
0,"Like","maintenance*","OR",2,36,766,12047
0,"Like","recur*","OR",2,36,766,12048
0,"Like","relaps*","OR",2,57,766,12049
0,"Like","maintain*","OR",2,57,766,12050
0,"Like","rehospitalis*","OR",2,57,766,12051
0,"Like","maintenance*","OR",2,57,766,12052
0,"Like","recur*",,2,57,766,12053
0,"Like","clozapine*","OR",2,27,767,12054
0,"Like","*clozapine*","OR",2,27,767,12055
0,"Like","clozaril*","OR",2,27,767,12056
0,"Like","*clozaril*","OR",2,27,767,12057
0,"Like","*denzapine*","OR",2,27,767,12058
0,"Like","*zaponex*","OR",2,27,767,12059
0,"Like","*clozapine*","OR",2,36,767,12060
0,"Like","*clozaril*","OR",2,36,767,12061
0,"Like","*denzapine*","OR",2,36,767,12062
0,"Like","*zaponex*","OR",2,36,767,12063
0,"Like","*clozapine*","OR",2,57,767,12064
0,"Like","*clozaril*","OR",2,57,767,12065
0,"Like","*denzapine*","OR",2,57,767,12066
0,"Like","*zaponex*",,2,57,767,12067
0,"Like","day?hosp*","OR",2,27,768,12068
0,"Like","*day?hosp*","OR",2,27,768,12069
0,"Like","day?care*","OR",2,27,768,12070
0,"Like","*day?care*","OR",2,27,768,12071
0,"Like","day?treatment*","OR",2,27,768,12072
0,"Like","*day?treatment*","OR",2,27,768,12073
0,"Like","day?cent*","OR",2,27,768,12074
0,"Like","*day?cent*","OR",2,27,768,12075
0,"Like","*day?hosp*","OR",2,36,768,12076
0,"Like","*day?care*","OR",2,36,768,12077
0,"Like","*day?treatment*","OR",2,36,768,12078
0,"Like","*day?cent*","OR",2,36,768,12079
0,"Like","*day?hosp*","OR",2,57,768,12080
0,"Like","*day?care*","OR",2,57,768,12081
0,"Like","*day?treatment*","OR",2,57,768,12082
0,"Like","*day?cent*",,2,57,768,12083
0,"Like","*day?unit*","OR",2,27,769,12084
0,"Like","day?unit*","OR",2,27,769,12085
0,"Like","partial?hosp*","OR",2,27,769,12086
0,"Like","*partial?hosp*","OR",2,27,769,12087
0,"Like","dispensary*","OR",2,27,769,12088
0,"Like","*dispensary*","OR",2,27,769,12089
0,"Like","*day?unit*","OR",2,36,769,12090
0,"Like","*partial?hosp*","OR",2,36,769,12091
0,"Like","*dispensary*","OR",2,36,769,12092
0,"Like","*day?unit*","OR",2,57,769,12093
0,"Like","*partial?hosp*","OR",2,57,769,12094
0,"Like","*dispensary*",,2,57,769,12095
0,"Like","day?care","OR",1,14,771,12112
0,"Like","day?cent*","OR",1,14,771,12113
0,"Like","day?hosp*",,1,14,771,12114
0,"Like","Akineton*","OR",2,27,772,12115
0,"Like","*Akineton*","OR",2,27,772,12116
0,"Like","Anticholinergic*","OR",2,27,772,12117
0,"Like","*Anticholinergic*","OR",2,27,772,12118
0,"Like","Antimuscarinic*","OR",2,27,772,12119
0,"Like","*Antimuscarinic*","OR",2,27,772,12120
0,"Like","Aparkan*","OR",2,27,772,12121
0,"Like","*Aparkan*","OR",2,27,772,12122
0,"Like","Arpicolin*","OR",2,27,772,12123
0,"Like","*Arpicolin*","OR",2,27,772,12124
0,"Like","Artane*","OR",2,27,772,12125
0,"Like","*Artane*","OR",2,27,772,12126
0,"Like","Akineton*","OR",2,36,772,12127
0,"Like","Anticholinergic*","OR",2,36,772,12128
0,"Like","Antimuscarinic*","OR",2,36,772,12129
0,"Like","Aparkan*","OR",2,36,772,12130
0,"Like","Arpicolin*","OR",2,36,772,12131
0,"Like","Artane*","OR",2,36,772,12132
0,"Like","Akineton*","OR",2,57,772,12133
0,"Like","Anticholinergic*","OR",2,57,772,12134
0,"Like","Antimuscarinic*","OR",2,57,772,12135
0,"Like","Aparkan*","OR",2,57,772,12136
0,"Like","Arpicolin*","OR",2,57,772,12137
0,"Like","Artane*",,2,57,772,12138
0,"Like","Atropine*","OR",2,27,773,12139
0,"Like","*Atropine*","OR",2,27,773,12140
0,"Like","Banflex*","OR",2,27,773,12141
0,"Like","*Banflex*","OR",2,27,773,12142
0,"Like","Benapr*","OR",2,27,773,12143
0,"Like","*Benapr*","OR",2,27,773,12144
0,"Like","Benzatropine*","OR",2,27,773,12145
0,"Like","*Benzatropine*","OR",2,27,773,12146
0,"Like","Benzhexol*","OR",2,27,773,12147
0,"Like","*Benzhexol*","OR",2,27,773,12148
0,"Like","Benztropine*","OR",2,27,773,12149
0,"Like","*Benztropine*","OR",2,27,773,12150
0,"Like","Atropine*","OR",2,36,773,12151
0,"Like","Banflex*","OR",2,36,773,12152
0,"Like","Benapr*","OR",2,36,773,12153
0,"Like","Benzatropine*","OR",2,36,773,12154
0,"Like","Benzhexol*","OR",2,36,773,12155
0,"Like","Benztropine*","OR",2,36,773,12156
0,"Like","Atropine*","OR",2,57,773,12157
0,"Like","Banflex*","OR",2,57,773,12158
0,"Like","Benapr*","OR",2,57,773,12159
0,"Like","Benzatropine*","OR",2,57,773,12160
0,"Like","Benzhexol*","OR",2,57,773,12161
0,"Like","Benztropine*",,2,57,773,12162
0,"Like","Biperiden*","OR",2,27,774,12163
0,"Like","*Biperiden*","OR",2,27,774,12164
0,"Like","Biorphen*","OR",2,27,774,12165
0,"Like","*Biorphen*","OR",2,27,774,12166
0,"Like","Bornaprine*","OR",2,27,774,12167
0,"Like","*Bornaprine*","OR",2,27,774,12168
0,"Like","Broflex*","OR",2,27,774,12169
0,"Like","*Broflex*","OR",2,27,774,12170
0,"Like","Buscopan*","OR",2,27,774,12171
0,"Like","*Buscopan*","OR",2,27,774,12172
0,"Like","Cholinergic*","OR",2,27,774,12173
0,"Like","*Cholinergic*","OR",2,27,774,12174
0,"Like","Biperiden*","OR",2,36,774,12175
0,"Like","Biorphen*","OR",2,36,774,12176
0,"Like","Bornaprine*","OR",2,36,774,12177
0,"Like","Broflex*","OR",2,36,774,12178
0,"Like","Buscopan*","OR",2,36,774,12179
0,"Like","Cholinergic*","OR",2,36,774,12180
0,"Like","Biperiden*","OR",2,57,774,12181
0,"Like","Biorphen*","OR",2,57,774,12182
0,"Like","Bornaprine*","OR",2,57,774,12183
0,"Like","Broflex*","OR",2,57,774,12184
0,"Like","Buscopan*","OR",2,57,774,12185
0,"Like","Cholinergic*",,2,57,774,12186
0,"Like","Cogentin*","OR",2,27,775,12187
0,"Like","*Cogentin*","OR",2,27,775,12188
0,"Like","Cycrimine*","OR",2,27,775,12189
0,"Like","*Cycrimine*","OR",2,27,775,12190
0,"Like","Darifenacin*","OR",2,27,775,12191
0,"Like","*Darifenacin*","OR",2,27,775,12192
0,"Like","Dicycloverine*","OR",2,27,775,12193
0,"Like","*Dicycloverine*","OR",2,27,775,12194
0,"Like","Diphenhydramine*","OR",2,27,775,12195
0,"Like","*Diphenhydramine*","OR",2,27,775,12196
0,"Like","Disipal*","OR",2,27,775,12197
0,"Like","*Disipal*","OR",2,27,775,12198
0,"Like","Cogentin*","OR",2,36,775,12199
0,"Like","Cycrimine*","OR",2,36,775,12200
0,"Like","Darifenacin*","OR",2,36,775,12201
0,"Like","Dicycloverine*","OR",2,36,775,12202
0,"Like","Diphenhydramine*","OR",2,36,775,12203
0,"Like","Disipal*","OR",2,36,775,12204
0,"Like","Cogentin*","OR",2,57,775,12205
0,"Like","Cycrimine*","OR",2,57,775,12206
0,"Like","Darifenacin*","OR",2,57,775,12207
0,"Like","Dicycloverine*","OR",2,57,775,12208
0,"Like","Diphenhydramine*","OR",2,57,775,12209
0,"Like","Disipal*",,2,57,775,12210
0,"Like","Elantrine*","OR",2,27,776,12211
0,"Like","*Elantrine*","OR",2,27,776,12212
0,"Like","Ethopropazine*","OR",2,27,776,12213
0,"Like","*Ethopropazine*","OR",2,27,776,12214
0,"Like","Flavoxate*","OR",2,27,776,12215
0,"Like","*Flavoxate*","OR",2,27,776,12216
0,"Like","Flexon*","OR",2,27,776,12217
0,"Like","*Flexon*","OR",2,27,776,12218
0,"Like","Hyoscine*","OR",2,27,776,12219
0,"Like","*Hyoscine*","OR",2,27,776,12220
0,"Like","Kemadrin*","OR",2,27,776,12221
0,"Like","*Kemadrin*","OR",2,27,776,12222
0,"Like","Elantrine*","OR",2,36,776,12223
0,"Like","Ethopropazine*","OR",2,36,776,12224
0,"Like","Flavoxate*","OR",2,36,776,12225
0,"Like","Flexon*","OR",2,36,776,12226
0,"Like","Hyoscine*","OR",2,36,776,12227
0,"Like","Kemadrin*","OR",2,36,776,12228
0,"Like","Elantrine*","OR",2,57,776,12229
0,"Like","Ethopropazine*","OR",2,57,776,12230
0,"Like","Flavoxate*","OR",2,57,776,12231
0,"Like","Flexon*","OR",2,57,776,12232
0,"Like","Hyoscine*","OR",2,57,776,12233
0,"Like","Kemadrin*",,2,57,776,12234
0,"Like","Mephenamin*","OR",2,27,777,12235
0,"Like","*Mephenamin*","OR",2,27,777,12236
0,"Like","Muscarinic*","OR",2,27,777,12237
0,"Like","*Muscarinic*","OR",2,27,777,12238
0,"Like","Norflex*","OR",2,27,777,12239
0,"Like","*Norflex*","OR",2,27,777,12240
0,"Like","Oxybutynin*","OR",2,27,777,12241
0,"Like","*Oxybutynin*","OR",2,27,777,12242
0,"Like","Parkin*","OR",2,27,777,12243
0,"Like","*Parkin*","OR",2,27,777,12244
0,"Like","Parsid*","OR",2,27,777,12245
0,"Like","*Parsid*","OR",2,27,777,12246
0,"Like","Mephenamin*","OR",2,36,777,12247
0,"Like","Muscarinic*","OR",2,36,777,12248
0,"Like","Norflex*","OR",2,36,777,12249
0,"Like","Oxybutynin*","OR",2,36,777,12250
0,"Like","Parkin*","OR",2,36,777,12251
0,"Like","Parsid*","OR",2,36,777,12252
0,"Like","Mephenamin*","OR",2,57,777,12253
0,"Like","Muscarinic*","OR",2,57,777,12254
0,"Like","Norflex*","OR",2,57,777,12255
0,"Like","Oxybutynin*","OR",2,57,777,12256
0,"Like","Parkin*","OR",2,57,777,12257
0,"Like","Parsid*",,2,57,777,12258
0,"Like","Orphenadrine*","OR",2,27,778,12259
0,"Like","*Orphenadrine*","OR",2,27,778,12260
0,"Like","Pro-banthine*","OR",2,27,778,12261
0,"Like","*Pro-banthine*","OR",2,27,778,12262
0,"Like","Procyclidine*","OR",2,27,778,12263
0,"Like","*Procyclidine*","OR",2,27,778,12264
0,"Like","Profenamine*","OR",2,27,778,12265
0,"Like","*Profenamine*","OR",2,27,778,12266
0,"Like","Propantheline*","OR",2,27,778,12267
0,"Like","*Propantheline*","OR",2,27,778,12268
0,"Like","Propiverine*","OR",2,27,778,12269
0,"Like","*Propiverine*","OR",2,27,778,12270
0,"Like","Orphenadrine*","OR",2,36,778,12271
0,"Like","Pro-banthine*","OR",2,36,778,12272
0,"Like","Procyclidine*","OR",2,36,778,12273
0,"Like","Profenamine*","OR",2,36,778,12274
0,"Like","Propantheline*","OR",2,36,778,12275
0,"Like","Propiverine*","OR",2,36,778,12276
0,"Like","Orphenadrine*","OR",2,57,778,12277
0,"Like","Pro-banthine*","OR",2,57,778,12278
0,"Like","Procyclidine*","OR",2,57,778,12279
0,"Like","Profenamine*","OR",2,57,778,12280
0,"Like","Propantheline*","OR",2,57,778,12281
0,"Like","Propiverine*",,2,57,778,12282
0,"Like","Scopolamine*","OR",2,27,779,12283
0,"Like","*Scopolamine*","OR",2,27,779,12284
0,"Like","Solifenacin*","OR",2,27,779,12285
0,"Like","*Solifenacin*","OR",2,27,779,12286
0,"Like","Tolterodine*","OR",2,27,779,12287
0,"Like","*Tolterodine*","OR",2,27,779,12288
0,"Like","Trihexyphenidyl*","OR",2,27,779,12289
0,"Like","*Trihexyphenidyl*","OR",2,27,779,12290
0,"Like","Trospium*","OR",2,27,779,12291
0,"Like","*Trospium*","OR",2,27,779,12292
0,"Like","Scopolamine*","OR",2,36,779,12293
0,"Like","Solifenacin*","OR",2,36,779,12294
0,"Like","Tolterodine*","OR",2,36,779,12295
0,"Like","Trihexyphenidyl*","OR",2,36,779,12296
0,"Like","Trospium*","OR",2,36,779,12297
0,"Like","Scopolamine*","OR",2,57,779,12298
0,"Like","Solifenacin*","OR",2,57,779,12299
0,"Like","Tolterodine*","OR",2,57,779,12300
0,"Like","Trihexyphenidyl*","OR",2,57,779,12301
0,"Like","Trospium*",,2,57,779,12302
0,"Like","Levomepromazin*","OR",2,27,780,12303
0,"Like","*Levomepromazin*","OR",2,27,780,12304
0,"Like","Levoprome*","OR",2,27,780,12305
0,"Like","*Levoprome*","OR",2,27,780,12306
0,"Like","Levium*","OR",2,27,780,12307
0,"Like","*Levium*","OR",2,27,780,12308
0,"Like","Levozin*","OR",2,27,780,12309
0,"Like","*Levozin*","OR",2,27,780,12310
0,"Like","Levomepromazin*","OR",2,36,780,12311
0,"Like","Levoprome*","OR",2,36,780,12312
0,"Like","Levium*","OR",2,36,780,12313
0,"Like","Levozin*","OR",2,36,780,12314
0,"Like","Levomepromazin*","OR",2,57,780,12315
0,"Like","Levoprome*","OR",2,57,780,12316
0,"Like","Levium*","OR",2,57,780,12317
0,"Like","Levozin*","OR",2,57,780,12318
0,"Like","methotrimeprazine*","OR",2,27,781,12319
0,"Like","*methotrimeprazine*","OR",2,27,781,12320
0,"Like","Neurocil*","OR",2,27,781,12321
0,"Like","*Neurocil*","OR",2,27,781,12322
0,"Like","Norzinan*","OR",2,27,781,12323
0,"Like","*Norzinan*","OR",2,27,781,12324
0,"Like","Nosinan*","OR",2,27,781,12325
0,"Like","*Nosinan*","OR",2,27,781,12326
0,"Like","methotrimeprazine*","OR",2,36,781,12327
0,"Like","Neurocil*","OR",2,36,781,12328
0,"Like","Norzinan*","OR",2,36,781,12329
0,"Like","Nosinan*","OR",2,36,781,12330
0,"Like","methotrimeprazine*","OR",2,57,781,12331
0,"Like","Neurocil*","OR",2,57,781,12332
0,"Like","Norzinan*","OR",2,57,781,12333
0,"Like","Nosinan*",,2,57,781,12334
0,"Like","Novo-Meprazine*","OR",2,27,782,12335
0,"Like","*Novo-Meprazine*","OR",2,27,782,12336
0,"Like","Nozinan*","OR",2,27,782,12337
0,"Like","*Nozinan*","OR",2,27,782,12338
0,"Like","Sinogan*","OR",2,27,782,12339
0,"Like","*Sinogan*","OR",2,27,782,12340
0,"Like","Tisercin*","OR",2,27,782,12341
0,"Like","*Tisercin*","OR",2,27,782,12342
0,"Like","Novo-Meprazine*","OR",2,36,782,12343
0,"Like","Nozinan*","OR",2,36,782,12344
0,"Like","Sinogan*","OR",2,36,782,12345
0,"Like","Tisercin*","OR",2,36,782,12346
0,"Like","Novo-Meprazine*","OR",2,57,782,12347
0,"Like","Nozinan*","OR",2,57,782,12348
0,"Like","Sinogan*","OR",2,57,782,12349
0,"Like","Tisercin*",,2,57,782,12350
0,"Like","Veractil*","OR",2,27,783,12351
0,"Like","*Veractil*","OR",2,27,783,12352
0,"Like","Veractil*","OR",2,36,783,12353
0,"Like","Veractil*",,2,57,783,12354
0,"Like","Levomepromazin*","OR",1,14,785,12368
0,"Like","Levoprome*","OR",1,14,785,12369
0,"Like","Levium*","OR",1,14,785,12370
0,"Like","Levozin*","OR",1,14,785,12371
0,"Like","methotrimeprazine*","OR",1,14,785,12372
0,"Like","Neurocil*","OR",1,14,786,12373
0,"Like","Norzinan*","OR",1,14,786,12374
0,"Like","Nosinan*","OR",1,14,786,12375
0,"Like","Novo-Meprazine*","OR",1,14,786,12376
0,"Like","Sinogan*",,1,14,786,12377
0,"Like","Tisercin*","OR",1,14,787,12378
0,"Like","Veractil*",,1,14,787,12379
0,"Like","Acetylcholinesterase*","OR",2,27,788,12380
0,"Like","Anseculin*","OR",2,27,788,12381
0,"Like","CHF 2060*","OR",2,27,788,12382
0,"Like","Donepezil*","OR",2,27,788,12383
0,"Like","Eptastigmine*","OR",2,27,788,12384
0,"Like","Galantamine*","OR",2,27,788,12385
0,"Like","Acetylcholinesterase*","OR",2,36,788,12386
0,"Like","Anseculin*","OR",2,36,788,12387
0,"Like","CHF 2060*","OR",2,36,788,12388
0,"Like","Donepezil*","OR",2,36,788,12389
0,"Like","Eptastigmine*","OR",2,36,788,12390
0,"Like","Galantamine*","OR",2,36,788,12391
0,"Like","Acetylcholinesterase*","OR",2,57,788,12392
0,"Like","Anseculin*","OR",2,57,788,12393
0,"Like","CHF 2060*","OR",2,57,788,12394
0,"Like","Donepezil*","OR",2,57,788,12395
0,"Like","Eptastigmine*","OR",2,57,788,12396
0,"Like","Galantamine*",,2,57,788,12397
0,"Like","Huperzine A*","OR",2,27,789,12398
0,"Like","Icopezil*","OR",2,27,789,12399
0,"Like","Ipidacrine*","OR",2,27,789,12400
0,"Like","Itopride*","OR",2,27,789,12401
0,"Like","Metrifonate*","OR",2,27,789,12402
0,"Like","Mimopezil*","OR",2,27,789,12403
0,"Like","Huperzine A*","OR",2,36,789,12404
0,"Like","Icopezil*","OR",2,36,789,12405
0,"Like","Ipidacrine*","OR",2,36,789,12406
0,"Like","Itopride*","OR",2,36,789,12407
0,"Like","Metrifonate*","OR",2,36,789,12408
0,"Like","Mimopezil*","OR",2,36,789,12409
0,"Like","Huperzine A*","OR",2,57,789,12410
0,"Like","Icopezil*","OR",2,57,789,12411
0,"Like","Ipidacrine*","OR",2,57,789,12412
0,"Like","Itopride*","OR",2,57,789,12413
0,"Like","Metrifonate*","OR",2,57,789,12414
0,"Like","Mimopezil*",,2,57,789,12415
0,"Like","Phenserine*","OR",2,27,790,12416
0,"Like","Physostigmine*","OR",2,27,790,12417
0,"Like","Pramiracetam*","OR",2,27,790,12418
0,"Like","Quilostigmine*","OR",2,27,790,12419
0,"Like","Rivastigmine*","OR",2,27,790,12420
0,"Like","S 9977*","OR",2,27,790,12421
0,"Like","Phenserine*","OR",2,36,790,12422
0,"Like","Physostigmine*","OR",2,36,790,12423
0,"Like","Pramiracetam*","OR",2,36,790,12424
0,"Like","Quilostigmine*","OR",2,36,790,12425
0,"Like","Rivastigmine*","OR",2,36,790,12426
0,"Like","S 9977*","OR",2,36,790,12427
0,"Like","Phenserine*","OR",2,57,790,12428
0,"Like","Physostigmine*","OR",2,57,790,12429
0,"Like","Pramiracetam*","OR",2,57,790,12430
0,"Like","Quilostigmine*","OR",2,57,790,12431
0,"Like","Rivastigmine*","OR",2,57,790,12432
0,"Like","S 9977*",,2,57,790,12433
0,"Like","Tacrine*","OR",2,27,791,12434
0,"Like","Velnacrine*","OR",2,27,791,12435
0,"Like","Zanepesil*","OR",2,27,791,12436
0,"Like","Zifrosilone*","OR",2,27,791,12437
0,"Like","*Acetylcholinesterase*","OR",2,27,791,12438
0,"Like","*Anseculin*","OR",2,27,791,12439
0,"Like","*CHF 2060*","OR",2,27,791,12440
0,"Like","*Donepezil*","OR",2,27,791,12441
0,"Like","*Eptastigmine*","OR",2,27,791,12442
0,"Like","*Galantamine*",,2,27,791,12443
0,"Like","Tacrine*","OR",2,36,791,12444
0,"Like","Velnacrine*","OR",2,36,791,12445
0,"Like","Zanepesil*","OR",2,36,791,12446
0,"Like","Zifrosilone*","OR",2,36,791,12447
0,"Like","Tacrine*","OR",2,57,791,12448
0,"Like","Velnacrine*","OR",2,57,791,12449
0,"Like","Zanepesil*","OR",2,57,791,12450
0,"Like","Zifrosilone*","OR",2,57,791,12451
0,"Like","*Huperzine A*","OR",2,27,792,12452
0,"Like","*Icopezil*","OR",2,27,792,12453
0,"Like","*Ipidacrine*","OR",2,27,792,12454
0,"Like","*Itopride*","OR",2,27,792,12455
0,"Like","*Metrifonate*","OR",2,27,792,12456
0,"Like","*Mimopezil*","OR",2,27,792,12457
0,"Like","*Phenserine*","OR",2,27,792,12458
0,"Like","*Physostigmine*","OR",2,27,792,12459
0,"Like","*Pramiracetam*","OR",2,27,792,12460
0,"Like","*Quilostigmine*","OR",2,27,792,12461
0,"Like","*Rivastigmine*","OR",2,27,792,12462
0,"Like","*S 9977*","OR",2,27,792,12463
0,"Like","*Tacrine*","OR",2,27,792,12464
0,"Like","*Velnacrine*","OR",2,27,792,12465
0,"Like","*Zanepesil*","OR",2,27,792,12466
0,"Like","*Zifrosilone*",,2,27,792,12467
0,"Like","Acetylcholinesterase*","OR",1,14,793,12468
0,"Like","Anseculin*","OR",1,14,793,12469
0,"Like","CHF 2060*","OR",1,14,793,12470
0,"Like","Donepezil*","OR",1,14,793,12471
0,"Like","Eptastigmine*","OR",1,14,793,12472
0,"Like","Galantamine*","OR",1,14,793,12473
0,"Like","Huperzine A*","OR",1,14,793,12474
0,"Like","Icopezil*","OR",1,14,793,12475
0,"Like","Ipidacrine*","OR",1,14,793,12476
0,"Like","Itopride*","OR",1,14,793,12477
0,"Like","Metrifonate*","OR",1,14,793,12478
0,"Like","Mimopezil*","OR",1,14,793,12479
0,"Like","Phenserine*","OR",1,14,793,12480
0,"Like","Physostigmine*","OR",1,14,793,12481
0,"Like","Pramiracetam*",,1,14,793,12482
0,"Like","Quilostigmine*","OR",1,14,794,12483
0,"Like","Rivastigmine*","OR",1,14,794,12484
0,"Like","S 9977*","OR",1,14,794,12485
0,"Like","Tacrine*","OR",1,14,794,12486
0,"Like","Velnacrine*","OR",1,14,794,12487
0,"Like","Zanepesil*","OR",1,14,794,12488
0,"Like","Zifrosilone*",,1,14,794,12489
0,"Like","*outreach*","OR",2,27,797,12530
0,"Like","outreach*","OR",2,27,797,12531
0,"Like","*hostel*","OR",2,27,797,12532
0,"Like","hostel*","OR",2,27,797,12533
0,"Like","*aftercare*","OR",2,27,797,12534
0,"Like","aftercare*","OR",2,27,797,12535
0,"Like","*residential*","OR",2,27,797,12536
0,"Like","residential*","OR",2,27,797,12537
0,"Like","*housing*","OR",2,27,797,12538
0,"Like","housing*","OR",2,27,797,12539
0,"Like","*outreach*","OR",2,36,797,12540
0,"Like","*hostel*","OR",2,36,797,12541
0,"Like","*aftercare*","OR",2,36,797,12542
0,"Like","*residential*","OR",2,36,797,12543
0,"Like","*housing*","OR",2,36,797,12544
0,"Like","*outreach*","OR",2,57,797,12545
0,"Like","*hostel*","OR",2,57,797,12546
0,"Like","*aftercare*","OR",2,57,797,12547
0,"Like","*residential*","OR",2,57,797,12548
0,"Like","*housing*",,2,57,797,12549
0,"Like","*transitional*","OR",2,27,798,12550
0,"Like","transitional*","OR",2,27,798,12551
0,"Like","*posthospital*","OR",2,27,798,12552
0,"Like","posthospital*","OR",2,27,798,12553
0,"Like","*partial hospitali?ation*","OR",2,27,798,12554
0,"Like","partial hospitali?ation*","OR",2,27,798,12555
0,"Like","*community treatment*","OR",2,27,798,12556
0,"Like","community treatment*","OR",2,27,798,12557
0,"Like","*community mental health*","OR",2,27,798,12558
0,"Like","community mental health*","OR",2,27,798,12559
0,"Like","*transitional*","OR",2,36,798,12560
0,"Like","*posthospital*","OR",2,36,798,12561
0,"Like","*partial hospitali?ation*","OR",2,36,798,12562
0,"Like","*community treatment*","OR",2,36,798,12563
0,"Like","*community mental health*","OR",2,36,798,12564
0,"Like","*transitional*","OR",2,57,798,12565
0,"Like","*posthospital*","OR",2,57,798,12566
0,"Like","*partial hospitali?ation*","OR",2,57,798,12567
0,"Like","*community treatment*","OR",2,57,798,12568
0,"Like","*community mental health*",,2,57,798,12569
0,"Like","*PACT*","OR",2,27,800,12590
0,"Like","PACT*","OR",2,27,800,12591
0,"Like","*tcl*","OR",2,27,800,12592
0,"Like","tcl*","OR",2,27,800,12593
0,"Like","PACT*","OR",2,36,800,12594
0,"Like","tcl*","OR",2,36,800,12595
0,"Like","PACT*","OR",2,57,800,12596
0,"Like","tcl*",,2,57,800,12597
0,"Like","*drop-in cent*","OR",2,27,801,12598
0,"Like","drop-in cent*","OR",2,27,801,12599
0,"Like","*drop-in hospital*","OR",2,27,801,12600
0,"Like","*drop-in hospital*","OR",2,27,801,12601
0,"Like","*drop-in treatment*","OR",2,27,801,12602
0,"Like","drop-in treatment*","OR",2,27,801,12603
0,"Like","*drop-in care*","OR",2,27,801,12604
0,"Like","drop-in care*","OR",2,27,801,12605
0,"Like","*drop-in unit*","OR",2,27,801,12606
0,"Like","drop-in unit*","OR",2,27,801,12607
0,"Like","*drop-in cent*","OR",2,36,801,12608
0,"Like","*drop-in hospital*","OR",2,36,801,12609
0,"Like","*drop-in treatment*","OR",2,36,801,12610
0,"Like","*drop-in care*","OR",2,36,801,12611
0,"Like","*drop-in unit*","OR",2,36,801,12612
0,"Like","*drop-in cent*","OR",2,57,801,12613
0,"Like","*drop-in hospital*","OR",2,57,801,12614
0,"Like","*drop-in treatment*","OR",2,57,801,12615
0,"Like","*drop-in care*","OR",2,57,801,12616
0,"Like","*drop-in unit*",,2,57,801,12617
0,"Like","*drop in cent*","OR",2,27,802,12618
0,"Like","drop in cent*","OR",2,27,802,12619
0,"Like","*drop in hospital*","OR",2,27,802,12620
0,"Like","*drop in hospital*","OR",2,27,802,12621
0,"Like","*drop in treatment*","OR",2,27,802,12622
0,"Like","drop in treatment*","OR",2,27,802,12623
0,"Like","*drop in care*","OR",2,27,802,12624
0,"Like","drop in care*","OR",2,27,802,12625
0,"Like","*drop in unit*","OR",2,27,802,12626
0,"Like","drop in unit*","OR",2,27,802,12627
0,"Like","*drop in cent*","OR",2,36,802,12628
0,"Like","*drop in hospital*","OR",2,36,802,12629
0,"Like","*drop in treatment*","OR",2,36,802,12630
0,"Like","*drop in care*","OR",2,36,802,12631
0,"Like","*drop in unit*","OR",2,36,802,12632
0,"Like","*drop in cent*","OR",2,57,802,12633
0,"Like","*drop in hospital*","OR",2,57,802,12634
0,"Like","*drop in treatment*","OR",2,57,802,12635
0,"Like","*drop in care*","OR",2,57,802,12636
0,"Like","*drop in unit*",,2,57,802,12637
0,"Like","*ca?e management*","OR",2,27,804,12658
0,"Like","ca?e management*","OR",2,27,804,12659
0,"Like","*cpa*","OR",2,27,804,12660
0,"Like","cpa*","OR",2,27,804,12661
0,"Like","*madison model*","OR",2,27,804,12662
0,"Like","madison model*","OR",2,27,804,12663
0,"Like","*foster*","OR",2,27,804,12664
0,"Like","foster*","OR",2,27,804,12665
0,"Like","*guardianship*","OR",2,27,804,12666
0,"Like","guardianship*","OR",2,27,804,12667
0,"Like","*ca?e management*","OR",2,36,804,12668
0,"Like","*cpa*","OR",2,36,804,12669
0,"Like","*madison model*","OR",2,36,804,12670
0,"Like","*foster*","OR",2,36,804,12671
0,"Like","*guardianship*","OR",2,36,804,12672
0,"Like","*ca?e management*","OR",2,57,804,12673
0,"Like","*cpa*","OR",2,57,804,12674
0,"Like","*madison model*","OR",2,57,804,12675
0,"Like","*foster*","OR",2,57,804,12676
0,"Like","*guardianship*",,2,57,804,12677
0,"Like","*daily living programme*","OR",2,27,805,12678
0,"Like","daily living programme*","OR",2,27,805,12679
0,"Like","*crisis intervention*","OR",2,27,805,12680
0,"Like","crisis intervention*","OR",2,27,805,12681
0,"Like","*early intervention*","OR",2,27,805,12682
0,"Like","early intervention*","OR",2,27,805,12683
0,"Like","*ambulatory treatment*","OR",2,27,805,12684
0,"Like","ambulatory treatment*","OR",2,27,805,12685
0,"Like","*ambulatory care*","OR",2,27,805,12686
0,"Like","ambulatory care*","OR",2,27,805,12687
0,"Like","*daily living programme*","OR",2,36,805,12688
0,"Like","*crisis intervention*","OR",2,36,805,12689
0,"Like","*early intervention*","OR",2,36,805,12690
0,"Like","*ambulatory treatment*","OR",2,36,805,12691
0,"Like","*ambulatory care*","OR",2,36,805,12692
0,"Like","*daily living programme*","OR",2,57,805,12693
0,"Like","*crisis intervention*","OR",2,57,805,12694
0,"Like","*early intervention*","OR",2,57,805,12695
0,"Like","*ambulatory treatment*","OR",2,57,805,12696
0,"Like","*ambulatory care*",,2,57,805,12697
0,"Like","*assertive outreach*","OR",2,27,806,12698
0,"Like","assertive outreach*","OR",2,27,806,12699
0,"Like","*patient participation*","OR",2,27,806,12700
0,"Like","patient participation*","OR",2,27,806,12701
0,"Like","*community living*","OR",2,27,806,12702
0,"Like","community living*","OR",2,27,806,12703
0,"Like","*social support*","OR",2,27,806,12704
0,"Like","social support*","OR",2,27,806,12705
0,"Like","*patient care team*","OR",2,27,806,12706
0,"Like","*patient care team*","OR",2,27,806,12707
0,"Like","*assertive outreach*","OR",2,36,806,12708
0,"Like","*patient participation*","OR",2,36,806,12709
0,"Like","*community living*","OR",2,36,806,12710
0,"Like","*social support*","OR",2,36,806,12711
0,"Like","*patient care team*","OR",2,36,806,12712
0,"Like","*assertive outreach*","OR",2,57,806,12713
0,"Like","*patient participation*","OR",2,57,806,12714
0,"Like","*community living*","OR",2,57,806,12715
0,"Like","*social support*","OR",2,57,806,12716
0,"Like","*patient care team*",,2,57,806,12717
0,"Like","*community Team*","OR",2,27,807,12718
0,"Like","community Team*","OR",2,27,807,12719
0,"Like","*community cent*","OR",2,27,807,12720
0,"Like","community cent*","OR",2,27,807,12721
0,"Like","*care programme approach*","OR",2,27,807,12722
0,"Like","care programme approach*","OR",2,27,807,12723
0,"Like","*community Team*","OR",2,36,807,12724
0,"Like","*community cent*","OR",2,36,807,12725
0,"Like","*care programme approach*","OR",2,36,807,12726
0,"Like","*community Team*","OR",2,57,807,12727
0,"Like","*community cent*","OR",2,57,807,12728
0,"Like","*care programme approach*",,2,57,807,12729
0,"Like","*day cent*","OR",2,27,808,12730
0,"Like","day cent*","OR",2,27,808,12731
0,"Like","*day hospital*","OR",2,27,808,12732
0,"Like","*day hospital*","OR",2,27,808,12733
0,"Like","*day treatment*","OR",2,27,808,12734
0,"Like","day treatment*","OR",2,27,808,12735
0,"Like","*day care*","OR",2,27,808,12736
0,"Like","day care*","OR",2,27,808,12737
0,"Like","*day unit*","OR",2,27,808,12738
0,"Like","day unit*","OR",2,27,808,12739
0,"Like","*day cent*","OR",2,36,808,12740
0,"Like","*day hospital*","OR",2,36,808,12741
0,"Like","*day treatment*","OR",2,36,808,12742
0,"Like","*day care*","OR",2,36,808,12743
0,"Like","*day unit*","OR",2,36,808,12744
0,"Like","*day cent*","OR",2,57,808,12745
0,"Like","*day hospital*","OR",2,57,808,12746
0,"Like","*day treatment*","OR",2,57,808,12747
0,"Like","*day care*","OR",2,57,808,12748
0,"Like","*day unit*",,2,57,808,12749
0,"Like","*intensive care*","OR",2,27,809,12750
0,"Like","intensive care*","OR",2,27,809,12751
0,"Like","*intensive intervention*","OR",2,27,809,12752
0,"Like","intensive intervention*","OR",2,27,809,12753
0,"Like","*intensive treat*","OR",2,27,809,12754
0,"Like","intensive treat*","OR",2,27,809,12755
0,"Like","*intensive therap*","OR",2,27,809,12756
0,"Like","intensive therap*","OR",2,27,809,12757
0,"Like","*intensive management*","OR",2,27,809,12758
0,"Like","intensive management*","OR",2,27,809,12759
0,"Like","*intensive care*","OR",2,36,809,12760
0,"Like","*intensive intervention*","OR",2,36,809,12761
0,"Like","*intensive treat*","OR",2,36,809,12762
0,"Like","*intensive therap*","OR",2,36,809,12763
0,"Like","*intensive management*","OR",2,36,809,12764
0,"Like","*intensive care*","OR",2,57,809,12765
0,"Like","*intensive intervention*","OR",2,57,809,12766
0,"Like","*intensive treat*","OR",2,57,809,12767
0,"Like","*intensive therap*","OR",2,57,809,12768
0,"Like","*intensive management*",,2,57,809,12769
0,"Like","*intensive model*","OR",2,27,810,12770
0,"Like","intensive model*","OR",2,27,810,12771
0,"Like","*intensive programme*","OR",2,27,810,12772
0,"Like","intensive programme*","OR",2,27,810,12773
0,"Like","*intensive team*","OR",2,27,810,12774
0,"Like","intensive team*","OR",2,27,810,12775
0,"Like","*intensive service*","OR",2,27,810,12776
0,"Like","intensive service*","OR",2,27,810,12777
0,"Like","*mobile care*","OR",2,27,810,12778
0,"Like","mobile care*","OR",2,27,810,12779
0,"Like","*intensive model*","OR",2,36,810,12780
0,"Like","*intensive programme*","OR",2,36,810,12781
0,"Like","*intensive team*","OR",2,36,810,12782
0,"Like","*intensive service*","OR",2,36,810,12783
0,"Like","*mobile care*","OR",2,36,810,12784
0,"Like","*intensive model*","OR",2,57,810,12785
0,"Like","*intensive programme*","OR",2,57,810,12786
0,"Like","*intensive team*","OR",2,57,810,12787
0,"Like","*intensive service*","OR",2,57,810,12788
0,"Like","*mobile care*",,2,57,810,12789
0,"Like","*outreach interven*","OR",2,27,812,12810
0,"Like","outreachinterven*","OR",2,27,812,12811
0,"Like","*outreach treat*","OR",2,27,812,12812
0,"Like","outreach treat*","OR",2,27,812,12813
0,"Like","*outreach therap*","OR",2,27,812,12814
0,"Like","outreach therap*","OR",2,27,812,12815
0,"Like","*outreach management*","OR",2,27,812,12816
0,"Like","outreach management*","OR",2,27,812,12817
0,"Like","*outreach model*","OR",2,27,812,12818
0,"Like","*outreach model*","OR",2,27,812,12819
0,"Like","*outreach interven*","OR",2,36,812,12820
0,"Like","*outreach treat*","OR",2,36,812,12821
0,"Like","*outreach therap*","OR",2,36,812,12822
0,"Like","*outreach management*","OR",2,36,812,12823
0,"Like","*outreach model*","OR",2,36,812,12824
0,"Like","*outreach interven*","OR",2,57,812,12825
0,"Like","*outreach treat*","OR",2,57,812,12826
0,"Like","*outreach therap*","OR",2,57,812,12827
0,"Like","*outreach management*","OR",2,57,812,12828
0,"Like","*outreach model*",,2,57,812,12829
0,"Like","*outreach interven*","OR",2,27,813,12830
0,"Like","outreach interven*","OR",2,27,813,12831
0,"Like","*outreach treat*","OR",2,27,813,12832
0,"Like","outreach treat*","OR",2,27,813,12833
0,"Like","*outreach therap*","OR",2,27,813,12834
0,"Like","outreach therap*","OR",2,27,813,12835
0,"Like","*outreach management*","OR",2,27,813,12836
0,"Like","outreach management*","OR",2,27,813,12837
0,"Like","*outreach model*","OR",2,27,813,12838
0,"Like","*outreach model*","OR",2,27,813,12839
0,"Like","*outreach interven*","OR",2,36,813,12840
0,"Like","*outreach treat*","OR",2,36,813,12841
0,"Like","*outreach therap*","OR",2,36,813,12842
0,"Like","*outreach management*","OR",2,36,813,12843
0,"Like","*outreach model*","OR",2,36,813,12844
0,"Like","*outreach interven*","OR",2,57,813,12845
0,"Like","*outreach treat*","OR",2,57,813,12846
0,"Like","*outreach therap*","OR",2,57,813,12847
0,"Like","*outreach management*","OR",2,57,813,12848
0,"Like","*outreach model*",,2,57,813,12849
0,"Like","*community interven*","OR",2,27,814,12850
0,"Like","community interven*","OR",2,27,814,12851
0,"Like","*community treat*","OR",2,27,814,12852
0,"Like","community treat*","OR",2,27,814,12853
0,"Like","*community therap*","OR",2,27,814,12854
0,"Like","community therap*","OR",2,27,814,12855
0,"Like","*community management*","OR",2,27,814,12856
0,"Like","community management*","OR",2,27,814,12857
0,"Like","*community model*","OR",2,27,814,12858
0,"Like","*community model*","OR",2,27,814,12859
0,"Like","*community interven*","OR",2,36,814,12860
0,"Like","*community treat*","OR",2,36,814,12861
0,"Like","*community therap*","OR",2,36,814,12862
0,"Like","*community management*","OR",2,36,814,12863
0,"Like","*community model*","OR",2,36,814,12864
0,"Like","*community interven*","OR",2,57,814,12865
0,"Like","*community treat*","OR",2,57,814,12866
0,"Like","*community therap*","OR",2,57,814,12867
0,"Like","*community management*","OR",2,57,814,12868
0,"Like","*community model*",,2,57,814,12869
0,"Like","*Home interven*","OR",2,27,815,12870
0,"Like","Home interven*","OR",2,27,815,12871
0,"Like","*Home treat*","OR",2,27,815,12872
0,"Like","Home treat*","OR",2,27,815,12873
0,"Like","*Home therap*","OR",2,27,815,12874
0,"Like","Home therap*","OR",2,27,815,12875
0,"Like","*Home management*","OR",2,27,815,12876
0,"Like","Home management*","OR",2,27,815,12877
0,"Like","*Home model*","OR",2,27,815,12878
0,"Like","*Home model*","OR",2,27,815,12879
0,"Like","*Home interven*","OR",2,36,815,12880
0,"Like","*Home treat*","OR",2,36,815,12881
0,"Like","*Home therap*","OR",2,36,815,12882
0,"Like","*Home management*","OR",2,36,815,12883
0,"Like","*Home model*","OR",2,36,815,12884
0,"Like","*Home interven*","OR",2,57,815,12885
0,"Like","*Home treat*","OR",2,57,815,12886
0,"Like","*Home therap*","OR",2,57,815,12887
0,"Like","*Home management*","OR",2,57,815,12888
0,"Like","*Home model*",,2,57,815,12889
0,"Like","*mobile programme*","OR",2,27,816,12890
0,"Like","mobile programme*","OR",2,27,816,12891
0,"Like","*mobile team*","OR",2,27,816,12892
0,"Like","mobile team*","OR",2,27,816,12893
0,"Like","*mobile service*","OR",2,27,816,12894
0,"Like","mobile service*","OR",2,27,816,12895
0,"Like","*outreach care*","OR",2,27,816,12896
0,"Like","outreach care*","OR",2,27,816,12897
0,"Like","*community care*","OR",2,27,816,12898
0,"Like","community care*","OR",2,27,816,12899
0,"Like","*mobile programme*","OR",2,36,816,12900
0,"Like","*mobile team*","OR",2,36,816,12901
0,"Like","*mobile service*","OR",2,36,816,12902
0,"Like","*outreach care*","OR",2,36,816,12903
0,"Like","*community care*","OR",2,36,816,12904
0,"Like","*mobile programme*","OR",2,57,816,12905
0,"Like","*mobile team*","OR",2,57,816,12906
0,"Like","*mobile service*","OR",2,57,816,12907
0,"Like","*outreach care*","OR",2,57,816,12908
0,"Like","*community care*","OR",2,57,816,12909
0,"Like","*outreach programme*","OR",2,27,817,12910
0,"Like","outreach programme*","OR",2,27,817,12911
0,"Like","*outreach team*","OR",2,27,817,12912
0,"Like","outreach team*","OR",2,27,817,12913
0,"Like","*outreach service*","OR",2,27,817,12914
0,"Like","outreach service*","OR",2,27,817,12915
0,"Like","*community programme*","OR",2,27,817,12916
0,"Like","community programme*","OR",2,27,817,12917
0,"Like","*community team*","OR",2,27,817,12918
0,"Like","community team*","OR",2,27,817,12919
0,"Like","*outreach programme*","OR",2,36,817,12920
0,"Like","*outreach team*","OR",2,36,817,12921
0,"Like","*outreach service*","OR",2,36,817,12922
0,"Like","*community programme*","OR",2,36,817,12923
0,"Like","*community team*","OR",2,36,817,12924
0,"Like","*outreach programme*","OR",2,57,817,12925
0,"Like","*outreach team*","OR",2,57,817,12926
0,"Like","*outreach service*","OR",2,57,817,12927
0,"Like","*community programme*","OR",2,57,817,12928
0,"Like","*community team*","OR",2,57,817,12929
0,"Like","*Home programme*","OR",2,27,818,12930
0,"Like","Home programme*","OR",2,27,818,12931
0,"Like","*Home team*","OR",2,27,818,12932
0,"Like","Home team*","OR",2,27,818,12933
0,"Like","*Home service*","OR",2,27,818,12934
0,"Like","Home service*","OR",2,27,818,12935
0,"Like","*Home base*","OR",2,27,818,12936
0,"Like","Home base*","OR",2,27,818,12937
0,"Like","*community service*","OR",2,27,818,12938
0,"Like","community service*","OR",2,27,818,12939
0,"Like","*Home programme*","OR",2,36,818,12940
0,"Like","*Home team*","OR",2,36,818,12941
0,"Like","*Home service*","OR",2,36,818,12942
0,"Like","*Home base*","OR",2,36,818,12943
0,"Like","*community service*","OR",2,36,818,12944
0,"Like","*Home programme*","OR",2,57,818,12945
0,"Like","*Home team*","OR",2,57,818,12946
0,"Like","*Home service*","OR",2,57,818,12947
0,"Like","*Home base*","OR",2,57,818,12948
0,"Like","*community service*","OR",2,57,818,12949
0,"Like","*community base*","OR",2,27,819,12950
0,"Like","community base*","OR",2,27,819,12951
0,"Like","*community base*","OR",2,36,819,12952
0,"Like","*community base*",,2,57,819,12953
0,"Like","*community base*","OR",2,27,820,12954
0,"Like","community base*","OR",2,27,820,12955
0,"Like","*broker*","OR",2,27,820,12956
0,"Like","broker*","OR",2,27,820,12957
0,"Like","*aggressive outreach*","OR",2,27,820,12958
0,"Like","aggressive outreach*","OR",2,27,820,12959
0,"Like","*community base*","OR",2,36,820,12960
0,"Like","*broker*","OR",2,36,820,12961
0,"Like","*aggressive outreach*","OR",2,36,820,12962
0,"Like","*community base*","OR",2,57,820,12963
0,"Like","*broker*","OR",2,57,820,12964
0,"Like","*aggressive outreach*",,2,57,820,12965
0,"Like","*cpa*","OR",1,14,821,12966
0,"Like","*community treatment*","OR",1,14,821,12967
0,"Like","*community team*","OR",1,14,821,12968
0,"Like","*community cent*","OR",1,14,821,12969
0,"Like","*community care approach*","OR",1,14,821,12970
0,"Like","*madison model*","OR",1,14,821,12971
0,"Like","*outreach*","OR",1,14,821,12972
0,"Like","*hostel*","OR",1,14,821,12973
0,"Like","*aftercare*","OR",1,14,821,12974
0,"Like","*residential*","OR",1,14,821,12975
0,"Like","*housing*","OR",1,14,821,12976
0,"Like","*transitional*","OR",1,14,821,12977
0,"Like","*posthospital*","OR",1,14,821,12978
0,"Like","*partial hospitali?ation*","OR",1,14,821,12979
0,"Like","*Foster*","OR",1,14,821,12980
0,"Like","*Guardianship*","OR",1,14,821,12981
0,"Like","*daily living programme*","OR",1,14,821,12982
0,"Like","*crisis intervention*","OR",1,14,821,12983
0,"Like","*early intervention*",,1,14,821,12984
0,"Like","*ca?e management*","OR",1,14,821,12985
0,"Like","*Ambulatory treatment*","OR",1,14,822,12986
0,"Like","*Ambulatory care*","OR",1,14,822,12987
0,"Like","*community living*","OR",1,14,822,12988
0,"Like","*social support*","OR",1,14,822,12989
0,"Like","*patient care team*","OR",1,14,822,12990
0,"Like","*community mental health*","OR",1,14,822,12991
0,"Like","*patient participation*","OR",1,14,822,12992
0,"Like","*assertive outreach*","OR",1,14,822,12993
0,"Like","*drop-in hospital*","OR",1,14,822,12994
0,"Like","*drop-in care*","OR",1,14,822,12995
0,"Like","*drop-in treatment*","OR",1,14,822,12996
0,"Like","*drop-in cent*","OR",1,14,822,12997
0,"Like","*drop-in unit*","OR",1,14,822,12998
0,"Like","*drop in hospital*","OR",1,14,822,12999
0,"Like","*drop in care*","OR",1,14,822,13000
0,"Like","*drop in treatment*","OR",1,14,822,13001
0,"Like","*drop in cent*","OR",1,14,822,13002
0,"Like","*drop in unit*","OR",1,14,822,13003
0,"Like","*day hospital*","OR",1,14,822,13004
0,"Like","*day care*",,1,14,822,13005
0,"Like","*day treatment*","OR",1,14,823,13006
0,"Like","*day cent*","OR",1,14,823,13007
0,"Like","*day unit*","OR",1,14,823,13008
0,"Like","*Intensive care*","OR",1,14,823,13009
0,"Like","*Intensive interven*","OR",1,14,823,13010
0,"Like","*Intensive treat*","OR",1,14,823,13011
0,"Like","*Intensive therap*","OR",1,14,823,13012
0,"Like","*Intensive management*","OR",1,14,823,13013
0,"Like","*Intensive model*","OR",1,14,823,13014
0,"Like","*Intensive programm*","OR",1,14,823,13015
0,"Like","*Intensive team*","OR",1,14,823,13016
0,"Like","*Intensive service*","OR",1,14,823,13017
0,"Like","*mobile care*","OR",1,14,823,13018
0,"Like","*mobile interven*","OR",1,14,823,13019
0,"Like","*mobile treat*","OR",1,14,823,13020
0,"Like","*mobile therap*","OR",1,14,823,13021
0,"Like","*mobile management*","OR",1,14,823,13022
0,"Like","*mobile model*","OR",1,14,823,13023
0,"Like","*mobile programm*","OR",1,14,823,13024
0,"Like","*mobile team*",,1,14,823,13025
0,"Like","*mobile service*","OR",1,14,824,13026
0,"Like","*outreach care*","OR",1,14,824,13027
0,"Like","*outreach interven*","OR",1,14,824,13028
0,"Like","*outreach treat*","OR",1,14,824,13029
0,"Like","*outreach therap*","OR",1,14,824,13030
0,"Like","*outreach management*","OR",1,14,824,13031
0,"Like","*outreach model*","OR",1,14,824,13032
0,"Like","*outreach programm*","OR",1,14,824,13033
0,"Like","*outreach team*","OR",1,14,824,13034
0,"Like","*outreach service*","OR",1,14,824,13035
0,"Like","*community care*","OR",1,14,824,13036
0,"Like","*community interven*","OR",1,14,824,13037
0,"Like","*community treat*","OR",1,14,824,13038
0,"Like","*community therap*","OR",1,14,824,13039
0,"Like","*community management*","OR",1,14,824,13040
0,"Like","*community model*","OR",1,14,824,13041
0,"Like","*community programm*","OR",1,14,824,13042
0,"Like","*community team*","OR",1,14,824,13043
0,"Like","*community service*","OR",1,14,824,13044
0,"Like","*community base*",,1,14,824,13045
0,"Like","*home care*","OR",1,14,825,13046
0,"Like","*home interven*","OR",1,14,825,13047
0,"Like","*home treat*","OR",1,14,825,13048
0,"Like","*home therap*","OR",1,14,825,13049
0,"Like","*home management*","OR",1,14,825,13050
0,"Like","*home model*","OR",1,14,825,13051
0,"Like","*home programm*","OR",1,14,825,13052
0,"Like","*home team*","OR",1,14,825,13053
0,"Like","*home service*","OR",1,14,825,13054
0,"Like","*home base*","OR",1,14,825,13055
0,"Like","*aggressive outreach*","OR",1,14,825,13056
0,"Like","*broker*","OR",1,14,825,13057
0,"Like","*Pact*","OR",1,14,825,13058
0,"Like","*tcl*",,1,14,825,13059
0,"Like","*vitamin*","OR",2,27,826,13060
0,"Like","*tocopherol*","OR",2,27,826,13061
0,"Like","tocopherol*","OR",2,27,826,13062
0,"Like","vitamin*",,2,27,826,13063
0,"Like","*vitamin*","OR",2,36,826,13064
0,"Like","*tocopherol*","OR",2,36,826,13065
0,"Like","*vitamin*","OR",2,57,826,13066
0,"Like","*tocopherol*","OR",2,57,826,13067
0,"Like","program*","OR",2,27,827,13068
0,"Like","*program*","OR",2,27,827,13069
0,"Like","*care program approach*","OR",2,27,827,13070
0,"Like","care program approach*","OR",2,27,827,13071
0,"Like","*care programme approach*","OR",2,27,827,13072
0,"Like","care programme approach*",,2,27,827,13073
0,"Like","*care program approach*","OR",2,36,827,13074
0,"Like","*program*","OR",2,36,827,13075
0,"Like","*care programme approach*","OR",2,36,827,13076
0,"Like","*care program approach*","OR",2,57,827,13077
0,"Like","*program*","OR",2,57,827,13078
0,"Like","*care programme approach*","OR",2,57,827,13079
0,"Like","*program*","OR",1,14,828,13080
0,"Like","*care program management*","OR",1,14,828,13081
0,"Like","*care programme management*",,1,14,828,13082
0,"Like","*abecarnil*","OR",2,27,829,13083
0,"Like","abecarnil*","OR",2,27,829,13084
0,"Like","*alprazo*","OR",2,27,829,13085
0,"Like","alprazo*","OR",2,27,829,13086
0,"Like","*amobarbital*","OR",2,27,829,13087
0,"Like","amobarbital*","OR",2,27,829,13088
0,"Like","*arfendazam*","OR",2,27,829,13089
0,"Like","arfendazam*","OR",2,27,829,13090
0,"Like","*abecarnil*","OR",2,36,829,13091
0,"Like","*alprazo*","OR",2,36,829,13092
0,"Like","*amobarbital*","OR",2,36,829,13093
0,"Like","*arfendazam*","OR",2,36,829,13094
0,"Like","*abecarnil*","OR",2,57,829,13095
0,"Like","*alprazo*","OR",2,57,829,13096
0,"Like","*amobarbital*","OR",2,57,829,13097
0,"Like","*arfendazam*",,2,57,829,13098
0,"Like","*azepam*","OR",2,27,830,13099
0,"Like","azepam*","OR",2,27,830,13100
0,"Like","*benzodia*","OR",2,27,830,13101
0,"Like","benzodia*","OR",2,27,830,13102
0,"Like","*bromazepam*","OR",2,27,830,13103
0,"Like","bromazepam*","OR",2,27,830,13104
0,"Like","*Chlordiaz*","OR",2,27,830,13105
0,"Like","Chlordiaz*","OR",2,27,830,13106
0,"Like","*azepam*","OR",2,36,830,13107
0,"Like","*benzodia*","OR",2,36,830,13108
0,"Like","*bromazepam*","OR",2,36,830,13109
0,"Like","*Chlordiaz*","OR",2,36,830,13110
0,"Like","*azepam*","OR",2,57,830,13111
0,"Like","*benzodia*","OR",2,57,830,13112
0,"Like","*bromazepam*","OR",2,57,830,13113
0,"Like","*Chlordiaz*",,2,57,830,13114
0,"Like","*ciclotizolam*","OR",2,27,831,13115
0,"Like","ciclotizolam*","OR",2,27,831,13116
0,"Like","*clobazam*","OR",2,27,831,13117
0,"Like","clobazam*","OR",2,27,831,13118
0,"Like","clonazepam*","OR",2,27,831,13119
0,"Like","*clonazepam*","OR",2,27,831,13120
0,"Like","cloraze*","OR",2,27,831,13121
0,"Like","*cloraze*","OR",2,27,831,13122
0,"Like","*ciclotizolam*","OR",2,36,831,13123
0,"Like","*clobazam*","OR",2,36,831,13124
0,"Like","*clonazepam*","OR",2,36,831,13125
0,"Like","*cloraze*","OR",2,36,831,13126
0,"Like","*ciclotizolam*","OR",2,57,831,13127
0,"Like","*clobazam*","OR",2,57,831,13128
0,"Like","*clonazepam*","OR",2,57,831,13129
0,"Like","*cloraze*",,2,57,831,13130
0,"Like","clotiazepam*","OR",2,27,832,13131
0,"Like","*clotiazepam*","OR",2,27,832,13132
0,"Like","*diazepam*","OR",2,27,832,13133
0,"Like","diazepam*","OR",2,27,832,13134
0,"Like","estazo*","OR",2,27,832,13135
0,"Like","*estazo*","OR",2,27,832,13136
0,"Like","etizolam*","OR",2,27,832,13137
0,"Like","*etizolam*","OR",2,27,832,13138
0,"Like","*clotiazepam*","OR",2,36,832,13139
0,"Like","*diazepam*","OR",2,36,832,13140
0,"Like","*estazo*","OR",2,36,832,13141
0,"Like","*etizolam*","OR",2,36,832,13142
0,"Like","*clotiazepam*","OR",2,57,832,13143
0,"Like","*diazepam*","OR",2,57,832,13144
0,"Like","*estazo*","OR",2,57,832,13145
0,"Like","*etizolam*",,2,57,832,13146
0,"Like","*FG 7142*","OR",2,27,833,13147
0,"Like","FG 7142*","OR",2,27,833,13148
0,"Like","flumazenil*","OR",2,27,833,13149
0,"Like","*flumazenil*","OR",2,27,833,13150
0,"Like","flunitrazepam*","OR",2,27,833,13151
0,"Like","*flunitrazepam*","OR",2,27,833,13152
0,"Like","flurazepam*","OR",2,27,833,13153
0,"Like","*flurazepam*","OR",2,27,833,13154
0,"Like","*FG 7142*","OR",2,36,833,13155
0,"Like","*flumazenil*","OR",2,36,833,13156
0,"Like","*flunitrazepam*","OR",2,36,833,13157
0,"Like","*flurazepam*","OR",2,36,833,13158
0,"Like","*FG 7142*","OR",2,57,833,13159
0,"Like","*flumazenil*","OR",2,57,833,13160
0,"Like","*flunitrazepam*","OR",2,57,833,13161
0,"Like","*flurazepam*",,2,57,833,13162
0,"Like","*GABA*","OR",2,27,834,13163
0,"Like","GABA*","OR",2,27,834,13164
0,"Like","girisopam*","OR",2,27,834,13165
0,"Like","*girisopam*","OR",2,27,834,13166
0,"Like","loprazol*","OR",2,27,834,13167
0,"Like","*loprazol*","OR",2,27,834,13168
0,"Like","*lorazepam*","OR",2,27,834,13169
0,"Like","*lorazepam*","OR",2,27,834,13170
0,"Like","*GABA*","OR",2,36,834,13171
0,"Like","*girisopam*","OR",2,36,834,13172
0,"Like","*loprazol*","OR",2,36,834,13173
0,"Like","*lorazepam*","OR",2,36,834,13174
0,"Like","*GABA*","OR",2,57,834,13175
0,"Like","*girisopam*","OR",2,57,834,13176
0,"Like","*loprazol*","OR",2,57,834,13177
0,"Like","*lorazepam*",,2,57,834,13178
0,"Like","lormetazepam*","OR",2,27,835,13179
0,"Like","*lormetazepam*","OR",2,27,835,13180
0,"Like","*magnesium*","OR",2,27,835,13181
0,"Like","magnesium*","OR",2,27,835,13182
0,"Like","medazepam*","OR",2,27,835,13183
0,"Like","*medazepam*","OR",2,27,835,13184
0,"Like","*midazol*","OR",2,27,835,13185
0,"Like","midazol*","OR",2,27,835,13186
0,"Like","*lormetazepam*","OR",2,36,835,13187
0,"Like","*magnesium*","OR",2,36,835,13188
0,"Like","*medazepam*","OR",2,36,835,13189
0,"Like","*midazol*","OR",2,36,835,13190
0,"Like","*lormetazepam*","OR",2,57,835,13191
0,"Like","*magnesium*","OR",2,57,835,13192
0,"Like","*medazepam*","OR",2,57,835,13193
0,"Like","*midazol*",,2,57,835,13194
0,"Like","nitrazepam*","OR",2,27,836,13195
0,"Like","*nitrazepam*","OR",2,27,836,13196
0,"Like","*oxazepam*","OR",2,27,836,13197
0,"Like","oxazepam*","OR",2,27,836,13198
0,"Like","reclazepam*","OR",2,27,836,13199
0,"Like","*reclazepam*","OR",2,27,836,13200
0,"Like","ricasetron*","OR",2,27,836,13201
0,"Like","*ricasetron*","OR",2,27,836,13202
0,"Like","*nitrazepam*","OR",2,36,836,13203
0,"Like","*oxazepam*","OR",2,36,836,13204
0,"Like","*reclazepam*","OR",2,36,836,13205
0,"Like","*ricasetron*","OR",2,36,836,13206
0,"Like","*nitrazepam*","OR",2,57,836,13207
0,"Like","*oxazepam*","OR",2,57,836,13208
0,"Like","*reclazepam*","OR",2,57,836,13209
0,"Like","*ricasetron*",,2,57,836,13210
0,"Like","Ro 5-4864*","OR",2,27,837,13211
0,"Like","*Ro 5-4864*","OR",2,27,837,13212
0,"Like","*SL 75102*","OR",2,27,837,13213
0,"Like","SL 75102*","OR",2,27,837,13214
0,"Like","*temazepam*","OR",2,27,837,13215
0,"Like","temazepam*","OR",2,27,837,13216
0,"Like","*tracazolate*","OR",2,27,837,13217
0,"Like","tracazolate*","OR",2,27,837,13218
0,"Like","*Ro 5-4864*","OR",2,36,837,13219
0,"Like","*SL 75102*","OR",2,36,837,13220
0,"Like","*temazepam*","OR",2,36,837,13221
0,"Like","*tracazolate*","OR",2,36,837,13222
0,"Like","*Ro 5-4864*","OR",2,57,837,13223
0,"Like","*SL 75102*","OR",2,57,837,13224
0,"Like","*temazepam*","OR",2,57,837,13225
0,"Like","*tracazolate*",,2,57,837,13226
0,"Like","*triazolam*","OR",2,27,838,13227
0,"Like","triazolam*","OR",2,27,838,13228
0,"Like","*zaleplon*","OR",2,27,838,13229
0,"Like","zaleplon*","OR",2,27,838,13230
0,"Like","*zolpidem*","OR",2,27,838,13231
0,"Like","zolpidem*","OR",2,27,838,13232
0,"Like","*triazolam*","OR",2,36,838,13233
0,"Like","*zaleplon*","OR",2,36,838,13234
0,"Like","*zolpidem*","OR",2,36,838,13235
0,"Like","*triazolam*","OR",2,57,838,13236
0,"Like","*zaleplon*","OR",2,57,838,13237
0,"Like","*zolpidem*","OR",2,57,838,13238
0,"Like","*sexual malfunct*","OR",2,27,839,13239
0,"Like","sexual malfunct*","OR",2,27,839,13240
0,"Like","*sexual disorder*","OR",2,27,839,13241
0,"Like","sexual disorder*","OR",2,27,839,13242
0,"Like","*sexual side effect*","OR",2,27,839,13243
0,"Like","sexual side effect*","OR",2,27,839,13244
0,"Like","*sexual side-effect*","OR",2,27,839,13245
0,"Like","sexual side-effect*","OR",2,27,839,13246
0,"Like","*sexual malfunct*","OR",2,36,839,13247
0,"Like","*sexual disorder*","OR",2,36,839,13248
0,"Like","*sexual side effect*","OR",2,36,839,13249
0,"Like","*sexual side-effect*","OR",2,36,839,13250
0,"Like","*sexual malfunct*","OR",2,57,839,13251
0,"Like","*sexual disorder*","OR",2,57,839,13252
0,"Like","*sexual side effect*","OR",2,57,839,13253
0,"Like","*sexual side-effect*",,2,57,839,13254
0,"Like","cognitive rehab*","OR",1,14,840,13255
0,"Like","cognitive train*","OR",1,14,840,13256
0,"Like","cognitive remediat*",,1,14,840,13257
0,"Like","benzoperidol*","OR",2,27,841,13258
0,"Like","*benzoperidol*","OR",2,27,841,13259
0,"Like","*anquil*","OR",2,27,841,13260
0,"Like","anquil*","OR",2,27,841,13261
0,"Like","*McN-JR-4584*","OR",2,27,841,13262
0,"Like","McN-JR-4584*","OR",2,27,841,13263
0,"Like","*benzoperidol*","OR",2,36,841,13264
0,"Like","*anquil*","OR",2,36,841,13265
0,"Like","*McN-JR-4584*","OR",2,36,841,13266
0,"Like","*benzoperidol*","OR",2,57,841,13267
0,"Like","*anquil*","OR",2,57,841,13268
0,"Like","*McN-JR-4584*",,2,57,841,13269
0,"Like","Benperidol*","OR",1,14,842,13270
0,"Like","benzperidol*","OR",1,14,842,13271
0,"Like","benzoperidol*","OR",1,14,842,13272
0,"Like","frenactyl*","OR",1,14,842,13273
0,"Like","glianimon*","OR",1,14,842,13274
0,"Like","phenactil*","OR",1,14,842,13275
0,"Like","frenactil*","OR",1,14,842,13276
0,"Like","anquil*","OR",1,14,842,13277
0,"Like","psichoben*","OR",1,14,842,13278
0,"Like","CB-8089*","OR",1,14,842,13279
0,"Like","cb 8089*","OR",1,14,842,13280
0,"Like","8089 CB*","OR",1,14,842,13281
0,"Like","McN-JR-4584*","OR",1,14,842,13282
0,"Like","mcn jr 4584*","OR",1,14,842,13283
0,"Like","R-4584*","OR",1,14,842,13284
0,"Like","r 4584*",,1,14,842,13285
0,"Like","LAI *","OR",2,27,843,13286
0,"Like","* LAI *","OR",2,27,843,13287
0,"Like","*depot*","OR",2,27,843,13288
0,"Like","depot*","OR",2,27,843,13289
0,"Like","*long-act*","OR",2,27,843,13290
0,"Like","long-act*","OR",2,27,843,13291
0,"Like","*long act*","OR",2,27,843,13292
0,"Like","long act*","OR",2,27,843,13293
0,"Like","* LAI *","OR",2,36,843,13294
0,"Like","*depot*","OR",2,36,843,13295
0,"Like","*long-act*","OR",2,36,843,13296
0,"Like","*long act*","OR",2,36,843,13297
0,"Like","* LAI *","OR",2,57,843,13298
0,"Like","*depot*","OR",2,57,843,13299
0,"Like","*long-act*","OR",2,57,843,13300
0,"Like","*long act*",,2,57,843,13301
0,"Like","*Olanzapine*","OR",2,27,844,13302
0,"Like","Olanzapine*","OR",2,27,844,13303
0,"Like","*Olanzapine*","OR",2,36,844,13304
0,"Like","*Olanzapine*","OR",2,57,844,13305
0,"Like","*zyprex*","OR",2,27,844,13306
0,"Like","zyprex*","OR",2,27,844,13307
0,"Like","*zyprex*","OR",2,36,844,13308
0,"Like","*zyprex*","OR",2,57,844,13309
0,"Like","*CX 516*","OR",2,27,844,13310
0,"Like","CX 516*","OR",2,27,844,13311
0,"Like","*CX 516*","OR",2,36,844,13312
0,"Like","*CX 516*","OR",2,57,844,13313
0,"Like","*lurasidone*","OR",2,27,844,13314
0,"Like","lurasidone*","OR",2,27,844,13315
0,"Like","*lurasidone*","OR",2,36,844,13316
0,"Like","*lurasidone*","OR",2,57,844,13317
0,"Like","*zypadhera*","OR",2,27,845,13318
0,"Like","zypadhera*","OR",2,27,845,13319
0,"Like","*zypadhera*","OR",2,36,845,13320
0,"Like","*zypadhera*",,2,57,845,13321
0,"Like","text*","OR",2,27,846,13322
0,"Like","*text*","OR",2,27,846,13323
0,"Like","email*","OR",2,27,846,13324
0,"Like","*email*","OR",2,27,846,13325
0,"Like","e-mail*","OR",2,27,846,13326
0,"Like","*e-mail*","OR",2,27,846,13327
0,"Like","sms*","OR",2,27,846,13328
0,"Like","*sms*","OR",2,27,846,13329
0,"Like","* text*","OR",2,36,846,13330
0,"Like","*email*","OR",2,36,846,13331
0,"Like","*e-mail*","OR",2,36,846,13332
0,"Like","*sms*","OR",2,36,846,13333
0,"Like","* text*","OR",2,57,846,13334
0,"Like","*email*","OR",2,57,846,13335
0,"Like","*e-mail*","OR",2,57,846,13336
0,"Like","*sms*",,2,57,846,13337
0,"Like","early*","OR",1,14,847,13338
0,"Like","early*","OR",1,15,847,13339
0,"Like","prodromal*",,1,15,847,13340
0,"Like","anaten*","OR",2,27,848,13341
0,"Like","*anaten*","OR",2,27,848,13342
0,"Like","cardilac*","OR",2,27,848,13343
0,"Like","*cardilac*","OR",2,27,848,13344
0,"Like","cenilene*","OR",2,27,848,13345
0,"Like","*cenilene*","OR",2,27,848,13346
0,"Like","dapotum*","OR",2,27,848,13347
0,"Like","*dapotum*","OR",2,27,848,13348
0,"Like","decafen*","OR",2,27,848,13349
0,"Like","*decafen*","OR",2,27,848,13350
0,"Like","*anaten*","OR",2,36,848,13351
0,"Like","*cardilac*","OR",2,36,848,13352
0,"Like","*cenilene*","OR",2,36,848,13353
0,"Like","*dapotum*","OR",2,36,848,13354
0,"Like","*decafen*","OR",2,36,848,13355
0,"Like","*anaten*","OR",2,57,848,13356
0,"Like","*cardilac*","OR",2,57,848,13357
0,"Like","*cenilene*","OR",2,57,848,13358
0,"Like","*dapotum*","OR",2,57,848,13359
0,"Like","*decafen*",,2,57,848,13360
0,"Like","decazate*","OR",2,27,849,13361
0,"Like","*decazate*","OR",2,27,849,13362
0,"Like","decentan*","OR",2,27,849,13363
0,"Like","*decentan*","OR",2,27,849,13364
0,"Like","enanthate*","OR",2,27,849,13365
0,"Like","*enanthate*","OR",2,27,849,13366
0,"Like","eutimox*","OR",2,27,849,13367
0,"Like","*eutimox*","OR",2,27,849,13368
0,"Like","fludeca*","OR",2,27,849,13369
0,"Like","*fludeca*","OR",2,27,849,13370
0,"Like","*decazate*","OR",2,36,849,13371
0,"Like","*decentan*","OR",2,36,849,13372
0,"Like","*enanthate*","OR",2,36,849,13373
0,"Like","*eutimox*","OR",2,36,849,13374
0,"Like","*fludeca*","OR",2,36,849,13375
0,"Like","*decazate*","OR",2,57,849,13376
0,"Like","*decentan*","OR",2,57,849,13377
0,"Like","*enanthate*","OR",2,57,849,13378
0,"Like","*eutimox*","OR",2,57,849,13379
0,"Like","*fludeca*",,2,57,849,13380
0,"Like","flufen*","OR",2,27,850,13381
0,"Like","*flufen*","OR",2,27,850,13382
0,"Like","flunanthate*","OR",2,27,850,13383
0,"Like","*flunanthate*","OR",2,27,850,13384
0,"Like","fluphen*","OR",2,27,850,13385
0,"Like","*fluphen*","OR",2,27,850,13386
0,"Like","idazoxan*","OR",2,27,850,13387
0,"Like","*idazoxan*","OR",2,27,850,13388
0,"Like","lyogen*","OR",2,27,850,13389
0,"Like","*lyogen*","OR",2,27,850,13390
0,"Like","*flufen*","OR",2,36,850,13391
0,"Like","*flunanthate*","OR",2,36,850,13392
0,"Like","*fluphen*","OR",2,36,850,13393
0,"Like","*idazoxan*","OR",2,36,850,13394
0,"Like","*lyogen*","OR",2,36,850,13395
0,"Like","*flufen*","OR",2,57,850,13396
0,"Like","*flunanthate*","OR",2,57,850,13397
0,"Like","*fluphen*","OR",2,57,850,13398
0,"Like","*idazoxan*","OR",2,57,850,13399
0,"Like","*lyogen*",,2,57,850,13400
0,"Like","lyoridin*","OR",2,27,851,13401
0,"Like","*lyoridin*","OR",2,27,851,13402
0,"Like","mirenil*","OR",2,27,851,13403
0,"Like","*mirenil*","OR",2,27,851,13404
0,"Like","modec*","OR",2,27,851,13405
0,"Like","*modec*","OR",2,27,851,13406
0,"Like","moditen*","OR",2,27,851,13407
0,"Like","*moditen*","OR",2,27,851,13408
0,"Like","omca*","OR",2,27,851,13409
0,"Like","*omca*","OR",2,27,851,13410
0,"Like","*lyoridin*","OR",2,36,851,13411
0,"Like","*mirenil*","OR",2,36,851,13412
0,"Like","*modec*","OR",2,36,851,13413
0,"Like","*moditen*","OR",2,36,851,13414
0,"Like","*omca*","OR",2,36,851,13415
0,"Like","*lyoridin*","OR",2,57,851,13416
0,"Like","*mirenil*","OR",2,57,851,13417
0,"Like","*modec*","OR",2,57,851,13418
0,"Like","*moditen*","OR",2,57,851,13419
0,"Like","*omca*",,2,57,851,13420
0,"Like","oxyprothepin*","OR",2,27,852,13421
0,"Like","*oxyprothepin*","OR",2,27,852,13422
0,"Like","pacinol*","OR",2,27,852,13423
0,"Like","*pacinol*","OR",2,27,852,13424
0,"Like","permitil*","OR",2,27,852,13425
0,"Like","*permitil*","OR",2,27,852,13426
0,"Like","phenathiazine*","OR",2,27,852,13427
0,"Like","*phenathiazine*","OR",2,27,852,13428
0,"Like","piperazine*","OR",2,27,852,13429
0,"Like","*piperazine*","OR",2,27,852,13430
0,"Like","*oxyprothepin*","OR",2,36,852,13431
0,"Like","*pacinol*","OR",2,36,852,13432
0,"Like","*permitil*","OR",2,36,852,13433
0,"Like","*phenathiazine*","OR",2,36,852,13434
0,"Like","*piperazine*","OR",2,36,852,13435
0,"Like","*oxyprothepin*","OR",2,57,852,13436
0,"Like","*pacinol*","OR",2,57,852,13437
0,"Like","*permitil*","OR",2,57,852,13438
0,"Like","*phenathiazine*","OR",2,57,852,13439
0,"Like","*piperazine*",,2,57,852,13440
0,"Like","prolixin*","OR",2,27,853,13441
0,"Like","*prolixin*","OR",2,27,853,13442
0,"Like","prolongatum*","OR",2,27,853,13443
0,"Like","*prolongatum*","OR",2,27,853,13444
0,"Like","Rx 781094*","OR",2,27,853,13445
0,"Like","*Rx 781094*","OR",2,27,853,13446
0,"Like","sediten*","OR",2,27,853,13447
0,"Like","*sediten*","OR",2,27,853,13448
0,"Like","selecten*","OR",2,27,853,13449
0,"Like","*selecten*","OR",2,27,853,13450
0,"Like","*prolixin*","OR",2,36,853,13451
0,"Like","*prolongatum*","OR",2,36,853,13452
0,"Like","*Rx 781094*","OR",2,36,853,13453
0,"Like","*sediten*","OR",2,36,853,13454
0,"Like","*selecten*","OR",2,36,853,13455
0,"Like","*prolixin*","OR",2,57,853,13456
0,"Like","*prolongatum*","OR",2,57,853,13457
0,"Like","*Rx 781094*","OR",2,57,853,13458
0,"Like","*sediten*","OR",2,57,853,13459
0,"Like","*selecten*",,2,57,853,13460
0,"Like","sevinol*","OR",2,27,854,13461
0,"Like","*sevinol*","OR",2,27,854,13462
0,"Like","sinqualone*","OR",2,27,854,13463
0,"Like","*sinqualone*","OR",2,27,854,13464
0,"Like","siqualone*","OR",2,27,854,13465
0,"Like","*siqualone*","OR",2,27,854,13466
0,"Like","trancin*","OR",2,27,854,13467
0,"Like","*trancin*","OR",2,27,854,13468
0,"Like","*sevinol*","OR",2,36,854,13469
0,"Like","*sinqualone*","OR",2,36,854,13470
0,"Like","*siqualone*","OR",2,36,854,13471
0,"Like","*trancin*","OR",2,36,854,13472
0,"Like","*sevinol*","OR",2,57,854,13473
0,"Like","*sinqualone*","OR",2,57,854,13474
0,"Like","*siqualone*","OR",2,57,854,13475
0,"Like","*trancin*","OR",2,57,854,13476
0,"Like","*decanoat*","AND",2,27,855,13477
0,"Like","decanoat*","AND",2,27,855,13478
0,"Like","*depot*","AND",2,27,855,13479
0,"Like","depot*","AND",2,27,855,13480
0,"Like","*long?act*","AND",2,27,855,13481
0,"Like","long?act*","AND",2,27,855,13482
0,"Like","delayed?act*","AND",2,27,855,13483
0,"Like","*delayed?act*","AND",2,27,855,13484
0,"Like","*decanoat*","AND",2,36,855,13485
0,"Like","*depot*","AND",2,36,855,13486
0,"Like","*long?act*","AND",2,36,855,13487
0,"Like","*delayed?act*","AND",2,36,855,13488
0,"Like","*decanoat*","AND",2,57,855,13489
0,"Like","*depot*","AND",2,57,855,13490
0,"Like","*long?act*","AND",2,57,855,13491
0,"Like","*delayed?act*",,2,57,855,13492
0,"Like","*decanoat*","OR",2,27,856,13493
0,"Like","decanoat*","OR",2,27,856,13494
0,"Like","*depot*","OR",2,27,856,13495
0,"Like","depot*","OR",2,27,856,13496
0,"Like","*long?act*","OR",2,27,856,13497
0,"Like","long?act*","OR",2,27,856,13498
0,"Like","delayed?act*","OR",2,27,856,13499
0,"Like","*delayed?act*","OR",2,27,856,13500
0,"Like","*decanoat*","OR",2,36,856,13501
0,"Like","*depot*","OR",2,36,856,13502
0,"Like","*long?act*","OR",2,36,856,13503
0,"Like","*delayed?act*","OR",2,36,856,13504
0,"Like","*decanoat*","OR",2,57,856,13505
0,"Like","*depot*","OR",2,57,856,13506
0,"Like","*long?act*","OR",2,57,856,13507
0,"Like","*delayed?act*","OR",2,57,856,13508
0,"Like","*transitional*","OR",2,27,859,13515
0,"Like","*posthospital*","OR",2,27,859,13516
0,"Like","*partial hospitali?ation*","OR",2,27,859,13517
0,"Like","*daily living programme*","OR",2,27,859,13518
0,"Like","*ambulatory treatment*","OR",2,27,859,13519
0,"Like","*patient care team*","OR",2,27,859,13520
0,"Like","*transitional*","OR",2,36,859,13521
0,"Like","*posthospital*","OR",2,36,859,13522
0,"Like","*partial hospitali?ation*","OR",2,36,859,13523
0,"Like","*daily living programme*","OR",2,36,859,13524
0,"Like","*ambulatory treatment*","OR",2,36,859,13525
0,"Like","*patient care team*","OR",2,36,859,13526
0,"Like","*transitional*","OR",2,57,859,13527
0,"Like","*posthospital*","OR",2,57,859,13528
0,"Like","*partial hospitali?ation*","OR",2,57,859,13529
0,"Like","*daily living programme*","OR",2,57,859,13530
0,"Like","*ambulatory treatment*","OR",2,57,859,13531
0,"Like","*patient care team*",,2,57,859,13532
0,"Like","*community mental health*","OR",2,27,860,13533
0,"Like","*patient participation*","OR",2,27,860,13534
0,"Like","*drop-in hospital*","OR",2,27,860,13535
0,"Like","*drop-in care*","OR",2,27,860,13536
0,"Like","*drop-in treatment*","OR",2,27,860,13537
0,"Like","*drop-in cent*","OR",2,27,860,13538
0,"Like","*community mental health*","OR",2,36,860,13539
0,"Like","*patient participation*","OR",2,36,860,13540
0,"Like","*drop-in hospital*","OR",2,36,860,13541
0,"Like","*drop-in care*","OR",2,36,860,13542
0,"Like","*drop-in treatment*","OR",2,36,860,13543
0,"Like","*drop-in cent*","OR",2,36,860,13544
0,"Like","*community mental health*","OR",2,57,860,13545
0,"Like","*patient participation*","OR",2,57,860,13546
0,"Like","*drop-in hospital*","OR",2,57,860,13547
0,"Like","*drop-in care*","OR",2,57,860,13548
0,"Like","*drop-in treatment*","OR",2,57,860,13549
0,"Like","*drop-in cent*",,2,57,860,13550
0,"Like","*drop-in unit*","OR",2,27,861,13551
0,"Like","*drop-in unit*","OR",2,36,861,13552
0,"Like","*drop-in unit*","OR",2,57,861,13553
0,"Like","*drop in hospital*","OR",2,27,861,13554
0,"Like","*drop in hospital*","OR",2,36,861,13555
0,"Like","*drop in hospital*","OR",2,57,861,13556
0,"Like","*drop in care*","OR",2,27,861,13557
0,"Like","*drop in care*","OR",2,36,861,13558
0,"Like","*drop in care*","OR",2,57,861,13559
0,"Like","*drop in treatment*","OR",2,27,861,13560
0,"Like","*drop in treatment*","OR",2,36,861,13561
0,"Like","*drop in treatment*","OR",2,57,861,13562
0,"Like","*drop in cent*","OR",2,27,861,13563
0,"Like","*drop in cent*","OR",2,36,861,13564
0,"Like","*drop in cent*","OR",2,57,861,13565
0,"Like","*drop in unit*","OR",2,27,861,13566
0,"Like","*drop in unit*","OR",2,36,861,13567
0,"Like","*drop in unit*",,2,57,861,13568
0,"Like","*day hospital*","OR",2,27,862,13569
0,"Like","*day care*","OR",2,27,862,13570
0,"Like","*drop treatment*","OR",2,27,862,13571
0,"Like","*drop cent*","OR",2,27,862,13572
0,"Like","*drop unit*","OR",2,27,862,13573
0,"Like","*care programme approach*","OR",2,27,862,13574
0,"Like","*care programme*","OR",2,27,862,13575
0,"Like","*day hospital*","OR",2,36,862,13576
0,"Like","*day care*","OR",2,36,862,13577
0,"Like","*drop treatment*","OR",2,36,862,13578
0,"Like","*drop cent*","OR",2,36,862,13579
0,"Like","*drop unit*","OR",2,36,862,13580
0,"Like","*care programme approach*","OR",2,36,862,13581
0,"Like","*care programme*","OR",2,36,862,13582
0,"Like","*day hospital*","OR",2,57,862,13583
0,"Like","*day care*","OR",2,57,862,13584
0,"Like","*drop treatment*","OR",2,57,862,13585
0,"Like","*drop cent*","OR",2,57,862,13586
0,"Like","*drop unit*","OR",2,57,862,13587
0,"Like","*care programme approach*","OR",2,57,862,13588
0,"Like","*care programme*",,2,57,862,13589
0,"Like","*pact*","OR",2,27,863,13590
0,"Like","*tcl*","OR",2,27,863,13591
0,"Like","pact*","OR",2,36,863,13592
0,"Like","tcl*","OR",2,36,863,13593
0,"Like","pact*","OR",2,57,863,13594
0,"Like","tcl*",,2,57,863,13595
0,"Like","*transitional*","OR",1,14,864,13596
0,"Like","*posthospital*","OR",1,14,864,13597
0,"Like","*partial hospitali?ation*","OR",1,14,864,13598
0,"Like","*daily living programme","OR",1,14,864,13599
0,"Like","*ambulatory treatment*","OR",1,14,864,13600
0,"Like","*patient care team*","OR",1,14,864,13601
0,"Like","*community mental health*","OR",1,14,864,13602
0,"Like","*patient participation*","OR",1,14,864,13603
0,"Like","*drop-in hospital*","OR",1,14,864,13604
0,"Like","*drop-in care*","OR",1,14,864,13605
0,"Like","*drop-in treatment*","OR",1,14,864,13606
0,"Like","*drop-in cent*","OR",1,14,864,13607
0,"Like","*drop-in unit*","OR",1,14,864,13608
0,"Like","*drop in hospital*","OR",1,14,864,13609
0,"Like","*drop in care*","OR",1,14,864,13610
0,"Like","*drop in treatment*","OR",1,14,864,13611
0,"Like","*drop in cent*","OR",1,14,864,13612
0,"Like","*drop in unit*",,1,14,864,13613
0,"Like","*day hospital*","OR",1,14,865,13614
0,"Like","*day care*","OR",1,14,865,13615
0,"Like","*day treatment*","OR",1,14,865,13616
0,"Like","*day Cent*","OR",1,14,865,13617
0,"Like","*day unit*","OR",1,14,865,13618
0,"Like","*care programme approach*","OR",1,14,865,13619
0,"Like","*care programme*","OR",1,14,865,13620
0,"Like","pact*","OR",1,14,865,13621
0,"Like","tcl*","OR",1,14,865,13622
0,"Like","*email*","OR",2,27,866,13623
0,"Like","*e-mail*","OR",2,27,866,13624
0,"Like","*sms*","OR",2,27,866,13625
0,"Like","*e-learning*","OR",2,27,866,13626
0,"Like","*virtual*","OR",2,27,866,13627
0,"Like","*email*","OR",2,36,866,13628
0,"Like","*e-mail*","OR",2,36,866,13629
0,"Like","*sms*","OR",2,36,866,13630
0,"Like","*e-learning*","OR",2,36,866,13631
0,"Like","*virtual*","OR",2,36,866,13632
0,"Like","*email*","OR",2,57,866,13633
0,"Like","*e-mail*","OR",2,57,866,13634
0,"Like","*sms*","OR",2,57,866,13635
0,"Like","*e-learning*","OR",2,57,866,13636
0,"Like","*virtual*",,2,57,866,13637
0,"Like","*de-escalation*","OR",2,27,867,13638
0,"Like","*deescalation*","OR",2,27,867,13639
0,"Like","*one-to-one*","OR",2,27,867,13640
0,"Like","*one to one*","OR",2,27,867,13641
0,"Like","*de-escalation*","OR",2,36,867,13642
0,"Like","*deescalation*","OR",2,36,867,13643
0,"Like","*one-to-one*","OR",2,36,867,13644
0,"Like","*one to one*","OR",2,36,867,13645
0,"Like","*de-escalation*","OR",2,57,867,13646
0,"Like","*deescalation*","OR",2,57,867,13647
0,"Like","*one-to-one*","OR",2,57,867,13648
0,"Like","*one to one*",,2,57,867,13649
0,"Like","*de-escalation*","OR",2,27,868,13650
0,"Like","*deescalation*","OR",2,27,868,13651
0,"Like","*one-to-one*","OR",2,27,868,13652
0,"Like","*one to one*","OR",2,27,868,13653
0,"Like","*talking down*","OR",2,27,868,13654
0,"Like","*aggress*","OR",2,27,868,13655
0,"Like","*agitation*","OR",2,27,868,13656
0,"Like","*violen*","OR",2,27,868,13657
0,"Like","*diffus*","OR",2,27,868,13658
0,"Like","*de-escalation*","OR",2,36,868,13659
0,"Like","*deescalation*","OR",2,36,868,13660
0,"Like","*one-to-one*","OR",2,36,868,13661
0,"Like","*one to one*","OR",2,36,868,13662
0,"Like","*talking down*","OR",2,36,868,13663
0,"Like","*aggress*","OR",2,36,868,13664
0,"Like","*agitation*","OR",2,36,868,13665
0,"Like","*violen*","OR",2,36,868,13666
0,"Like","*diffus*","OR",2,36,868,13667
0,"Like","*de-escalation*","OR",2,57,868,13668
0,"Like","*deescalation*","OR",2,57,868,13669
0,"Like","*one-to-one*","OR",2,57,868,13670
0,"Like","*one to one*","OR",2,57,868,13671
0,"Like","*talking down*","OR",2,57,868,13672
0,"Like","*aggress*","OR",2,57,868,13673
0,"Like","*agitation*","OR",2,57,868,13674
0,"Like","*violen*","OR",2,57,868,13675
0,"Like","*diffus*",,2,57,868,13676
0,"Like","*aggress*","OR",2,27,869,13677
0,"Like","*agitation*","OR",2,27,869,13678
0,"Like","*violen*","OR",2,27,869,13679
0,"Like","*aggress*","OR",2,36,869,13680
0,"Like","*agitation*","OR",2,36,869,13681
0,"Like","*violen*","OR",2,36,869,13682
0,"Like","*aggress*","OR",2,57,869,13683
0,"Like","*agitation*","OR",2,57,869,13684
0,"Like","*violen*",,2,57,869,13685
0,"Like","*de-escalat*","OR",2,27,870,13686
0,"Like","*deescalat*","OR",2,27,870,13687
0,"Like","*de-stimulat*","OR",2,27,870,13688
0,"Like","*destimulat*","OR",2,27,870,13689
0,"Like","*de-fus*","OR",2,27,870,13690
0,"Like","*defus*","OR",2,27,870,13691
0,"Like","*one-to-one*","OR",2,27,870,13692
0,"Like","*one to one*","OR",2,27,870,13693
0,"Like","*de-escalat*","OR",2,36,870,13694
0,"Like","*deescalat*","OR",2,36,870,13695
0,"Like","*de-stimulat*","OR",2,36,870,13696
0,"Like","*destimulat*","OR",2,36,870,13697
0,"Like","*de-fus*","OR",2,36,870,13698
0,"Like","*defus*","OR",2,36,870,13699
0,"Like","*one-to-one*","OR",2,36,870,13700
0,"Like","*one to one*","OR",2,36,870,13701
0,"Like","*de-escalat*","OR",2,57,870,13702
0,"Like","*deescalat*","OR",2,57,870,13703
0,"Like","*de-stimulat*","OR",2,57,870,13704
0,"Like","*destimulat*","OR",2,57,870,13705
0,"Like","*de-fus*","OR",2,57,870,13706
0,"Like","*defus*","OR",2,57,870,13707
0,"Like","*one-to-one*","OR",2,57,870,13708
0,"Like","*one to one*",,2,57,870,13709
0,"Like","*diffuse*","OR",2,27,871,13710
0,"Like","*calming*","OR",2,27,871,13711
0,"Like","*non aversive*","OR",2,27,871,13712
0,"Like","*non-aversive*","OR",2,27,871,13713
0,"Like","*non confrontat*","OR",2,27,871,13714
0,"Like","*non-confrontat*","OR",2,27,871,13715
0,"Like","*psycho social*","OR",2,27,871,13716
0,"Like","*psycho-social*","OR",2,27,871,13717
0,"Like","*diffuse*","OR",2,36,871,13718
0,"Like","*calming*","OR",2,36,871,13719
0,"Like","*non aversive*","OR",2,36,871,13720
0,"Like","*non-aversive*","OR",2,36,871,13721
0,"Like","*non confrontat*","OR",2,36,871,13722
0,"Like","*non-confrontat*","OR",2,36,871,13723
0,"Like","*psycho social*","OR",2,36,871,13724
0,"Like","*psycho-social*","OR",2,36,871,13725
0,"Like","*diffuse*","OR",2,57,871,13726
0,"Like","*calming*","OR",2,57,871,13727
0,"Like","*non aversive*","OR",2,57,871,13728
0,"Like","*non-aversive*","OR",2,57,871,13729
0,"Like","*non confrontat*","OR",2,57,871,13730
0,"Like","*non-confrontat*","OR",2,57,871,13731
0,"Like","*psycho social*","OR",2,57,871,13732
0,"Like","*psycho-social*",,2,57,871,13733
0,"Like","*talk*","OR",2,27,872,13734
0,"Like","*verbal*","OR",2,27,872,13735
0,"Like","*non verbal*","OR",2,27,872,13736
0,"Like","*non-verbal*","OR",2,27,872,13737
0,"Like","*talk*","OR",2,36,872,13738
0,"Like","*verbal*","OR",2,36,872,13739
0,"Like","*non verbal*","OR",2,36,872,13740
0,"Like","*non-verbal*","OR",2,36,872,13741
0,"Like","*talk*",,2,57,872,13742
0,"Like","*verbal*","OR",2,57,872,13743
0,"Like","*non verbal*","OR",2,57,872,13744
0,"Like","*non-verbal*","OR",2,57,872,13745
0,"Like","*oxyprothepin*","OR",2,27,873,13746
0,"Like","*idazoxan*","OR",2,27,873,13747
0,"Like","*oxyprothepin*","OR",2,36,873,13748
0,"Like","*idazoxan*","OR",2,36,873,13749
0,"Like","*oxyprothepin*","OR",2,57,873,13750
0,"Like","*idazoxan*",,2,57,873,13751
0,"Like","*dietary*","OR",2,27,874,13752
0,"Like","*nutrition*","OR",2,27,874,13753
0,"Like","*food*","OR",2,27,874,13754
0,"Like","*eat*","OR",2,27,874,13755
0,"Like","*supplement*","OR",2,27,874,13756
0,"Like","*healthy*","OR",2,27,874,13757
0,"Like","*dietary*","OR",2,36,874,13758
0,"Like","*nutrition*","OR",2,36,874,13759
0,"Like","*food*","OR",2,36,874,13760
0,"Like","*eat*","OR",2,36,874,13761
0,"Like","*supplement*","OR",2,36,874,13762
0,"Like","*healthy*","OR",2,36,874,13763
0,"Like","*dietary*","OR",2,57,874,13764
0,"Like","*nutrition*","OR",2,57,874,13765
0,"Like","*food*","OR",2,57,874,13766
0,"Like","*eat*","OR",2,57,874,13767
0,"Like","*supplement*","OR",2,57,874,13768
0,"Like","*healthy*","OR",2,57,874,13769
0,"Like","*therapy*","OR",2,27,875,13770
0,"Like","*fruit*","OR",2,27,875,13771
0,"Like","*vegetables*","OR",2,27,875,13772
0,"Like","*fat*","OR",2,27,875,13773
0,"Like","*therapy*","OR",2,36,875,13774
0,"Like","*fruit*","OR",2,36,875,13775
0,"Like","*vegetables*","OR",2,36,875,13776
0,"Like","*fat*","OR",2,36,875,13777
0,"Like","*therapy*","OR",2,57,875,13778
0,"Like","*fruit*","OR",2,57,875,13779
0,"Like","*vegetables*","OR",2,57,875,13780
0,"Like","*fat*",,2,57,875,13781
0,"Like","*fruit*","OR",2,27,876,13782
0,"Like","*vegetables*","OR",2,27,876,13783
0,"Like","*fat*","OR",2,27,876,13784
0,"Like","*fruit*","OR",2,36,876,13785
0,"Like","*vegetables*","OR",2,36,876,13786
0,"Like","*fat*","OR",2,36,876,13787
0,"Like","*fruit*","OR",2,57,876,13788
0,"Like","*vegetables*","OR",2,57,876,13789
0,"Like","*fat*",,2,57,876,13790
0,"Like","*body-oriented*","OR",2,27,877,13791
0,"Like","*body oriented*","OR",2,27,877,13792
0,"Like","*body-oriented*","OR",2,36,877,13793
0,"Like","*body oriented*","OR",2,36,877,13794
0,"Like","*body-oriented*","OR",2,57,877,13795
0,"Like","*body oriented*","OR",2,57,877,13796
0,"Like","*botulin*","OR",2,27,878,13797
0,"Like","*endorphin*","OR",2,27,878,13798
0,"Like","*estrogen*","OR",2,27,878,13799
0,"Like","*fatty acid*","OR",2,27,878,13800
0,"Like","*EX?11?582A*","OR",2,27,878,13801
0,"Like","*botulin*","OR",2,36,878,13802
0,"Like","*endorphin*","OR",2,36,878,13803
0,"Like","*estrogen*","OR",2,36,878,13804
0,"Like","*fatty acid*","OR",2,36,878,13805
0,"Like","*EX?11?582A*","OR",2,36,878,13806
0,"Like","*botulin*","OR",2,57,878,13807
0,"Like","*endorphin*","OR",2,57,878,13808
0,"Like","*estrogen*","OR",2,57,878,13809
0,"Like","*fatty acid*","OR",2,57,878,13810
0,"Like","*EX?11?582A*","OR",2,57,878,13811
0,"Like","*ganglioside*","OR",2,27,879,13812
0,"Like","*insulin*","OR",2,27,879,13813
0,"Like","*lithium*","OR",2,27,879,13814
0,"Like","*naloxone*","OR",2,27,879,13815
0,"Like","*periactin*","OR",2,27,879,13816
0,"Like","*ganglioside*","OR",2,36,879,13817
0,"Like","*insulin*","OR",2,36,879,13818
0,"Like","*lithium*","OR",2,36,879,13819
0,"Like","*naloxone*","OR",2,36,879,13820
0,"Like","*periactin*","OR",2,36,879,13821
0,"Like","*ganglioside*","OR",2,57,879,13822
0,"Like","*insulin*","OR",2,57,879,13823
0,"Like","*lithium*","OR",2,57,879,13824
0,"Like","*naloxone*","OR",2,57,879,13825
0,"Like","*periactin*","OR",2,57,879,13826
0,"Like","*phenylalanine*","OR",2,27,880,13827
0,"Like","*piracetam*","OR",2,27,880,13828
0,"Like","*stepholidine*","OR",2,27,880,13829
0,"Like","*tryptophan*","OR",2,27,880,13830
0,"Like","*neurosurg*","OR",2,27,880,13831
0,"Like","* ect*","OR",2,27,880,13832
0,"Like","*phenylalanine*","OR",2,36,880,13833
0,"Like","*piracetam*","OR",2,36,880,13834
0,"Like","*stepholidine*","OR",2,36,880,13835
0,"Like","*tryptophan*","OR",2,36,880,13836
0,"Like","*neurosurg*","OR",2,36,880,13837
0,"Like","* ect*","OR",2,36,880,13838
0,"Like","*phenylalanine*","OR",2,57,880,13839
0,"Like","*piracetam*","OR",2,57,880,13840
0,"Like","*stepholidine*","OR",2,57,880,13841
0,"Like","*tryptophan*","OR",2,57,880,13842
0,"Like","*neurosurg*","OR",2,57,880,13843
0,"Like","* ect*",,2,57,880,13844
0,"Like","* herb*","OR",2,27,881,13845
0,"Like","*chinese*","OR",2,27,881,13846
0,"Like","* plant*","OR",2,27,881,13847
0,"Like","* complementary*","OR",2,27,881,13848
0,"Like","* herb*","OR",2,28,881,13849
0,"Like","*chinese*","OR",2,28,881,13850
0,"Like","* plant*","OR",2,28,881,13851
0,"Like","* complementary*","OR",2,28,881,13852
0,"Like","* herb*","OR",2,36,881,13853
0,"Like","*chinese*","OR",2,36,881,13854
0,"Like","* plant*","OR",2,36,881,13855
0,"Like","* complementary*","OR",2,36,881,13856
0,"Like","* herb*","OR",2,57,881,13857
0,"Like","*chinese*","OR",2,57,881,13858
0,"Like","* plant*","OR",2,57,881,13859
0,"Like","* complementary*",,2,57,881,13860
0,"Like","*alternative*","OR",2,27,884,13960
0,"Like","*yang*","OR",2,27,884,13961
0,"Like","* yin*","OR",2,27,884,13962
0,"Like","*alternative*","OR",2,28,884,13963
0,"Like","*yang*","OR",2,28,884,13964
0,"Like","* yin*","OR",2,28,884,13965
0,"Like","*alternative*","OR",2,36,884,13966
0,"Like","*yang*","OR",2,36,884,13967
0,"Like","* yin*","OR",2,36,884,13968
0,"Like","*alternative*","OR",2,57,884,13969
0,"Like","*yang*","OR",2,57,884,13970
0,"Like","* yin*",,2,57,884,13971
0,"Like","*traditional*","OR",2,27,885,13972
0,"Like","*oriental*","OR",2,27,885,13973
0,"Like","* TCM*","OR",2,27,885,13974
0,"Like","*TCD*","OR",2,27,885,13975
0,"Like","*traditional*","OR",2,28,885,13976
0,"Like","*oriental*","OR",2,28,885,13977
0,"Like","* TCM*","OR",2,28,885,13978
0,"Like","*TCD*","OR",2,28,885,13979
0,"Like","*traditional*","OR",2,36,885,13980
0,"Like","*oriental*","OR",2,36,885,13981
0,"Like","* TCM*","OR",2,36,885,13982
0,"Like","*TCD*","OR",2,36,885,13983
0,"Like","*traditional*","OR",2,57,885,13984
0,"Like","*oriental*","OR",2,57,885,13985
0,"Like","* TCM*","OR",2,57,885,13986
0,"Like","*TCD*",,2,57,885,13987
0,"Like","* herb*","OR",1,14,886,13988
0,"Like","*Chinese*","OR",1,14,886,13989
0,"Like","* plant*","OR",1,14,886,13990
0,"Like","*complementary*","OR",1,14,886,13991
0,"Like","*alternative*","OR",1,14,886,13992
0,"Like","*yang*","OR",1,14,886,13993
0,"Like","* yin*","OR",1,14,886,13994
0,"Like","*traditional*","OR",1,14,886,13995
0,"Like","*oriental*",,1,14,886,13996
0,"Like","*Acebutolol*","OR",2,27,887,13997
0,"Like","*Acebutolol*","OR",2,36,887,13998
0,"Like","*Acebutolol*","OR",2,57,887,13999
0,"Like","*Alprenolol*","OR",2,27,887,14000
0,"Like","*Alprenolol*","OR",2,36,887,14001
0,"Like","*Alprenolol*","OR",2,57,887,14002
0,"Like","*amosulalol*","OR",2,27,887,14003
0,"Like","*amosulalol*","OR",2,36,887,14004
0,"Like","*amosulalol*","OR",2,57,887,14005
0,"Like","*arotinolol*","OR",2,27,887,14006
0,"Like","*arotinolol*","OR",2,36,887,14007
0,"Like","*arotinolol*","OR",2,57,887,14008
0,"Like","*Atenolol*","OR",2,27,887,14009
0,"Like","*Atenolol*","OR",2,36,887,14010
0,"Like","*Atenolol*","OR",2,57,887,14011
0,"Like","*befunolol*","OR",2,27,887,14012
0,"Like","*befunolol*","OR",2,36,887,14013
0,"Like","*befunolol*",,2,57,887,14014
0,"Like","*Betaxolol*","OR",2,27,888,14015
0,"Like","*Betaxolol*","OR",2,36,888,14016
0,"Like","*Betaxolol*","OR",2,57,888,14017
0,"Like","*Beta blocker*","OR",2,27,888,14018
0,"Like","*Beta blocker*","OR",2,36,888,14019
0,"Like","*Beta blocker*","OR",2,57,888,14020
0,"Like","*Beta-blocker*","OR",2,27,888,14021
0,"Like","*Beta-blocker*","OR",2,36,888,14022
0,"Like","*Beta-blocker*","OR",2,57,888,14023
0,"Like","*bevantolol*","OR",2,27,888,14024
0,"Like","*bevantolol*","OR",2,36,888,14025
0,"Like","*bevantolol*","OR",2,57,888,14026
0,"Like","*Bisoprolol*","OR",2,27,888,14027
0,"Like","*Bisoprolol*","OR",2,36,888,14028
0,"Like","*Bisoprolol*","OR",2,57,888,14029
0,"Like","*bopindolol*","OR",2,27,888,14030
0,"Like","*bopindolol*","OR",2,36,888,14031
0,"Like","*bopindolol*",,2,57,888,14032
0,"Like","*bromoacetylalprenololmenthane*","OR",2,27,889,14033
0,"Like","*bromoacetylalprenololmenthane*","OR",2,36,889,14034
0,"Like","*bromoacetylalprenololmenthane*","OR",2,57,889,14035
0,"Like","*bucindolol*","OR",2,27,889,14036
0,"Like","*bucindolol*","OR",2,36,889,14037
0,"Like","*bucindolol*","OR",2,57,889,14038
0,"Like","*bufuralol*","OR",2,27,889,14039
0,"Like","*bufuralol*","OR",2,36,889,14040
0,"Like","*bufuralol*","OR",2,57,889,14041
0,"Like","*Bupranolol*","OR",2,27,889,14042
0,"Like","*Bupranolol*","OR",2,36,889,14043
0,"Like","*Bupranolol*","OR",2,57,889,14044
0,"Like","*Butoxamine*","OR",2,27,889,14045
0,"Like","*Butoxamine*","OR",2,36,889,14046
0,"Like","*Butoxamine*","OR",2,57,889,14047
0,"Like","*carazolol*","OR",2,27,889,14048
0,"Like","*carazolol*","OR",2,36,889,14049
0,"Like","*carazolol*",,2,57,889,14050
0,"Like","*Carteolol*","OR",2,27,890,14051
0,"Like","*Carteolol*","OR",2,36,890,14052
0,"Like","*Carteolol*","OR",2,57,890,14053
0,"Like","*carvedilol*","OR",2,27,890,14054
0,"Like","*carvedilol*","OR",2,36,890,14055
0,"Like","*carvedilol*","OR",2,57,890,14056
0,"Like","*Celiprolol*","OR",2,27,890,14057
0,"Like","*Celiprolol*","OR",2,36,890,14058
0,"Like","*Celiprolol*","OR",2,57,890,14059
0,"Like","*CGP 12177*","OR",2,27,890,14060
0,"Like","*CGP 12177*","OR",2,36,890,14061
0,"Like","*CGP 12177*","OR",2,57,890,14062
0,"Like","*CGP 20712A*","OR",2,27,890,14063
0,"Like","*CGP 20712A*","OR",2,36,890,14064
0,"Like","*CGP 20712A*","OR",2,57,890,14065
0,"Like","*cyanopindolol*","OR",2,27,890,14066
0,"Like","*cyanopindolol*","OR",2,36,890,14067
0,"Like","*cyanopindolol*",,2,57,890,14068
0,"Like","*Dihydroalprenolol*","OR",2,27,891,14069
0,"Like","*Dihydroalprenolol*","OR",2,36,891,14070
0,"Like","*Dihydroalprenolol*","OR",2,57,891,14071
0,"Like","*epanolol*","OR",2,27,891,14072
0,"Like","*epanolol*","OR",2,36,891,14073
0,"Like","*epanolol*","OR",2,57,891,14074
0,"Like","*esmolol*","OR",2,27,891,14075
0,"Like","*esmolol*","OR",2,36,891,14076
0,"Like","*esmolol*","OR",2,57,891,14077
0,"Like","*exaprolol*","OR",2,27,891,14078
0,"Like","*exaprolol*","OR",2,36,891,14079
0,"Like","*exaprolol*","OR",2,57,891,14080
0,"Like","*flestolol*","OR",2,27,891,14081
0,"Like","*flestolol*","OR",2,36,891,14082
0,"Like","*flestolol*","OR",2,57,891,14083
0,"Like","*hexadecyl*","OR",2,27,891,14084
0,"Like","*hexadecyl*","OR",2,36,891,14085
0,"Like","*hexadecyl*",,2,57,891,14086
0,"Like","*hydroxypropafenone*","OR",2,27,892,14087
0,"Like","*hydroxypropafenone*","OR",2,36,892,14088
0,"Like","*hydroxypropafenone*","OR",2,57,892,14089
0,"Like","*icatibant*","OR",2,27,892,14090
0,"Like","*icatibant*","OR",2,36,892,14091
0,"Like","*icatibant*","OR",2,57,892,14092
0,"Like","*ICI 118551*","OR",2,27,892,14093
0,"Like","*ICI 118551*","OR",2,36,892,14094
0,"Like","*ICI 118551*","OR",2,57,892,14095
0,"Like","*ICI 89406*","OR",2,27,892,14096
0,"Like","*ICI 89406*","OR",2,36,892,14097
0,"Like","*ICI 89406*","OR",2,57,892,14098
0,"Like","*indenolol*","OR",2,27,892,14099
0,"Like","*indenolol*","OR",2,36,892,14100
0,"Like","*indenolol*","OR",2,57,892,14101
0,"Like","*Iodocyanopindolol*","OR",2,27,892,14102
0,"Like","*Iodocyanopindolol*","OR",2,36,892,14103
0,"Like","*Iodocyanopindolol*",,2,57,892,14104
0,"Like","*iodopindolol*","OR",2,27,893,14105
0,"Like","*iodopindolol*","OR",2,36,893,14106
0,"Like","*iodopindolol*","OR",2,57,893,14107
0,"Like","*IPS 339*","OR",2,27,893,14108
0,"Like","*IPS 339*","OR",2,36,893,14109
0,"Like","*IPS 339*","OR",2,57,893,14110
0,"Like","*K 351*","OR",2,27,893,14111
0,"Like","*K 351*","OR",2,36,893,14112
0,"Like","*K 351*","OR",2,57,893,14113
0,"Like","*Labetalol*","OR",2,27,893,14114
0,"Like","*Labetalol*","OR",2,36,893,14115
0,"Like","*Labetalol*","OR",2,57,893,14116
0,"Like","*landiolol*","OR",2,27,893,14117
0,"Like","*landiolol*","OR",2,36,893,14118
0,"Like","*landiolol*","OR",2,57,893,14119
0,"Like","*Levobunolol*","OR",2,27,893,14120
0,"Like","*Levobunolol*",,2,36,893,14121
0,"Like","*medroxalol*","OR",2,27,894,14122
0,"Like","*mepindolol*","OR",2,27,894,14123
0,"Like","*Metipranolol*","OR",2,27,894,14124
0,"Like","*Metoprolol*","OR",2,27,894,14125
0,"Like","*Nadolol*","OR",2,27,894,14126
0,"Like","*nebivolol*","OR",2,27,894,14127
0,"Like","*medroxalol*","OR",2,36,894,14128
0,"Like","*mepindolol*","OR",2,36,894,14129
0,"Like","*Metipranolol*","OR",2,36,894,14130
0,"Like","*Metoprolol*","OR",2,36,894,14131
0,"Like","*Nadolol*","OR",2,36,894,14132
0,"Like","*nebivolol*","OR",2,36,894,14133
0,"Like","*medroxalol*","OR",2,57,894,14134
0,"Like","*mepindolol*","OR",2,57,894,14135
0,"Like","*Metipranolol*","OR",2,57,894,14136
0,"Like","*Metoprolol*","OR",2,57,894,14137
0,"Like","*Nadolol*","OR",2,57,894,14138
0,"Like","*nebivolol*",,2,57,894,14139
0,"Like","*Oxprenolol*","OR",2,27,895,14140
0,"Like","*Penbutolol*","OR",2,27,895,14141
0,"Like","*Pindolol*","OR",2,27,895,14142
0,"Like","*Practolol*","OR",2,27,895,14143
0,"Like","*prizidilol*","OR",2,27,895,14144
0,"Like","*Propranolol*","OR",2,27,895,14145
0,"Like","*Oxprenolol*","OR",2,36,895,14146
0,"Like","*Penbutolol*","OR",2,36,895,14147
0,"Like","*Pindolol*","OR",2,36,895,14148
0,"Like","*Practolol*","OR",2,36,895,14149
0,"Like","*prizidilol*","OR",2,36,895,14150
0,"Like","*Propranolol*","OR",2,36,895,14151
0,"Like","*Oxprenolol*","OR",2,57,895,14152
0,"Like","*Penbutolol*","OR",2,57,895,14153
0,"Like","*Pindolol*","OR",2,57,895,14154
0,"Like","*Practolol*","OR",2,57,895,14155
0,"Like","*prizidilol*","OR",2,57,895,14156
0,"Like","*Propranolol*",,2,57,895,14157
0,"Like","*Sotalol*","OR",2,27,896,14158
0,"Like","*SR 59230A*","OR",2,27,896,14159
0,"Like","*talinolol*","OR",2,27,896,14160
0,"Like","*tertatolol*","OR",2,27,896,14161
0,"Like","*tilisolol*","OR",2,27,896,14162
0,"Like","*Timolol*","OR",2,27,896,14163
0,"Like","*tobanum*","OR",2,27,896,14164
0,"Like","*Sotalol*","OR",2,36,896,14165
0,"Like","*SR 59230A*","OR",2,36,896,14166
0,"Like","*talinolol*","OR",2,36,896,14167
0,"Like","*tertatolol*","OR",2,36,896,14168
0,"Like","*tilisolol*","OR",2,36,896,14169
0,"Like","*Timolol*","OR",2,36,896,14170
0,"Like","*tobanum*","OR",2,36,896,14171
0,"Like","*Sotalol*","OR",2,57,896,14172
0,"Like","*SR 59230A*","OR",2,57,896,14173
0,"Like","*talinolol*","OR",2,57,896,14174
0,"Like","*tertatolol*","OR",2,57,896,14175
0,"Like","*tilisolol*","OR",2,57,896,14176
0,"Like","*Timolol*","OR",2,57,896,14177
0,"Like","*tobanum*",,2,57,896,14178
0,"Like","*Acebutolol*","OR",1,14,897,14179
0,"Like","*Alprenolol*","OR",1,14,897,14180
0,"Like","*amosulalol*","OR",1,14,897,14181
0,"Like","*arotinolol*","OR",1,14,897,14182
0,"Like","*Atenolol*","OR",1,14,897,14183
0,"Like","*befunolol*","OR",1,14,897,14184
0,"Like","*Betaxolol*","OR",1,14,897,14185
0,"Like","*Beta blocker*","OR",1,14,897,14186
0,"Like","*Beta-blocker*","OR",1,14,897,14187
0,"Like","*bevantolol*","OR",1,14,897,14188
0,"Like","*Bisoprolol*","OR",1,14,897,14189
0,"Like","*bopindolol*","OR",1,14,897,14190
0,"Like","*bromoacetylalprenololmenthane*","OR",1,14,897,14191
0,"Like","*bucindolol*","OR",1,14,897,14192
0,"Like","*bufuralol*","OR",1,14,897,14193
0,"Like","*Bupranolol*","OR",1,14,897,14194
0,"Like","*Butoxamine*",,1,14,897,14195
0,"Like","*carazolol*","OR",1,14,898,14196
0,"Like","*Carteolol*","OR",1,14,898,14197
0,"Like","*carvedilol*","OR",1,14,898,14198
0,"Like","*Celiprolol*","OR",1,14,898,14199
0,"Like","*CGP 12177*","OR",1,14,898,14200
0,"Like","*CGP 20712A*","OR",1,14,898,14201
0,"Like","*cyanopindolol*","OR",1,14,898,14202
0,"Like","*Dihydroalprenolol*","OR",1,14,898,14203
0,"Like","*epanolol*","OR",1,14,898,14204
0,"Like","*esmolol*","OR",1,14,898,14205
0,"Like","*exaprolol*","OR",1,14,898,14206
0,"Like","*flestolol*","OR",1,14,898,14207
0,"Like","*hexadecyl*","OR",1,14,898,14208
0,"Like","*hydroxypropafenone*","OR",1,14,898,14209
0,"Like","*icatibant*","OR",1,14,898,14210
0,"Like","*ICI 118551*",,1,14,898,14211
0,"Like","*ICI 89406*","OR",1,14,899,14212
0,"Like","*indenolol*","OR",1,14,899,14213
0,"Like","*Iodocyanopindolol*","OR",1,14,899,14214
0,"Like","*iodopindolol*","OR",1,14,899,14215
0,"Like","*IPS 339*","OR",1,14,899,14216
0,"Like","*K 351*","OR",1,14,899,14217
0,"Like","*Labetalol*","OR",1,14,899,14218
0,"Like","*landiolol*","OR",1,14,899,14219
0,"Like","*Levobunolol*","OR",1,14,899,14220
0,"Like","*medroxalol*","OR",1,14,899,14221
0,"Like","*mepindolol*","OR",1,14,899,14222
0,"Like","*Metipranolol*","OR",1,14,899,14223
0,"Like","*Metoprolol*","OR",1,14,899,14224
0,"Like","*Nadolol*","OR",1,14,899,14225
0,"Like","*nebivolol*","OR",1,14,899,14226
0,"Like","*Oxprenolol*",,1,14,899,14227
0,"Like","*Penbutolol*","OR",1,14,900,14228
0,"Like","*Pindolol*","OR",1,14,900,14229
0,"Like","*Practolol*","OR",1,14,900,14230
0,"Like","*prizidilol*","OR",1,14,900,14231
0,"Like","*Propranolol*","OR",1,14,900,14232
0,"Like","*Sotalol*","OR",1,14,900,14233
0,"Like","*SR 59230A*","OR",1,14,900,14234
0,"Like","*talinolol*","OR",1,14,900,14235
0,"Like","*tertatolol*","OR",1,14,900,14236
0,"Like","*tilisolol*","OR",1,14,900,14237
0,"Like","*Timolol*","OR",1,14,900,14238
0,"Like","*tobanum*","OR",1,14,900,14239
0,"Like","*education*","OR",1,14,901,14240
0,"Like","*health promot*","OR",1,14,901,14241
0,"Like","*preventi*","OR",1,14,901,14242
0,"Like","*motivati*",,1,14,901,14243
0,"Like","*physical*","OR",2,27,902,14244
0,"Like","*cardio*","OR",2,27,902,14245
0,"Like","*metabolic*","OR",2,27,902,14246
0,"Like","*weight*","OR",2,27,902,14247
0,"Like","*HIV*","OR",2,27,902,14248
0,"Like","*AIDS*","OR",2,27,902,14249
0,"Like","*Tobacc*","OR",2,27,902,14250
0,"Like","*Smok*","OR",2,27,902,14251
0,"Like","*sex*","OR",2,27,902,14252
0,"Like","*medical*","OR",2,27,902,14253
0,"Like","*dental*","OR",2,27,902,14254
0,"Like","*alcohol*","OR",2,27,902,14255
0,"Like","*oral*","OR",2,27,902,14256
0,"Like","*vision*","OR",2,27,902,14257
0,"Like","*sight*","OR",2,27,902,14258
0,"Like","*hearing*","OR",2,27,902,14259
0,"Like","*nutrition*",,2,27,902,14260
0,"Like","*zotepine*","OR",2,27,903,14261
0,"Like","*zotepine*","OR",2,36,903,14262
0,"Like","*zotepine*","OR",2,57,903,14263
0,"Like","*Lodopin*","OR",2,27,903,14264
0,"Like","*Lodopin*","OR",2,36,903,14265
0,"Like","*Lodopin*","OR",2,57,903,14266
0,"Like","*nipolept*","OR",2,27,903,14267
0,"Like","*nipolept*","OR",2,36,903,14268
0,"Like","*nipolept*","OR",2,57,903,14269
0,"Like","*zopite*","OR",2,27,903,14270
0,"Like","*zopite*","OR",2,36,903,14271
0,"Like","*zopite*","OR",2,57,903,14272
0,"Like","*setous*","OR",2,27,903,14273
0,"Like","*setous*","OR",2,36,903,14274
0,"Like","*setous*","OR",2,57,903,14275
0,"Like","*majorpin*","OR",2,36,903,14276
0,"Like","*majorpin*","OR",2,27,903,14277
0,"Like","*majorpin*",,2,57,903,14278
0,"Like","*Sustenna*","OR",2,27,904,14279
0,"Like","*paliperidone palmitate*","OR",2,27,904,14280
0,"Like","*Sustenna*","OR",2,36,904,14281
0,"Like","*paliperidone palmitate*","OR",2,36,904,14282
0,"Like","*Sustenna*",,2,57,904,14283
0,"Like","*paliperidone palmitate*","OR",2,57,904,14284
0,"Like","*paliperidone palmitate*","AND",1,14,905,14285
0,"Like","*Sustenna*",,1,14,905,14286
0,"Like","*elderly*","OR",2,27,906,14287
0,"Like","*paraphrenia*","OR",2,27,906,14288
0,"Like","*late onset*","OR",2,27,906,14289
0,"Like","*elderly*","OR",2,36,906,14290
0,"Like","*paraphrenia*","OR",2,36,906,14291
0,"Like","*late onset*","OR",2,36,906,14292
0,"Like","*elderly*","OR",2,57,906,14293
0,"Like","*paraphrenia*","OR",2,57,906,14294
0,"Like","*late onset*",,2,57,906,14295
0,"Like","*puerperal*","OR",2,27,907,14296
0,"Like","*pregna*","OR",2,27,907,14297
0,"Like","*postpartum*
baby-blues*","OR",2,27,907,14298
0,"Like","*post?partum*","OR",2,27,907,14299
0,"Like","*baby?blue*","OR",2,27,907,14300
0,"Like","*puerperal*","OR",2,36,907,14301
0,"Like","*pregna*","OR",2,36,907,14302
0,"Like","*post?partum*","OR",2,36,907,14303
0,"Like","*puerperal*","OR",2,36,907,14304
0,"Like","*pregna*","OR",2,36,907,14305
0,"Like","*postpartum*","OR",2,36,907,14306
0,"Like","*baby?blue*","OR",2,36,907,14307
0,"Like","*puerperal*","OR",2,57,907,14308
0,"Like","*post?partum*","OR",2,57,907,14309
0,"Like","*postpartum*","OR",2,57,907,14310
0,"Like","*pregna*","OR",2,57,907,14311
0,"Like","*baby?blue*",,2,57,907,14312
0,"Like","*vocat*","OR",1,14,908,14313
0,"Like","*work*","OR",1,14,908,14314
0,"Like","*employ*","OR",1,14,908,14315
0,"Like","*job*","OR",1,14,908,14316
0,"Like","*occupat*","OR",1,14,908,14317
0,"Like","* placem*","OR",1,14,908,14318
0,"Like","*rehab*",,1,14,908,14319
0,"Like","Asenapine*","OR",1,14,909,14320
0,"Like","iloperidone*","OR",1,14,909,14321
0,"Like","Paliperidone*","OR",1,14,909,14322
0,"Like","zotepine*","OR",1,14,909,14323
0,"Like","ziprasidone*","OR",1,14,909,14324
0,"Like","risperidone*","OR",1,14,909,14325
0,"Like","quetiapine*","OR",1,14,909,14326
0,"Like","olanzapine*","OR",1,14,909,14327
0,"Like","clozapine*","OR",1,14,909,14328
0,"Like","aripiprazole*","OR",1,14,909,14329
0,"Like","Amisulpride*",,1,14,909,14330
0,"Like","Methotrimeprazine*","OR",1,14,910,14331
0,"Like","Levomep*","OR",1,14,910,14332
0,"Like","Levopromazine*","OR",1,14,910,14333
0,"Like","Tiserc*","OR",1,14,910,14334
0,"Like","Tizertsin*",,1,14,910,14335
0,"Like","*postpartum*","OR",2,27,911,14336
0,"Like","*pregnancy*","OR",2,27,911,14337
0,"Like","*postpartum*","OR",2,36,911,14338
0,"Like","*postpartum*","OR",2,57,911,14339
0,"Like","*pregnancy*",,2,57,911,14340
0,"Like","*postnatal*","OR",2,27,912,14341
0,"Like","*post?natal*","OR",2,27,912,14342
0,"Like","*postpartum*","OR",2,27,912,14343
0,"Like","*post?partum*","OR",2,27,912,14344
0,"Like","*birth*","OR",2,27,912,14345
0,"Like","*pregnan*","OR",2,27,912,14346
0,"Like","*postnatal*","OR",2,36,912,14347
0,"Like","*post?natal*","OR",2,36,912,14348
0,"Like","*postpartum*","OR",2,36,912,14349
0,"Like","*post?partum*","OR",2,36,912,14350
0,"Like","*birth*","OR",2,36,912,14351
0,"Like","*pregnan*","OR",2,36,912,14352
0,"Like","*postnatal*","OR",2,57,912,14353
0,"Like","*post?natal*","OR",2,57,912,14354
0,"Like","*postpartum*","OR",2,57,912,14355
0,"Like","*post?partum*","OR",2,57,912,14356
0,"Like","*birth*","OR",2,57,912,14357
0,"Like","*pregnan*",,2,57,912,14358
0,"Like","*cessation*","OR",2,27,913,14359
0,"Like","*withdr?w*","OR",2,27,913,14360
0,"Like","*discontinu*","OR",2,27,913,14361
0,"Like","*halt*","OR",2,27,913,14362
0,"Like","*stop*","OR",2,27,913,14363
0,"Like","*cessation*","OR",2,36,913,14364
0,"Like","*withdr?w*","OR",2,36,913,14365
0,"Like","*discontinu*","OR",2,36,913,14366
0,"Like","*halt*","OR",2,36,913,14367
0,"Like","*stop*","OR",2,36,913,14368
0,"Like","*cessation*","OR",2,57,913,14369
0,"Like","*withdr?w*","OR",2,57,913,14370
0,"Like","*discontinu*","OR",2,57,913,14371
0,"Like","*halt*","OR",2,57,913,14372
0,"Like","*stop*","OR",2,57,913,14373
0,"Like","*postnatal*","OR",1,15,914,14374
0,"Like","*post?natal*","OR",1,15,914,14375
0,"Like","*postpartum","OR",1,15,914,14376
0,"Like","*post?partum","OR",1,15,914,14377
0,"Like","*pregnan*","OR",1,15,914,14378
0,"Like","*birth*",,1,15,914,14379
0,"Like","*adheren*","OR",2,27,915,14380
0,"Like","*algorithm*","OR",2,27,915,14381
0,"Like","*care plan*","OR",2,27,915,14382
0,"Like","*care manage*","OR",2,27,915,14383
0,"Like","*case manage*","OR",2,27,915,14384
0,"Like","*adheren*","OR",2,36,915,14385
0,"Like","*algorithm*","OR",2,36,915,14386
0,"Like","*care plan*","OR",2,36,915,14387
0,"Like","*care manage*","OR",2,36,915,14388
0,"Like","*case manage*","OR",2,36,915,14389
0,"Like","*adheren*","OR",2,57,915,14390
0,"Like","*algorithm*","OR",2,57,915,14391
0,"Like","*care plan*","OR",2,57,915,14392
0,"Like","*care manage*","OR",2,57,915,14393
0,"Like","*case manage*",,2,57,915,14394
0,"Like","*collaborat*","OR",2,27,916,14395
0,"Like","*communication*","OR",2,27,916,14396
0,"Like","*complex intervention*","OR",2,27,916,14397
0,"Like","*consult*","OR",2,27,916,14398
0,"Like","*continuity*","OR",2,27,916,14399
0,"Like","*collaborat*","OR",2,36,916,14400
0,"Like","*communication*","OR",2,36,916,14401
0,"Like","*complex intervention*","OR",2,36,916,14402
0,"Like","*consult*","OR",2,36,916,14403
0,"Like","*continuity*","OR",2,36,916,14404
0,"Like","*collaborat*","OR",2,57,916,14405
0,"Like","*communication*","OR",2,57,916,14406
0,"Like","*complex intervention*","OR",2,57,916,14407
0,"Like","*consult*","OR",2,57,916,14408
0,"Like","*continuity*",,2,57,916,14409
0,"Like","*cooperative behav*","OR",2,27,917,14410
0,"Like","*coordination care *","OR",2,27,917,14411
0,"Like","*co-ordination care *","OR",2,27,917,14412
0,"Like","*delivery of health care*","OR",2,27,917,14413
0,"Like","*disease manage*","OR",2,27,917,14414
0,"Like","*cooperative behav*","OR",2,36,917,14415
0,"Like","*coordination care *","OR",2,36,917,14416
0,"Like","*co-ordination care *","OR",2,36,917,14417
0,"Like","*delivery of health care*","OR",2,36,917,14418
0,"Like","*disease manage*","OR",2,36,917,14419
0,"Like","*cooperative behav*","OR",2,57,917,14420
0,"Like","*coordination care *","OR",2,57,917,14421
0,"Like","*co-ordination care *","OR",2,57,917,14422
0,"Like","*delivery of health care*","OR",2,57,917,14423
0,"Like","*disease manage*",,2,57,917,14424
0,"Like","*early intervention*","OR",2,27,918,14425
0,"Like","*education *","OR",2,27,918,14426
0,"Like","*enhanced care*","OR",2,27,918,14427
0,"Like","*evidence?based*","OR",2,27,918,14428
0,"Like","*feedback*","OR",2,27,918,14429
0,"Like","*early intervention*","OR",2,36,918,14430
0,"Like","*education *","OR",2,36,918,14431
0,"Like","*enhanced care*","OR",2,36,918,14432
0,"Like","*evidence?based*","OR",2,36,918,14433
0,"Like","*feedback*","OR",2,36,918,14434
0,"Like","*early intervention*","OR",2,57,918,14435
0,"Like","*education *","OR",2,57,918,14436
0,"Like","*enhanced care*","OR",2,57,918,14437
0,"Like","*evidence?based*","OR",2,57,918,14438
0,"Like","*feedback*",,2,57,918,14439
0,"Like","*guideline*","OR",2,27,919,14440
0,"Like","*integrated?care*","OR",2,27,919,14441
0,"Like","*integration care*","OR",2,27,919,14442
0,"Like","*joint?working*","OR",2,27,919,14443
0,"Like","*medication adherence *","OR",2,27,919,14444
0,"Like","*guideline*","OR",2,36,919,14445
0,"Like","*integrated?care*","OR",2,36,919,14446
0,"Like","*integration care*","OR",2,36,919,14447
0,"Like","*joint?working*","OR",2,36,919,14448
0,"Like","*medication adherence *","OR",2,36,919,14449
0,"Like","*guideline*","OR",2,57,919,14450
0,"Like","*integrated?care*","OR",2,57,919,14451
0,"Like","*integration care*","OR",2,57,919,14452
0,"Like","*joint?working*","OR",2,57,919,14453
0,"Like","*medication adherence *",,2,57,919,14454
0,"Like","*medication compliance *","OR",2,27,920,14455
0,"Like","*medication management*","OR",2,27,920,14456
0,"Like","*medication nonadherence*","OR",2,27,920,14457
0,"Like","*medication non-adherence*","OR",2,27,920,14458
0,"Like","*medication noncompliance*","OR",2,27,920,14459
0,"Like","*medication compliance *","OR",2,36,920,14460
0,"Like","*medication management*","OR",2,36,920,14461
0,"Like","*medication nonadherence*","OR",2,36,920,14462
0,"Like","*medication non-adherence*","OR",2,36,920,14463
0,"Like","*medication noncompliance*","OR",2,36,920,14464
0,"Like","*medication compliance *","OR",2,57,920,14465
0,"Like","*medication management*","OR",2,57,920,14466
0,"Like","*medication nonadherence*","OR",2,57,920,14467
0,"Like","*medication non-adherence*","OR",2,57,920,14468
0,"Like","*medication noncompliance*",,2,57,920,14469
0,"Like","*medication non-compliance*","OR",2,27,921,14470
0,"Like","*multicomponent*","OR",2,27,921,14471
0,"Like","*patient compliance*","OR",2,27,921,14472
0,"Like","*patient education*","OR",2,27,921,14473
0,"Like","*patient monitoring*","OR",2,27,921,14474
0,"Like","*medication non-compliance*","OR",2,36,921,14475
0,"Like","*multicomponent*","OR",2,36,921,14476
0,"Like","*patient compliance*","OR",2,36,921,14477
0,"Like","*patient education*","OR",2,36,921,14478
0,"Like","*patient monitoring*","OR",2,36,921,14479
0,"Like","*medication non-compliance*","OR",2,57,921,14480
0,"Like","*multicomponent*","OR",2,57,921,14481
0,"Like","*patient compliance*","OR",2,57,921,14482
0,"Like","*patient education*","OR",2,57,921,14483
0,"Like","*patient monitoring*",,2,57,921,14484
0,"Like","*patient satisfaction*","OR",2,27,922,14485
0,"Like","*pharmaci*","OR",2,27,922,14486
0,"Like","*pharmacy*","OR",2,27,922,14487
0,"Like","*protocol*","OR",2,27,922,14488
0,"Like","*psychoeducation*","OR",2,27,922,14489
0,"Like","*patient satisfaction*","OR",2,36,922,14490
0,"Like","*pharmaci*","OR",2,36,922,14491
0,"Like","*pharmacy*","OR",2,36,922,14492
0,"Like","*protocol*","OR",2,36,922,14493
0,"Like","*psychoeducation*","OR",2,36,922,14494
0,"Like","*patient satisfaction*","OR",2,57,922,14495
0,"Like","*pharmaci*","OR",2,57,922,14496
0,"Like","*pharmacy*","OR",2,57,922,14497
0,"Like","*protocol*","OR",2,57,922,14498
0,"Like","*psychoeducation*",,2,57,922,14499
0,"Like","*psycho-educational *","OR",2,27,923,14500
0,"Like","*quality assurance*","OR",2,27,923,14501
0,"Like","*quality improvement*","OR",2,27,923,14502
0,"Like","* referral*","OR",2,27,923,14503
0,"Like","*reminder*","OR",2,27,923,14504
0,"Like","*psycho-educational *","OR",2,36,923,14505
0,"Like","*quality assurance*","OR",2,36,923,14506
0,"Like","*quality improvement*","OR",2,36,923,14507
0,"Like","* referral*","OR",2,36,923,14508
0,"Like","*reminder*","OR",2,36,923,14509
0,"Like","*psycho-educational *","OR",2,57,923,14510
0,"Like","*quality assurance*","OR",2,57,923,14511
0,"Like","*quality improvement*","OR",2,57,923,14512
0,"Like","* referral*","OR",2,57,923,14513
0,"Like","*reminder*",,2,57,923,14514
0,"Like","*self?care*","OR",2,27,924,14515
0,"Like","*self?management*","OR",2,27,924,14516
0,"Like","*shared?care*","OR",2,27,924,14517
0,"Like","*shared medical record*","OR",2,27,924,14518
0,"Like","*stepped?care*","OR",2,27,924,14519
0,"Like","*self?care*","OR",2,36,924,14520
0,"Like","*self?management*","OR",2,36,924,14521
0,"Like","*shared?care*","OR",2,36,924,14522
0,"Like","*shared medical record*","OR",2,36,924,14523
0,"Like","*stepped?care*","OR",2,36,924,14524
0,"Like","*self?care*","OR",2,57,924,14525
0,"Like","*self?management*","OR",2,57,924,14526
0,"Like","*shared?care*","OR",2,57,924,14527
0,"Like","*shared medical record*","OR",2,57,924,14528
0,"Like","*stepped?care*",,2,57,924,14529
0,"Like","*systematic care*","OR",2,27,925,14530
0,"Like","*total quality management*","OR",2,27,925,14531
0,"Like","*treatment adherence*","OR",2,27,925,14532
0,"Like","*treatment compliance *","OR",2,27,925,14533
0,"Like","*treatment management*","OR",2,27,925,14534
0,"Like","*systematic care*","OR",2,36,925,14535
0,"Like","*total quality management*","OR",2,36,925,14536
0,"Like","*treatment adherence*","OR",2,36,925,14537
0,"Like","*treatment compliance *","OR",2,36,925,14538
0,"Like","*treatment management*","OR",2,36,925,14539
0,"Like","*systematic care*","OR",2,57,925,14540
0,"Like","*total quality management*","OR",2,57,925,14541
0,"Like","*treatment adherence*","OR",2,57,925,14542
0,"Like","*treatment compliance *","OR",2,57,925,14543
0,"Like","*treatment management*",,2,57,925,14544
0,"Like","*treatment nonadherence *","OR",2,27,926,14545
0,"Like","*treatment non-adherence *","OR",2,27,926,14546
0,"Like","*treatment noncompliance*","OR",2,27,926,14547
0,"Like","*treatment non-compliance*","OR",2,27,926,14548
0,"Like","* cpa *","OR",2,27,926,14549
0,"Like","*treatment nonadherence *","OR",2,36,926,14550
0,"Like","*treatment non-adherence *","OR",2,36,926,14551
0,"Like","*treatment noncompliance*","OR",2,36,926,14552
0,"Like","*treatment non-compliance*","OR",2,36,926,14553
0,"Like","* cpa *","OR",2,36,926,14554
0,"Like","*treatment nonadherence *","OR",2,57,926,14555
0,"Like","*treatment non-adherence *","OR",2,57,926,14556
0,"Like","*treatment noncompliance*","OR",2,57,926,14557
0,"Like","*treatment non-compliance*","OR",2,57,926,14558
0,"Like","* cpa *",,2,57,926,14559
0,"Like","*care programme approach*","OR",2,27,927,14560
0,"Like","* WRAP *","OR",2,27,927,14561
0,"Like","*wellness recovery action plan*","OR",2,27,927,14562
0,"Like","*care programme approach*","OR",2,36,927,14563
0,"Like","* WRAP *","OR",2,36,927,14564
0,"Like","*wellness recovery action plan*","OR",2,36,927,14565
0,"Like","*care programme approach*","OR",2,57,927,14566
0,"Like","* WRAP *","OR",2,57,927,14567
0,"Like","*wellness recovery action plan*","OR",2,57,927,14568
0,"Like","*garden*","OR",2,27,928,14569
0,"Like","*horticult*","OR",2,27,928,14570
0,"Like","*topiary*","OR",2,27,928,14571
0,"Like","*floriculture*","OR",2,27,928,14572
0,"Like","* plant*","OR",2,27,928,14573
0,"Like","*cultivation*","OR",2,27,928,14574
0,"Like","*garden*","OR",2,36,928,14575
0,"Like","*horticult*","OR",2,36,928,14576
0,"Like","*topiary*","OR",2,36,928,14577
0,"Like","*floriculture*","OR",2,36,928,14578
0,"Like","* plant*","OR",2,36,928,14579
0,"Like","*cultivation*","OR",2,36,928,14580
0,"Like","*garden*","OR",2,57,928,14581
0,"Like","*horticult*","OR",2,57,928,14582
0,"Like","*topiary*","OR",2,57,928,14583
0,"Like","*floriculture*","OR",2,57,928,14584
0,"Like","* plant*","OR",2,57,928,14585
0,"Like","*cultivation*",,2,57,928,14586
0,"Like","*ciatyl*","OR",2,27,929,14587
0,"Like","*cisordinol*","OR",2,27,929,14588
0,"Like","*clopixol-acutard*","OR",2,27,929,14589
0,"Like","*Semi Prolongee*","OR",2,27,929,14590
0,"Like","*Acuphase*","OR",2,27,929,14591
0,"Like","*ciatyl*","OR",2,36,929,14592
0,"Like","*cisordinol*","OR",2,36,929,14593
0,"Like","*clopixol-acutard*","OR",2,36,929,14594
0,"Like","*Semi Prolongee*","OR",2,36,929,14595
0,"Like","*Acuphase*","OR",2,36,929,14596
0,"Like","*ciatyl*","OR",2,57,929,14597
0,"Like","*cisordinol*","OR",2,57,929,14598
0,"Like","*clopixol-acutard*","OR",2,57,929,14599
0,"Like","*Semi Prolongee*","OR",2,57,929,14600
0,"Like","*Acuphase*",,2,57,929,14601
0,"Like","*avant*","OR",2,27,930,14602
0,"Like","*avant*","OR",2,36,930,14603
0,"Like","*avant*","OR",2,57,930,14604
0,"Like","*decanoa*","OR",2,27,930,14605
0,"Like","*decanoa*","OR",2,36,930,14606
0,"Like","*decanoa*","OR",2,57,930,14607
0,"Like","*decaldo*","OR",2,27,930,14608
0,"Like","*decaldo*","OR",2,57,930,14609
0,"Like","*decaldo*","OR",2,36,930,14610
0,"Like","*norodol*","OR",2,27,930,14611
0,"Like","*norodol*","OR",2,36,930,14612
0,"Like","*norodol*","OR",2,57,930,14613
0,"Like","*novo?peridol*","OR",2,27,930,14614
0,"Like","*novo?peridol*","OR",2,36,930,14615
0,"Like","*novo?peridol*","OR",2,57,930,14616
0,"Like","*vesa*","OR",2,27,930,14617
0,"Like","*vesa*","OR",2,36,930,14618
0,"Like","*vesa*","OR",2,57,930,14619
0,"Like","*R-1625*","OR",2,27,930,14620
0,"Like","*R-1625*","OR",2,57,930,14621
0,"Like","*R-1625*","OR",2,36,930,14622
0,"Like","*alased*","OR",2,27,931,14623
0,"Like","*aloperidi*","OR",2,27,931,14624
0,"Like","*bioperido*","OR",2,27,931,14625
0,"Like","*buterid*","OR",2,27,931,14626
0,"Like","*ceree*","OR",2,27,931,14627
0,"Like","*dozic*","OR",2,27,931,14628
0,"Like","*duraperido*","OR",2,27,931,14629
0,"Like","*fortuna*","OR",2,27,931,14630
0,"Like","*seviu*","OR",2,27,931,14631
0,"Like","*sigaperid*","OR",2,27,931,14632
0,"Like","*sylad*","OR",2,27,931,14633
0,"Like","*zafri*","OR",2,27,931,14634
0,"Like","*alased*","OR",2,36,931,14635
0,"Like","*aloperidi*","OR",2,36,931,14636
0,"Like","*bioperido*","OR",2,36,931,14637
0,"Like","*buterid*","OR",2,36,931,14638
0,"Like","*ceree*","OR",2,36,931,14639
0,"Like","*dozic*","OR",2,36,931,14640
0,"Like","*duraperido*","OR",2,36,931,14641
0,"Like","*fortuna*","OR",2,36,931,14642
0,"Like","*seviu*","OR",2,36,931,14643
0,"Like","*sigaperid*","OR",2,36,931,14644
0,"Like","*sylad*","OR",2,36,931,14645
0,"Like","*zafri*","OR",2,36,931,14646
0,"Like","*alased*","OR",2,57,931,14647
0,"Like","*aloperidi*","OR",2,57,931,14648
0,"Like","*bioperido*","OR",2,57,931,14649
0,"Like","*buterid*","OR",2,57,931,14650
0,"Like","*ceree*","OR",2,57,931,14651
0,"Like","*dozic*","OR",2,57,931,14652
0,"Like","*duraperido*","OR",2,57,931,14653
0,"Like","*fortuna*","OR",2,57,931,14654
0,"Like","*seviu*","OR",2,57,931,14655
0,"Like","*sigaperid*","OR",2,57,931,14656
0,"Like","*sylad*","OR",2,57,931,14657
0,"Like","*zafri*",,2,57,931,14658
0,"Like","*prodrom*","OR",2,27,932,14659
0,"Like","*first?episo*","OR",2,27,932,14660
0,"Like","*second?episo*","OR",2,27,932,14661
0,"Like","*primary?episo?","OR",2,27,932,14662
0,"Like","*secondary?episo*","OR",2,27,932,14663
0,"Like","*first?admission*","OR",2,27,932,14664
0,"Like","*early?episo*","OR",2,27,932,14665
0,"Like","*early?symtom*","OR",2,27,932,14666
0,"Like","*early?interv*","OR",2,27,932,14667
0,"Like","*early?episo*","OR",2,36,932,14668
0,"Like","*prodrom*","OR",2,36,932,14669
0,"Like","*first?episo*","OR",2,36,932,14670
0,"Like","*second?episo*","OR",2,36,932,14671
0,"Like","*primary?episo*","OR",2,36,932,14672
0,"Like","*secondary?episo*","OR",2,36,932,14673
0,"Like","*early?symtom*","OR",2,36,932,14674
0,"Like","*early?interv*","OR",2,36,932,14675
0,"Like","*first?admission*","OR",2,36,932,14676
0,"Like","*prodrom*","OR",2,57,932,14677
0,"Like","*first?episo*","OR",2,57,932,14678
0,"Like","*second?episo*","OR",2,57,932,14679
0,"Like","*primary?episo*","OR",2,57,932,14680
0,"Like","*secondary?episo*","OR",2,57,932,14681
0,"Like","*first?admission*","OR",2,57,932,14682
0,"Like","*early?episo*","OR",2,57,932,14683
0,"Like","*early?symtom*","OR",2,57,932,14684
0,"Like","*early?interv*",,2,57,932,14685
0,"Like","*agitat*","OR",2,27,933,14686
0,"Like","*aggress*","OR",2,27,933,14687
0,"Like","*violen*","OR",2,27,933,14688
0,"Like","*disturb*","OR",2,27,933,14689
0,"Like","*acute*","OR",2,27,933,14690
0,"Like","*behave*","OR",2,27,933,14691
0,"Like","*tranquil*","OR",2,27,933,14692
0,"Like","*sedat*","OR",2,27,933,14693
0,"Like","*restrain*","OR",2,27,933,14694
0,"Like","*agitat*","OR",2,36,933,14695
0,"Like","*aggress*","OR",2,36,933,14696
0,"Like","*violen*","OR",2,36,933,14697
0,"Like","*disturb*","OR",2,36,933,14698
0,"Like","*acute*","OR",2,36,933,14699
0,"Like","*behave*","OR",2,36,933,14700
0,"Like","*tranquil*","OR",2,36,933,14701
0,"Like","*sedat*","OR",2,36,933,14702
0,"Like","*restrain*","OR",2,36,933,14703
0,"Like","*agitat*","OR",2,57,933,14704
0,"Like","*aggress*","OR",2,57,933,14705
0,"Like","*violen*","OR",2,57,933,14706
0,"Like","*disturb*","OR",2,57,933,14707
0,"Like","*acute*","OR",2,57,933,14708
0,"Like","*behave*","OR",2,57,933,14709
0,"Like","*tranquil*","OR",2,57,933,14710
0,"Like","*sedat*","OR",2,57,933,14711
0,"Like","*restrain*",,2,57,933,14712
0,"Like","*azepam*","OR",2,27,934,14713
0,"Like","*zolam*","OR",2,27,934,14714
0,"Like","*diazep*","OR",2,27,934,14715
0,"Like","*Anthramycin*","OR",2,27,934,14716
0,"Like","*clorazepat*","OR",2,27,934,14717
0,"Like","*Devazepid*","OR",2,27,934,14718
0,"Like","*Flumazenil*","OR",2,27,934,14719
0,"Like","*Pirenzepine*","OR",2,27,934,14720
0,"Like","*clobazam*","OR",2,27,934,14721
0,"Like","*flutazoram*","OR",2,27,934,14722
0,"Like","*girisopam*","OR",2,27,934,14723
0,"Like","*nerisopam*","OR",2,27,934,14724
0,"Like","*pinasepam*","OR",2,27,934,14725
0,"Like","*tofisopam*","OR",2,27,934,14726
0,"Like","*triflubazam*","OR",2,27,934,14727
0,"Like","*azepam*","OR",2,36,934,14728
0,"Like","*zolam*","OR",2,36,934,14729
0,"Like","*diazep*","OR",2,36,934,14730
0,"Like","*Anthramycin*","OR",2,36,934,14731
0,"Like","*clorazepat*","OR",2,36,934,14732
0,"Like","*Devazepid*","OR",2,36,934,14733
0,"Like","*Flumazenil*","OR",2,36,934,14734
0,"Like","*Pirenzepine*","OR",2,36,934,14735
0,"Like","*clobazam*","OR",2,36,934,14736
0,"Like","*flutazoram*","OR",2,36,934,14737
0,"Like","*girisopam*","OR",2,36,934,14738
0,"Like","*nerisopam*","OR",2,36,934,14739
0,"Like","*pinasepam*","OR",2,36,934,14740
0,"Like","*tofisopam*","OR",2,36,934,14741
0,"Like","*triflubazam*","OR",2,36,934,14742
0,"Like","*azepam*","OR",2,57,934,14743
0,"Like","*zolam*","OR",2,57,934,14744
0,"Like","*diazep*","OR",2,57,934,14745
0,"Like","*Anthramycin*","OR",2,57,934,14746
0,"Like","*clorazepat*","OR",2,57,934,14747
0,"Like","*Devazepid*","OR",2,57,934,14748
0,"Like","*Flumazenil*","OR",2,57,934,14749
0,"Like","*Pirenzepine*","OR",2,57,934,14750
0,"Like","*clobazam*","OR",2,57,934,14751
0,"Like","*flutazoram*","OR",2,57,934,14752
0,"Like","*girisopam*","OR",2,57,934,14753
0,"Like","*nerisopam*","OR",2,57,934,14754
0,"Like","*pinasepam*","OR",2,57,934,14755
0,"Like","*tofisopam*","OR",2,57,934,14756
0,"Like","*triflubazam*",,2,57,934,14757
0,"Like","*weight*","OR",2,27,935,14758
0,"Like","*body mass*","OR",2,27,935,14759
0,"Like","*bmi *","OR",2,27,935,14760
0,"Like","*diet*","OR",2,27,935,14761
0,"Like","* eat*","OR",2,27,935,14762
0,"Like","*waist*","OR",2,27,935,14763
0,"Like","*obes*","OR",2,27,935,14764
0,"Like","* fat*","OR",2,27,935,14765
0,"Like","*metaboli*","OR",2,27,935,14766
0,"Like","*weight*","OR",2,36,935,14767
0,"Like","*body mass*","OR",2,36,935,14768
0,"Like","*bmi *","OR",2,36,935,14769
0,"Like","*diet*","OR",2,36,935,14770
0,"Like","* eat*","OR",2,36,935,14771
0,"Like","*waist*","OR",2,36,935,14772
0,"Like","*obes*","OR",2,36,935,14773
0,"Like","* fat*","OR",2,36,935,14774
0,"Like","*metaboli*","OR",2,36,935,14775
0,"Like","*weight*","OR",2,57,935,14776
0,"Like","*body mass*","OR",2,57,935,14777
0,"Like","*bmi *","OR",2,57,935,14778
0,"Like","*diet*","OR",2,57,935,14779
0,"Like","* eat*","OR",2,57,935,14780
0,"Like","*waist*","OR",2,57,935,14781
0,"Like","*obes*","OR",2,57,935,14782
0,"Like","* fat*","OR",2,57,935,14783
0,"Like","*metaboli*",,2,57,935,14784
0,"Like","*asenapine*","OR",2,27,936,14785
0,"Like","*saphris*","OR",2,27,936,14786
0,"Like","*5222*","OR",2,27,936,14787
0,"Like","*asenapine*","OR",2,36,936,14788
0,"Like","*saphris*","OR",2,36,936,14789
0,"Like","*5222*","OR",2,36,936,14790
0,"Like","*asenapine*","OR",2,57,936,14791
0,"Like","*saphris*","OR",2,57,936,14792
0,"Like","*5222*",,2,57,936,14793
0,"Like","*asenapine*","OR",1,14,937,14794
0,"Like","*saphris*","OR",1,14,937,14795
0,"Like","*5222*",,1,14,937,14796
0,"Like","*vitamin C*","OR",2,27,938,14797
0,"Like","*ascorbic acid*","OR",2,27,938,14798
0,"Like","*vitamin E*","OR",2,27,938,14799
0,"Like","*alpha-tocopherol*","OR",2,27,938,14800
0,"Like","*selegiline*","OR",2,27,938,14801
0,"Like","*deprenyl*","OR",2,27,938,14802
0,"Like","*n-acetyl cysteine*","OR",2,27,938,14803
0,"Like","*acetylcysteine*","OR",2,27,938,14804
0,"Like","*superoxide dismutase*","OR",2,27,938,14805
0,"Like","* SOD *","OR",2,27,938,14806
0,"Like","*dehydroepiandrosterone*","OR",2,27,938,14807
0,"Like","*antioxidant*","OR",2,27,938,14808
0,"Like","*vitamin C*","OR",2,36,938,14809
0,"Like","*ascorbic acid*","OR",2,36,938,14810
0,"Like","*vitamin E*","OR",2,36,938,14811
0,"Like","*alpha-tocopherol*","OR",2,36,938,14812
0,"Like","*selegiline*","OR",2,36,938,14813
0,"Like","*deprenyl*","OR",2,36,938,14814
0,"Like","*n-acetyl cysteine*","OR",2,36,938,14815
0,"Like","*acetylcysteine*","OR",2,36,938,14816
0,"Like","*superoxide dismutase*","OR",2,36,938,14817
0,"Like","* SOD *","OR",2,36,938,14818
0,"Like","*dehydroepiandrosterone*","OR",2,36,938,14819
0,"Like","*antioxidant*","OR",2,36,938,14820
0,"Like","*vitamin C*","OR",2,57,938,14821
0,"Like","*ascorbic acid*","OR",2,57,938,14822
0,"Like","*vitamin E*","OR",2,57,938,14823
0,"Like","*alpha-tocopherol*","OR",2,57,938,14824
0,"Like","*selegiline*","OR",2,57,938,14825
0,"Like","*deprenyl*","OR",2,57,938,14826
0,"Like","*n-acetyl cysteine*","OR",2,57,938,14827
0,"Like","*acetylcysteine*","OR",2,57,938,14828
0,"Like","*superoxide dismutase*","OR",2,57,938,14829
0,"Like","* SOD *","OR",2,57,938,14830
0,"Like","*dehydroepiandrosterone*","OR",2,57,938,14831
0,"Like","*antioxidant*",,2,57,938,14832
0,"Like","*vitamin C*","OR",2,27,939,14833
0,"Like","*ascorbic acid*","OR",2,27,939,14834
0,"Like","*vitamin E*","OR",2,27,939,14835
0,"Like","*alpha-tocopherol*","OR",2,27,939,14836
0,"Like","*selegiline*","OR",2,27,939,14837
0,"Like","*deprenyl*","OR",2,27,939,14838
0,"Like","*n-acetyl cysteine*","OR",2,27,939,14839
0,"Like","*acetylcysteine*","OR",2,27,939,14840
0,"Like","*superoxide dismutase*","OR",2,27,939,14841
0,"Like","* SOD *","OR",2,27,939,14842
0,"Like","*dehydroepiandrosterone*","OR",2,27,939,14843
0,"Like","*antioxidant*","OR",2,27,939,14844
0,"Like","*vitamin C*","OR",2,36,939,14845
0,"Like","*ascorbic acid*","OR",2,36,939,14846
0,"Like","*vitamin E*","OR",2,36,939,14847
0,"Like","*alpha-tocopherol*","OR",2,36,939,14848
0,"Like","*selegiline*","OR",2,36,939,14849
0,"Like","*deprenyl*","OR",2,36,939,14850
0,"Like","*n-acetyl cysteine*","OR",2,36,939,14851
0,"Like","*acetylcysteine*","OR",2,36,939,14852
0,"Like","*superoxide dismutase*","OR",2,36,939,14853
0,"Like","* SOD *","OR",2,36,939,14854
0,"Like","*dehydroepiandrosterone*","OR",2,36,939,14855
0,"Like","*antioxidant*","OR",2,36,939,14856
0,"Like","*vitamin C*","OR",2,57,940,14857
0,"Like","*ascorbic acid*","OR",2,57,940,14858
0,"Like","*vitamin E*","OR",2,57,940,14859
0,"Like","*alpha-tocopherol*","OR",2,57,940,14860
0,"Like","*selegiline*","OR",2,57,940,14861
0,"Like","*deprenyl*","OR",2,57,940,14862
0,"Like","*n-acetyl cysteine*","OR",2,57,940,14863
0,"Like","*acetylcysteine*","OR",2,57,940,14864
0,"Like","*superoxide dismutase*","OR",2,57,940,14865
0,"Like","* SOD *","OR",2,57,940,14866
0,"Like","*dehydroepiandrosterone*","OR",2,57,940,14867
0,"Like","*antioxidant*","OR",2,57,940,14868
0,"Like","*vitamin C*","OR",1,14,941,14869
0,"Like","*ascorbic acid*","OR",1,14,941,14870
0,"Like","*vitamin E*","OR",1,14,941,14871
0,"Like","*alpha-tocopherol*","OR",1,14,941,14872
0,"Like","*selegiline*","OR",1,14,941,14873
0,"Like","*deprenyl*","OR",1,14,941,14874
0,"Like","*n-acetyl cysteine*","OR",1,14,941,14875
0,"Like","*n-acetyl-l-cysteine*","OR",1,14,941,14876
0,"Like","*n-acetylcysteine*","OR",1,14,941,14877
0,"Like","*acetylcysteine*","OR",1,14,941,14878
0,"Like","*superoxide dismutase*","OR",1,14,941,14879
0,"Like","* SOD *","OR",1,14,941,14880
0,"Like","*dehydroepiandrosterone","OR",1,14,941,14881
0,"Like","*antioxidant*",,1,14,941,14882
0,"Like","*vocat*","OR",2,27,942,14883
0,"Like","*work*","OR",2,27,942,14884
0,"Like","*employ*","OR",2,27,942,14885
0,"Like","*job*","OR",2,27,942,14886
0,"Like","*occupat*","OR",2,27,942,14887
0,"Like","* placem*","OR",2,27,942,14888
0,"Like","*rehab*","OR",2,27,942,14889
0,"Like","*mass screening*","OR",2,27,943,14890
0,"Like","*cancer*","OR",2,27,943,14891
0,"Like","*neoplasm*","OR",2,27,943,14892
0,"Like","*mass screening*","OR",2,36,943,14893
0,"Like","*cancer*","OR",2,36,943,14894
0,"Like","*neoplasm*","OR",2,36,943,14895
0,"Like","*mass screening*","OR",2,57,943,14896
0,"Like","*cancer*","OR",2,57,943,14897
0,"Like","*neoplasm*",,2,57,943,14898
0,"Like","*didactic*","OR",2,27,944,14899
0,"Like","*video*","OR",2,27,944,14900
0,"Like","*role?play*","OR",2,27,944,14901
0,"Like","*communication skills*","OR",2,27,944,14902
0,"Like","*e?learning*","OR",2,27,944,14903
0,"Like","*communicat*","OR",2,27,944,14904
0,"Like","*active?learning*","OR",2,27,944,14905
0,"Like","*computer*","OR",2,27,944,14906
0,"Like","*didactic*","OR",2,36,944,14907
0,"Like","*video*","OR",2,36,944,14908
0,"Like","*role?play*","OR",2,36,944,14909
0,"Like","*communication skills*","OR",2,36,944,14910
0,"Like","*e?learning*","OR",2,36,944,14911
0,"Like","*communicat*","OR",2,36,944,14912
0,"Like","*active?learning*","OR",2,36,944,14913
0,"Like","*computer*","OR",2,36,944,14914
0,"Like","*didactic*","OR",2,57,944,14915
0,"Like","*video*","OR",2,57,944,14916
0,"Like","*role?play*","OR",2,57,944,14917
0,"Like","*communication skills*","OR",2,57,944,14918
0,"Like","*e?learning*","OR",2,57,944,14919
0,"Like","*communicat*","OR",2,57,944,14920
0,"Like","*active?learning*","OR",2,57,944,14921
0,"Like","*computer*",,2,57,944,14922
0,"Like","*benzodiazepine*","OR",1,14,945,14923
0,"Like","*alprazolam*","OR",1,14,945,14924
0,"Like","*bromazepam*","OR",1,14,945,14925
0,"Like","*neo*","OR",1,14,945,14926
0,"Like","*brotizolam*","OR",1,14,945,14927
0,"Like","*chlordiazepoxid*","OR",1,14,945,14928
0,"Like","*clobazam*","OR",1,14,945,14929
0,"Like","*clotiazepam*","OR",1,14,945,14930
0,"Like","*diazepam*","OR",1,14,945,14931
0,"Like","*dikaliumclorazepat*","OR",1,14,945,14932
0,"Like","*flunitrazepam*","OR",1,14,945,14933
0,"Like","*flurazepam*","OR",1,14,945,14934
0,"Like","*loprazolam*","OR",1,14,945,14935
0,"Like","*lorazepam*","OR",1,14,945,14936
0,"Like","*lormetazepam*","OR",1,14,945,14937
0,"Like","*medazepam*","OR",1,14,945,14938
0,"Like","*metaclazepam*","OR",1,14,945,14939
0,"Like","*midazolam*","OR",1,14,945,14940
0,"Like","*nitrazepam*","OR",1,14,945,14941
0,"Like","*nordazepam*","OR",1,14,945,14942
0,"Like","*oxazepam*","OR",1,14,945,14943
0,"Like","*prazepam*","OR",1,14,945,14944
0,"Like","*temazepam*","OR",1,14,945,14945
0,"Like","*triazolam*",,1,14,945,14946
0,"Like","*abecarnil*","OR",1,14,946,14947
0,"Like","*adinazolam*","OR",1,14,946,14948
0,"Like","*AHN 086*","OR",1,14,946,14949
0,"Like","*alpidem*","OR",1,14,946,14950
0,"Like","*alprazolam*","OR",1,14,946,14951
0,"Like","*Anthramycin*","OR",1,14,946,14952
0,"Like","*arfendazam*","OR",1,14,946,14953
0,"Like","*azepam*","OR",1,14,947,14954
0,"Like","*bentazepam*","OR",1,14,947,14955
0,"Like","*benzodiazepine*",,1,14,947,14956
0,"Like","*chlordiazepoxide*","OR",1,14,948,14957
0,"Like","*ciclotizolam*","OR",1,14,948,14958
0,"Like","*ciprazafone*","OR",1,14,948,14959
0,"Like","*clobazam*","OR",1,14,948,14960
0,"Like","*clonazepa*","OR",1,14,948,14961
0,"Like","*clotiazepam*","OR",1,14,948,14962
0,"Like","*CP 32961*",,1,14,948,14963
0,"Like","*DBCE*","OR",1,14,949,14964
0,"Like","*devazepide*","OR",1,14,949,14965
0,"Like","*dextofisopam*","OR",1,14,949,14966
0,"Like","*diazepam*","OR",1,14,949,14967
0,"Like","*dikaliumclorazepat*","OR",1,14,949,14968
0,"Like","*divaplon*","OR",1,14,949,14969
0,"Like","*dulozafone*","OR",1,14,950,14970
0,"Like","*ELB 139*","OR",1,14,950,14971
0,"Like","*emapunil*","OR",1,14,950,14972
0,"Like","*endixaprine*","OR",1,14,950,14973
0,"Like","*eszopiclone*","OR",1,14,950,14974
0,"Like","*etizolam*","OR",1,14,950,14975
0,"Like","*FG 7142*",,1,14,950,14976
0,"Like","*Flumazenil*","OR",1,14,951,14977
0,"Like","*flunitrazepam*","OR",1,14,951,14978
0,"Like","*flurazepam*","OR",1,14,951,14979
0,"Like","*flutazoram*","OR",1,14,951,14980
0,"Like","*GABA*","OR",1,14,951,14981
0,"Like","*gedocarnil*","OR",1,14,951,14982
0,"Like","*girisopam*",,1,14,951,14983
0,"Like","*imidazenil*","OR",1,14,952,14984
0,"Like","*JL 13*","OR",1,14,952,14985
0,"Like","*KC 5944*","OR",1,14,952,14986
0,"Like","*L 365260*","OR",1,14,952,14987
0,"Like","*lorazepam*","OR",1,14,952,14988
0,"Like","*lormetazepam*","OR",1,14,952,14989
0,"Like","*lorzafone*",,1,14,952,14990
0,"Like","*magnesium *","OR",1,14,953,14991
0,"Like","*MCC*","OR",1,14,953,14992
0,"Like","*medazepam*","OR",1,14,953,14993
0,"Like","*metaclazepam*","OR",1,14,953,14994
0,"Like","*midazolam*","OR",1,14,953,14995
0,"Like","*nerisopam*","OR",1,14,953,14996
0,"Like","*nitrazepam*",,1,14,953,14997
0,"Like","*nordazepam*","OR",1,14,954,14998
0,"Like","*oxazepam*","OR",1,14,954,14999
0,"Like","*pazinaclone*","OR",1,14,954,15000
0,"Like","*PBCC*","OR",1,14,954,15001
0,"Like","*perlapine*","OR",1,14,954,15002
0,"Like","*pinasepam*","OR",1,14,954,15003
0,"Like","*pipequaline*",,1,14,954,15004
0,"Like","*Pirenzepine*","OR",1,14,955,15005
0,"Like","*PK 11195*","OR",1,14,955,15006
0,"Like","*prazepam*","OR",1,14,955,15007
0,"Like","*premazepam*","OR",1,14,955,15008
0,"Like","*quazepam*","OR",1,14,955,15009
0,"Like","*radequinil*","OR",1,14,955,15010
0,"Like","*reclazepam*",,1,14,955,15011
0,"Like","*ricasetron*","OR",1,14,956,15012
0,"Like","*rilmazafone*","OR",1,14,956,15013
0,"Like","*Ro 15-4513*","OR",1,14,956,15014
0,"Like","*Ro 19-5686*","OR",1,14,956,15015
0,"Like","*Ro 5-4864*","OR",1,14,956,15016
0,"Like","*sarmazenil*","OR",1,14,956,15017
0,"Like","*SL 75102*",,1,14,956,15018
0,"Like","*SR 95195*","OR",1,14,957,15019
0,"Like","*suriclone*","OR",1,14,957,15020
0,"Like","*temazepam*","OR",1,14,957,15021
0,"Like","*tiagabine*","OR",1,14,957,15022
0,"Like","*timelotem*","OR",1,14,957,15023
0,"Like","*tofisopam*","OR",1,14,957,15024
0,"Like","*tracazolate*",,1,14,957,15025
0,"Like","*trepipam*","OR",1,14,958,15026
0,"Like","*triazolam*","OR",1,14,958,15027
0,"Like","*triflubazam*","OR",1,14,958,15028
0,"Like","*Y 23684*","OR",1,14,958,15029
0,"Like","*zaleplon*","OR",1,14,958,15030
0,"Like","*zalospirone*","OR",1,14,958,15031
0,"Like","*ZAPA*",,1,14,958,15032
0,"Like","*ZK 90798*","OR",1,14,959,15033
0,"Like","*ZK 91296*","OR",1,14,959,15034
0,"Like","*ZK 93423*","OR",1,14,959,15035
0,"Like","*zolam *","OR",1,14,959,15036
0,"Like","*zolpidem*","OR",1,14,959,15037
0,"Like","*zopiclone*","OR",1,14,959,15038
0,"Like","*garden*","OR",2,27,960,15039
0,"Like","*horticult*","OR",2,27,960,15040
0,"Like","*cultivat*","OR",2,27,960,15041
0,"Like","* plant*","OR",2,27,960,15042
0,"Like","*floriculture*","OR",2,27,960,15043
0,"Like","*topiary*","OR",2,27,960,15044
0,"Like","*garden*","OR",2,36,960,15045
0,"Like","*horticult*","OR",2,36,960,15046
0,"Like","*cultivat*","OR",2,36,960,15047
0,"Like","* plant*","OR",2,36,960,15048
0,"Like","*floriculture*","OR",2,36,960,15049
0,"Like","*topiary*","OR",2,36,960,15050
0,"Like","*garden*","OR",2,57,960,15051
0,"Like","*horticult*","OR",2,57,960,15052
0,"Like","*cultivat*","OR",2,57,960,15053
0,"Like","* plant*","OR",2,57,960,15054
0,"Like","*floriculture*","OR",2,57,960,15055
0,"Like","*topiary*",,2,57,960,15056
0,"Like","*collaborative care*","OR",2,27,961,15057
0,"Like","*collaborative care*","OR",2,36,961,15058
0,"Like","*collaborative care*","OR",2,57,961,15059
0,"Like","*collab*","OR",2,27,961,15060
0,"Like","*collab*","OR",2,36,961,15061
0,"Like","*collab*",,2,57,961,15062
0,"Like","*first?admission*","OR",2,27,962,15063
0,"Like","*first?episo*","OR",2,27,962,15064
0,"Like","*early?episo*","OR",2,27,962,15065
0,"Like","*early?symtom*","OR",2,27,962,15066
0,"Like","*first?admission*","OR",2,36,962,15067
0,"Like","*first?episo*","OR",2,36,962,15068
0,"Like","*early?episo*","OR",2,36,962,15069
0,"Like","*early?symtom*","OR",2,36,962,15070
0,"Like","*first?admission*","OR",2,57,962,15071
0,"Like","*first?episo*","OR",2,57,962,15072
0,"Like","*early?episo*","OR",2,57,962,15073
0,"Like","*early?symtom*",,2,57,962,15074
0,"Like","*early?interv*","OR",2,27,963,15075
0,"Like","*prodrom*","OR",2,27,963,15076
0,"Like","*second?episo*","OR",2,27,963,15077
0,"Like","*primary?episo*","OR",2,27,963,15078
0,"Like","*secondary?episo*","OR",2,27,963,15079
0,"Like","*early?interv*","OR",2,36,963,15080
0,"Like","*prodrom*","OR",2,36,963,15081
0,"Like","*second?episo*","OR",2,36,963,15082
0,"Like","*primary?episo*","OR",2,36,963,15083
0,"Like","*secondary?episo*","OR",2,36,963,15084
0,"Like","*early?interv*","OR",2,57,963,15085
0,"Like","*prodrom*","OR",2,57,963,15086
0,"Like","*second?episo*","OR",2,57,963,15087
0,"Like","*primary?episo*","OR",2,57,963,15088
0,"Like","*secondary?episo*",,2,57,963,15089
0,"Like","*perphenazine*","OR",2,27,964,15090
0,"Like","*trilafon*","OR",2,27,964,15091
0,"Like","*peratsin*","OR",2,27,964,15092
0,"Like","*decentan-depot*","OR",2,27,964,15093
0,"Like","*chlorpiprazine*","OR",2,27,964,15094
0,"Like","*perfenazine*","OR",2,27,964,15095
0,"Like","*perphenazine*","OR",2,36,964,15096
0,"Like","*trilafon*","OR",2,36,964,15097
0,"Like","*peratsin*","OR",2,36,964,15098
0,"Like","*decentan-depot*","OR",2,36,964,15099
0,"Like","*chlorpiprazine*","OR",2,36,964,15100
0,"Like","*perfenazine*","OR",2,36,964,15101
0,"Like","*perphenazine*","OR",2,57,964,15102
0,"Like","*trilafon*","OR",2,57,964,15103
0,"Like","*peratsin*","OR",2,57,964,15104
0,"Like","*decentan-depot*","OR",2,57,964,15105
0,"Like","*chlorpiprazine*","OR",2,57,964,15106
0,"Like","*perfenazine*",,2,57,964,15107
0,"Like","*computer*","OR",2,27,965,15108
0,"Like","*internet*","OR",2,27,965,15109
0,"Like","*ICT*","OR",2,27,965,15110
0,"Like","*electronic*","OR",2,27,965,15111
0,"Like","*computer*","OR",2,36,965,15112
0,"Like","*internet*","OR",2,36,965,15113
0,"Like","*ICT*","OR",2,36,965,15114
0,"Like","*electronic*","OR",2,36,965,15115
0,"Like","*computer*","OR",2,57,965,15116
0,"Like","*internet*","OR",2,57,965,15117
0,"Like","*ICT*","OR",2,57,965,15118
0,"Like","*electronic*",,2,57,965,15119
0,"Like","*online*","OR",2,27,966,15120
0,"Like","*Virtual*","OR",2,27,966,15121
0,"Like","*world wide web*","OR",2,27,966,15122
0,"Like","*second life*","OR",2,27,966,15123
0,"Like","*online*","OR",2,36,966,15124
0,"Like","*Virtual*","OR",2,36,966,15125
0,"Like","*world wide web*","OR",2,36,966,15126
0,"Like","*second life*","OR",2,36,966,15127
0,"Like","*online*","OR",2,57,966,15128
0,"Like","*Virtual*","OR",2,57,966,15129
0,"Like","*world wide web*","OR",2,57,966,15130
0,"Like","*second life*",,2,57,966,15131
0,"Like","*facebook*","OR",2,27,967,15132
0,"Like","*twitter*","OR",2,27,967,15133
0,"Like","*blog*","OR",2,27,967,15134
0,"Like","*messeng*","OR",2,27,967,15135
0,"Like","*MSN*","OR",2,27,967,15136
0,"Like","*SMS*","OR",2,27,967,15137
0,"Like","*facebook*","OR",2,36,967,15138
0,"Like","*twitter*","OR",2,36,967,15139
0,"Like","*blog*","OR",2,36,967,15140
0,"Like","*messeng*","OR",2,36,967,15141
0,"Like","*MSN*","OR",2,36,967,15142
0,"Like","*SMS*","OR",2,36,967,15143
0,"Like","*facebook*","OR",2,57,967,15144
0,"Like","*twitter*","OR",2,57,967,15145
0,"Like","*blog*","OR",2,57,967,15146
0,"Like","*messeng*","OR",2,57,967,15147
0,"Like","*MSN*","OR",2,57,967,15148
0,"Like","*SMS*",,2,57,967,15149
0,"Like","*virtual*","OR",2,27,968,15150
0,"Like","*VR*","OR",2,27,968,15151
0,"Like","*second life*","OR",2,27,968,15152
0,"Like","*facebook*","OR",2,27,968,15153
0,"Like","*Twitter*","OR",2,27,968,15154
0,"Like","*virtual*","OR",2,36,968,15155
0,"Like","*VR*","OR",2,36,968,15156
0,"Like","*second life*","OR",2,36,968,15157
0,"Like","*facebook*","OR",2,36,968,15158
0,"Like","*Twitter*","OR",2,36,968,15159
0,"Like","*virtual*","OR",2,57,968,15160
0,"Like","*VR*","OR",2,57,968,15161
0,"Like","*second life*","OR",2,57,968,15162
0,"Like","*facebook*","OR",2,57,968,15163
0,"Like","*Twitter*","OR",2,57,968,15164
0,"Like","*3rd generation*","OR",2,27,969,15165
0,"Like","*third generation*","OR",2,27,969,15166
0,"Like","*video*","OR",2,27,969,15167
0,"Like","*hypermedia*","OR",2,27,969,15168
0,"Like","*Computer*","OR",2,27,969,15169
0,"Like","*3rd generation*","OR",2,36,969,15170
0,"Like","*third generation*","OR",2,36,969,15171
0,"Like","*video*","OR",2,36,969,15172
0,"Like","*hypermedia*","OR",2,36,969,15173
0,"Like","*Computer*","OR",2,36,969,15174
0,"Like","*3rd generation*","OR",2,57,969,15175
0,"Like","*third generation*","OR",2,57,969,15176
0,"Like","*video*","OR",2,57,969,15177
0,"Like","*hypermedia*","OR",2,57,969,15178
0,"Like","*Computer*","OR",2,57,969,15179
0,"Like","*guideline*","OR",2,27,970,15180
0,"Like","*guideline*","OR",2,36,970,15181
0,"Like","*guideline*",,2,57,970,15182
0,"Like","*Algorithm*","OR",2,27,971,15183
0,"Like","*disseminat*","OR",2,27,971,15184
0,"Like","*distribut*","OR",2,27,971,15185
0,"Like","*health care reform*","OR",2,27,971,15186
0,"Like","*health plan*","OR",2,27,971,15187
0,"Like","*Algorithm*","OR",2,36,971,15188
0,"Like","*disseminat*","OR",2,36,971,15189
0,"Like","*distribut*","OR",2,36,971,15190
0,"Like","*health care reform*","OR",2,36,971,15191
0,"Like","*health plan*","OR",2,36,971,15192
0,"Like","*Algorithm*","OR",2,57,971,15193
0,"Like","*disseminat*","OR",2,57,971,15194
0,"Like","*distribut*","OR",2,57,971,15195
0,"Like","*health care reform*","OR",2,57,971,15196
0,"Like","*health plan*",,2,57,971,15197
0,"Like","*health polic*","OR",2,27,972,15198
0,"Like","*health priorit*","OR",2,27,972,15199
0,"Like","*health reform*","OR",2,27,972,15200
0,"Like","*Improving care*","OR",2,27,972,15201
0,"Like","*improving treatment*","OR",2,27,972,15202
0,"Like","*health polic*","OR",2,36,972,15203
0,"Like","*health priorit*","OR",2,36,972,15204
0,"Like","*health reform*","OR",2,36,972,15205
0,"Like","*Improving care*","OR",2,36,972,15206
0,"Like","*improving treatment*","OR",2,36,972,15207
0,"Like","*health polic*","OR",2,57,972,15208
0,"Like","*health priorit*","OR",2,57,972,15209
0,"Like","*health reform*","OR",2,57,972,15210
0,"Like","*Improving care*","OR",2,57,972,15211
0,"Like","*improving treatment*",,2,57,972,15212
0,"Like","*knowledge transfer*","OR",2,27,973,15213
0,"Like","*performance measure*","OR",2,27,973,15214
0,"Like","*policy making*","OR",2,27,973,15215
0,"Like","*professional standard*","OR",2,27,973,15216
0,"Like","*research agenda*","OR",2,27,973,15217
0,"Like","*knowledge transfer*","OR",2,36,973,15218
0,"Like","*performance measure*","OR",2,36,973,15219
0,"Like","*policy making*","OR",2,36,973,15220
0,"Like","*professional standard*","OR",2,36,973,15221
0,"Like","*research agenda*","OR",2,36,973,15222
0,"Like","*knowledge transfer*","OR",2,57,973,15223
0,"Like","*performance measure*","OR",2,57,973,15224
0,"Like","*policy making*","OR",2,57,973,15225
0,"Like","*professional standard*","OR",2,57,973,15226
0,"Like","*research agenda*",,2,57,973,15227
0,"Like","*research priorit*","OR",2,27,974,15228
0,"Like","*research program*","OR",2,27,974,15229
0,"Like","*statement*","OR",2,27,974,15230
0,"Like","*treatment guid*","OR",2,27,974,15231
0,"Like","*Treatment protocol*","OR",2,27,974,15232
0,"Like","*research priorit*","OR",2,36,974,15233
0,"Like","*research program*","OR",2,36,974,15234
0,"Like","*statement*","OR",2,36,974,15235
0,"Like","*treatment guid*","OR",2,36,974,15236
0,"Like","*Treatment protocol*","OR",2,36,974,15237
0,"Like","*research priorit*","OR",2,57,974,15238
0,"Like","*research program*","OR",2,57,974,15239
0,"Like","*statement*","OR",2,57,974,15240
0,"Like","*treatment guid*","OR",2,57,974,15241
0,"Like","*Treatment protocol*",,2,57,974,15242
0,"Like","*assess*","OR",2,27,975,15243
0,"Like","*evaluat*","OR",2,27,975,15244
0,"Like","*Impact*","OR",2,27,975,15245
0,"Like","*implement*","OR",2,27,975,15246
0,"Like","*validity*","OR",2,27,975,15247
0,"Like","*assess*","OR",2,36,975,15248
0,"Like","*evaluat*","OR",2,36,975,15249
0,"Like","*Impact*","OR",2,36,975,15250
0,"Like","*implement*","OR",2,36,975,15251
0,"Like","*validity*","OR",2,36,975,15252
0,"Like","*assess*","OR",2,57,975,15253
0,"Like","*evaluat*","OR",2,57,975,15254
0,"Like","*Impact*","OR",2,57,975,15255
0,"Like","*implement*","OR",2,57,975,15256
0,"Like","*validity*",,2,57,975,15257
0,"Like","*anadep*","OR",1,14,976,15258
0,"Like","*chlora*","OR",1,14,976,15259
0,"Like","*chlorprom*","OR",1,14,976,15260
0,"Like","*(chlor p-z)*","OR",1,14,976,15261
0,"Like","*chromeda*","OR",1,14,976,15262
0,"Like","*cpz*","OR",1,14,976,15263
0,"Like","*elmarine*","OR",1,14,976,15264
0,"Like","*esmind*","OR",1,14,976,15265
0,"Like","*plegomaz*","OR",1,14,977,15266
0,"Like","*procalm*","OR",1,14,977,15267
0,"Like","*proma*","OR",1,14,977,15268
0,"Like","*promexin*","OR",1,14,977,15269
0,"Like","*promosol*","OR",1,14,977,15270
0,"Like","*prozil*","OR",1,14,977,15271
0,"Like","*psychozin*","OR",1,14,977,15272
0,"Like","*psylactil*","OR",1,14,977,15273
0,"Like","*Celecoxib*","OR",2,27,978,15274
0,"Like","*Celebrex* `","OR",2,27,978,15275
0,"Like","*SC 58635*","OR",2,27,978,15276
0,"Like","*SC-58635*","OR",2,27,978,15277
0,"Like","*Celecoxib*","OR",2,36,978,15278
0,"Like","*Celebrex*","OR",2,36,978,15279
0,"Like","*SC 58635*","OR",2,36,978,15280
0,"Like","*SC-58635*",,2,36,978,15281
0,"Like","*Celecoxib*","OR",2,57,978,15282
0,"Like","*Celebrex*","OR",2,57,978,15283
0,"Like","*SC 58635*","OR",2,57,978,15284
0,"Like","*SC-58635*","OR",2,57,978,15285
0,"Like","*aggress*","OR",1,14,979,15286
0,"Like","*violen*","OR",1,14,979,15287
0,"Like","*agitat*","OR",1,14,979,15288
0,"Like","*tranq*",,1,14,979,15289
0,"Like","*aggress*","OR",2,27,980,15290
0,"Like","*violen*","OR",2,27,980,15291
0,"Like","*agitat*","OR",2,27,980,15292
0,"Like","*tranq*","OR",2,27,980,15293
0,"Like","*hostil*","OR",2,27,980,15294
0,"Like","*aggress*","OR",2,36,980,15295
0,"Like","*violen*","OR",2,36,980,15296
0,"Like","*agitat*","OR",2,36,980,15297
0,"Like","*tranq*","OR",2,36,980,15298
0,"Like","*hostil*","OR",2,36,980,15299
0,"Like","*aggress*","OR",2,57,980,15300
0,"Like","*violen*","OR",2,57,980,15301
0,"Like","*agitat*","OR",2,57,980,15302
0,"Like","*tranq*","OR",2,57,980,15303
0,"Like","*hostil*",,2,57,980,15304
0,"Like","*haloperi*","OR",1,14,981,15305
0,"Like","*R-1625*","OR",1,14,981,15306
0,"Like","*haldol*","OR",1,14,981,15307
0,"Like","*alased*","OR",1,14,981,15308
0,"Like","*aloperidi*","OR",1,14,981,15309
0,"Like","*bioperido*",,1,14,981,15310
0,"Like","*buterid*","OR",1,14,982,15311
0,"Like","*ceree*","OR",1,14,982,15312
0,"Like","*dozic*","OR",1,14,982,15313
0,"Like","*duraperido*","OR",1,14,982,15314
0,"Like","*fortuna*","OR",1,14,982,15315
0,"Like","*serena*",,1,14,982,15316
0,"Like","*serenel*","OR",1,14,983,15317
0,"Like","*seviu*","OR",1,14,983,15318
0,"Like","*sigaperid*","OR",1,14,983,15319
0,"Like"," *sylad*","OR",1,14,983,15320
0,"Like","*zafri*","OR",1,14,983,15321
0,"Like","*pimozide*","OR",2,27,984,15322
0,"Like","*pimozide*","OR",2,36,984,15323
0,"Like","*pimozide*","OR",2,57,984,15324
0,"Like","* orap*","OR",2,27,984,15325
0,"Like","* orap*","OR",2,36,984,15326
0,"Like","* orap*","OR",2,57,984,15327
0,"Like","*antalon*","OR",2,27,984,15328
0,"Like","*antalon*","OR",2,36,984,15329
0,"Like","*antalon*","OR",2,57,984,15330
0,"Like","*opiran*","OR",2,27,984,15331
0,"Like","*opiran*","OR",2,36,984,15332
0,"Like","*opiran*","OR",2,57,984,15333
0,"Like","*pirium*","OR",2,27,984,15334
0,"Like","*pirium*","OR",2,36,984,15335
0,"Like","*pirium*","OR",2,57,984,15336
0,"Like","*R-6238*","OR",2,27,984,15337
0,"Like","*R-6238*","OR",2,36,984,15338
0,"Like","*R-6238*",,2,57,984,15339
0,"Like","*diet*","OR",2,27,985,15340
0,"Like","*diet*","OR",2,36,985,15341
0,"Like","*diet*","OR",2,57,985,15342
0,"Like","*fruit*","OR",2,27,985,15343
0,"Like","*fruit*","OR",2,36,985,15344
0,"Like","*fruit*","OR",2,57,985,15345
0,"Like","*vegetable*","OR",2,27,985,15346
0,"Like","*vegetable*","OR",2,36,985,15347
0,"Like","*vegetable*","OR",2,57,985,15348
0,"Like","*fish*","OR",2,27,985,15349
0,"Like","*fish*","OR",2,36,985,15350
0,"Like","*fish*","OR",2,57,985,15351
0,"Like","*carbohydrat*","OR",2,27,985,15352
0,"Like","*carbohydrat*","OR",2,36,985,15353
0,"Like","*carbohydrat*",,2,57,985,15354
0,"Like","*nutrition*","OR",2,27,986,15355
0,"Like","* eating*","OR",2,27,986,15356
0,"Like","*feeding*","OR",2,27,986,15357
0,"Like","*weight loss*","OR",2,27,986,15358
0,"Like","*food*","OR",2,27,986,15359
0,"Like","*nutrition*","OR",2,36,986,15360
0,"Like","* eating*","OR",2,36,986,15361
0,"Like","*feeding*","OR",2,36,986,15362
0,"Like","*weight loss*","OR",2,36,986,15363
0,"Like","*food*","OR",2,36,986,15364
0,"Like","*nutrition*","OR",2,57,986,15365
0,"Like","* eating*","OR",2,57,986,15366
0,"Like","*feeding*","OR",2,57,986,15367
0,"Like","*weight loss*","OR",2,57,986,15368
0,"Like","*food*",,2,57,986,15369
0,"Like","*fats*","OR",2,27,987,15370
0,"Like","*fatty*","OR",2,27,987,15371
0,"Like","*calori*","OR",2,27,987,15372
0,"Like","*weight loss*","OR",2,27,987,15373
0,"Like","*health promotion*","OR",2,27,987,15374
0,"Like","*fats*","OR",2,36,987,15375
0,"Like","*fatty*","OR",2,36,987,15376
0,"Like","*calori*","OR",2,36,987,15377
0,"Like","*weight loss*","OR",2,36,987,15378
0,"Like","*health promotion*","OR",2,36,987,15379
0,"Like","*fats*","OR",2,57,987,15380
0,"Like","*fatty*","OR",2,57,987,15381
0,"Like","*calori*","OR",2,57,987,15382
0,"Like","*weight loss*","OR",2,57,987,15383
0,"Like","*health promotion*",,2,57,987,15384
0,"Like","*health education*","OR",2,27,988,15385
0,"Like","*food supplement","OR",2,27,988,15386
0,"Like","*food habit*","OR",2,27,988,15387
0,"Like","*weight management*","OR",2,27,988,15388
0,"Like","*health education*","OR",2,36,988,15389
0,"Like","*food supplement","OR",2,36,988,15390
0,"Like","*food habit*","OR",2,36,988,15391
0,"Like","*weight management*","OR",2,36,988,15392
0,"Like","*health education*","OR",2,57,988,15393
0,"Like","*food supplement","OR",2,57,988,15394
0,"Like","*food habit*","OR",2,57,988,15395
0,"Like","*weight management*","OR",2,57,988,15396
0,"Like","*formula*","AND",2,27,989,15397
0,"Like","*food*",,2,27,989,15398
0,"Like","*Agapurin*","OR",1,14,990,15399
0,"Like","*Allohexa*","OR",1,14,990,15400
0,"Like","*Alloprin*","OR",1,14,990,15401
0,"Like","*Allopurin*","OR",1,14,990,15402
0,"Like","*Allorin*","OR",1,14,990,15403
0,"Like","*Allpargin*","OR",1,14,990,15404
0,"Like","*Allural*","OR",1,14,990,15405
0,"Like","*Antistenocardin*","OR",1,14,990,15406
0,"Like","*Apulonga*","OR",1,14,990,15407
0,"Like","*Apurin*","OR",1,14,990,15408
0,"Like","*Atisuril*","OR",1,14,990,15409
0,"Like","*BL-191*","OR",1,14,990,15410
0,"Like","*Bleminol*","OR",1,14,990,15411
0,"Like","*Caplenal*","OR",1,14,990,15412
0,"Like","*Capurate*","OR",1,14,990,15413
0,"Like","*Cellidrin*",,1,14,990,15414
0,"Like","*Cerebrovase*","OR",1,14,991,15415
0,"Like","*Cléridium*","OR",1,14,991,15416
0,"Like","*Curant*","OR",1,14,991,15417
0,"Like","*Dipyramidole*","OR",1,14,991,15418
0,"Like","*Dipyridamole*","OR",1,14,991,15419
0,"Like","*Embarin*","OR",1,14,991,15420
0,"Like","*Foligan*","OR",1,14,991,15421
0,"Like","*Hamarin*","OR",1,14,991,15422
0,"Like","*Hypoxanthine Dehydrogenase*","OR",1,14,991,15423
0,"Like","*Hypoxanthine Oxidase*","OR",1,14,991,15424
0,"Like","*Jenapurinol*","OR",1,14,991,15425
0,"Like","*Kurantil*","OR",1,14,991,15426
0,"Like","*Lopurin*","OR",1,14,991,15427
0,"Like","*Lysuron*","OR",1,14,991,15428
0,"Like","*Milurit*","OR",1,14,991,15429
0,"Like","*Miosen*",,1,14,991,15430
0,"Like","*Novo-Dipiradol*","OR",1,14,992,15431
0,"Like","*Novopurol*","OR",1,14,992,15432
0,"Like","*Oxpentifylline*","OR",1,14,992,15433
0,"Like","*Pan Quimica*","OR",1,14,992,15434
0,"Like","*Pentoxifylline*","OR",1,14,992,15435
0,"Like","*Pentoxil*","OR",1,14,992,15436
0,"Like","*Persantin*","OR",1,14,992,15437
0,"Like","*Progout*","OR",1,14,992,15438
0,"Like","*Pureduct*","OR",1,14,992,15439
0,"Like","*Purine*","OR",1,14,992,15440
0,"Like","*Purinol*","OR",1,14,992,15441
0,"Like","*Remid*","OR",1,14,992,15442
0,"Like","*Rimapurinol*","OR",1,14,992,15443
0,"Like","*Roucol*","OR",1,14,992,15444
0,"Like","*Suspendol*","OR",1,14,992,15445
0,"Like","*Tipuric*",,1,14,992,15446
0,"Like","*Torental*","OR",1,14,993,15447
0,"Like","*Trental*","OR",1,14,993,15448
0,"Like","*Uribenz*","OR",1,14,993,15449
0,"Like","*Uridocid*","OR",1,14,993,15450
0,"Like","*Uripurinol*","OR",1,14,993,15451
0,"Like","*Urosin*","OR",1,14,993,15452
0,"Like","*Urtias*","OR",1,14,993,15453
0,"Like","*Xanthine Oxidase*","OR",1,14,993,15454
0,"Like","*Xanthomax*","OR",1,14,993,15455
0,"Like","*Xanturic*","OR",1,14,993,15456
0,"Like","*Zygout*","OR",1,14,993,15457
0,"Like","*Zyloprim*","OR",1,14,993,15458
0,"Like","*Zyloric*","OR",1,14,993,15459
0,"Like","*delusional disorder*","OR",2,27,994,15460
0,"Like","*paranoia*","OR",2,27,994,15461
0,"Like","*paranoid psychosis*","OR",2,27,994,15462
0,"Like","*paranoid state*","OR",2,27,994,15463
0,"Like","*paraphrenia*","OR",2,27,994,15464
0,"Like","*delusional disorder*","OR",2,36,994,15465
0,"Like","*paranoia*","OR",2,36,994,15466
0,"Like","*paranoid psychosis*","OR",2,36,994,15467
0,"Like","*paranoid state*","OR",2,36,994,15468
0,"Like","*paraphrenia*","OR",2,36,994,15469
0,"Like","*delusional disorder*","OR",2,57,994,15470
0,"Like","*paranoia*","OR",2,57,994,15471
0,"Like","*paranoid psychosis*","OR",2,57,994,15472
0,"Like","*paranoid state*","OR",2,57,994,15473
0,"Like","*paraphrenia*",,2,57,994,15474
0,"Like","*sensitiver Beziehungswahn*","OR",2,27,995,15475
0,"Like","*erotomania*","OR",2,27,995,15476
0,"Like","*de Clerambault syndrome*","OR",2,27,995,15477
0,"Like","*delusional jealousy*","OR",2,27,995,15478
0,"Like","*othello syndrome*","OR",2,27,995,15479
0,"Like","*sensitiver Beziehungswahn*","OR",2,36,995,15480
0,"Like","*erotomania*","OR",2,36,995,15481
0,"Like","*de Clerambault syndrome*","OR",2,36,995,15482
0,"Like","*delusional jealousy*","OR",2,36,995,15483
0,"Like","*othello syndrome*","OR",2,36,995,15484
0,"Like","*sensitiver Beziehungswahn*","OR",2,57,995,15485
0,"Like","*erotomania*","OR",2,57,995,15486
0,"Like","*de Clerambault syndrome*","OR",2,57,995,15487
0,"Like","*delusional jealousy*","OR",2,57,995,15488
0,"Like","*othello syndrome*",,2,57,995,15489
0,"Like","*hypersaliv*","OR",2,27,996,15490
0,"Like","*hypersaliv*","OR",2,36,996,15491
0,"Like","*hypersaliv*","OR",2,57,996,15492
0,"Like","*drool*","OR",2,27,996,15493
0,"Like","*drool*","OR",2,36,996,15494
0,"Like","*drool*","OR",2,57,996,15495
0,"Like","* saliva*","OR",2,27,996,15496
0,"Like","* saliva*","OR",2,36,996,15497
0,"Like","* saliva*","OR",2,57,996,15498
0,"Like","*ptyalism*","OR",2,27,996,15499
0,"Like","*ptyalism*","OR",2,36,996,15500
0,"Like","*ptyalism*","OR",2,57,996,15501
0,"Like","*sialism*","OR",2,27,996,15502
0,"Like","*sialism*","OR",2,36,996,15503
0,"Like","*sialism*","OR",2,57,996,15504
0,"Like","*sailorr*","OR",2,27,996,15505
0,"Like","*sailorr*","OR",2,36,996,15506
0,"Like","*sailorr*",,2,57,996,15507
0,"Like","*hypersalivation*","OR",1,15,997,15508
0,"Like","*hypersaliv*","OR",1,17,997,15509
0,"Like","*drool*","OR",1,17,997,15510
0,"Like","* saliva*","OR",1,17,997,15511
0,"Like","*ptyalism*","OR",1,17,997,15512
0,"Like","*sialism*","OR",1,17,997,15513
0,"Like","*sailorr*",,1,17,997,15514
0,"Like","*cessation*","OR",2,27,998,15515
0,"Like","*withdr?w*","OR",2,27,998,15516
0,"Like","*discontinu*","OR",2,27,998,15517
0,"Like","*halt*","OR",2,27,998,15518
0,"Like","*stop*","OR",2,27,998,15519
0,"Like","*drop?out*","OR",2,27,998,15520
0,"Like","*cessation*","OR",2,36,998,15521
0,"Like","*withdr?w*","OR",2,36,998,15522
0,"Like","*discontinu*","OR",2,36,998,15523
0,"Like","*halt*","OR",2,36,998,15524
0,"Like","*stop*","OR",2,36,998,15525
0,"Like","*drop?out*","OR",2,36,998,15526
0,"Like","*cessation*","OR",2,57,998,15527
0,"Like","*withdr?w*","OR",2,57,998,15528
0,"Like","*discontinu*","OR",2,57,998,15529
0,"Like","*halt*","OR",2,57,998,15530
0,"Like","*stop*","OR",2,57,998,15531
0,"Like","*drop?out*","OR",2,57,998,15532
0,"Like","*dropout*","OR",2,27,999,15533
0,"Like","*rehospitalis*","OR",2,27,999,15534
0,"Like","*relaps*","OR",2,27,999,15535
0,"Like","*maintain*","OR",2,27,999,15536
0,"Like","*maintenance*","OR",2,27,999,15537
0,"Like","*recur*","OR",2,27,999,15538
0,"Like","*dropout*","OR",2,36,999,15539
0,"Like","*rehospitalis*","OR",2,36,999,15540
0,"Like","*relaps*","OR",2,36,999,15541
0,"Like","*maintain*","OR",2,36,999,15542
0,"Like","*maintenance*","OR",2,36,999,15543
0,"Like","*recur*","OR",2,36,999,15544
0,"Like","*dropout*","OR",2,57,999,15545
0,"Like","*rehospitalis*","OR",2,57,999,15546
0,"Like","*relaps*","OR",2,57,999,15547
0,"Like","*maintain*","OR",2,57,999,15548
0,"Like","*maintenance*","OR",2,57,999,15549
0,"Like","*recur*","OR",2,57,999,15550
0,"Like","*olanz*","OR",1,14,1000,15551
0,"Like","*zyprex*","OR",1,14,1000,15552
0,"Like","*LY?170053*","OR",1,14,1000,15553
0,"Like","*LY?170052*","OR",1,14,1000,15554
0,"Like","*lanzac*","OR",1,14,1000,15555
0,"Like","*olansek*","OR",1,14,1000,15556
0,"Like","*zydis*","OR",1,14,1000,15557
0,"Like","*zypadhera*",,1,14,1000,15558
0,"Like","*education*","OR",1,14,1001,15559
0,"Like","*health promot*","OR",1,14,1001,15560
0,"Like","*preventi*","OR",1,14,1001,15561
0,"Like","*motivate*","OR",1,14,1001,15562
0,"Like","*advice*","OR",1,14,1001,15563
0,"Like","*monitor*",,1,14,1001,15564
0,"Like","*early warning sign*","OR",2,27,1002,15565
0,"Like","* ews *","OR",2,27,1002,15566
0,"Like","*coping start*","OR",2,27,1002,15567
0,"Like","*coping skill*","OR",2,27,1002,15568
0,"Like","*coping method*","OR",2,27,1002,15569
0,"Like","*early warning sign*","OR",2,36,1002,15570
0,"Like","* ews *","OR",2,36,1002,15571
0,"Like","*coping start*","OR",2,36,1002,15572
0,"Like","*coping skill*","OR",2,36,1002,15573
0,"Like","*coping method*","OR",2,36,1002,15574
0,"Like","*early warning sign*","OR",2,57,1002,15575
0,"Like","* ews *","OR",2,57,1002,15576
0,"Like","*coping start*","OR",2,57,1002,15577
0,"Like","*coping skill*","OR",2,57,1002,15578
0,"Like","*coping method*",,2,57,1002,15579
0,"Like","*aggress*","OR",1,14,1003,15580
0,"Like","*violen*","OR",1,14,1003,15581
0,"Like","*agitat*","OR",1,14,1003,15582
0,"Like","*tranq*",,1,14,1003,15583
0,"Like","*diet*","OR",2,27,1004,15584
0,"Like","*health*","OR",2,27,1004,15585
0,"Like","*blood pressure*","OR",2,27,1004,15586
0,"Like","*hypertension*","OR",2,27,1004,15587
0,"Like","*cholesterol*","OR",2,27,1004,15588
0,"Like","*statin*","OR",2,27,1004,15589
0,"Like","*physical*","OR",1,15,1005,15590
0,"Like","*cardio*","OR",1,15,1005,15591
0,"Like","*metabolic*","OR",1,15,1005,15592
0,"Like","*weight*","OR",1,15,1005,15593
0,"Like","*HIV*","OR",1,15,1005,15594
0,"Like","*AIDS*","OR",1,15,1005,15595
0,"Like","*Tobacc*","OR",1,15,1005,15596
0,"Like","*Smok*","OR",1,15,1005,15597
0,"Like","*sex*","OR",1,15,1005,15598
0,"Like","*medical*","OR",1,15,1005,15599
0,"Like","*dental*","OR",1,15,1005,15600
0,"Like","*alcohol*","OR",1,15,1005,15601
0,"Like","*oral*","OR",1,15,1005,15602
0,"Like","*vision*","OR",1,15,1005,15603
0,"Like","*sight*","OR",1,15,1005,15604
0,"Like","*hearing*","OR",1,15,1005,15605
0,"Like","*nutrition*","OR",1,15,1005,15606
0,"Like","*diet*",,1,15,1005,15607
0,"Like","*health*","OR",1,15,1006,15608
0,"Like","*diabete*","OR",1,15,1006,15609
0,"Like","*blood pressure*","OR",1,15,1006,15610
0,"Like","*hypertension*","OR",1,15,1006,15611
0,"Like","*cholesterol*","OR",1,15,1006,15612
0,"Like","*statin*","OR",1,15,1006,15613
0,"Like","*coercion*","OR",1,14,1007,15614
0,"Like","*coercive*","OR",1,14,1007,15615
0,"Like","*compulsor*","OR",1,14,1007,15616
0,"Like","*immobili*","OR",1,14,1007,15617
0,"Like","*Involunta*","OR",1,14,1007,15618
0,"Like","*isolation*","OR",1,14,1007,15619
0,"Like","*restrai*","OR",1,14,1007,15620
0,"Like","*seclu*",,1,14,1007,15621
0,"Like","*fluphen*","OR",1,14,1008,15622
0,"Like","*flufen*","OR",1,14,1008,15623
0,"Like","*modec*","OR",1,14,1008,15624
0,"Like","*moditen*","OR",1,14,1008,15625
0,"Like","*eutimax*","OR",1,14,1008,15626
0,"Like","*prolixin*","OR",1,14,1008,15627
0,"Like","*siqualon*","OR",1,14,1008,15628
0,"Like","*bromperidol*","OR",1,14,1009,15629
0,"Like","*bromop*","OR",1,14,1009,15630
0,"Like","*azuren*","OR",1,14,1009,15631
0,"Like","*bridel*","OR",1,14,1009,15632
0,"Like","*bromidol*","OR",1,14,1009,15633
0,"Like","*erodium*","OR",1,14,1009,15634
0,"Like","*impromen*","OR",1,14,1009,15635
0,"Like","*lunapron*","OR",1,14,1009,15636
0,"Like","*prindil*","OR",1,14,1009,15637
0,"Like","*ropel*","OR",1,14,1009,15638
0,"Like","*tesoprel*","OR",1,14,1009,15639
0,"Like","*r 11.333*","OR",1,14,1009,15640
0,"Like","*r 46541*","OR",1,14,1009,15641
0,"Like","*r46541*",,1,14,1009,15642
0,"Like","*post?natal*","OR",2,27,1010,15643
0,"Like","*post?partum*","OR",2,27,1010,15644
0,"Like","*baby?blues*","OR",2,27,1010,15645
0,"Like","*Puerperal*","OR",2,27,1010,15646
0,"Like","*post?natal*","OR",2,36,1010,15647
0,"Like","*post?partum*","OR",2,36,1010,15648
0,"Like","*baby?blues*","OR",2,36,1010,15649
0,"Like","*Puerperal*","OR",2,36,1010,15650
0,"Like","*post?natal*","OR",2,57,1010,15651
0,"Like","*post?partum*","OR",2,57,1010,15652
0,"Like","*baby?blues*","OR",2,57,1010,15653
0,"Like","*Puerperal*",,2,57,1010,15654
0,"Like","*carbama*","OR",1,14,1011,15655
0,"Like","*amizepine*","OR",1,14,1011,15656
0,"Like","*carbag*","OR",1,14,1011,15657
0,"Like","*carbap*","OR",1,14,1011,15658
0,"Like","*carbaz*","OR",1,14,1011,15659
0,"Like","*carbymal*","OR",1,14,1011,15660
0,"Like","*carpaz*","OR",1,14,1011,15661
0,"Like","*cephalon*","OR",1,14,1011,15662
0,"Like","*degranol*","OR",1,14,1011,15663
0,"Like","*epitol*",,1,14,1011,15664
0,"Like","*degranol*","OR",1,14,1012,15665
0,"Like","*epitol*","OR",1,14,1012,15666
0,"Like","*finlepsin*","OR",1,14,1012,15667
0,"Like","*fokalepsin*","OR",1,14,1012,15668
0,"Like","*hermolepsin*","OR",1,14,1012,15669
0,"Like","*neurotol*","OR",1,14,1012,15670
0,"Like","*neurotop*","OR",1,14,1012,15671
0,"Like","*nordotol*","OR",1,14,1012,15672
0,"Like","*sirtal*","OR",1,14,1013,15673
0,"Like","*tardotol*","OR",1,14,1013,15674
0,"Like","*tegret*","OR",1,14,1013,15675
0,"Like","*teril*","OR",1,14,1013,15676
0,"Like","*timonil*","OR",1,14,1013,15677
0,"Like","*trimonil*","OR",1,14,1013,15678
0,"Like","*trialeptal*","OR",1,14,1013,15679
0,"Like","*trilpetal*","OR",1,14,1013,15680
0,"Like","*lithium*","OR",1,14,1014,15681
0,"Like","*lithicarb*","OR",1,14,1014,15682
0,"Like","*eskalith*","OR",1,14,1014,15683
0,"Like","*lithobid*","OR",1,14,1014,15684
0,"Like","*lithane*","OR",1,14,1014,15685
0,"Like","*cibalith-s*","OR",1,14,1014,15686
0,"Like","*quilonum*","OR",1,14,1014,15687
0,"Like","*hypnorex*",,1,14,1014,15688
0,"Like","*valproat*","OR",1,14,1015,15689
0,"Like","*valproic acid*","OR",1,14,1015,15690
0,"Like","*sodium valproate*","OR",1,14,1015,15691
0,"Like","*sodium dipropylacetate*","OR",1,14,1015,15692
0,"Like","*calcium valproate*","OR",1,14,1015,15693
0,"Like","*convulex*","OR",1,14,1015,15694
0,"Like","*depakene*","OR",1,14,1015,15695
0,"Like","*ergenyl*",,1,14,1015,15696
0,"Like","*Clopenthixol*","OR",1,14,1016,15697
0,"Like","* 0-108*","OR",1,14,1016,15698
0,"Like","*cisordinol*","OR",1,14,1016,15699
0,"Like","*clopixol*","OR",1,14,1016,15700
0,"Like","zuclopenthix*","OR",1,14,1016,15701
0,"Like","* ciatyl*",,1,14,1016,15702
0,"Like","*didactic*","OR",2,27,1017,15703
0,"Like","*video*","OR",2,27,1017,15704
0,"Like","*role?play*","OR",2,27,1017,15705
0,"Like","*e?learning*","OR",2,27,1017,15706
0,"Like","*active?learning*","OR",2,27,1017,15707
0,"Like","*didactic*","OR",2,36,1017,15708
0,"Like","*video*","OR",2,36,1017,15709
0,"Like","*role?play*","OR",2,36,1017,15710
0,"Like","*e?learning*","OR",2,36,1017,15711
0,"Like","*active?learning*","OR",2,36,1017,15712
0,"Like","*didactic*","OR",2,57,1017,15713
0,"Like","*video*","OR",2,57,1017,15714
0,"Like","*role?play*","OR",2,57,1017,15715
0,"Like","*e?learning*","OR",2,57,1017,15716
0,"Like","*active?learning*",,2,57,1017,15717
0,"Like","*consultation skill*","OR",2,27,1018,15718
0,"Like","*communication skill*","OR",2,27,1018,15719
0,"Like","*consultation skill*","OR",2,36,1018,15720
0,"Like","*communication skill*","OR",2,36,1018,15721
0,"Like","*consultation skill*","OR",2,57,1018,15722
0,"Like","*communication skill*","OR",2,57,1018,15723
0,"Like","*depot*","OR",2,27,1019,15724
0,"Like","*long-act*","OR",2,27,1019,15725
0,"Like","*long act*","OR",2,27,1019,15726
0,"Like","*LAI*","OR",2,27,1019,15727
0,"Like","*depot*","OR",2,36,1019,15728
0,"Like","*long-act*","OR",2,36,1019,15729
0,"Like","*long act*","OR",2,36,1019,15730
0,"Like","*LAI*","OR",2,36,1019,15731
0,"Like","*depot*","OR",2,57,1019,15732
0,"Like","*long-act*","OR",2,57,1019,15733
0,"Like","*LAI*","OR",2,57,1019,15734
0,"Like","*long act*",,2,57,1019,15735
0,"Like","*Treatment?resist*","OR",2,27,1020,15736
0,"Like","*non?respon*","OR",2,27,1020,15737
0,"Like","*non?remission*","OR",2,27,1020,15738
0,"Like","*non?remitter*","OR",2,27,1020,15739
0,"Like","*Therapy?Resist*","OR",2,27,1020,15740
0,"Like","*Treatment?resist*","OR",2,36,1020,15741
0,"Like","*non?respon*","OR",2,36,1020,15742
0,"Like","*non?remission*","OR",2,36,1020,15743
0,"Like","*non?remitter*","OR",2,36,1020,15744
0,"Like","*Therapy?Resist*","OR",2,36,1020,15745
0,"Like","*Treatment?resist*","OR",2,57,1020,15746
0,"Like","*non?respon*","OR",2,57,1020,15747
0,"Like","*non?remission*","OR",2,57,1020,15748
0,"Like","*non?remitter*","OR",2,57,1020,15749
0,"Like","*Therapy?Resist*",,2,57,1020,15750
0,"Like","*serazon*","OR",1,14,1021,15751
0,"Like","*sonazin*","OR",1,14,1021,15752
0,"Like","*thoradex*","OR",1,14,1021,15753
0,"Like","*thorazine*","OR",1,14,1021,15754
0,"Like","*tranzine*",,1,14,1021,15755
0,"Like","* depot*","OR",2,27,1022,15756
0,"Like","* microsph*","OR",2,27,1022,15757
0,"Like","* micro-sp*","OR",2,27,1022,15758
0,"Like","* long-acting*","OR",2,27,1022,15759
0,"Like","* long act*","OR",2,27,1022,15760
0,"Like","* depot*","OR",2,36,1022,15761
0,"Like","* microsph*","OR",2,36,1022,15762
0,"Like","* micro-sp*","OR",2,36,1022,15763
0,"Like","* long-acting*","OR",2,36,1022,15764
0,"Like","* long act*",,2,36,1022,15765
0,"Like","* depot*","OR",2,57,1022,15766
0,"Like","* microsph*","OR",2,57,1022,15767
0,"Like","* micro-sp*","OR",2,57,1022,15768
0,"Like","* long-acting*","OR",2,57,1022,15769
0,"Like","* long act*","OR",2,57,1022,15770
0,"Like","*atomoxetine*","OR",1,14,1023,15771
0,"Like","*attentin*","OR",1,14,1023,15772
0,"Like","*beloxepin*","OR",1,14,1023,15773
0,"Like","*davedax*","OR",1,14,1023,15774
0,"Like","*edonax*","OR",1,14,1023,15775
0,"Like","*edronax*","OR",1,14,1023,15776
0,"Like","*esreboxetine*","OR",1,14,1023,15777
0,"Like","*FCE 20124*","OR",1,14,1023,15778
0,"Like","*FCE 21684*","OR",1,14,1023,15779
0,"Like","*LY 139602 *","OR",1,14,1023,15780
0,"Like","*LY 139603*",,1,14,1023,15781
0,"Like","*nisoxetine*","OR",1,14,1024,15782
0,"Like","*norebox*","OR",1,14,1024,15783
0,"Like","*Org 4428*","OR",1,14,1024,15784
0,"Like","*prolift*","OR",1,14,1024,15785
0,"Like","*reboxetine*","OR",1,14,1024,15786
0,"Like","*solvex*","OR",1,14,1024,15787
0,"Like","*norepinephrine reuptake*","OR",2,27,1025,15788
0,"Like","*noradrenaline reuptake*","OR",2,27,1025,15789
0,"Like","*norepinephrine reuptake*","OR",2,36,1025,15790
0,"Like","*noradrenaline reuptake*","OR",2,36,1025,15791
0,"Like","*norepinephrine reuptake*","OR",2,57,1025,15792
0,"Like","*noradrenaline reuptake*",,2,57,1025,15793
0,"Like","* IM *","OR",2,27,1026,15794
0,"Like","*intramuscular*","OR",2,27,1026,15795
0,"Like","*velotab*","OR",2,27,1026,15796
0,"Like","*orodispersible*","OR",2,27,1026,15797
0,"Like","*tablet*",,2,27,1026,15798
0,"Like","*support*","OR",1,14,1027,15799
0,"Like","*individual*","OR",1,14,1027,15800
0,"Like","*sociotherapy*","OR",1,14,1027,15801
0,"Like","*socioenvir*",,1,14,1027,15802
0,"Like","*support*","OR",2,27,1028,15803
0,"Like","*advoc*","OR",2,27,1028,15804
0,"Like","*sociotherapy*","OR",2,27,1028,15805
0,"Like","*socioenvir*","OR",2,27,1028,15806
0,"Like","*individual*",,2,27,1028,15807
0,"Like","*Sibling*","OR",2,27,1029,15808
0,"Like","*brother*","OR",2,27,1029,15809
0,"Like","*Sister*","OR",2,27,1029,15810
0,"Like","*family*","OR",2,27,1029,15811
0,"Like","*Sibling*","OR",2,36,1029,15812
0,"Like","*brother*","OR",2,36,1029,15813
0,"Like","*Sister*","OR",2,36,1029,15814
0,"Like","*family*","OR",2,36,1029,15815
0,"Like","*Sibling*","OR",2,57,1029,15816
0,"Like","*brother*","OR",2,57,1029,15817
0,"Like","*Sister*","OR",2,57,1029,15818
0,"Like","*family*",,2,57,1029,15819
0,"Like","*homeless*","OR",2,27,1030,15820
0,"Like","*vagrant*","OR",2,27,1030,15821
0,"Like","*homeless*","OR",2,36,1030,15822
0,"Like","*vagrant*","OR",2,36,1030,15823
0,"Like","*homeless*","OR",2,57,1030,15824
0,"Like","*vagrant*","OR",2,57,1030,15825
0,"Like","*homeless*",,1,14,1031,15826
0,"Like","*home*","OR",1,15,1031,15827
0,"Like","*antidepress*","OR",1,14,1032,15828
0,"Like","*triptylin*","OR",1,14,1032,15829
0,"Like","*ipramin*","OR",1,14,1032,15830
0,"Like","*oxetin*","OR",1,14,1032,15831
0,"Like","*azadon*","OR",1,14,1032,15832
0,"Like","*amineptin*","OR",1,14,1032,15833
0,"Like","*bupropion*",,1,14,1032,15834
0,"Like","*citalopram*","OR",1,14,1033,15835
0,"Like","*doxepin*","OR",1,14,1033,15836
0,"Like","*flupent*","OR",1,14,1033,15837
0,"Like","*fluvoxamin*","OR",1,14,1033,15838
0,"Like","*gamfexin*","OR",1,14,1033,15839
0,"Like","*iproniazid*","OR",1,14,1033,15840
0,"Like","*isocarboxazid*","OR",1,14,1033,15841
0,"Like","*rubidium*","OR",1,14,1034,15842
0,"Like","*sertralin*","OR",1,14,1034,15843
0,"Like","*tranycypromin*","OR",1,14,1034,15844
0,"Like","*tryptophan*","OR",1,14,1034,15845
0,"Like","*viloxazin*","OR",1,14,1034,15846
0,"Like","*ameser*","OR",1,14,1034,15847
0,"Like","*amoxapin*","OR",1,14,1034,15848
0,"Like","*benactyzin*","OR",1,14,1035,15849
0,"Like","*brofaro*","OR",1,14,1035,15850
0,"Like","*caroxa*","OR",1,14,1035,15851
0,"Like","*pramin*","OR",1,14,1035,15852
0,"Like","*clorgy*","OR",1,14,1035,15853
0,"Like","*oxamine*","OR",1,14,1035,15854
0,"Like","*Lurasidone*","OR",2,27,1036,15855
0,"Like","*SM?13496*","OR",2,27,1036,15856
0,"Like","*SM-13496*","OR",2,27,1036,15857
0,"Like","*SM13496*","OR",2,27,1036,15858
0,"Like","*MK 3756*","OR",2,27,1036,15859
0,"Like","*SMP 13496*","OR",2,27,1036,15860
0,"Like","*Lurasidone*","OR",2,36,1036,15861
0,"Like","*SM?13496*","OR",2,36,1036,15862
0,"Like","*SM-13496*","OR",2,36,1036,15863
0,"Like","*SM13496*","OR",2,36,1036,15864
0,"Like","*MK 3756*","OR",2,36,1036,15865
0,"Like","*SMP 13496*","OR",2,36,1036,15866
0,"Like","*Lurasidone*","OR",2,57,1036,15867
0,"Like","*SM?13496*","OR",2,57,1036,15868
0,"Like","*SM-13496*","OR",2,57,1036,15869
0,"Like","*SM13496*","OR",2,57,1036,15870
0,"Like","*MK 3756*","OR",2,57,1036,15871
0,"Like","*Lurasidone*","OR",1,14,1037,15872
0,"Like","*SM?13496*","OR",1,14,1037,15873
0,"Like","*SM-13496*","OR",1,14,1037,15874
0,"Like","*SM13496*","OR",1,14,1037,15875
0,"Like","*MK 3756*","OR",1,14,1037,15876
0,"Like","*SMP 13496*",,1,14,1037,15877
0,"Like","* attenta*","OR",2,27,1038,15878
0,"Like","*c 4311-b*","OR",2,27,1038,15879
0,"Like","*centedrin*","OR",2,27,1038,15880
0,"Like","*concerta*","OR",2,27,1038,15881
0,"Like","*daytrana*","OR",2,27,1038,15882
0,"Like","* attenta*","OR",2,36,1038,15883
0,"Like","*c 4311-b*","OR",2,36,1038,15884
0,"Like","*centedrin*","OR",2,36,1038,15885
0,"Like","*concerta*","OR",2,36,1038,15886
0,"Like","*daytrana*","OR",2,36,1038,15887
0,"Like","* attenta*","OR",2,57,1038,15888
0,"Like","*c 4311-b*","OR",2,57,1038,15889
0,"Like","*centedrin*","OR",2,57,1038,15890
0,"Like","*concerta*","OR",2,57,1038,15891
0,"Like","*daytrana*",,2,57,1038,15892
0,"Like","*dexmethylphenidate hydrochloride*","OR",2,27,1039,15893
0,"Like","*equasym*","OR",2,27,1039,15894
0,"Like","*focalin*","OR",2,27,1039,15895
0,"Like","*metadata*","OR",2,27,1039,15896
0,"Like","*methylfenidate*","OR",2,27,1039,15897
0,"Like","*dexmethylphenidate hydrochloride*","OR",2,36,1039,15898
0,"Like","*equasym*","OR",2,36,1039,15899
0,"Like","*focalin*","OR",2,36,1039,15900
0,"Like","*metadata*","OR",2,36,1039,15901
0,"Like","*methylfenidate*","OR",2,36,1039,15902
0,"Like","*dexmethylphenidate hydrochloride*","OR",2,57,1039,15903
0,"Like","*equasym*","OR",2,57,1039,15904
0,"Like","*focalin*","OR",2,57,1039,15905
0,"Like","*metadata*","OR",2,57,1039,15906
0,"Like","*methylfenidate*","OR",2,57,1039,15907
0,"Like","*methylin*","OR",2,27,1040,15908
0,"Like","*methylphenidate*","OR",2,27,1040,15909
0,"Like","*methylphenidylacetate*","OR",2,27,1040,15910
0,"Like","*methylphenindate*","OR",2,27,1040,15911
0,"Like","*methylphenidate*","OR",2,27,1040,15912
0,"Like","*methylin*","OR",2,36,1040,15913
0,"Like","*methylphenidate*","OR",2,36,1040,15914
0,"Like","*methylphenidylacetate*","OR",2,36,1040,15915
0,"Like","*methylphenindate*","OR",2,36,1040,15916
0,"Like","*methylphenidate*","OR",2,36,1040,15917
0,"Like","*methylin*","OR",2,57,1040,15918
0,"Like","*methylphenidate*","OR",2,57,1040,15919
0,"Like","*methylphenidylacetate*","OR",2,57,1040,15920
0,"Like","*methylphenindate*","OR",2,57,1040,15921
0,"Like","*methylphenidate*","OR",2,57,1040,15922
0,"Like","*methypatch*","OR",2,27,1041,15923
0,"Like","*medikinet*","OR",2,27,1041,15924
0,"Like","* mpd*","OR",2,27,1041,15925
0,"Like","* mph*","OR",2,27,1041,15926
0,"Like","* penid*","OR",2,27,1041,15927
0,"Like","*methypatch*","OR",2,36,1041,15928
0,"Like","*medikinet*","OR",2,36,1041,15929
0,"Like","* mpd*","OR",2,36,1041,15930
0,"Like","* mph*","OR",2,36,1041,15931
0,"Like","* penid*","OR",2,36,1041,15932
0,"Like","*methypatch*","OR",2,57,1041,15933
0,"Like","*medikinet*","OR",2,57,1041,15934
0,"Like","* mpd*","OR",2,57,1041,15935
0,"Like","* mph*","OR",2,57,1041,15936
0,"Like","* penid*",,2,57,1041,15937
0,"Like","*phenidylate*","OR",2,27,1042,15938
0,"Like","*ritalin*","OR",2,27,1042,15939
0,"Like","*ritaphen*","OR",2,27,1042,15940
0,"Like","*rubifen*","OR",2,27,1042,15941
0,"Like","*tranquilyn*","OR",2,27,1042,15942
0,"Like","*phenidylate*","OR",2,36,1042,15943
0,"Like","*ritalin*","OR",2,36,1042,15944
0,"Like","*ritaphen*","OR",2,36,1042,15945
0,"Like","*rubifen*","OR",2,36,1042,15946
0,"Like","*tranquilyn*","OR",2,36,1042,15947
0,"Like","*phenidylate*","OR",2,57,1042,15948
0,"Like","*ritalin*","OR",2,57,1042,15949
0,"Like","*ritaphen*","OR",2,57,1042,15950
0,"Like","*rubifen*","OR",2,57,1042,15951
0,"Like","*tranquilyn*",,2,57,1042,15952
0,"Like","*tsentedrin*","OR",2,27,1043,15953
0,"Like","*tsentedrin*","OR",2,36,1043,15954
0,"Like","*tsentedrin*","OR",2,57,1043,15955
0,"Like","* attenta*","OR",1,14,1044,15956
0,"Like","*c 4311-b*","OR",1,14,1044,15957
0,"Like","*c4311b*","OR",1,14,1044,15958
0,"Like","*centedrin*","OR",1,14,1044,15959
0,"Like","*concerta*","OR",1,14,1044,15960
0,"Like","*daytrana*","OR",1,14,1044,15961
0,"Like","*dexmethylphenidate hydrochloride*","OR",1,14,1044,15962
0,"Like","*equasym*",,1,14,1044,15963
0,"Like","*focalin*","OR",1,14,1045,15964
0,"Like","*metadata*","OR",1,14,1045,15965
0,"Like","*methylfenidate*","OR",1,14,1045,15966
0,"Like","*methylin*","OR",1,14,1045,15967
0,"Like","*methylphenidate*","OR",1,14,1045,15968
0,"Like","*methylphenidylacetate*","OR",1,14,1045,15969
0,"Like","*methylphenindate*","OR",1,14,1045,15970
0,"Like","*methylphenidate*",,1,14,1045,15971
0,"Like","*methylphenindate*","OR",1,14,1046,15972
0,"Like","*methylphenidate*","OR",1,14,1046,15973
0,"Like","*methypatch*","OR",1,14,1046,15974
0,"Like","*medikinet*","OR",1,14,1046,15975
0,"Like","* mpd*","OR",1,14,1046,15976
0,"Like","* mph*","OR",1,14,1046,15977
0,"Like","* penid*",,1,14,1046,15978
0,"Like","*phenidylate*","OR",1,14,1047,15979
0,"Like","*ritalin*","OR",1,14,1047,15980
0,"Like","*ritaphen*","OR",1,14,1047,15981
0,"Like","*rubifen*","OR",1,14,1047,15982
0,"Like","*tranquilyn*","OR",1,14,1047,15983
0,"Like","*tsentedrin*","OR",1,14,1047,15984
0,"Like","*illness management*","OR",2,27,1048,15985
0,"Like","*imr*","OR",2,27,1048,15986
0,"Like","*illness management*","OR",2,36,1048,15987
0,"Like","*imr*",,2,36,1048,15988
0,"Like","*illness management*","OR",2,57,1048,15989
0,"Like","*imr*","OR",2,57,1048,15990
0,"Like","*imr*","OR",1,14,1049,15991
0,"Like","*illness management*",,1,14,1049,15992
0,"Like","*Pyridoxal*","OR",2,27,1050,15993
0,"Like","*Pyridoxine*","OR",2,27,1050,15994
0,"Like","*P5P*","OR",2,27,1050,15995
0,"Like","*PLP*","OR",2,27,1050,15996
0,"Like","*tardoxal*","OR",2,27,1050,15997
0,"Like","*Pyridoxal*","OR",2,36,1050,15998
0,"Like","*Pyridoxine*","OR",2,36,1050,15999
0,"Like","*P5P*","OR",2,36,1050,16000
0,"Like","*PLP*","OR",2,36,1050,16001
0,"Like","*tardoxal*","OR",2,36,1050,16002
0,"Like","*Pyridoxal*","OR",2,57,1050,16003
0,"Like","*Pyridoxine*","OR",2,57,1050,16004
0,"Like","*P5P*","OR",2,57,1050,16005
0,"Like","*PLP*","OR",2,57,1050,16006
0,"Like","*tardoxal*",,2,57,1050,16007
0,"Like","*Vitamin B6*","OR",2,27,1051,16008
0,"Like","*Vitamin B 6*","OR",2,27,1051,16009
0,"Like","*Vitamin B6*","OR",2,36,1051,16010
0,"Like","*Vitamin B 6*","OR",2,36,1051,16011
0,"Like","*Vitamin B6*","OR",2,57,1051,16012
0,"Like","*Vitamin B 6*","OR",2,57,1051,16013
0,"Like","*amphetamine*","OR",2,27,1052,16014
0,"Like","*hallucigen*","OR",2,27,1052,16015
0,"Like","*amphetamine*","OR",2,36,1052,16016
0,"Like","*hallucigen*","OR",2,36,1052,16017
0,"Like","*amphetamine*","OR",2,57,1052,16018
0,"Like","*hallucigen*",,2,57,1052,16019
0,"Like","*crime*","OR",2,27,1053,16020
0,"Like","*crime*","OR",2,36,1053,16021
0,"Like","*crime*","OR",2,57,1053,16022
0,"Like","*criminal*","OR",2,27,1053,16023
0,"Like","*criminal*","OR",2,36,1053,16024
0,"Like","*criminal*","OR",2,57,1053,16025
0,"Like","*victim*","OR",2,27,1053,16026
0,"Like","*victim*","OR",2,36,1053,16027
0,"Like","*victim*","OR",2,57,1053,16028
0,"Like","*fraud*","OR",2,27,1053,16029
0,"Like","*fraud*","OR",2,36,1053,16030
0,"Like","*fraud*",,2,57,1053,16031
0,"Like","*homicide*","OR",2,27,1054,16032
0,"Like","*sex offen*","OR",2,27,1054,16033
0,"Like","* rape*","OR",2,27,1054,16034
0,"Like","*theft*","OR",2,27,1054,16035
0,"Like","*homicide*","OR",2,36,1054,16036
0,"Like","*sex offen*","OR",2,36,1054,16037
0,"Like","* rape*","OR",2,36,1054,16038
0,"Like","*theft*","OR",2,36,1054,16039
0,"Like","*homicide*","OR",2,57,1054,16040
0,"Like","*sex offen*","OR",2,57,1054,16041
0,"Like","* rape*","OR",2,57,1054,16042
0,"Like","*theft*",,2,57,1054,16043
0,"Like","*assault*","OR",2,27,1055,16044
0,"Like","*mugg*","OR",2,27,1055,16045
0,"Like","*robb*","OR",2,27,1055,16046
0,"Like","*burglar*","OR",2,27,1055,16047
0,"Like","*vandalis*","OR",2,27,1055,16048
0,"Like","*assault*","OR",2,36,1055,16049
0,"Like","*mugg*","OR",2,36,1055,16050
0,"Like","*robb*","OR",2,36,1055,16051
0,"Like","*burglar*","OR",2,36,1055,16052
0,"Like","*vandalis*","OR",2,36,1055,16053
0,"Like","*assault*","OR",2,57,1055,16054
0,"Like","*mugg*","OR",2,57,1055,16055
0,"Like","*robb*","OR",2,57,1055,16056
0,"Like","*burglar*","OR",2,57,1055,16057
0,"Like","*vandalis*",,2,57,1055,16058
0,"Like","*aggress*","OR",2,27,1056,16059
0,"Like","*abus*","OR",2,27,1056,16060
0,"Like","*violence*","OR",2,27,1056,16061
0,"Like","*batter*","OR",2,27,1056,16062
0,"Like","*beat*","OR",2,27,1056,16063
0,"Like","*aggress*","OR",2,36,1056,16064
0,"Like","*abus*","OR",2,36,1056,16065
0,"Like","*violence*","OR",2,36,1056,16066
0,"Like","*batter*","OR",2,36,1056,16067
0,"Like","*beat*","OR",2,36,1056,16068
0,"Like","*aggress*","OR",2,57,1056,16069
0,"Like","*abus*","OR",2,57,1056,16070
0,"Like","*violence*","OR",2,57,1056,16071
0,"Like","*batter*","OR",2,57,1056,16072
0,"Like","*beat*",,2,57,1056,16073
0,"Like","*victim*","OR",2,27,1057,16074
0,"Like","*crime*","OR",2,27,1057,16075
0,"Like","*criminal*","OR",2,27,1057,16076
0,"Like","*domestic*","OR",2,27,1057,16077
0,"Like","*partner*","OR",2,27,1057,16078
0,"Like","*victim*","OR",2,36,1057,16079
0,"Like","*crime*","OR",2,36,1057,16080
0,"Like","*criminal*","OR",2,36,1057,16081
0,"Like","*domestic*","OR",2,36,1057,16082
0,"Like","*partner*","OR",2,36,1057,16083
0,"Like","*victim*","OR",2,57,1057,16084
0,"Like","*crime*","OR",2,57,1057,16085
0,"Like","*criminal*","OR",2,57,1057,16086
0,"Like","*domestic*","OR",2,57,1057,16087
0,"Like","*partner*",,2,57,1057,16088
0,"Like","*famil*","OR",2,27,1058,16089
0,"Like","*spouse*","OR",2,27,1058,16090
0,"Like"," *carer*","OR",2,27,1058,16091
0,"Like","*famil*","OR",2,36,1058,16092
0,"Like","*spouse*","OR",2,36,1058,16093
0,"Like"," *carer*","OR",2,36,1058,16094
0,"Like","*famil*","OR",2,57,1058,16095
0,"Like","*spouse*","OR",2,57,1058,16096
0,"Like"," *carer*","OR",2,57,1058,16097
0,"Like","*youth*","OR",2,27,1059,16098
0,"Like","*young*","OR",2,27,1059,16099
0,"Like","*pediatri*","OR",2,27,1059,16100
0,"Like","*paediatric*","OR",2,27,1059,16101
0,"Like","*teenag*","OR",2,27,1059,16102
0,"Like","*child*","OR",2,27,1059,16103
0,"Like","*adolesc*",,2,27,1059,16104
0,"Like","*old*","OR",2,27,1060,16105
0,"Like","*elder*","OR",2,27,1060,16106
0,"Like","*paraphrenia*","OR",2,27,1060,16107
0,"Like","*late?onset*","OR",2,27,1060,16108
0,"Like","*older adult*","OR",2,36,1060,16109
0,"Like","*elder*","OR",2,36,1060,16110
0,"Like","*paraphrenia*","OR",2,36,1060,16111
0,"Like","*late?onset*","OR",2,36,1060,16112
0,"Like","*older adult*","OR",2,57,1060,16113
0,"Like","*elder*","OR",2,57,1060,16114
0,"Like","*paraphrenia*","OR",2,57,1060,16115
0,"Like","*late?onset*","OR",2,57,1060,16116
0,"Like","aged*",,2,57,1060,16117
\.
END;
