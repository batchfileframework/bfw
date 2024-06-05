@echo off


REM Call :split-demo
REM GoTo :EOF


:setup
:macro
:main

REM detect if first argument is a existing function in this file
REM detect if first argument is a file in %bfw.root%\lib
REM demo should be case
for %%a in ( %* ) do ( for %%b in ( /h /? -h -? help --help ) do ( if "[%%a]" EQU "[%%b]" ( Call :%~n0-help & exit /b 1 ) ) )
for %%a in ( %* ) do ( if "[%%a]" EQU "[demo]" ( Call :%~n0-demo & exit /b 1 ) ) 
if "[%~n0]" EQU "[bfw]" if "[%~1]" EQU "[]" ( echo %~n0 needs at least one argument & exit /b 1 )
REM if "[%~n0]" EQU "[bfw]" if "[%~1]" EQU "[]" if "[%~2]" EQU "[]" ( echo %~n0 needs at least two argument & exit /b 1 )
if "[%~n0]" EQU "[bfw]" ( Call :ShiftedArgumentCaller %* ) else ( Call :%~n0 %* )

:end


GoTo :EOF



REM bad delimiter found ~[O]xPmyi[PU

REM this string 6`{Xx=;1Z0Eg6$qfi6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o
REM with this delimiter DxHU;q@=D{ju
REM byref
REM Index 0 : result 0  ::"DxHU;q@=D{ju6$qfi6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 1 : result 0  ::"6DxHU;q@=D{ju$qfi6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 2 : result 0  ::"6`DxHU;q@=D{juqfi6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 3 : result 0  ::"6`{DxHU;q@=D{jufi6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 4 : result 0  ::"6`{XDxHU;q@=D{jui6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 5 : result 0  ::"6`{XxDxHU;q@=D{ju6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 6 : result 1  ::"6`{Xx=DxHU;q@=D{jufH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 7 : result 2  ::"6`{Xx=;DxHU;q@=D{juH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 8 : result 3  ::"6`{Xx=;1DxHU;q@=D{ju?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 9 : result 4  ::"6`{Xx=;1ZDxHU;q@=D{ju-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM byval
REM Index 0 : result 0  ::"DxHU;q@=D{ju6$qfi6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 1 : result 0  ::"6DxHU;q@=D{ju$qfi6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 2 : result 0  ::"6`DxHU;q@=D{juqfi6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 3 : result 0  ::"6`{DxHU;q@=D{jufi6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 4 : result 0  ::"6`{XDxHU;q@=D{jui6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 5 : result 0  ::"6`{XxDxHU;q@=D{ju6fH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 6 : result 1  ::"6`{Xx=DxHU;q@=D{jufH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 7 : result 2  ::"6`{Xx=;DxHU;q@=D{juH?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 8 : result 3  ::"6`{Xx=;1DxHU;q@=D{ju?-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::
REM Index 9 : result 4  ::"6`{Xx=;1ZDxHU;q@=D{ju-CN]165::UwjDAm'UCdxC'iv*bQBtu=-nmn*tt\}m,P=A;}\q_z2VsK;hDNbS8aMPI-*xRd,L~].;+o"::

REM problem, 10 first index are 0
REM 20 Alphanumeric random string, with punctuation and space and nopoison 8000 long, 50 count "::9=~A9JTYMfK::" is the search pattern,
REM Test string is ::"h ±ÒßÑ¹\÷ó?oã@x¨õ·IîÀ?u~£íÌ 6·cûß`ÄZ´8xIAÏÚ$Ô»?8s­è?{¿õB?n¯aR??Í¶VXU`$òb©¨?þC:­ø~ôXn«è½ú;õ+k@Z+#F1²ëÇ??ì-½Éx?Eûk?­Kò?Ïf¾ØJDÑáu¿±Å+Á??A³??1øªh÷¸Ëþ´_sÂ-ÞÃÓA9?I6åIr[ëd?ïÕÞD?®[Û´­E»ÐJ =\t¤?.wÞ½õ*çNÈ©Jº?ä­Ø`f¬ÆÂLY]ß??ø°¿ÄQ*½²R²J;µO:??tMG:08½î?±ßþMÝ3³??GA?[T???ðÔ?LcHrî?v?yÃ2­v?Ð??ú{;Å,ÀÇ¡èÝ§ã?`ûviÔ¦ ?AÆ?hªÙ{]ÏÓ??r¢??Ë?a4?ò³ËÕá»éÍÝ?ZUÛ½ÌaÇ'Âöv¦??uh¿p¥ççÓ[fú??ÜÒlÞx¨¥JÂT?qP???ìRc·M¬=,µ?Ý3ÅÉã_nOx¿?áå?ÜNÎÛNµÄØû7???v¨p{sêï°.ëb?[23þÁAÉUyMü7ÊDEaa?v?Æèl?ËêäÀÏòéK'Ù\WHã'íHõµ??¯ ¬Û_?Ô$ì4q8ø??jBJß-FJ?CäÉÊý3?Ð1Ò?6 Rw¼z³K?¡ü4?Kéêc$ ?pr¹'\2R'p¸vìæ?Ös´ñ·äd~ÓX?ñIÝè¨?Óèoæ¡y?Ü#@ål¬h4_8ÿ»?9?×¦uòåÖf?¹g¿E?×?®f¾¯ã;¶C®/Ä??¦®-H?¥?øT?\íÄnù~¥âP?ö*LÞÍ?$Úz6?Ró»?S=sç?q?ù~û?á­?ÒC±H×hb?á?? ö? ¶n£?iÓ??Ä?öÎd}]æ ??ÓõV®B¢¿5?¤?Êûâ+-?i`á9à?'?óðã4MÊ9N×fhqÒyslïz@¾Ö?¿Á?Bq?ï+û:­,??óXvÀï?÷ÿÅñóöy???æà¨°2:¤]á?SFFÌ¥'eÝÍ?àÉp`8ótGÃÑèñQÕ?»i¿uI?Sµ2Ìw~µç³íîÀGÍ?÷6Àû{?ö?'¸?i4?KK5ã#nKåáï?,T?Î?Í²Ð¥¦øgÁ[ÎaçË]?y?Rïù9Gtz2¯±ZjÓ?trQ?ï?UkÙ°,.«»¶Nßàh«cS·Ó¯Ø§ùß?§?ÐS?øðC?6y?VÔeHz3¤Qü/?º?Á¯ÛõÙqaxD?K¿cî°~ÞRÝdÂ}ÿhô?«fô?Dß²AÊm@???©}ÞQ?è/ü}]0Ä?gÑ=??Àâ?xvEbéRß?ØX?ì« RÖí#l¸??L*Y\Ò+Õ\í[¦ô2åºÏî»ÇÚ»]éìAilbÈ×Ø?IgdwH1òÚUzÄÊÙàv#NÊ?}¶4©b.ü*ßöäÁi?LIP.8ß?°¹îPx§ïv$óaP@²Êû»²y¯½­Uø?$ýc³¹«­?t\ëSL??*?;ÆE¢NÄ«Ò#WÌ?ºªíØÉ£n?ÇÀô3GÜ?v?kâj¯?öÃL?»L´ÏØâÐ¥r7x??[F×òKü- ìQð??ã?ÑåE³6]æ?OÅ=AA\§zt³qÊàô×?òÖ*úe_~´¯¡ë?Ø¯ÈÓd?åOìUÛNäkÏ¶¨$AF1 ´Èö,C'ïo5;oyFBAæeó´Fuåú?÷d·Áï¦¸â#ql°§îûñ$;¾P«[j?éÝÄÙbOÛÇ#ÔËï»¸Ýlâ{ÀC'4üydâ@?w??ßæ±?Þ? øE¼ÌìF{ààÆÿrh*Z¦»¨­?iltÈ`?H]ãná?ø®u×ùu²§×®t+.CtvÍ2ö?°?-¶?Ä_z9Ó©µÄ?¯Cû?U?üEr??xÜÖAE=VÐ??¦À}©Ó¼?3??Ó?èÞ¤¼­ÌS?Ï?À??}?qè?·ô?Ö?®pCd8Q£f1Þ2k\µ@«3@qx?½ÔêåHÍ?ë?`B`]?Rocs?î«uØùÑÇsYdÁÚ¢n®ÂÎbnÁÆÍêßW?t¶rmB?§ÿ¡1ËB¾u;§®²¸cóXíi?*nö6ËüÐ¶Vui?H³{Ivò«_$MÒ?Kü1þÜ{Aº¯???ºËD}FíÓÊABj4gfæ¾®g?ÉV¸½?ÔXù??øÍÖ¥~à?#døzxXÿÈÔ?¥vÊ÷ðç$Bíãqí¶?~?6W?à¾?Aæñ²[t?[ªu?´~o]K't?q3ý:Á?}]Í@­ä4?HÍ~?'?å°¿_?Aù#0?ÙzÏîM?$¡¼° PáÂ?lt?m÷?y_½¹?'óvJ_¬ºPBÓãDI??ÂsV©Ð/?¶?nê¿éÍ»cÔ7Ð/f[¾3ëZ?OÄ{®í¤zl÷Z:Å??/²¢Ä?ZdgHgUí¾'Þ?àÿ¯V:fFo?é 6;Ðæ»_Î*ITv_?_÷F£ä?ÉA[ßµì¿BÆQ?üÂQü6¿.~?õ?e,Iâ?{«/ëºX?Vì?ßº/e?qi¶þ]÷?G ?hútaydÉDÖÆm;À??Ê??¤­Ï¨Âs»6?'ª«'LèS¾È?W´îñ?Ù¹X??1/OôÞc?«¡?Ó8?¢ÿ??àÛ®3-ðpÚuÃ{tÃU×?u¡`ZXH¶¿-:¥?àczX¯º?ù?ð­®Ýz?¯ÉÁÆº¦FÓ}x¥ß¶5??¼7ÞúWÝo?Å?mª¢M~¢Çõ?âºaJ?j?ípCp}HÑDE6C$áGxu¡¬ùäø}ÅnZ@vHüäX?pÔ??`?î?.+??Hÿ2?ÿ}?DÄÒÕµâS§¹Ú´á3«òú½=s7âGyURï©?½¸J©???ï?Ny«t$fz2KÉ´~°ýÄø×£*??YL\ÙL??÷\RwÛ*Ù¾4aý®v[jQnSÿø8Ä«,L{@±­?·?cÅJ¹½PÈÐ¶ëD$??ËC÷ÐQPª3tîM;è'YII¤l?iÍ-Ûì¼´«L?#Ð??ê_ïfø¦²ëÐ??V6aÞç½ígztVV?dÓµúµ°`ª{ü?Z?ñH0?j.o?ïð¦ö¶$~õRßj?\Ç=»¶þë??¼=Ñ?ö?*å£?¤Ä?ñ¢Ì??¶ù«Ï±c_gVbP×o?v4?FÜ0àCY#·H¬Î_ª²áyÒª¨??Åò$l?Q?ÏóK1Åû??²??Ë§£º??lj°4?üSDñX¿?µD?~z?x Y?{ã¤Ù©Nç`¼1/×ûp5?£'©¥õ:#,ð?¶i×???Q×Ë/?ß?ækVñb¾ÉÓªÿS°x??Í??bnK`î?ÀK.àCC?Å {É:ZÀ»åØ $ëm?ðþém§ðø´2§º8}?¹äKt+Þ­ÚûÝÇåØQpØb·O¥?ÀO?Ï?£cóZ?ã÷Î?Ò?²2P0®?¤êûm£¿÷{qt$úl0÷¾??z»ËMÖ\??è`wÃº?s*É?©ôs~¸Fr?Ç«´·.­Ë¼g?ì®°ü9W?à`L;;¼?¢?oY?älûXÛ¨D·ìjÏGY?¯wÂF+£®??ï÷=hT/çµCY,[yÍ?ø[k;J??«Gw4S}ª·®i/??Q§:]Bú·?¿Zµ?ÅÆéÎnR¸R?©'Nt?i+«Þ?3èßÒ?ºd??ç¯Â9??TA4sªÉ#f¥×\Y*æôâ}öB¶?Ë+n=Bu_b`?0?8Öj¿0z½Y?V?ÜQÙÓ¦/Ô?iòÌãºêSa.`Æ÷?k?XËìZ4½w¬\µ-?ÔãOÀz_áÝ_???ee??-³EOÆ4 ?Þ¦8¥D??¯- ø  rØ?À,þðÝÞ$Ãqê¡ÑÉ£ù??vÀ:ØÂçÚ¶çî?áâÖÔM¸ÀXk;¨?T?0/¶?=ß_Èïµä¬MvUÞròÍ8@C'Õ~??V9÷æ³¤·G5á*ó-o£9´÷Yî?=P¨ü¶ÕqË???g?¿???Ûa?ë?;*?vQå\E?¢E?eÑïK½*?àÈ°äÇðùÑ§X5??;òK§@?Y?i+ê?è­?½2{¤ºÅúP¨¼~ó0/ê3cpß?û?÷¡ü]ñ0{¢®AÍuÏ³ÛA¤\mlG`?e?oáöSÇµè\û~JÃª·?T?ä·h?{×ãfÚ?+§¾ú?ø¦6ø¢ÈÄsúï?¨Ëº³póüfÁ???ú?[gÇ£¼Õ?{7n\Ï?G#êÝ?älR??æ??üt2¹ ½áf??#???i?ØZwõ?£.úàhêü¿xÈN?y¥}¾ÁÐý®éÄÂ/?JÙÛ?jäOÍ?1???AÊ?m?gÞÙ?U?¸?x?d«$?:ØÂ¨9²·?÷'}«üà????ak@z¸?ÆrjÜ?ûÍ?8¶AòÏ?¶W°õüj¼YcC?rã9}¬Ò³©?ÛÆ?¼fPêÉ?U­?Ê³Ç`EuS@âJ?}×aì?}³r??Úx`?Sy?PÏñÍ´+?JmÙ¡pÙ*~fñà?kÑøðe;J5¼Õç1A]?©.k?xlSqØÔÜ}ø­Úí40ævK05à«ÝPºbLQûÅ?§8?ù÷úòØrê¤ö$Û«?±3P?yõ?é'í6þø ÖîæÜA½?ßÖºFydàâ²Òºz¢?#aMf2g?6;`ÿ?Ìúe¨ºvÜ1PÚûË·;5ñyÛUËeJÈ?ïäöÔëùi-fµ???Y¢ÿÔrA.;S,PÇ­©ÆÙÊ[×?Éø©ZVRsûÕ?ÂhsTkc5??ÑïU?'â?¡$ÊrnvìIÀ?LN?¶¼?ý?P+t®]=Z~þGE?5âCÓê87L+Ô¢W¯?tóZïéQ¼Q½®uiöxm?Ê5¾¹×qø??c?¸âNM#cãôËÕ?ë?sæw=Ù?áÕ_èaÎ{Íø]ãS Cÿé`?rµ??§¥÷ýo©øë9Ê?ß~?Eu?0ñhèÚKåyÛÈ# ?ÿ»4;û¬?ìy2v?­µµ ?G×Þ??r¯û¾¼û??8PgWq¢V¬Ú'Ï?x?ÀW,:Ë®9¹yêáTrª?Å?ãN¿*S7à½0ÿ????bz3y?³Ò5[n?öKÖ??ú¦?ÙfÚéU¶âvi}Tù@?s-BÞùè?Ãcg:X??ciòÜf?R=Îo[IcºÙ?â='VÓb:Ö?I¡i@kÂÏ¥'´?³0ãá??¬?0?ØúQso®ÒeÌUÔþ???/Á?M?ó?¼;m?RÊíVÄqÌ?]?¨à?EÚ-Â¸?æ?0Å¦??ÿì÷é?®V`ó Õë]6¶Ýù½þ£:ÖkÃ[æuìßà¢Wà}piK?¸.?ÅÏ??òó?ÔÕæmù?uò?aw?ôzáw±E¬MÅ?¸  ?C@~lëpÑõ±tqCÚÈË¥CXÑJyà??Û8ÌÈ?+ßäöÆ±´Ö[íÔKEº[V°??ñÅ?Õ-í¼ìæ?R?©c?4ºÉð?£Ã~È?tO,ÞGgÍØ{ôts?7?ÔÙ¨?¥#òÝ©Á}RuMAµ_¨îÍþ²´góîç?S×8«c6E²?l?É?2ÎL??._O.6·­-ÜOò3??7}÷f?kû ñ??3+*ËßU?63ô???+@Ã½ú?Ã¦3W¦*ôËMo9¢W¨·¼ÏÞ?WD?4;4w??R@??¡MH-5½ëN\õ;ä?4¼?¶Rl?i?çÃQ¼ÔÂ¶ìÂcì?MÏÆiÃlüQÃpÕ??üUJ7¨ýÒç´/?äR?=³2ó5'Ãs»«Ã`©÷a-ÖÐL¼c»h5Ø¤nµËJ?»ª?®»ÆvÌ`á?]e9âÑnàÁc?x9Ú?i¸¦×?Í9Þ6i?µ]???~ÛÌçøCT[77ÍòÖ?ïã3??Ú8µ£ë?1em§tJUm??ý?ZÐr£ã#¡ðY½Gy¹×ßu[??i`¹eß¿6¦Ð?$Y¤æ?§w?°üëY6?ì:SÀ8?nñçã×XLê*MTÀ?{?#¸?\0ïÃ=·V¯rå?áEõ¶@:?6?Ö£*6­2:ÿÚ\?5??.]âþ°í¹e\2Í«½??c½Íà¶«??¦ï?ìlóf¬NÝ¯Iÿ® rÙ}-­d*?r@´OOã[q²?~C·ËQÉrPq'ó*?8`¢9×ñ~XQÍ?ÀQ?Æ§Eu?À±oà$@×`USÛÛíc?8x±¼Á-S=??²ºzñÃÿhè÷yáí5Ð²Ý½7Î`ÃO?¹UÐg6?gVûRb?FÍÑú¢'w²EX?£à©Ð?»{´åF¢?Ödþá0®?ó©òT?Â?9¸Éd?ìW½+ëé®tÜôÌ\Vy?:Ö+ô÷$o]òo6[?å??¡Pô®»m´ø§4OÙ­äN4ÌEæÍg.o¢#?øÑ~Ê¡,wÞ}} ³§ÆÚËá²z8?0~?~íØ÷EÙÊ#$Ñ¤OQÃãïÀ[õÛè3;EÅOH¥à$:ï£Õxà¼?÷ìbÎ1fþÃoÂ²j4ê?gQöF82zõ »í?0Þ.c9}Õîq?¯½NTn?ëh0b?~d¡þô}à§?WM9Í?_ºëâ?=¾?DÀ±lOñõÎÈf4ÇY}?¥õ¤Îÿ]q³Ö¡èÜC{Ñ?¢Ç¾?,ÔU¹??»¬B·½YÅ¬ë÷ûù?9»?ëO@¨èZÔñ?¸GR?´?÷lFûJçwÂó~Ë±c¥õð?­ýå?¾å?ÅèI°L[??ÑÜ?°ÇzÖ¤+?ªHT7¥??qÀ_´?R?Øå${Ô1Qê?Ø?Üj?êzÕØN¾?$WËµ¾.F?Y{u?59ØúÕl½¹]*ï. WkËtY?o?Èq±Ýé»¡Yt9`ÕºlúçDh?Ç´CYr+Áá¶°nü?õ$c²?øå´ÐX+??MÀ_õ?ô¸²¢?}â??ÒÆ?¦8jÁµRÕ±¥c0¬¼üËü??Z=àî?dÜÕQ?fs:ÐFÞ\ÛÁ¹òvY¦Q¢d?§9½J?úo9×?«OzÎ?$mGóK?±:l}¤¼=÷ ¾By?«9¸?Ê­p?k?nkoÀ¦?Ò}[\½÷?³2*jÝ'¤ÂR©¯ä?_/³ü?U{B?1É$®x£¬²¼oÝ?tr.@äWz?lÃP?ðß¡:är?B4¼aÊU¡?Nç§8Ï16êî\?§?ÒxÄ=b¨;®ÞÎCãC£?æ6Ý=Ì? ©ÌóB?dÌGÄ?C?eÄ-º÷=è~ã?/¡Æ×H¸_¿¹¬ÉÐÉX?ê/´¹WU{ì?þ?xËX»þ?b®à°£ÀDæS aÙú¨ÙÚ?]óÌ?¿Â$jlIêÆ5ßtcÃ©?ÉÒ2¤ã?hkßÝª»¨?®ô?ó?/ê40CîNp6?Ü?³¹m'?'?E ÀfèÐ´?Z?ë°òþÄï?Ú?â]Óf[UeLæ¦ÿu;k?9Æº¨?#è?JU?ú¬î*W=·Y7ç;3íì\0ð·´jÿ]b²×üP?Jß¡hY?êÝûrC?LaíYÝv9.ï?g`Ã?Ì?á*?Àï?}m¶È,×Ã5ÿ?¾ù?ÁÔ?ï]? 6GXÂ?öáéècO`âÍ¢×S ??á-ðÉZ¦V?E´Ý\X²¼Ùæº?¯eUÒá¢HkW?-í@g±?Üaj=ä¾å0ÒÀ½m?sv?mç³Z?Ej9hÆ¢±ïókc4M???úy=ÍY?Åòïå¹Ø2rmIôt¦ðãb?ý¶Úý?}¬?3?Og??*°Aàú?ÌªaMpÖGìÉ¡õi?3+?¤5¹1ÂwPúèÑÈðXXÒ?ðu:ø¿4£J1ÿ?Ý;Ø¶MÁ9¬?¤ ?Hí?4?¬ñ?Ì?v?´l´}?éûKI??WñI?¼ä¦ÀçÓ?gWà{ÙQË?Ê?òYÄ7?ÀWãÄüw;¢?ØÊì?Ë?Ï£é6??-?$Dä°?ì]·¬©øg²nwy±;b?¼Z?¹?í=òU ??EþÌgÜD}Dqç¶ùX?Ö2?M1Mj???âdfÉÎÍ5êHÁ©?ªùy,?Z,×ú?»?½8?]ryÖÝûöð±+?önF??¨àT¥kÔTI­P?Bm?QõzÜ[dòwÁ§aC*«xU¤T0mí+îàHù¹·?Ú?ã7?ËmR?íb??Ò;¡¢dÛ?©µÙ1?Jó?¾CÛYµâ=Ôg#?²ã÷?é=[É??c?Ðy¸UÀ?°¢??v?6þÙn¹Hç?ø?ô?Xs?÷8c¾­Å0¶5¶Ë¬ogë éÁc?3¥´ùÎµ*66?÷Þ?f/$S?hÒâA¾ùiFLÀÙQ?FåmÑsmÿ×'ì{GCÖZUG?ÔB¿§lÏv?³åBà;¢sÃûþ±Ã??eGK´uÇ??b???ûq=*mcèRØî©?`2U?M6Q«??K¯f¾¨Õ,?è{ëDbÞå~?øÃ:aÌ4ÄR¤sÀ©:±òîêôWR×?±KyýíÀûô#?+7þ${Ñ¿m_?@ê¼tI-ª=ù? #4ÇåÙ*O??,a©'@?¯Û?üè®xÐÆþiÃ®Ç³#ÿï.z?Bjô/²?©Rb»zÐ?-#¦«µ?¥V; À?³ÄK??A«?[ä?ÍY#Ûj?jp°ÌªÌe6b-¤G3î]«Jê?@$qIq?¶ã°V?­ä°Fb©¶¿M/ìà¥Ôd­8'²º 0?Fx¯¹ÃMÊõmþ?J:??$·éµl?ØÖô?ÿ+Ï+¶Ï»?»;PË6½ÈmUq¹¹Ô/·äc©yL¼ÿúD?TD´G¯Ì«¡Ð ºyáfi¤w$kÀ?³m$??_Ã#±ïaïÒqyO£/h´?#èÀßBÛjsÜ9?3Eë2¡ñ?Hp½zöBðIK#ve?½?jU?´¼¨êPknLbj0EhÛ#Eá¦??x?·îWjþ±\fùªWeËÜÆ?ØKíNÒè'Gæ°@D9 b[?øG×?¼íUÂÅNA?ªIv?ßÎ#×-ÿaÒ­ÜnMûOBÑn£¡Ò:ñ«F½þéÐ_?2.mUßzIyá_çæò¨ ?YY?é-R$ÇdÆ¦¡¥Ù4¤W1rÒAüx\ÀÜ¼fÈq±?ßüg?²ÓÎ?f?×¹r?þë¾ñË¶«rµ§O_Ë¯q ,?Hî§?HÐu¡kèëÕ²Þ?²??ùýÿ????¦2OK0zöUåÑ??I:?¨`?T7·ytÕ?/?Ý¾w@?ãz0/àMÑOÙ±P°¾ø~_?7?;×- Þ?UÚ}·Æá.tÖvã??qnBÈ9ò?Ç?ø'??³ÒC,M@ÐÕi+`ó?©?ÃniÃ¹ÕKÄkZ`Ä?êé?ö?:Ít?E?~=ÈSÙ`j?3À¥±?ö1??c#ì×þí5Åt?HÔKl¿u¾0?z?­PXñMÌP×{LäÐ½ú·­«P7ÚÔ?¯nìIÎñPSyñIWâ?i?uûæ?G??RËôü?5®å¸¾[ýüÑä=nÈäï/4Ôæ¬??AG+?AVÎr7w?Ð+?¨í?Äxü?2M5ó[×?·e«c¸ótiSt*?öÀu5¹@?5??«Vï??Ñ£ãbrªÚIN¼éø?ôà°rOò÷ÝM8øV?B´?\¢´0å?ö¤ÄÃQR/þwKòÉ2?÷DC©ÀÉ?j?Óâàgjt×­7¯x?ê·ÕtrÄÊrÁÔHM¨?ZÆ2yiz7l[?ÌÀ?ÞáïcoCTúLü?µ¬,/ÕBC]jx#6v?Ó ¥?ÍäÖæ4?è??À?V´TqE¼k{?Jò`xh??ëQ?öæÅUxÅ@ù?Á?ÊWxgìô»?Âà7?T¾Ù?X?¡{þÊ®?é?1Èx«@\úêa¾@©¸?ÕÇäx¯1Púù¶¤öáBÊãÖ68yC?Shó:a²àÑéâmzÃEdäÈ¡?VE­Åå??$îÍ?Ò?]ß/Gu,Râ.Kt\=Ø?ìùÇÐú±?Õ$ï¨Ö}gÀ7wç«¾¶ª£??u_.,· øÛ§¬?¿?´¨?\Y+?dzüÞõ¸?S q3ös©?ßBn*ÇæÝÒAluó¹?+?`L?á¡$ÄM¬ãþ'Y?ä?ÎYPêÆD?üû?­s4µjlPËS¸vy}ÎIrjú'¿30?þ~8Õ4?C??ðÎ¾?cGa¹?ÔùHü?a?ÍÓûqffÔ ábPçd?Ë3ów¡?6?ë3Âoh¥ÈOè??Y?c?7Óö×Àø¥Ö]ómÁkÿsð»`Ëi?Xx¸g:?`Z?gÅc¦qÀã» ?à?'?I;Ãg?g?è_2LÏxé?ÆU*ðS//ÓaÃ??«?ÍµS9ùá8Â´T??1µÏe?Öj°?oÌáþ¾£ÞÇ?ãDx\e¢¿äÏn÷û¨zý?Ìy?.?´ñìqL\.èÀ²O?À¡=8«·?9ØlÙOßôÕÌØù?7 s¼­üñmHfí/aï.z`Û±_JeLM¨ì¸:@3ó1³Ã?ÿ±è?ôxó?L=???÷?£?Ã°?*Ñj?i»?$¸ò4ê`  #é6¢J$.?IÉÿ2`ôÕBÎÒgQ¡JØú?g4O 4Sªü?=®m´P¨Ê?¢¡?Û?ê§×R??ÕðÛê»?=t_£HwÅaÿ×Oðº³ù]_I­°Ü?=?ËÚO-ó8k?Þf¯ì?l?SÐ$«¼-èµÜ??.þ±QÍÜÀ0ë?céÙÌ??Ñ¦'?ã0î9?ÄtÂ8[²??RÝ?k°?âüó4«}Ú£ÞÎ#]yÑ½¢pðMzwÞóÕ?Ld6q×ùø-óú¦i?àâè,Ô¦*¤?;Ú$µCQ?}½UímÀ·ÑLÿ?4?\èàÇO¶eÀÐg???º»?:ÆkFÍN?åG»]ûpfRÌê*©?????îüwäÖåJ@Àt=Á² deO?\??±*þ¡?-7Ó??=ïý°9?þ/1ÙëLI?s'IiS?[ÐwõÚÏ??Ð»ËðÙ?Ââü:{#??b?ÝÃH·pX»ÓY´?=ì ÅcWü¨RöeÌÁ?.0O4{?4áuÅîø"{TRUNKATED AT 8000}::
REM test

REM index always zero 21 All FFF string, 100 long, "~*xHi2zqmP-," is the search pattern, Test string is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"

REM 23 Alphanumeric random string, with punctuation and space and nopoison 100 long, 100 count "::3:^:tzsUr(m*Wm5PY::" is the search pattern, Test string is "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li${Cf::"
REM Index 0 : result 99  "::3::tzsUr(m*Wm5PY'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li${Cf::"
REM Index 1 : result 99  "::N3::tzsUr(m*Wm5PYzl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li${Cf::"
REM Index 2 : result 99  "::N#3::tzsUr(m*Wm5PYl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li${Cf::"
REM Index 3 : result 99  "::N#a3::tzsUr(m*Wm5PY44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li${Cf::"
REM Index 4 : result 99  "::N#a,3::tzsUr(m*Wm5PY4jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li${Cf::"
REM Index 5 : result 99  "::N#a,.3::tzsUr(m*Wm5PYjyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li${Cf::"
REM Index 6 : result 99  "::N#a,.23::tzsUr(m*Wm5PYyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li${Cf::"
REM Index 77 : result 99  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTH3::tzsUr(m*Wm5PYli${Cf::"
REM Index 78 : result 99  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHS3::tzsUr(m*Wm5PYi${Cf::"
REM Index 79 : result 99  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG3::tzsUr(m*Wm5PY${Cf::"
REM Index 80 : result 99  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~3::tzsUr(m*Wm5PY{Cf::"
REM Index 81 : result 99  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,3::tzsUr(m*Wm5PYCf::"
REM Index 82 : result 99  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g3::tzsUr(m*Wm5PYf::"
REM Index 83 : result 99  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~3::tzsUr(m*Wm5PY::"
REM Index 84 : result 100  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\3::tzsUr(m*Wm5PY::"
REM Index 85 : result 101  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\k3::tzsUr(m*Wm5PY::"
REM Index 86 : result 102  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC3::tzsUr(m*Wm5PY::"
REM Index 87 : result 103  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\3::tzsUr(m*Wm5PY::"
REM Index 88 : result 104  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#3::tzsUr(m*Wm5PY::"
REM Index 89 : result 105  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I3::tzsUr(m*Wm5PY::"
REM Index 90 : result 106  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*3::tzsUr(m*Wm5PY::"
REM Index 91 : result 107  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*53::tzsUr(m*Wm5PY::"
REM Index 92 : result 108  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5b3::tzsUr(m*Wm5PY::"
REM Index 93 : result 109  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ3::tzsUr(m*Wm5PY::"
REM Index 94 : result 110  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ03::tzsUr(m*Wm5PY::"
REM Index 95 : result 111  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0l3::tzsUr(m*Wm5PY::"
REM Index 96 : result 112  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li3::tzsUr(m*Wm5PY::"
REM Index 97 : result 113  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li$3::tzsUr(m*Wm5PY::"
REM Index 98 : result 114  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li${3::tzsUr(m*Wm5PY::"
REM Index 99 : result 115  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li${C3::tzsUr(m*Wm5PY::"
REM Index 100 : result 116  "::N#a,.2$eR'3cuG`Zm'zl44jyW4HlLL}Q1**;aIqu=Ime,l]g1@Kr5m'dgdF\YRrL \6S1iKQUedTHSG~,g~\kC\#I*5bZ0li${Cf3::tzsUr(m*Wm5PY::"

REM 26 / 27 / 28 / 29 don't work

REM 30 Alphanumeric random string, with punctuation and space and nopoison 100 long, 100 count "::h'4h4~rnU{'h#svO?=::" is the search pattern, Test string is "::Ø??jMÀ­¡?~GÊ?°ÙG??àéf?bF4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Starting test 30, string length 100, loop  count 100
REM _GetSubstringIndex_testarray[] values inserted with test pattern "::h'4h4~rnU{'h#svO?=::"
REM GetSubstringIndex is called byref
REM Index 0 : result 0  "::h'4h4~rnU{'h#svO?=àéf?bF4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 1 : result 0  "::Øh'4h4~rnU{'h#svO?=éf?bF4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 2 : result 1  "::Ø?h'4h4~rnU{'h#svO?=f?bF4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 3 : result 2  "::Ø??h'4h4~rnU{'h#svO?=?bF4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 4 : result 3  "::Ø??jh'4h4~rnU{'h#svO?=bF4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 5 : result 4  "::Ø??jMh'4h4~rnU{'h#svO?=F4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM GetSubstringIndex is called byval
REM Index 0 : result 0  "::h'4h4~rnU{'h#svO?=àéf?bF4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 1 : result 0  "::Øh'4h4~rnU{'h#svO?=éf?bF4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 2 : result 1  "::Ø?h'4h4~rnU{'h#svO?=f?bF4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 3 : result 2  "::Ø??h'4h4~rnU{'h#svO?=?bF4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 4 : result 3  "::Ø??jh'4h4~rnU{'h#svO?=bF4?±3$*?k;î'e?êôdÒÃ?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 24 : result 23  "::Ø??jMÀ­¡?~GÊ?°ÙG??àéf?bFh'4h4~rnU{'h#svO?=?Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 25 : result 24  "::Ø??jMÀ­¡?~GÊ?°ÙG??àéf?bF4h'4h4~rnU{'h#svO?=Ç"?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM Index 26 : result 25  "::Ø??jMÀ­¡?~GÊ?°ÙG??àéf?bF4?h'4h4~rnU{'h#svO?="?À£dQTÃNP?æãe?Xü«?h¬âÄwüÆÜj$Ð?ª¼{-GjñGåÓ?{}?ÒÂÛ¥A³"g³q?::"
REM =" & shift & GoTo :GetSubstringIndex-args ) was unexpected at this time.

REM everything after 31 doesn't work

:GetSubstringIndex-demo

Call :ClearVariablesByPrefix _GetSubstringIndex

set _GetSubstringIndex_show_string=true

set /a _GetSubstringIndex_index=0
REM set /a _GetSubstringIndex_index=1
REM set /a _GetSubstringIndex_index=2
REM set /a _GetSubstringIndex_index=3
REM set /a _GetSubstringIndex_index=4
REM set /a _GetSubstringIndex_index=5
REM set /a _GetSubstringIndex_index=6
REM set /a _GetSubstringIndex_index=7
REM set /a _GetSubstringIndex_index=8
REM set /a _GetSubstringIndex_index=9
REM set /a _GetSubstringIndex_index=10
REM set /a _GetSubstringIndex_index=11
REM set /a _GetSubstringIndex_index=12
REM set /a _GetSubstringIndex_index=13
REM set /a _GetSubstringIndex_index=14
REM set /a _GetSubstringIndex_index=15
REM set /a _GetSubstringIndex_index=16
REM set /a _GetSubstringIndex_index=17
REM set /a _GetSubstringIndex_index=18
REM set /a _GetSubstringIndex_index=19
REM set /a _GetSubstringIndex_index=20
REM set /a _GetSubstringIndex_index=21
REM set /a _GetSubstringIndex_index=22
REM set /a _GetSubstringIndex_index=23
REM set /a _GetSubstringIndex_index=24
REM set /a _GetSubstringIndex_index=25
REM set /a _GetSubstringIndex_index=26
REM set /a _GetSubstringIndex_index=27
REM set /a _GetSubstringIndex_index=28
REM set /a _GetSubstringIndex_index=29
REM set /a _GetSubstringIndex_index=30
REM set /a _GetSubstringIndex_index=31
REM set /a _GetSubstringIndex_index=32
REM set /a _GetSubstringIndex_index=33
REM set /a _GetSubstringIndex_index=34
REM set /a _GetSubstringIndex_index=35
REM set /a _GetSubstringIndex_index=36

REM set /a _GetSubstringIndex_stop=0
REM set /a _GetSubstringIndex_stop=1
REM set /a _GetSubstringIndex_stop=2
REM set /a _GetSubstringIndex_stop=3
REM set /a _GetSubstringIndex_stop=4
REM set /a _GetSubstringIndex_stop=5
REM set /a _GetSubstringIndex_stop=7
REM set /a _GetSubstringIndex_stop=8
REM set /a _GetSubstringIndex_stop=9
REM set /a _GetSubstringIndex_stop=10
REM set /a _GetSubstringIndex_stop=11
REM set /a _GetSubstringIndex_stop=12
REM set /a _GetSubstringIndex_stop=13
REM set /a _GetSubstringIndex_stop=14
REM set /a _GetSubstringIndex_stop=15
REM set /a _GetSubstringIndex_stop=16
REM set /a _GetSubstringIndex_stop=17
REM set /a _GetSubstringIndex_stop=18
REM set /a _GetSubstringIndex_stop=19
REM set /a _GetSubstringIndex_stop=20
REM set /a _GetSubstringIndex_stop=21
REM set /a _GetSubstringIndex_stop=22
REM set /a _GetSubstringIndex_stop=23
REM set /a _GetSubstringIndex_stop=24
set /a _GetSubstringIndex_stop=25
REM set /a _GetSubstringIndex_stop=26
REM set /a _GetSubstringIndex_stop=27
REM set /a _GetSubstringIndex_stop=28
REM set /a _GetSubstringIndex_stop=29
REM set /a _GetSubstringIndex_stop=30
REM set /a _GetSubstringIndex_stop=31
REM set /a _GetSubstringIndex_stop=32
REM set /a _GetSubstringIndex_stop=33

:GetSubstringIndex-demo-loop

REM _GetSubstringIndex_index_length
REM _GetSubstringIndex_index_count
REM _GetSubstringIndex_testvar
REM _GetSubstringIndex_testpattern
REM test explain string
REM _GetSubstringIndex_index
REM _GetSubstringIndex_stop

GoTo :GetSubstringIndex-1-skip

call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter "OVERRIDE 71" 10 100 "All F base array, all G delimiter"
call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter "" 10 100 "All F base array, alphanumeric delimiter"
call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter "PUNCTUATION NOPOISON SPACE" 10 100 "All F base array, with punctuation and space"
call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10 100 "All F base array, with punctuation and space and extended"
call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter "PUNCTUATION SPACE EXTENDED" 10 100 "All F base array, with punctuation and space and extended and poison"

call :GetSubstringIndex-create-test-array OutputArray "" 100 Delimiter "OVERRIDE 71" 10 100 "Alphanumeric  base array, all G delimiter"
call :GetSubstringIndex-create-test-array OutputArray "" 100 Delimiter "" 10 100 "Alphanumeric  base array, alphanumeric delimiter"
call :GetSubstringIndex-create-test-array OutputArray "" 100 Delimiter "PUNCTUATION NOPOISON SPACE" 10 100 "Alphanumeric  base array, with punctuation and space"
call :GetSubstringIndex-create-test-array OutputArray "" 100 Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10 100 "Alphanumeric  base array, with punctuation and space and extended"
call :GetSubstringIndex-create-test-array OutputArray "" 100 Delimiter "PUNCTUATION SPACE EXTENDED" 10 100 "Alphanumeric  base array, with punctuation and space and extended and poison"

call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE" 100 Delimiter "OVERRIDE 71" 10 100 "Alphanumeric with punctuation and space base array, all G delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE" 100 Delimiter "" 10 100 "Alphanumeric with punctuation and space base array, alphanumeric delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE" 100 Delimiter "PUNCTUATION NOPOISON SPACE" 10 100 "Alphanumeric with punctuation and space base array, with punctuation and space"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE" 100 Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10 100 "Alphanumeric with punctuation and space base array, with punctuation and space and extended"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE" 100 Delimiter "PUNCTUATION SPACE EXTENDED" 10 100 "Alphanumeric with punctuation and space base array, with punctuation and space and extended and poison"

call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE EXTENDED" 100 Delimiter "OVERRIDE 71" 10 100 "Alphanumeric with punctuation and space and extended base array, all G delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE EXTENDED" 100 Delimiter "" 10 100 "Alphanumeric with punctuation and space and extended base array, alphanumeric delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE EXTENDED" 100 Delimiter "PUNCTUATION NOPOISON SPACE" 10 100 "Alphanumeric with punctuation and space and extended base array, with punctuation and space"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE EXTENDED" 100 Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10 100 "Alphanumeric with punctuation and space and extended base array, with punctuation and space and extended"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE EXTENDED" 100 Delimiter "PUNCTUATION SPACE EXTENDED" 10 100 "Alphanumeric with punctuation and space and extended base array, with punctuation and space and extended and poison"

call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION SPACE EXTENDED" 100 Delimiter "OVERRIDE 71" 10 100 "Alphanumeric with punctuation and space and extended and poison base array, all G delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION SPACE EXTENDED" 100 Delimiter "" 10 100 "Alphanumeric with punctuation and space and extended and poison base array, alphanumeric delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION SPACE EXTENDED" 100 Delimiter "PUNCTUATION NOPOISON SPACE" 10 100 "Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION SPACE EXTENDED" 100 Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10 100 "Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space and extended"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION SPACE EXTENDED" 100 Delimiter "PUNCTUATION SPACE EXTENDED" 10 100 "Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space and extended and poison"

:GetSubstringIndex-1-skip
GoTo :GetSubstringIndex-2-skip

call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter "OVERRIDE 71" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "All F base array, all G delimiter"
call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter "" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "All F base array, alphanumeric delimiter"
call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter "PUNCTUATION NOPOISON SPACE" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "All F base array, with punctuation and space"
call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "All F base array, with punctuation and space and extended"
call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter "PUNCTUATION SPACE EXTENDED" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "All F base array, with punctuation and space and extended and poison"

call :GetSubstringIndex-create-test-array OutputArray "" 100 Delimiter "OVERRIDE 71" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric  base array, all G delimiter"
call :GetSubstringIndex-create-test-array OutputArray "" 100 Delimiter "" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric  base array, alphanumeric delimiter"
call :GetSubstringIndex-create-test-array OutputArray "" 100 Delimiter "PUNCTUATION NOPOISON SPACE" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric  base array, with punctuation and space"
call :GetSubstringIndex-create-test-array OutputArray "" 100 Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric  base array, with punctuation and space and extended"
call :GetSubstringIndex-create-test-array OutputArray "" 100 Delimiter "PUNCTUATION SPACE EXTENDED" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric  base array, with punctuation and space and extended and poison"

call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE" 100 Delimiter "OVERRIDE 71" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space base array, all G delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE" 100 Delimiter "" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space base array, alphanumeric delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE" 100 Delimiter "PUNCTUATION NOPOISON SPACE" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space base array, with punctuation and space"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE" 100 Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space base array, with punctuation and space and extended"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE" 100 Delimiter "PUNCTUATION SPACE EXTENDED" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space base array, with punctuation and space and extended and poison"

call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE EXTENDED" 100 Delimiter "OVERRIDE 71" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space and extended base array, all G delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE EXTENDED" 100 Delimiter "" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space and extended base array, alphanumeric delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE EXTENDED" 100 Delimiter "PUNCTUATION NOPOISON SPACE" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space and extended base array, with punctuation and space"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE EXTENDED" 100 Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space and extended base array, with punctuation and space and extended"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION NOPOISON SPACE EXTENDED" 100 Delimiter "PUNCTUATION SPACE EXTENDED" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space and extended base array, with punctuation and space and extended and poison"

call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION SPACE EXTENDED" 100 Delimiter "OVERRIDE 71" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space and extended and poison base array, all G delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION SPACE EXTENDED" 100 Delimiter "" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space and extended and poison base array, alphanumeric delimiter"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION SPACE EXTENDED" 100 Delimiter "PUNCTUATION NOPOISON SPACE" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION SPACE EXTENDED" 100 Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space and extended"
call :GetSubstringIndex-create-test-array OutputArray "PUNCTUATION SPACE EXTENDED" 100 Delimiter "PUNCTUATION SPACE EXTENDED" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 100 "Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space and extended and poison"

:GetSubstringIndex-2-skip

call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter "OVERRIDE 71" 10 Delimiter INVERTPOSITION "OVERRIDE 80" 10 Delimiter INVERTPOSITION INDEXOFFSET -15 "OVERRIDE 81" 10 Delimiter INVERTPOSITION INDEXOFFSET -30 "OVERRIDE 82" 10 100 "All F base array, all G delimiter"
call :GetSubstringIndex-create-test-array OutputArray "OVERRIDE 70" 100 Delimiter REPEAT 3 "OVERRIDE 71" 10 100 "All F base array, all G delimiter"
GoTo :EOF

::Usage Call :GetSubstringIndex-test-helper [byref] RandomStringSetting LengthRange Delimiter [byref] [INVERTPOSITION] RandomStringSettings LengthRange 
:GetSubstringIndex-create-test-array
set "_GetSubstringIndex_test_helper_prefix=_GSITH"
setlocal enabledelayedexpansion
set "_GSITH_OutputArray=%~1" & shift
if /i "[%~1]" EQU "[byref]" ( set "_GSITH_InputByref=true" & shift )
set "_GSITH_InputRandomSettings=%~1"
for /f "tokens=1,2 delims=-" %%a in ('echo.%~2') do ( set /a _GSITH_InputMinLength=%%a & set /a _GSITH_InputMaxLength=%%b 2>nul )
if not defined _GSITH_InputMaxLength ( set /a _GSITH_InputActualLength=%_GSITH_InputMinLength% ) else ( call :rnd _GSITH_InputActualLength %_GSITH_InputMinLength% %_GSITH_InputMaxLength% )
Call :CreateRandomStringPS %_GSITH_InputRandomSettings% %_GSITH_InputActualLength% _GSITH_InputString
shift & shift
set /a _GSITH_Delimiters_ubound=-1
:GetSubstringIndex-create-test-array-args
if /i "[%~1]" NEQ "[DELIMITER]" GoTo :GetSubstringIndex-create-test-array-args-delimiter-skip
shift & set /a _GSITH_Delimiters_ubound+=1
if /i "[%~1]" EQU "[byref]" ( set "_GSITH_Delimiters[%_GSITH_Delimiters_ubound%].byref=true" & shift )
if /i "[%~1]" EQU "[INVERTPOSITION]" ( set "_GSITH_Delimiters[%_GSITH_Delimiters_ubound%].InvertPosition=true" & shift  )
if /i "[%~1]" EQU "[INDEXOFFSET]" ( set /a "_GSITH_Delimiters[%_GSITH_Delimiters_ubound%].IndexOffset=%~2" & shift & shift ) else ( set /a _GSITH_Delimiters[%_GSITH_Delimiters_ubound%].IndexOffset=0 )
if /i "[%~1]" EQU "[REPEAT]" ( set "_GSITH_Delimiters[%_GSITH_Delimiters_ubound%].Repeat=%~2" & shift & shift ) else ( set /a _GSITH_Delimiters[%_GSITH_Delimiters_ubound%].Repeat=0 )
set "_GSITH_Delimiters[%_GSITH_Delimiters_ubound%].StringSettings=%~1" & shift 
for /f "tokens=1,2 delims=-" %%a in ('echo.%~1') do ( set /a _GSITH_Delimiters[%_GSITH_Delimiters_ubound%].MinLength=%%a & set /a _GSITH_Delimiters[%_GSITH_Delimiters_ubound%].MaxLength=%%b 2>nul )
if not defined _GSITH_Delimiters[%_GSITH_Delimiters_ubound%].MaxLength ( set /a _GSITH_Delimiters[%_GSITH_Delimiters_ubound%].ActualLength=!_GSITH_Delimiters[%_GSITH_Delimiters_ubound%].MinLength! ) else ( call :rnd _GSITH_Delimiters[%_GSITH_Delimiters_ubound%].ActualLength !_GSITH_Delimiters[%_GSITH_Delimiters_ubound%].MinLength! !_GSITH_Delimiters[%_GSITH_Delimiters_ubound%].MaxLength! )
Call :CreateRandomStringPS !_GSITH_Delimiters[%_GSITH_Delimiters_ubound%].StringSettings! !_GSITH_Delimiters[%_GSITH_Delimiters_ubound%].ActualLength! _GSITH_Delimiters[%_GSITH_Delimiters_ubound%]
Call :len _GSITH_Delimiters[%_GSITH_Delimiters_ubound%] _GSITH_Delimiters[%_GSITH_Delimiters_ubound%].len
shift
:GetSubstringIndex-create-test-array-args-delimiter-skip
if /i "[%~1]" EQU "[DELIMITER]" GoTo :GetSubstringIndex-create-test-array-args
for /f "tokens=1,2 delims=-" %%a in ('echo.%~1') do ( set /a _GSITH_CountMin=%%a & set /a _GSITH_CountMax=%%b 2>nul )
if not defined _GSITH_CountMax ( set /a _GSITH_ActualCount=%_GSITH_CountMin% ) else ( call :rnd _GSITH_ActualCount %_GSITH_CountMin% %_GSITH_CountMax% )
set "_GSITH_comment=%~2"
set /a _GSITH_index=0
:GetSubstringIndex-create-test-array-count-loop
set /a _GSITH_delimiter_index=0
set "_GSITH_CurrentInputPointer=_GSITH_InputString"
:GetSubstringIndex-create-test-array-delimiter-count-loop
if defined _GSITH_Delimiters[%_GSITH_delimiter_index%].InvertPosition ( set /a _GSITH_Delimiter_Position=%_GSITH_ActualCount%-%_GSITH_index%+!_GSITH_Delimiters[%_GSITH_delimiter_index%].IndexOffset!-1 ) else ( set /a _GSITH_Delimiter_Position=%_GSITH_index%+!_GSITH_Delimiters[%_GSITH_delimiter_index%].IndexOffset! )
if %_GSITH_Delimiter_Position% LSS 0 set /a _GSITH_Delimiter_Position=0
Call :ReplaceString %_GSITH_CurrentInputPointer% %_GSITH_OutputArray%[%_GSITH_index%] %_GSITH_Delimiter_Position% _GSITH_Delimiters[%_GSITH_delimiter_index%] REPEAT !_GSITH_Delimiters[%_GSITH_delimiter_index%].Repeat! DONTOVERSPLIT LEN !_GSITH_Delimiters[%_GSITH_delimiter_index%].len!
set "_GSITH_CurrentInputPointer=%_GSITH_OutputArray%[%_GSITH_index%]" & set /a _GSITH_delimiter_index+=1
if %_GSITH_delimiter_index% LEQ %_GSITH_Delimiters_ubound% GoTo :GetSubstringIndex-create-test-array-delimiter-count-loop
set /a _GSITH_index+=1
if %_GSITH_index% LSS %_GSITH_ActualCount% GoTo :GetSubstringIndex-create-test-array-count-loop
set /a %_GSITH_OutputArray%.ubound=%_GSITH_ActualCount%
echo %_GSITH_comment%
set _GSITH
Call :EchoArray %_GSITH_OutputArray%
for /F "delims=" %%a in ('set %_GSITH_OutputArray%') do (
	endlocal
	set "%%a"
	)
Call :ClearVariablesByPrefix  _GSITH
GoTo :EOF



REM parameters of CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED

if %_GetSubstringIndex_index% EQU 0 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 0 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 0 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 0 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 0 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 1 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 1 Call :CreateRandomStringPS %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 1 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 1 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 1 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 2 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 2 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 2 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 2 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 2 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 3 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 3 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 3 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 3 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 3 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 4 ( set /a _GetSubstringIndex_index_length=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 4 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 4 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 4 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 4 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 5 ( set /a _GetSubstringIndex_index_length=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 5 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 5 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 5 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 5 GoTo :GetSubstringIndex-demo-start-loop


if %_GetSubstringIndex_index% EQU 6 ( set /a _GetSubstringIndex_index_length=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 6 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 6 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 6 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern,)
if %_GetSubstringIndex_index% EQU 6 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 6 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 7 echo  Repeat tests 1-6, but with auto generated alpha numeric testpattern of size variable between 10 and 20
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings="
set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100

if %_GetSubstringIndex_index% EQU 7 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 7 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 7 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 7 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 7 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 8 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 8 Call :CreateRandomStringPS %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 8 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 8 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 8 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 8 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 9 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 9 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 9 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 9 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 9 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 9 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 10 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 10 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 10 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 10 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 10 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 10 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 11 ( set /a _GetSubstringIndex_index_length=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 11 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 11 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 11 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 11 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 11 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 12 ( set /a _GetSubstringIndex_index_length=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 12 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 12 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 12 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 12 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 12 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 13 ( set /a _GetSubstringIndex_index_length=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 13 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 13 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 13 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 13 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern,)
if %_GetSubstringIndex_index% EQU 13 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 13 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 14 echo  Repeat tests 7-13, but with punctuation and space but no poison in the test pattern
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings=PUNCTUATION NOPOISON SPACE"

if %_GetSubstringIndex_index% EQU 14 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 14 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 14 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 14 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 14 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 14 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 15 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 15 Call :CreateRandomStringPS %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 15 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 15 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 15 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 15 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 16 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 16 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 16 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 16 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 16 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 16 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 17 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 17 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 17 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 17 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 17 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 17 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 18 ( set /a _GetSubstringIndex_index_length=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 18 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 18 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 18 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 18 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 18 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 19 ( set /a _GetSubstringIndex_index_length=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 19 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 19 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 19 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 19 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 19 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 20 ( set /a _GetSubstringIndex_index_length=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 20 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 20 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 20 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 20 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, )
if %_GetSubstringIndex_index% EQU 20 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 20 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 21 echo  Repeat tests 14-20, but including poison in the test pattern 
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings=PUNCTUATION SPACE"

if %_GetSubstringIndex_index% EQU 21 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 21 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 21 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 21 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 21 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 21 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 22 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 22 Call :CreateRandomStringPS %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 22 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 22 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 22 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 22 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 23 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 23 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 23 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 23 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 23 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 23 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 24 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 24 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 24 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 24 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 24 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 24 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 25 ( set /a _GetSubstringIndex_index_length=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 25 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 25 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 25 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 25 ( set /a _GetSubstringIndex_index_length=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 25 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 25 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 25 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 26 ( set /a _GetSubstringIndex_index_length=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 26 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 26 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 26 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 26 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, )
if %_GetSubstringIndex_index% EQU 26 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 26 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 27 echo  Repeat tests 21-26, but with poison characters in the test string too
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings=PUNCTUATION NOPOISON SPACE"

if %_GetSubstringIndex_index% EQU 27 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 27 set "_GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)(%^&=<>|FFFF"FFFFFFFFF"
if %_GetSubstringIndex_index% EQU 27 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 27 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 27 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 27 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 28 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 28 Call :CreateRandomStringPS PUNCTUATION %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 28 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 28 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 28 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 28 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 29 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 29 Call :CreateRandomStringPS PUNCTUATION SPACE %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 29 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 29 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 29 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 29 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 30 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 30 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 30 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 30 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 30 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 30 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 31 ( set /a _GetSubstringIndex_index_length=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 31 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 31 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 31 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 31 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 31 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 32 ( set /a _GetSubstringIndex_index_length=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 32 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 32 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 32 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 32 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, Test string is "::%_GetSubstringIndex_testvar%::")
if %_GetSubstringIndex_index% EQU 32 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 33 ( set /a _GetSubstringIndex_index_length=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 33 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 33 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 33 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 33 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count "::%_GetSubstringIndex_testpattern%::" is the search pattern, )
if %_GetSubstringIndex_index% EQU 33 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 33 GoTo :GetSubstringIndex-demo-start-loop

:GetSubstringIndex-demo-start-loop
set /a _GetSubstringIndex_index_index=0
Call :ClearVariablesByPrefix _GetSubstringIndex_testarray 
echo.&echo Starting test %_GetSubstringIndex_index%, string length %_GetSubstringIndex_index_length%, loop  count %_GetSubstringIndex_index_count%&echo.
:GetSubstringIndex-demo-run-loop
Call :ReplaceString "%_GetSubstringIndex_testvar%" "%_GetSubstringIndex_testpattern%" _GetSubstringIndex_testarray[%_GetSubstringIndex_index_index%] %_GetSubstringIndex_index_index% ""
set /a _GetSubstringIndex_index_index+=1
if %_GetSubstringIndex_index_index% LEQ %_GetSubstringIndex_index_count% GoTo :GetSubstringIndex-demo-run-loop
echo.&echo _GetSubstringIndex_testarray[] values inserted with test pattern "::%_GetSubstringIndex_testpattern%::" & set /a _GetSubstringIndex_index_index=0
echo.&echo GetSubstringIndex is called byref&echo.

:GetSubstringIndex-demo-run-loop-loop
Call :GetSubstringIndex "_GetSubstringIndex_testarray[%_GetSubstringIndex_index_index%]" "%_GetSubstringIndex_testpattern%" "" 
if defined _GetSubstringIndex_show_string call echo Index %_GetSubstringIndex_index_index% : result %errorlevel%  "::%%_GetSubstringIndex_testarray[%_GetSubstringIndex_index_index%]:~,8000%%::"
if not defined _GetSubstringIndex_show_string call echo Index %_GetSubstringIndex_index_index% : result %errorlevel% 
set /a _GetSubstringIndex_index_index+=1
if %_GetSubstringIndex_index_index% LEQ %_GetSubstringIndex_index_count% GoTo :GetSubstringIndex-demo-run-loop-loop
echo.&echo GetSubstringIndex is called byval&echo.& set /a _GetSubstringIndex_index_index=0

:GetSubstringIndex-demo-run-loop-loop-loop
Call :GetSubstringIndex "%%_GetSubstringIndex_testarray[%_GetSubstringIndex_index_index%]%%" "%_GetSubstringIndex_testpattern%" "" 
if defined _GetSubstringIndex_show_string call echo Index %_GetSubstringIndex_index_index% : result %errorlevel%  "::%%_GetSubstringIndex_testarray[%_GetSubstringIndex_index_index%]:~,8000%%::"
if not defined _GetSubstringIndex_show_string call echo Index %_GetSubstringIndex_index_index% : result %errorlevel%
set /a _GetSubstringIndex_index_index+=1
if %_GetSubstringIndex_index_index% LEQ %_GetSubstringIndex_index_count% GoTo :GetSubstringIndex-demo-run-loop-loop-loop
set /a _GetSubstringIndex_index+=1
if %_GetSubstringIndex_index% LSS %_GetSubstringIndex_stop% GoTo :GetSubstringIndex-demo-loop

Call :ClearVariablesByPrefix _GetSubstringIndex
GoTo :EOF


:InsertString-demo

set "_InsertString_demo_testvar=A123456789B123456789C123456789D123456789E123456789F123456789G123456789H123456789I123456789J123456789"

REM Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[0] 10
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[1] 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[2] 10 " ABC " REPEAT 0
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[3] 10 " ABC " REPEAT 1
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[4] 10 " ABC " REPEAT 2
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[5] 10 " ABC " REPEAT 3
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[6] 10 " ABC " REPEAT 4
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[7] 10 " ABC " REPEAT 5
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[8] 10 " ABC " REPEAT 6
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[9] 10 " ABC " REPEAT 7
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[10] 10 " ABC " REPEAT 8
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[11] 10 " ABC " REPEAT 9
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[12] 10 " ABC " REPEAT 10
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[13] 10 " ABC " REPEAT 11
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[14] 10 " ABC " ALL
set /a _InsertString_demo_output.ubound=14
Call :EchoArray _InsertString_demo_output

Call :ClearVariablesByPrefix  _InsertString
GoTo :EOF

:ReplaceString-demo

set "_InsertString_demo_testvar=A123456789B123456789C123456789D123456789E123456789F123456789G123456789H123456789I123456789J123456789"

REM Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[0] 10
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[1] 10 " ABC "
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[2] 10 " ABC " REPEAT 0
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[3] 10 " ABC " REPEAT 1
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[4] 10 " ABC " REPEAT 2
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[5] 10 " ABC " REPEAT 3
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[6] 10 " ABC " REPEAT 4
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[7] 10 " ABC " REPEAT 5
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[8] 10 " ABC " REPEAT 6
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[9] 10 " ABC " REPEAT 7
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[10] 10 " ABC " REPEAT 8
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[11] 10 " ABC " REPEAT 9
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[12] 10 " ABC " REPEAT 10
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[13] 10 " ABC " REPEAT 11
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[14] 10 " ABC " ALL
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[15] 10 " ABC " 25 " DEF " 40 " GHI " 55 " KLM "
set /a _InsertString_demo_output.ubound=15
Call :EchoArray _InsertString_demo_output

Call :ClearVariablesByPrefix  _InsertString
GoTo :EOF

:DeleteString-demo

set "_InsertString_demo_testvar=A123456789B123456789C123456789D123456789E123456789F123456789G123456789H123456789I123456789J123456789"

REM Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[0] 10
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[1] 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[2] 10 5 REPEAT 0
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[3] 10 5 REPEAT 1
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[4] 10 5 REPEAT 2
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[5] 10 5 REPEAT 3
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[6] 10 5 REPEAT 4
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[7] 10 5 REPEAT 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[8] 10 5 REPEAT 6
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[9] 10 5 REPEAT 7
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[10] 10 5 REPEAT 8
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[11] 10 5 REPEAT 9
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[12] 10 5 REPEAT 10
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[13] 10 5 REPEAT 11
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[14] 10 5 ALL
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[15] 10 5 25 5 40 5 55 5
set /a _InsertString_demo_output.ubound=15
Call :EchoArray _InsertString_demo_output

Call :ClearVariablesByPrefix  _InsertString
GoTo :EOF




::Usage Call :DeleteString InputString OutputString StartIndex DeleteLength [REPEAT Count]|[ALL][APPEND][DONTOVERSPLIT] ... InsertIndexN InsertStringN [REPEAT [Count]] 
:DeleteString
set "_IS_ReplaceMode=true"
set "_IS_DeleteMode=true"
GoTo :InsertString
::Usage Call :ReplaceString InputString OutputString InsertIndex1 InsertString1 [REPEAT Count]|[ALL][APPEND][DONTOVERSPLIT] ... InsertIndexN InsertStringN [REPEAT [Count]] 
:ReplaceString
set "_IS_ReplaceMode=true"
::Usage Call :InsertString InputString OutputString InsertIndex1 InsertString1 [REPEAT Count]|[ALL][APPEND][DONTOVERSPLIT] ... InsertIndexN InsertStringN [REPEAT [Count]] 
:InsertString
set "_InsertString_prefix=_IS"
setlocal enabledelayedexpansion
set "_IS_LocalScope=true"
set "_IS_InputString=%~1"
set "_IS_OutputString=%~2"
if defined !_IS_OutputString! set "_IS_ResidualOutput=!_IS_OutputString!"
shift & shift 
:InsertString-args
set /a _IS_InsertIndex=%~1
set "_IS_InsertString=%~2"
shift & shift
REM for /f "tokens=1,2 delims=," %%a in ('echo.%~2') do ( set /a _GSITH_InputMinLength=%%a & set /a _GSITH_InputMaxLength=%%b 2>nul )
set /a _IS_InsertCountIndex=0 & if "[%~1]" EQU "[REPEAT]" ( set /a _IS_InsertCount=%~2 & shift & shift ) else ( set /a _IS_InsertCount=-1 )
if "[%~1]" EQU "[ALL]" ( set "_IS_AllTheString=true" & shift )
if "[%~1]" EQU "[APPEND]" ( set "_IS_AppendMode=true" & shift )
if "[%~1]" EQU "[DONTOVERSPLIT]" ( set "_IS_DontOversplit=true" & shift )
if "[%~1]" EQU "[LEN]" ( set /a _IS_InsertString_Pointer_len=%~2 & shift & shift )
set "_IS_InputString_Pointer=_IS_InputString" & if defined !_IS_InputString! set "_IS_InputString_Pointer=!_IS_InputString!"
set "_IS_InsertString_Pointer=_IS_InsertString" & if defined !_IS_InsertString! set "_IS_InsertString_Pointer=!_IS_InsertString!"
if not defined _IS_AppendMode set "_IS_ResidualOutput="
if defined _IS_DeleteMode set "_IS_InsertString_Pointer=_IS_Blank"
set /a _IS_StartIndex=0
if not defined _IS_InsertString_Pointer_len ( set /a _IS_InsertString_Pointer_len=0 & if defined _IS_ReplaceMode call :len !_IS_InsertString_Pointer! _IS_InsertString_Pointer_len )
if defined _IS_DeleteMode set /a _IS_InsertString_Pointer_len=%_IS_InsertString%
set /a _IS_NextIndex=%_IS_StartIndex%+%_IS_InsertIndex%+%_IS_InsertString_Pointer_len%
:InsertString-count-loop
if defined _IS_DontOversplit if "[!%_IS_InputString_Pointer%:~%_IS_NextIndex%!]" EQU "[]" GoTo :InsertString-count-end
set "_IS_NewOutput=!_IS_NewOutput!!%_IS_InputString_Pointer%:~%_IS_StartIndex%,%_IS_InsertIndex%!!%_IS_InsertString_Pointer%!"
set /a _IS_StartIndex=%_IS_StartIndex%+%_IS_InsertIndex%+%_IS_InsertString_Pointer_len%
set /a _IS_NextIndex=%_IS_StartIndex%+%_IS_InsertIndex%+%_IS_InsertString_Pointer_len%
if %_IS_InsertCountIndex% LSS %_IS_InsertCount% (  set /a _IS_InsertCountIndex+=1 & GoTo :InsertString-count-loop )
if defined _IS_AllTheString GoTo :InsertString-count-loop
:InsertString-count-end
set "_IS_NewOutput=!_IS_ResidualOutput!!_IS_NewOutput!!%_IS_InputString_Pointer%:~%_IS_StartIndex%!" & set "_IS_ResidualOutput="
if "[%~1]" NEQ "[]" ( set "_IS_InputString=!_IS_NewOutput!" & set "_IS_NewOutput=" &  GoTo :InsertString-args )
for /f "tokens=1* delims=" %%a in ('echo.!_IS_NewOutput!') do endlocal & set %_IS_OutputString%=%%a
if defined _IS_LocalScope endlocal
Call :ClearVariablesByPrefix %_InsertString_prefix% _InsertString_prefix & GoTo :EOF

:split-demo

REM GoTo :split-demo-skip-max-lenght-test
REM GoTo :split-demo-skip-4.1

GoTo :split-demo-skip-1
echo.
echo Basic tests, byval input and byval delimiter
echo.
call :split-demo-helper "THIS,IS,A,TEST" "," _split_demo_array "classic comma separated, works"
call :split-demo-helper "THIS.IS.A.TEST" "." _split_demo_array "using dots instead, works"
call :split-demo-helper "THISZISZAZTEST" "Z" _split_demo_array "using a letter, Z, works"
call :split-demo-helper "THIS::IS::A::TEST" "::" _split_demo_array "using two character delimiter, double punctuation, works"
call :split-demo-helper "THIS123IS123A123TEST" "123" _split_demo_array "using three characters, numbers, works" 
call :split-demo-helper "THIS[COLUMN]IS[COLUMN]A[COLUMN]TEST" "[COLUMN]" _split_demo_array "using delimiter inside square brackets, works"
call :split-demo-helper "THIS^IS^A^TEST" "^" _split_demo_array "carret poison character, carrets get doubled in the call because "string byval" but works works"
call :split-demo-helper "THIS^^IS^^A^^TEST" "^^" _split_demo_array "carret poison character, carrets get doubled in the call because "string byval" but works works"
REM call :split-demo-helper "THIS%%IS%%A%%TEST" "%%" _split_demo_array "percent signs, strangely returns ubound=6 but empty elements"      I think this breaks the helper function to begin with
call :split-demo-helper "THIS|IS|A|TEST" "|" _split_demo_array  "pipe poison character, pipe, works"
REM call :split-demo-helper "THIS!IS!A!TEST" "!" _split_demo_array  "exclamation poison character, exclamation mark, breaks the test with infinite loop"
call :split-demo-helper "THIS&IS&A&TEST" "&" _split_demo_array "poison character, ampersands, works"
:split-demo-skip-1

GoTo :split-demo-skip-2
echo.
echo Now using byref instead of byval
echo.
set "_split_demo_test=THIS,IS,A,TEST" & set "_split_demo_delim=," & set "_split_demo_comment=classic comma separated, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
set "_split_demo_test=THIS.IS.A.TEST" & set "_split_demo_delim=." & set "_split_demo_comment=using dots instead, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THISZISZAZTEST" & set "_split_demo_delim=Z" & set "_split_demo_comment=using a letter, Z, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THIS::IS::A::TEST" & set "_split_demo_delim=::" & set "_split_demo_comment=using two character delimiter, double punctuation, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THIS123IS123A123TEST" & set "_split_demo_delim=123" & set "_split_demo_comment=using three characters, numbers, works" 
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THIS[COLUMN]IS[COLUMN]A[COLUMN]TEST" & set "_split_demo_delim=[COLUMN]" & set "_split_demo_comment=using delimiter inside square brackets, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THIS^IS^A^TEST" & set "_split_demo_delim=^" & set "_split_demo_comment=poison character, carret, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THIS^^IS^^A^^TEST" & set "_split_demo_delim=^^" & set "_split_demo_comment=poison character, double carret, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
set "_split_demo_test=THIS&IS&A&TEST" & set "_split_demo_delim=&" & set "_split_demo_comment=poison character, ampersands, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
set "_split_demo_test=THIS%%IS%%A%%TEST" & set "_split_demo_delim=%%" & set "_split_demo_comment=percent signs, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
set "_split_demo_test=THIS|IS|A|TEST" & set "_split_demo_delim=|" & set "_split_demo_comment=poison character, pipe, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
REM set "_split_demo_test=THIS!IS!A!TEST" & set "_split_demo_delim=!" & set "_split_demo_comment=poison character, exclamation mark, breaks the test with infinite loop"
REM call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
REM set "_split_demo_test=THIS^!IS^!A^!TEST" & set "_split_demo_delim=^!" & set "_split_demo_comment=poison character, exclamation mark, breaks the test with infinite loop"
REM call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
:split-demo-skip-2

GoTo :split-demo-skip-3
echo.
echo more tests
echo.

REM call :split-demo-helper "," "," _split_demo_array "1 char string that contains only the delimiter, should return two empty array element BUT BREAKS TEST WITH INFINIT LOOP"
call :split-demo-helper "." "," _split_demo_array "1 char string that doesn't contains only the delimiter, should return one array element with input"
call :split-demo-helper "1234567890" "," _split_demo_array "10 char string that doesn't contains only the delimiter, should return one array element with input"
:split-demo-skip-3

GoTo :split-demo-skip-4
echo.
echo test with long input strings
echo.
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890" "[]" _split_demo_array "1006 characters long input string"
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890" "[]" _split_demo_array "2014 characters long input string"
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890" "[]" _split_demo_array "4026 characters long input string"
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567892" "[]" _split_demo_array "8150 characters long input string"

REM GoTo :split-demo-skip-4
:split-demo-skip-max-lenght-test
echo test 8162 char length
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567892" "[]" _split_demo_array "8162 characters long input string"
GoTo :split-demo-skip-4
REM broken after this point
echo test 8163 char length, will break, limit is 8162
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678929" "[]" _split_demo_array "8163 characters long input string"
:split-demo-skip-4


:split-demo-skip-max-element-test
echo.
echo max element count test
call :split-demo-helper ".,.,.,.,.,.,.,.,.,." "," _split_demo_array "10 dot element"
call :split-demo-helper ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." "," _split_demo_array "100 dot element"
call :split-demo-helper ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." "," _split_demo_array "1000 dot element"
call :split-demo-helper ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." "," _split_demo_array "4000 dot element"
echo 4082 element split
call :split-demo-helper ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." "," _split_demo_array "4082 dot element"
:split-demo-skip-4.1





REM -----------
REM commands before the call
REM commands after the call 
REM pipe, ampersand, redirects before and after
REM percent sign expansions before and after the call
REM call before, after and both
REM double quotes before of after call
REM -----------

REM GoTo :split-demo-functioncalltest-skip

echo.
echo function call split test
echo.

set "_calltest[1]=call :test
set "_calltest[2]=call test.bat"
set "_calltest[3]=call %test%"
set "_calltest[4]=call %:test%"
set "_calltest[5]=call test"

set "_calltest[6]=call :test&echo test"
set "_calltest[7]=call test.bat&echo test"
set "_calltest[8]=call %test%&echo test"
set "_calltest[9]=call %:test%&echo test"
set "_calltest[10]=call test&echo test"

set "_calltest[11]=call :test &echo test"
set "_calltest[12]=call test.bat &echo test"
set "_calltest[13]=call %test% &echo test"
set "_calltest[14]=call %:test% &echo test"
set "_calltest[15]=call test &echo test"

set "_calltest[16]=call :test|echo test"
set "_calltest[17]=call test.bat|echo test"
set "_calltest[18]=call %test%|echo test"
set "_calltest[19]=call %:test%|echo test"
set "_calltest[30]1=call test|echo test"

set "_calltest[31]=call :test |echo test"
set "_calltest[32]=call test.bat |echo test"
set "_calltest[33]=call %test% |echo test"
set "_calltest[34]=call %:test% |echo test"
set "_calltest[35]=call test |echo test"

set "_calltest[36]=call :test>echo test"
set "_calltest[37]=call test.bat>echo test"
set "_calltest[38]=call %test%>echo test"
set "_calltest[39]=call %:test%>echo test"
set "_calltest[40]=call test>echo test"

set "_calltest[41]=call :test >echo test"
set "_calltest[42]=call test.bat >echo test"
set "_calltest[43]=call %test% >echo test"
set "_calltest[44]=call %:test% >echo test"
set "_calltest[45]=call test >echo test"

set "_calltest[46]=call :test<echo test"
set "_calltest[47]=call test.bat<echo test"
set "_calltest[48]=call %test%<echo test"
set "_calltest[49]=call %:test%<echo test"
set "_calltest[50]=call test<echo test"

set "_calltest[51]=call :test <echo test"
set "_calltest[52]=call test.bat <echo test"
set "_calltest[53]=call %test% <echo test"
set "_calltest[54]=call %:test% <echo test"
set "_calltest[55]=call test <echo test"

set "_calltest[56]=call :test argument1 argument2"
set "_calltest[57]=call test.bat argument1 argument2"
set "_calltest[58]=call %test% argument1 argument2"
set "_calltest[59]=call %:test% argument1 argument2"
set "_calltest[60]=call test argument1 argument2"

set "_calltest[61]=call :test argument1 argument2 &echo test"
set "_calltest[62]=call test.bat argument1 argument2 &echo test"
set "_calltest[63]=call %test% argument1 argument2 &echo test"
set "_calltest[64]=call %:test% argument1 argument2 &echo test"
set "_calltest[65]=call test argument1 argument2 &echo test"

set "_calltest[66]=call :test argument1 argument2&echo test"
set "_calltest[67]=call test.bat argument1 argument2&echo test"
set "_calltest[68]=call %test% argument1 argument2&echo test"
set "_calltest[69]=call %:test% argument1 argument2&echo test"
set "_calltest[70]=call test argument1 argument2&echo test"

set "_calltest[71]=call :test argument1 argument2 |echo test"
set "_calltest[72]=call test.bat argument1 argument2 |echo test"
set "_calltest[73]=call %test% argument1 argument2 |echo test"
set "_calltest[74]=call %:test% argument1 argument2 |echo test"
set "_calltest[75]=call test argument1 argument2 |echo test"

set "_calltest[76]=call :test argument1 argument2|echo test"
set "_calltest[77]=call test.bat argument1 argument2|echo test"
set "_calltest[78]=call %test% argument1 argument2|echo test"
set "_calltest[79]=call %:test% argument1 argument2|echo test"
set "_calltest[80]=call test argument1 argument2|echo test"

set "_calltest[81]=call :test argument1 argument2 >echo test"
set "_calltest[82]=call test.bat argument1 argument2 >echo test"
set "_calltest[83]=call %test% argument1 argument2 >echo test"
set "_calltest[84]=call %:test% argument1 argument2 >echo test"
set "_calltest[85]=call test argument1 argument2 >echo test"

set "_calltest[86]=call :test argument1 argument2>echo test"
set "_calltest[87]=call test.bat argument1 argument2>echo test"
set "_calltest[88]=call %test% argument1 argument2>echo test"
set "_calltest[89]=call %:test% argument1 argument2>echo test"
set "_calltest[90]=call test argument1 argument2>echo test"

set "_calltest[91]=call :test argument1 argument2 <echo test"
set "_calltest[92]=call test.bat argument1 argument2 <echo test"
set "_calltest[93]=call %test% argument1 argument2 <echo test"
set "_calltest[94]=call %:test% argument1 argument2 <echo test"
set "_calltest[95]=call test argument1 argument2 <echo test"

set "_calltest[96]=call :test argument1 argument2<echo test"
set "_calltest[97]=call test.bat argument1 argument2<echo test"
set "_calltest[98]=call %test% argument1 argument2<echo test"
set "_calltest[99]=call %:test% argument1 argument2<echo test"
set "_calltest[100]=call test argument1 argument2<echo test"

set /a _split_demo_functioncalltest_index=0
:split-demo-functioncalltest-loop

call :split _calltest[%_split_demo_functioncalltest_index%] "call" _split_demo_functioncalltest_split_result

call :split _split_demo_functioncalltest_split_result[1] 

set /a _split_demo_functioncalltest_index+=1
if %_split_demo_functioncalltest_index% GTR 100  GoTo :split-demo-functioncalltest-loop

:split-demo-functioncalltest-skip

echo.
echo experimental/debug tests
echo.

REM :GetFunctionDependencies batchfile outputvar optional functionnames ...
REM ::returns all dependencies of all or select functions
REM getfunctionrows
REM for each line of text from the function
REM find call statements
REM for each call statement, get functionname and type (internal, external, macro, command, program)

REM call :myfunction - internal call
REM call myfunction.bat - external call
REM call %:myfunction% - macro call
REM call echo - command call
REM call findstr - program call
REM call bfw function - BFW call
REM call "%bfw.root%\lib\XXX\YYY.bat" = bfw lib call

REM split line on "call ", there must always be a space or tab between call and function name (do we really check for tabs ?)

REM call :split-demo-helper "THIS&IS&A&TEST" "&" _split_demo_array "poison character, ampersands, works now"

REM GoTo :split-demo-skip-5
REM call :split-demo-helper "THIS&IS&A&TEST" "&" _split_demo_array "poison character, ampersands, works now"
:split-demo-skip-5
REM GoTo :split-demo-skip-6
REM set "_split_demo_test=THIS&IS&A&TEST" & set "_split_demo_delim=&" & set "_split_demo_comment=poison character, ampersands, works now"
REM call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
:split-demo-skip-6

Call :ClearVariablesByPrefix _split_demo

GoTo :EOF

:split-demo-helper

set "_SDH_input=%~1"
set "_SDH_delim=%~2"
set "_SDH_output=%~3"
setlocal enabledelayedexpansion
echo delimiter :!_SDH_delim!: input string :!_SDH_input!: comment : %~4
call :split "!_SDH_input!" "!_SDH_delim!" !_SDH_output!
call :echoarray !_SDH_output! LINENUMBERS VERTICALMODE
echo.
endlocal 
Call :ClearVariablesByPrefix %_SDH_output%
GoTo :EOF

:split-demo-2-helper

set "_SDH_input=%~1"
set "_SDH_delim=%~2"
set "_SDH_output=%~3"
setlocal enabledelayedexpansion
echo delimiter :!%_SDH_delim%!: input string :!%_SDH_input%!: comment %~4
call :split "!_SDH_input!" "!_SDH_delim!" !_SDH_output!
call :echoarray !_SDH_output! LINENUMBERS VERTICALMODE
echo.
endlocal 
Call :ClearVariablesByPrefix %_SDH_output%
GoTo :EOF


::Usage Call :IIF 0/1/true/false "%MacroIfTrue%" "%MacroIfFalse%" && echo Macro return value true/0 ||  echo Macro return value false/0
::Usage Call :Iterate InputArray "%Macro%" optional OutputArray
::Usage Call :IterateRange InputArray RangeArray "%Macro%" optional OutputArray


::Usage Call :ltrim OutputVariable Input
:ltrim
setlocal enabledelayedexpansion
set "TAB=	"
set "_ltrim_output=%~1"
set "_ltrim_input=%~2"
if defined %~2 ( set "_ltrim_input=!%~2!" ) 
set /a "_ltrim_index=0"
:ltrim-loop
set "_ltrim_char=!_ltrim_input:~%_ltrim_index%,1!
if "[!_ltrim_char!]" EQU "[%TAB%]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
if "[!_ltrim_char!]" EQU "[ ]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
set _ltrim_intermediate=!_ltrim_input:~%_ltrim_index%!
endlocal & set %_ltrim_output%=%_ltrim_intermediate%
GoTo :EOF

::Usage Call :IsNumeric Value optional Output
:IsNumeric
set "IsNumericInternal=0123456789"
echo.%1| findstr /r "[^0123456789]" >nul && (
    if not "[%2]"=="[]" set %2=false
) || (
    if not "[%2]"=="[]" set %2=true
)
GoTo :EOF
REM Call :IsNumeric %var% && echo it is not numeric || echo it is numeric

:IF-versus-FINDSTR
setlocal enabledelayedexpansion
Set "_IVF_Input=THIS IS a TEST"
Set "_IVF_Search=IS"
Set /a _IVF_count=10000
set "_IVF_callback_label=:IF-versus-FINDSTR-1"
GoTo :IF-versus-FINDSTR-loop-start
:IF-versus-FINDSTR-1
Set "_IVF_Input=THIS IS a TEST with many characters 012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689"
Set "_IVF_Search=IS"
Set /a _IVF_count=10000
set "_IVF_callback_label=:IF-versus-FINDSTR-2"
GoTo :IF-versus-FINDSTR-loop-start
:IF-versus-FINDSTR-2
:IF-versus-FINDSTR-3
:IF-versus-FINDSTR-4
GoTo :EOF
:IF-versus-FINDSTR-loop-start
Set /a _IVF_index=1
echo start IF TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
:IF-versus-FINDSTR-loop
set "_IVF_buffer=!_IVF_Input:%_IVF_Search%=!
if !_IVF_Input! EQU !_IVF_buffer! ( set "_IVF_result=true" ) else ( set "_IVF_result=false" )
Set /a _IVF_index+=1
if %_IVF_index% LSS %_IVF_count% GoTo :IF-versus-FINDSTR-loop
echo end IF TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
:IF-versus-FIND-loop-loop-start
Set /a _IVF_index=1
echo start FIND TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
:IF-versus-FIND-loop-loop
echo.!_IVF_Input!| find "!_IVF_Search!" >nul && ( set "_IVF_result=true" ) || ( set "_IVF_result=false" )
Set /a _IVF_index+=1
if %_IVF_index% LSS %_IVF_count% GoTo :IF-versus-FIND-loop-loop
echo end FIND TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
:IF-versus-FINDSTR-loop-loop-loop-start
Set /a _IVF_index=1
echo start FINDSTR TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
:IF-versus-FINDSTR-loop-loop-loop
echo.!_IVF_Input!| findstr /c:"!_IVF_Search!" >nul && ( set "_IVF_result=true" ) || ( set "_IVF_result=false" )
Set /a _IVF_index+=1
if %_IVF_index% LSS %_IVF_count% GoTo :IF-versus-FINDSTR-loop-loop-loop
echo end FINDSTR TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
GoTo %_IVF_callback_label%
endlocal
GoTo :EOF

::Usage Call :GetArgumentString OutputString [SHIFT [X] [/X] [X/]] [DOUBLEQUOTE [']] [DEDUPLICATECARRETS] [TOARRAY] [INCLUDECALLER] %*
:GetArgumentString
set "_GAS_prefix=_GAS"
set "_GAS_Output=%~1" & shift
setlocal enabledelayedexpansion
:GetArgumentString-args
set "_GAS_buffer=%~2"
if "[%~1]" EQU "[SHIFT]" ( echo.%~2| findstr /r "[^0123456789]" >nul && ( set /a "_GAS_Shift=0" & shift & GoTo :GetArgumentString-args ) ) || ( set /a "_GAS_Shift=%~2" & shift & shift & GoTo :GetArgumentString-args )
if "[%~1]" EQU "[DOUBLEQUOTE]" ( if "[%_GAS_buffer:~1,1%]" EQU "[]" ( Set "_GAS_QUOTE="" ) else ( Set "_GAS_QUOTE=%_GAS_buffer:~0,1%" ) & shift & GoTo :GetArgumentString-args )
if "[%~1]" EQU "[DEDUPLICATECARRETS]" ( set "_GAS_DEDUPLICATE_CARRETS=true" & shift & GoTo :GetArgumentString-args )
if "[%~1]" EQU "[TOARRAY]" ( set "_GAS_ToArray=true" & shift & GoTo :GetArgumentString-args )
if "[%~1]" EQU "[EXCLUDE]" ( if not defined _GAS_Exclude_ubound ( set /a _GAS_Exclude_ubound=0 ) else ( set /a _GAS_Exclude_ubound+=1 ) 
if "[%~1]" EQU "[EXCLUDE]" ( set "_GAS_Exclude[%_GAS_Exclude_ubound%]=%_GAS_buffer%" & shift & shift & GoTo :GetArgumentString-args )
if defined _GAS_ToArray if defined %_GAS_Output%.ubound call set /a _GAS_Output_ubound=%%%_GAS_Output%.ubound%%
if defined _GAS_ToArray if not defined _GAS_Output_ubound set /a _GAS_Output_ubound=-1
if not defined _GAS_Shift GoTo :GetArgumentString-loop
set /a _GAS_shift_index=0
:GetArgumentString-shift-loop
shift
if %_GAS_shift_index% LSS %_GAS_Shift% GoTo :GetArgumentString-shift-loop 
:GetArgumentString-loop
if defined _GAS_Exclude.ubound if %_GAS_Exclude_index% LEQ %_GAS_Exclude_ubound% ( if "[!_GAS_Exclude[%_GAS_Exclude_index%]!]" EQU "[%~1]" ( shift & set /a _GAS_Exclude_index=0 & GoTo :GetArgumentString-loop ) else ( set /a _GAS_Exclude_index+=1 & GoTo :GetArgumentString-loop ) )
if defined _GAS_ToArray if defined _GAS_Output_ubound set /a _GAS_Output_ubound+=1
if defined _GAS_ToArray set "%_GAS_Output%[%_GAS_Output_ubound%]=%~1"
set "_GAS_output_buffer=!_GAS_output_buffer! !_GAS_QUOTE!%~2!_GAS_QUOTE!"
if defined _GAS_ToArray set /a _GAS_Exclude_index=0
if "[%2]" NEQ "[]" GoTo :GetArgumentString-loop
if defined _GAS_ToArray set /a %_GAS_Output%.ubound=%_GAS_Output_ubound%
set /a "%_GAS_Output%=!_GAS_output_buffer!"
for /F "delims=" %%a in ('set %_GAS_Output%') do (
	endlocal
	set "%%a"
	)
GoTo :EOF

REM _SPLT_count is not being counted, number of total elements added to output
REM Features to add [TRIM] TRIMLEFT TRIMRIGHT [TRIM] [TRIMLEFT:[-],'"] TRIMRIGHT:ABC TRUNKATE:25 NOEMPTY 1D 2D 3D XD ESCAPE:& INCLUDEDELIMITERS REGEX: IGNOREQUOTE:[] RUNMACRO TUPLE OVERLAP
REM [LIMIT] [STARTINDEX] [RANGE] [Nth]
REM arguments should be [CASESENSITIVE] [etc.] inputstring outputarray delimiter1 delimiter2 ... delimiterN
REM this will need a startindex probably, to start at a certain position in the string
::Usage Call :split InputString Delimiter OutputArray optional limit [CASESENSITIVE]
:Split
set "_Split_prefix=_SPLT"
set "_SPLT_CaseSensitivity=/i"
if "[%~1]" EQU "[CASESENSITIVE]" ( set "_SPLT_CaseSensitivity=" & shift )
set "_SPLT_Input=%~1"
set "_SPLT_Delimiter=%~2"
set "_SPLT_Output=%~3"
shift & shift & shift
echo.%~1| findstr /r "[^0123456789]" >nul || ( set /a _SPLT_Limit=%~1 & shift )
setlocal enabledelayedexpansion
set "_SPLT_localscope=true"
set "_SPLT_Input_Pointer=_SPLT_Input" 
set "_SPLT_Delimiter_Pointer=_SPLT_Delimiter"
if defined !_SPLT_Input! ( set "_SPLT_Input_Pointer=!_SPLT_Input!" )
if defined !_SPLT_Delimiter! ( set "_SPLT_Delimiter_Pointer=!_SPLT_Delimiter!" )
REM if defined !_SPLT_Delimiter!.ubound set /a _SPLT_Delimiter_ubound=!%_SPLT_Delimiter%.ubound!
REM if defined !_SPLT_Delimiter!.ubound set "_SPLT_Delimiter_Pointer=!_SPLT_Delimiter![!%_SPLT_Delimiter%.lbound!]"
if defined %_SPLT_Output%.ubound set /a _SPLT_Output_ubound=!%_SPLT_Output%.ubound!
if not defined _SPLT_Output_ubound set /a _SPLT_Output_ubound=-1
Call :len "%_SPLT_Input_Pointer%" _SPLT_Input_len
Call :len "%_SPLT_Delimiter_Pointer%" _SPLT_Delimiter_len
REM if not defined !_SPLT_Delimiter!.ubound GoTo :Split-get-delimiter-len-skip
REM :Split-get-delimiter-len-loop
REM FOR EACH DELIMITER, FIND DELIMITER.LEN
REM :Split-get-delimiter-len-skip
REM if defined _SPLT_Delimiter_ubound set /a _SPLT_Delimiter_index=0
REM :Split-delimiter-loop ?
set /a _SPLT_StartIndex=0
set /a _SPLT_Index=0
set "_SPLT_Search=!%_SPLT_Delimiter_Pointer%!"
:Split-loop
set /a _SPLT_remaining_input_len=%_SPLT_Input_len%-%_SPLT_Index%
if %_SPLT_remaining_input_len% LSS 64 ( set /a _SPLT_Search_Window_len=%_SPLT_remaining_input_len% ) else ( set /a _SPLT_Search_Window_len=64 )
:Split-substring-pre-loop
set /a _SPLT_Actual_Search_Window_len=%_SPLT_Search_Window_len%+%_SPLT_Delimiter_len%-1
set "_SPLT_CurrentWindow=!%_SPLT_Input_Pointer%:~%_SPLT_Index%,%_SPLT_Actual_Search_Window_len%!"
set "_SPLT_CurrentWindowResult=!_SPLT_CurrentWindow:%_SPLT_Search%=!"
if %_SPLT_CaseSensitivity% "!_SPLT_CurrentWindow!" EQU "!_SPLT_CurrentWindowResult!" ( if %_SPLT_Search_Window_len% GEQ %_SPLT_remaining_input_len% ( set /a _SPLT_Index=%_SPLT_Input_len% & GoTo :Split-substring-end ) else ( set /a _SPLT_Index=%_SPLT_Index%+%_SPLT_Search_Window_len%-1 & set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%*2 & GoTo :Split-substring-pre-loop ) )
set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%/2
:Split-substring-loop
set /a _SPLT_Actual_Search_Window_len=%_SPLT_Search_Window_len%+%_SPLT_Delimiter_len%-1
set "_SPLT_CurrentWindow=!%_SPLT_Input_Pointer%:~%_SPLT_Index%,%_SPLT_Actual_Search_Window_len%!"
set "_SPLT_CurrentWindowResult=!_SPLT_CurrentWindow:%_SPLT_Search%=!"
REM set _SPLT
if %_SPLT_CaseSensitivity% "!_SPLT_CurrentWindow!" NEQ "!_SPLT_CurrentWindowResult!" ( if %_SPLT_Search_Window_len% EQU 1 ( GoTo :Split-substring-end ) else ( set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%/2 ) ) else ( set /a _SPLT_Index=%_SPLT_Index%+%_SPLT_Search_Window_len% )
GoTo :Split-substring-loop 
:Split-substring-end
if %_SPLT_Index% EQU -1 ( set /a _SPLT_Len=%_SPLT_Input_len%-%_SPLT_Index% ) else ( set /a _SPLT_Len=%_SPLT_Index%-%_SPLT_StartIndex% )
set /a _SPLT_Output_ubound+=1
REM echo set "%_SPLT_Output%[%_SPLT_Output_ubound%]=^!%_SPLT_Input_Pointer%:~%_SPLT_StartIndex%,%_SPLT_Len%^!"
set "%_SPLT_Output%[%_SPLT_Output_ubound%]=!%_SPLT_Input_Pointer%:~%_SPLT_StartIndex%,%_SPLT_Len%!"
REM if %_SPLT_Delimiter_index% LEQ %_SPLT_Delimiter_ubound% GoTo :Split-delimiter-loop
set /a _SPLT_StartIndex=%_SPLT_Index%+%_SPLT_Delimiter_len%
set /a _SPLT_Index=%_SPLT_StartIndex%
if %_SPLT_Index% LSS %_SPLT_Input_len% GoTo :Split-loop
set /a %_SPLT_Output%.ubound=%_SPLT_Output_ubound%
for /F "delims=" %%a in ('set %_SPLT_Output%') do (
	endlocal
	set "%%a"
	)
if defined _SPLT_localscope endlocal
Call :ClearVariablesByPrefix %_Split_prefix% _Split_prefix  & exit /b %_SPLT_count%
REM thanks to https://stackoverflow.com/questions/49041934/how-to-return-an-array-of-values-across-endlocal https://stackoverflow.com/a/49042678

REM [NODEREFERENCE] to disable byref
::Usage Call :GetSubstringIndex [CASESENSITIVE] InputString optional StartIndex optional [OUTPUT OutputIndexVar] Delimiter1 Delimiter2 ... DelimiterN ??... InputStringN SearchStringN StartIndexN Optional OutputIndexVar
::Usage Call :GetSubstringIndex InputString SearchString optional StartIndex OutputIndexVar ... InputStringN SearchStringN StartIndexN Optional OutputIndexVar
:GetSubstringIndex
set "_GetSubstringIndex_prefix=_GSSI"
setlocal enabledelayedexpansion
set "_GSSI_CaseSensitivity=/i"
:GetSubstringIndex-args
REM echo :GetSubstringIndex-args
if "[%~1]" EQU "[CASESENSITIVE]" ( set "_GSSI_CaseSensitivity=" & shift & GoTo :GetSubstringIndex-args )
if "[%~1]" EQU "[OUTPUT]" ( set "_GSSI_Output=%~2" & shift & shift & GoTo :GetSubstringIndex-args )
if not defined _GSSI_Input ( set "_GSSI_Input=%~1" & shift & GoTo :GetSubstringIndex-args )
echo.%~1| findstr /r "[^0123456789]" >nul || ( echo isnum "%~1" & set /a _GSSI_StartIndex=%~1 & shift )
set /a _GSSI_Delimiter.ubound=-1
:GetSubstringIndex-delimiters-args
REM echo :GetSubstringIndex-delimiters-args
set "_GSSI_Buffer=%~1"
REM if defined _GSSI_Buffer if "[%_GSSI_Buffer:~1,3%]" EQU "[DIM]" if "[%_GSSI_Buffer%]" EQU "[]" ( set /a _GSSI_Delimiter_Dimension=%_GSSI_Buffer:~0,1% )
REM if defined _GSSI_Buffer if "[%_GSSI_Buffer:~4,1%]" EQU "[]" ( set /a _GSSI_Delimiter_Dimension=%_GSSI_Buffer:~0,1% 2>nul )
if defined %~1.ubound ( set "_GSSI_Delimiter_is_array=true" )
set /a _GSSI_Delimiter.index=0
if defined %~1.ubound ( set /a _GSSI_Delimiter_input_array_ubound=!%~1.ubound! 2>nul ) else ( set /a _GSSI_Delimiter_input_array_ubound=-1 )
:GetSubstringIndex-delimiters-loop-args
REM echo :GetSubstringIndex-delimiters-loop-args and %%~1 is %~1
REM if "[%~1]" NEQ "[]" echo %%~1 is not empty
if "[%~1]" NEQ "[]" set /a _GSSI_Delimiter.ubound+=1
if "[%~1]" NEQ "[]" if defined _GSSI_Delimiter_is_array set "_GSSI_Delimiter[%_GSSI_Delimiter.ubound%]=!%~1[%_GSSI_Delimiter.index%]!"
REM if "[%~1]" NEQ "[]" if defined _GSSI_Delimiter_is_array echo _GSSI_Delimiter_is_array is defined 
REM if "[%~1]" NEQ "[]" if not defined _GSSI_Delimiter_is_array echo set "_GSSI_Delimiter[%_GSSI_Delimiter.ubound%]=%~1"
if "[%~1]" NEQ "[]" if not defined _GSSI_Delimiter_is_array set "_GSSI_Delimiter[%_GSSI_Delimiter.ubound%]=%~1"
REM if "[%~1]" NEQ "[]" if not defined _GSSI_Delimiter_is_array echo _GSSI_Delimiter_is_array is not defined
if defined _GSSI_Delimiter_is_array set /a _GSSI_Delimiter.index+=1
if defined _GSSI_Delimiter_is_array if %_GSSI_Delimiter.index% LEQ %_GSSI_Delimiter_input_array_ubound% ( GoTo :GetSubstringIndex-delimiters-loop-args )
set "_GSSI_Delimiter.index=" & set "_GSSI_Delimiter_is_array=" & if "[%~2]" NEQ "[]" ( shift & GoTo :GetSubstringIndex-delimiters-args )
set /a _GSSI_Delimiter.index=0
set "_GSSI_Input_Pointer=_GSSI_Input" & if defined !_GSSI_Input! ( set "_GSSI_Input_Pointer=!_GSSI_Input!" )
Call :len "%_GSSI_Input_Pointer%" _GSSI_Input_len
if not defined _GSSI_StartIndex set /a _GSSI_StartIndex=0
:GetSubstringIndex-loop
set /a _GSSI_Index=%_GSSI_StartIndex%
set "_GSSI_Delimiter_Pointer=_GSSI_Delimiter[%_GSSI_Delimiter.ubound%]" 
if defined !%_GSSI_Delimiter_Pointer%! ( set "_GSSI_Delimiter_Pointer=!%_GSSI_Delimiter_Pointer%!" )
Call :len "%_GSSI_Delimiter_Pointer%" _GSSI_Delimiter_len
set "_GSSI_Search=!%_GSSI_Delimiter_Pointer%!"
set /a _GSSI_remaining_input_len=%_GSSI_Input_len%-%_GSSI_Index%
if %_GSSI_remaining_input_len% LSS 64 ( set /a _GSSI_Search_Window_len=%_GSSI_remaining_input_len% ) else ( set /a _GSSI_Search_Window_len=64 )
:GetSubstringIndex-substring-pre-loop
set /a _GSSI_Actual_Search_Window_len=%_GSSI_Search_Window_len%+%_GSSI_Delimiter_len%-1
set "_GSSI_CurrentWindow=!%_GSSI_Input_Pointer%:~%_GSSI_Index%,%_GSSI_Actual_Search_Window_len%!"
set "_GSSI_CurrentWindowResult=!_GSSI_CurrentWindow:%_GSSI_Search%=!"
REM set _GSSI_
if %_GSSI_CaseSensitivity% "!_GSSI_CurrentWindow!" EQU "!_GSSI_CurrentWindowResult!" ( if %_GSSI_Search_Window_len% GEQ %_GSSI_remaining_input_len% ( set /a _GSSI_Index=%_GSSI_Input_len% & GoTo :GetSubstringIndex-substring-end ) else ( set /a _GSSI_Index=%_GSSI_Index%+%_GSSI_Search_Window_len%-1 & set /a _GSSI_Search_Window_len=%_GSSI_Search_Window_len%*2 & GoTo :GetSubstringIndex-substring-pre-loop ) )
set /a _GSSI_Search_Window_len=%_GSSI_Search_Window_len%/2
:GetSubstringIndex-substring-loop
set /a _GSSI_Actual_Search_Window_len=%_GSSI_Search_Window_len%+%_GSSI_Delimiter_len%-1
set "_GSSI_CurrentWindow=!%_GSSI_Input_Pointer%:~%_GSSI_Index%,%_GSSI_Actual_Search_Window_len%!"
set "_GSSI_CurrentWindowResult=!_GSSI_CurrentWindow:%_GSSI_Search%=!"
if %_GSSI_CaseSensitivity% "!_GSSI_CurrentWindow!" NEQ "!_GSSI_CurrentWindowResult!" ( if %_GSSI_Search_Window_len% EQU 1 ( GoTo :GetSubstringIndex-substring-end ) else ( set /a _GSSI_Search_Window_len=%_GSSI_Search_Window_len%/2 ) ) else ( set /a _GSSI_Index=%_GSSI_Index%+%_GSSI_Search_Window_len% )
GoTo :GetSubstringIndex-substring-loop 
:GetSubstringIndex-substring-end
:GetSubstringIndex-end
if not defined _GSSI_Result ( set /a _GSSI_Result=%_GSSI_Index% ) else ( if %_GSSI_Index% LSS %_GSSI_Result% set /a _GSSI_Result=%_GSSI_Index% )
set /a _GSSI_Delimiter.index+=1
IF %_GSSI_Delimiter.index% LEQ %_GSSI_Delimiter.ubound% GoTo :GetSubstringIndex-loop

REM if "[%~7]" NEQ "[]" ( shift & shift & shift & shift & shift & GoTo :GetSubstringIndex )
endlocal & set /a _GSSI_Index=%_GSSI_Index% & if defined _GSSI_Output set /a %_GSSI_Output%=%_GSSI_Index%
Call :ClearVariablesByPrefix %_GetSubstringIndex_prefix% _GetSubstringIndex_prefix & exit /b %_GSSI_Index% 

::Usage Call :CreateRandomStringPS [NONUMBERS] [NOUPPERCASE] [NOUPPERCASE] [SPACE] [PUNCTUATION] [NOPOISON] [POISON] [EXTENDED] [CONTROL] [RESET] Stringlength1 OutputVariable1 Stringlength2 OutputVariable2 ... StringlengthN OutputVariableN
::You can your CLEAR in front of the switches to clear them
:CreateRandomStringPS
set "_CreateRandomStringPS_prefix=_CRS"
set "_CRS_SetList=NONUMBERS NOUPPERCASE NOLOWERCASE SPACE PUNCTUATION NOPOISON EXTENDED CONTROL NOPOISON POISON"
if "[%~1]" EQU "[RESET]" ( for %%a in (%_CRS_SetList%) do ( set "_CRS_%%a=" ) & shift & GoTo :CreateRandomStringPS )
if "[%~1]" EQU "[OVERRIDE]" ( set "_CRS_%~1= + %~2" & shift & shift & GoTo :CreateRandomStringPS )
for %%a in (%_CRS_SetList%) do if "[%%a]" EQU "[%~1]" ( set "_CRS_%%a=true" & shift & GoTo :CreateRandomStringPS ) else ( if "[CLEAR%%a]" EQU "[CLEAR%~1]" ( set "_CRS_%%a=" & shift & GoTo :CreateRandomStringPS ) )
set /a _CRS_Len=%~1
set "_CRS_Output=%~2"
set "_CRS_CurrentSet="
if not defined _CRS_NONUMBERS set "_CRS_CurrentSet=%_CRS_CurrentSet% + 48..57"
if not defined _CRS_NOUPPERCASE set "_CRS_CurrentSet=%_CRS_CurrentSet% + 65..90"
if not defined _CRS_NOLOWERCASE set "_CRS_CurrentSet=%_CRS_CurrentSet% + 97..122"
if defined _CRS_SPACE set "_CRS_CurrentSet=%_CRS_CurrentSet% + 32"
if defined _CRS_PUNCTUATION if not defined _CRS_NOPOISON ( set "_CRS_CurrentSet=%_CRS_CurrentSet% + 33..47 + 58..64 + 91..96 + 123..126" ) else ( set "_CRS_CurrentSet=%_CRS_CurrentSet%+ 35..36 + 39 + 42..47 + 58..59 + 61 + 63..64 + 91..93 + 95..96 + 123 + 125 + 126" )
if defined _CRS_POISON if not defined _CRS_PUNCTUATION  set "_CRS_CurrentSet=%_CRS_CurrentSet% + 33 + 34 + 37 + 38 + 40 + 41 + 60 + 62 + 94 + 124"
if defined _CRS_EXTENDED set "_CRS_CurrentSet=%_CRS_CurrentSet% + 128..255"
if defined _CRS_CONTROL set "_CRS_CurrentSet=%_CRS_CurrentSet% + 0..31 + 127"
if defined _CRS_OVERRIDE call set "_CRS_CurrentSet=%_CRS_OVERRIDE%"
for /f "tokens=1* delims=" %%a in ('powershell -command "-join (1..%_CRS_Len% | ForEach-Object { %_CRS_CurrentSet:~3% | Get-Random } | ForEach-Object { [char]$_ })" 2^>nul') do set %_CRS_Output%=%%a
if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" ( shift & shift & GoTo :CreateRandomStringPS )
Call :ClearVariablesByPrefix %_CreateRandomStringPS_prefix% _CreateRandomStringPS_prefix & GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF


:len <stringVar> <resultVar>
(   
    setlocal EnableDelayedExpansion
    (set^ tmp=!%~1!)
    if defined tmp (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!tmp:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "tmp=!tmp:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~2=%len%"
    exit /b
)
REM https://stackoverflow.com/a/5841587

::Usage Call :EchoWithoutNewline text to be printed without a newline
:EchoWithoutNewline
echo|set /p="%*"
GoTo :EOF

::Usage Call :rnd Output optional Min optional Max
:: returns 0-100, based on tenth of a second of %time%
:: Unless optional min / max are specified
:rnd
if "[%~2]"=="[]" ( set /a "_rnd_min=0" ) else ( set /a "_rnd_min=%~2" )
if "[%~3]"=="[]" ( set /a "_rnd_max=100" ) else ( set /a "_rnd_max=%~3" )
set /a %~1=%RANDOM% * (%_rnd_max% - %_rnd_min% + 1) / 32768 + %_rnd_min%
GoTo :EOF

REM functional
REM add echo array "verticalmode" (no LF between array elements)
::Usage Call :EchoArray InputArray optional LINENUMBERS optional SHOWVARNAME optional .Suffix optional IndexRange
:EchoArray
set "_EchoArray_input=%~1"
call set /a "_EchoArray_lbound=%%%~1.lbound%%" 2>nul
if "[%_EchoArray_lbound%]" EQU "[]" set /a "_EchoArray_lbound=0"
call set /a "_EchoArray_ubound=%%%~1.ubound%%"
set /a "_EchoArray_index=%_EchoArray_lbound%"
shift
:EchoArray-arguments
set "_EchoArray_buffer=%~1"
if not defined _EchoArray_buffer GoTo :EchoArray-arguments-end
if "[%_EchoArray_buffer:~,1%]" EQU "[.]" ( set "_EchoArray_suffix=%_EchoArray_buffer%" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[LINENUMBERS]" ( set "_EchoArray_showlinenumbers=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[SHOWVARNAME]" ( set "_EchoArray_showvariablename=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[VERTICALMODE]" ( set "_EchoArray_verticalmode=true" & shift & GoTo :EchoArray-arguments )
if "[%~1]" NEQ "[]" if not defined _EchoArray_IndexList.lbound set /a "_EchoArray_IndexList.lbound=1"
if "[%~1]" NEQ "[]" ( Call :GetIndexArray _EchoArray_IndexList "%~1" & shift & GoTo :EchoArray-arguments )
:EchoArray-arguments-end
if defined _EchoArray_IndexList.ubound set /a "_EchoArray_ubound=%_EchoArray_IndexList.ubound%"
setlocal enabledelayedexpansion
:EchoArray-loop
if not defined _EchoArray_IndexList.ubound ( set "_EchoArray_index_actual=%_EchoArray_index%" ) else ( set "_EchoArray_index_actual=!_EchoArray_IndexList[%_EchoArray_index%]!" )
if defined _EchoArray_showlinenumbers set _EchoArray_prefix=%_EchoArray_index%:
if defined _EchoArray_showvariablename set _EchoArray_prefix=%_EchoArray_input%[%_EchoArray_index_actual%]:
if defined _EchoArray_showvariablename if defined _EchoArray_showlinenumbers set _EchoArray_prefix=%_EchoArray_index%:%_EchoArray_input%[%_EchoArray_index_actual%]:
if not defined _EchoArray_verticalmode GoTo :EchoArray-normalmode-loop-next
<nul set /p =%_EchoArray_prefix%!%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%! 
GoTo :EchoArray-loop-next
:EchoArray-normalmode-loop-next
REM echo(%_EchoArray_prefix%%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%
echo(%_EchoArray_prefix%!%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%!
:EchoArray-loop-next
set /a "_EchoArray_index+=1"
if %_EchoArray_index% LEQ %_EchoArray_ubound% GoTo :EchoArray-loop
:EchoArray-loop-end
endlocal
Call :ClearVariablesByPrefix _EchoArray
GoTo :EOF


REM finished ?
::Usage Call :GetIndexArray OutputIndexArray ListOfIndex1 ListOfIndex2 ... ListOfIndexN
::Lists of index are appended to the OutputIndexArray, Lists of index can contain
::single elements "18" 
::comma or space separated elements "10,14,23" "10 14 23"
::single ranges "2-9"
::multiple ranges "45-47,48-94" "45-47 48-94"
::ranges can be in descending order "33-66 66-33"
::ranges can includes more than two end stops "33-67-66-99" 
::or a mix of all the above
::not implemented keywords like start middle quarter third twothird threequarter  "start-45,middle-end,third-twothird,start-end,1-end"
::not implemented percentages 10% 20% 33% 100%  "10%-20%,0%-100%,start-100%"
::not implemented features would require knowing the starting and ending index of the reference array
:GetIndexArray
set "_GetIndexArray_prefix=_GIA"
set "_GIA_output=%~1"
if "[%_GIA_output%]" EQU "[]" GoTo :EOF
if "[%_GIA_output%]" NEQ "[%_GIA_output:[]=%]" set "_GIA_output_suffix=%_GIA_output:*]=%" & set "_GIA_output=%_GIA_output:*[=%"
call set "_GIA_output_lbound=%%%~1.lbound%%"
call set "_GIA_output_ubound=%%%~1.ubound%%"
if "[%_GIA_output_lbound%]" EQU "[]" set /a "_GIA_output_lbound=0"
if "[%_GIA_output_ubound%]" EQU "[]" set /a "_GIA_output_ubound=%_GIA_output_lbound%-1"
shift
:GetIndexArray-arguments
if "[%~1]" EQU "[]" GoTo :EOF
Call :ClearVariablesByPrefix _GIA_current_list
set "_GIA_current_list=%~1"
set /a "_GIA_current_list_index=0"
for /f %%a in ('set %_GIA_current_list%[ 2^>nul') do GoTo :GetIndexArray-isarray-arguments
for %%a in (%_GIA_current_list:,= %) do ( call set "_GIA_current_list[%%_GIA_current_list_index%%]=%%a" & call set /a "_GIA_current_list_index+=1" )
set /a "_GIA_current_list_ubound=%_GIA_current_list_index%-1" & set /a "_GIA_current_list_index=0"
REM set _GIA_current_list
GoTo :GetIndexArray-loop
:GetIndexArray-isarray-arguments
call set /a "_GIA_current_list_array_index=%%%_GIA_current_list%.lbound%%" 2>nul
if not defined _GIA_current_list_array_index set /a "_GIA_current_list_array_index=0"
call set /a "_GIA_current_list_array_ubound=%%%_GIA_current_list%.ubound%%" 2>nul
:GetIndexArray-isarray-arguments-loop
call set _GIA_current_list_array_element=%%%_GIA_current_list%[%_GIA_current_list_array_index%]%%
for %%a in (%_GIA_current_list_array_element:,= %) do call set "_GIA_current_list[%%_GIA_current_list_index%%]=%%a" & call set /a "_GIA_current_list_index+=1"
set /a "_GIA_current_list_array_index+=1"
if %_GIA_current_list_array_index% LEQ %_GIA_current_list_array_ubound% GoTo :GetIndexArray-isarray-arguments-loop
set /a "_GIA_current_list_ubound=%_GIA_current_list_index%-1" & set /a "_GIA_current_list_index=0"
:GetIndexArray-loop
REM set _GIA_current_list
call set "_GIA_current_list_element=%%_GIA_current_list[%_GIA_current_list_index%]%%
if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" GoTo :GetIndexArray-range-skip
set /a "_GIA_current_list_element_index=0"
REM echo for %%a in (%_GIA_current_list_element:-= %)
for %%a in (%_GIA_current_list_element:-= %) do ( call set "_GIA_current_list_element[%%_GIA_current_list_element_index%%]=%%a" & call set /a "_GIA_current_list_element_index+=1" )
REM set _GIA_current_list_element
set /a "_GIA_current_list_element_ubound=%_GIA_current_list_element_index%-1" & set /a "_GIA_current_list_element_index=0"
call set /a "_GIA_current_list_element_start=%%_GIA_current_list_element[%_GIA_current_list_element_index%]%%
:GetIndexArray-range-loop
call set /a "_GIA_current_list_element_end=%%_GIA_current_list_element[%_GIA_current_list_element_index%]%%
if %_GIA_current_list_element_start% EQU %_GIA_current_list_element_end% ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%_GIA_current_list_element_start%" & GoTo :GetIndexArray-range-next)
REM if %_GIA_current_list_element_start% EQU %_GIA_current_list_element_end% echo TEST II %_GIA_current_list_element_start% II& GoTo :GetIndexArray-range-next
if %_GIA_current_list_element_start% GTR %_GIA_current_list_element_end% ( set "_GIA_current_list_element_direction=-" ) else ( set "_GIA_current_list_element_direction=+" )
set /a "_GIA_current_list_element_start%_GIA_current_list_element_direction%=1"
REM for /l %%a in (%_GIA_current_list_element_start%,%_GIA_current_list_element_direction%1,%_GIA_current_list_element_end%) do ( echo TEST II %%a II )
for /l %%a in (%_GIA_current_list_element_start%,%_GIA_current_list_element_direction%1,%_GIA_current_list_element_end%) do ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%%a" )
:GetIndexArray-range-next
set /a "_GIA_current_list_element_start=%_GIA_current_list_element_end%"
set /a "_GIA_current_list_element_index+=1"
if %_GIA_current_list_element_index% LEQ %_GIA_current_list_element_ubound% GoTo :GetIndexArray-range-loop
:GetIndexArray-range-skip
REM if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" echo TEST JJ %_GIA_current_list_element% JJ
if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%_GIA_current_list_element%" )
:GetIndexArray-loop-end
Call :ClearVariablesByPrefix _GIA_current_list_element
set /a "_GIA_current_list_index+=1"
if %_GIA_current_list_index% LEQ %_GIA_current_list_ubound% GoTo :GetIndexArray-loop
shift 
if "[%~1]" NEQ "[]" GoTo :GetIndexArray-arguments
set /a "%_GIA_output%.ubound=%_GIA_output_ubound%"
Call :ClearVariablesByPrefix %_GetIndexArray_prefix% _GetIndexArray
GoTo :EOF


