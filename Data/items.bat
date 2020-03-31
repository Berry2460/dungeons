set /a dlevel=%level%+(%diff%*%diff%-1)
set /a magic=%random% %%4
if "%diff%"=="3" set /a magic=%random% %%3
set /a stuff=%random% %%2
set mbonus=n
set mamount=n
set mod=n
set item=n
set type=n
if "%stuff%"=="0" goto weapon
if "%stuff%"=="1" goto armor
:weapon
set b1=Sword
set b2=Club
set b3=Axe
set b4=Claymore
set b5=Mace
set b6=Flail
set b7=Maul
if %diff% gtr 1 set /a select=%random% %%5 +1
if %dlevel% gtr 0 set /a select=%random% %%3 +1
if %dlevel% gtr 2 set /a select=%random% %%5 +1
if %dlevel% gtr 4 set /a select=%random% %%7 +1
set base=!b%select%!
set space=y
if "%base%"=="Sword" set type=sharp
if "%base%"=="Sword" set e1=Short
if "%base%"=="Sword" set e2=
if "%base%"=="Sword" set e3=Long
if "%base%"=="Sword" set e4=Broad
if "%base%"=="Sword" set e5=Bastard
if "%base%"=="Sword" set e6=Great
if "%base%"=="Sword" if %dlevel% gtr 0 set /a select=%random% %%2 +1
if "%base%"=="Sword" if %dlevel% gtr 2 set /a select=%random% %%3 +1
if "%base%"=="Sword" if %dlevel% gtr 4 set /a select=%random% %%4 +1
if "%base%"=="Sword" if %dlevel% gtr 5 set /a select=%random% %%5 +1
if "%base%"=="Sword" if %dlevel% gtr 6 set /a select=%random% %%6 +1
if "%base%"=="Sword" set extra=!e%select%!
if "%base%"=="Sword" if "%select%"=="1" set /a mod=(%random% %%3 +3)*%diff%&set levelspend=1
if "%base%"=="Sword" if "%select%"=="2" set /a mod=(%random% %%2 +5)*%diff%&set levelspend=1&set space=n
if "%base%"=="Sword" if "%select%"=="3" set /a mod=(%random% %%3 +7)*%diff%&set levelspend=3
if "%base%"=="Sword" if "%select%"=="4" set /a mod=(%random% %%4 +9)*%diff%&set levelspend=5
if "%base%"=="Sword" if "%select%"=="5" set /a mod=(%random% %%4 +11)*%diff%&set levelspend=6
if "%base%"=="Sword" if "%select%"=="6" set /a mod=(%random% %%4 +14)*%diff%&set levelspend=7
if "%base%"=="Mace" set type=blunt
if "%base%"=="Mace" set extra=&set space=n
if "%base%"=="Mace" set /a mod=(%random% %%7 +2)*%diff%&set levelspend=3
if "%base%"=="Flail" set type=blunt
if "%base%"=="Flail" set extra=&set space=n
if "%base%"=="Flail" set /a mod=(%random% %%8 +3)*%diff%&set levelspend=5
if "%base%"=="Axe" set type=sharp
if "%base%"=="Axe" set e1=Small
if "%base%"=="Axe" set e2=
if "%base%"=="Axe" set e3=Large
if "%base%"=="Axe" set e4=Broad
if "%base%"=="Axe" set e5=Great
if "%base%"=="Axe" if %dlevel% gtr 0 set /a select=1
if "%base%"=="Axe" if %dlevel% gtr 2 set /a select=%random% %%2 +1
if "%base%"=="Axe" if %dlevel% gtr 3 set /a select=%random% %%3 +1
if "%base%"=="Axe" if %dlevel% gtr 5 set /a select=%random% %%4 +1
if "%base%"=="Axe" if %dlevel% gtr 6 set /a select=%random% %%5 +1
if "%base%"=="Axe" set extra=!e%select%!
if "%base%"=="Axe" if "%select%"=="1" set /a mod=(%random% %%2 +4)*%diff%&set levelspend=1
if "%base%"=="Axe" if "%select%"=="2" set /a mod=(%random% %%2 +6)*%diff%&set levelspend=3&set space=n
if "%base%"=="Axe" if "%select%"=="3" set /a mod=(%random% %%3 +9)*%diff%&set levelspend=4
if "%base%"=="Axe" if "%select%"=="4" set /a mod=(%random% %%3 +13)*%diff%&set levelspend=6
if "%base%"=="Axe" if "%select%"=="5" set /a mod=(%random% %%3 +15)*%diff%&set levelspend=7
if "%base%"=="Claymore" set type=sharp
if "%base%"=="Claymore" set extra=&set space=n
if "%base%"=="Claymore" set /a mod=(%random% %%5 +3)*%diff%&set levelspend=3
if "%base%"=="Maul" set type=blunt
if "%base%"=="Maul" set e1=
if "%base%"=="Maul" set e2=Great
if "%base%"=="Maul" set select=1
if "%base%"=="Maul" if %dlevel% gtr 6 set /a select=%random% %%2 +1
if "%base%"=="Maul" set extra=!e%select%!
if "%base%"=="Maul" if "%select%"=="1" set /a mod=(%random% %%3 +11)*%diff%&set levelspend=5&set space=n
if "%base%"=="Maul" if "%select%"=="2" set /a mod=(%random% %%2 +17)*%diff%&set levelspend=7
if "%base%"=="Club" set type=blunt
if "%base%"=="Club" set e1=
if "%base%"=="Club" set e2=Spiked
if "%base%"=="Club" set e3=Great
if "%base%"=="Club" if %dlevel% gtr 0 set /a select=1
if "%base%"=="Club" if %dlevel% gtr 2 set /a select=%random% %%2 +1
if "%base%"=="Club" if %dlevel% gtr 5 set /a select=%random% %%3 +1
if "%base%"=="Club" set extra=!e%select%!
if "%base%"=="Club" if "%select%"=="1" set /a mod=(%random% %%4 +2)*%diff%&set levelspend=1&set space=n
if "%base%"=="Club" if "%select%"=="2" set /a mod=(%random% %%4 +5)*%diff%&set levelspend=3
if "%base%"=="Club" if "%select%"=="3" set /a mod=(%random% %%4 +10)*%diff%&set levelspend=6
set /a levelspend*=%diff%
if "%magic%"=="0" set /a mod+=(%random% %%3 +3)*%diff%
if "%magic%"=="0" set m1=Strength
if "%magic%"=="0" set m2=Agility
if "%magic%"=="0" set m3=Stamina
if "%magic%"=="0" set m4=Wounding
if "%magic%"=="0" set m5=Power
if "%magic%"=="0" set m6=Skill
if "%magic%"=="0" set m7=The Wolf
if "%magic%"=="0" set m8=Slaying
if "%magic%"=="0" set m9=Demons
if "%magic%"=="0" set m10=Might
if "%magic%"=="0" set m11=Accuracy
if "%magic%"=="0" set m12=The Tiger
if "%magic%"=="0" set m13=Gore
if "%magic%"=="0" set m14=The Pit
if "%magic%"=="0" set m15=Giants
if "%magic%"=="0" set m16=Precision
if "%magic%"=="0" set m17=The Lion
if "%magic%"=="0" set m18=Carnage
if "%magic%"=="0" set m19=Blood
if "%magic%"=="0" set m20=Hell
if "%magic%"=="0" set m21=Titans
if "%magic%"=="0" set m22=Perfection
if "%magic%"=="0" set m23=The Whale
if "%magic%"=="0" set m24=Slaughter
if "%magic%"=="0" set m25=Vampires
if "%magic%"=="0" set m26=Hellfire
if "%magic%"=="0" if %dlevel% gtr 0 set /a select=%random% %%4 +1
if "%magic%"=="0" if %dlevel% gtr 3 set /a select=%random% %%9 +1
if "%magic%"=="0" if %dlevel% gtr 4 set /a select=%random% %%14 +1
if "%magic%"=="0" if %dlevel% gtr 6 set /a select=%random% %%20 +1
if "%magic%"=="0" if %dlevel% gtr 7 set /a select=%random% %%26 +1
if "%magic%"=="0" set magi=!m%select%!
if "%magic%"=="0" if "%select%"=="1" set mbonus=str&set /a mamount=%random% %%3 +2&set /a levelspend+=2*%diff%
if "%magic%"=="0" if "%select%"=="2" set mbonus=agi&set /a mamount=%random% %%2 +3&set /a levelspend+=2*%diff%
if "%magic%"=="0" if "%select%"=="3" set mbonus=sta&set /a mamount=%random% %%2 +2&set /a levelspend+=2*%diff%
if "%magic%"=="0" if "%select%"=="4" set mbonus=mod&set /a mamount=%random% %%2 +1&set /a levelspend+=2*%diff%
if "%magic%"=="0" if "%select%"=="5" set mbonus=str&set /a mamount=%random% %%3 +4&set /a levelspend+=4*%diff%
if "%magic%"=="0" if "%select%"=="6" set mbonus=agi&set /a mamount=%random% %%3 +5&set /a levelspend+=4*%diff%
if "%magic%"=="0" if "%select%"=="7" set mbonus=sta&set /a mamount=%random% %%3 +3&set /a levelspend+=4*%diff%
if "%magic%"=="0" if "%select%"=="8" set mbonus=mod&set /a mamount=%random% %%3 +2&set /a levelspend+=4*%diff%
if "%magic%"=="0" if "%select%"=="9" set mbonus=demon&set /a mamount=%random% %%2 +7&set /a levelspend+=4*%diff%
if "%magic%"=="0" if "%select%"=="10" set mbonus=str&set /a mamount=%random% %%3 +7&set /a levelspend+=5*%diff%
if "%magic%"=="0" if "%select%"=="11" set mbonus=agi&set /a mamount=%random% %%3 +8&set /a levelspend+=5*%diff%
if "%magic%"=="0" if "%select%"=="12" set mbonus=sta&set /a mamount=%random% %%3 +5&set /a levelspend+=5*%diff%
if "%magic%"=="0" if "%select%"=="13" set mbonus=mod&set /a mamount=%random% %%3 +4&set /a levelspend+=5*%diff%
if "%magic%"=="0" if "%select%"=="14" set mbonus=demon&set /a mamount=%random% %%3 +8&set /a levelspend+=5*%diff%
if "%magic%"=="0" if "%select%"=="15" set mbonus=str&set /a mamount=%random% %%3 +9&set /a levelspend+=7*%diff%
if "%magic%"=="0" if "%select%"=="16" set mbonus=agi&set /a mamount=%random% %%4 +9&set /a levelspend+=7*%diff%
if "%magic%"=="0" if "%select%"=="17" set mbonus=sta&set /a mamount=%random% %%3 +6&set /a levelspend+=7*%diff%
if "%magic%"=="0" if "%select%"=="18" set mbonus=mod&set /a mamount=%random% %%3 +5&set /a levelspend+=7*%diff%
if "%magic%"=="0" if "%select%"=="19" set mbonus=leech&set /a mamount=%random% %%2 +3&set /a levelspend+=7*%diff%
if "%magic%"=="0" if "%select%"=="20" set mbonus=demon&set /a mamount=%random% %%3 +10&set /a levelspend+=7*%diff%
if "%magic%"=="0" if "%select%"=="21" set mbonus=str&set /a mamount=%random% %%4 +12&set /a levelspend+=8*%diff%
if "%magic%"=="0" if "%select%"=="22" set mbonus=agi&set /a mamount=%random% %%4 +14&set /a levelspend+=8*%diff%
if "%magic%"=="0" if "%select%"=="23" set mbonus=sta&set /a mamount=%random% %%4 +8&set /a levelspend+=8*%diff%
if "%magic%"=="0" if "%select%"=="24" set mbonus=mod&set /a mamount=%random% %%3 +9&set /a levelspend+=8*%diff%
if "%magic%"=="0" if "%select%"=="25" set mbonus=leech&set /a mamount=%random% %%3 +4&set /a levelspend+=8*%diff%
if "%magic%"=="0" if "%select%"=="26" set mbonus=demon&set /a mamount=%random% %%4 +12&set /a levelspend+=8*%diff%
if "%magic%"=="0" set /a mamount*=%diff%
if "%magic%"=="0" if "%space%"=="n"  set item=%extra%%base% Of %magi%
if "%magic%"=="0" if "%space%"=="y"  set item=%extra% %base% Of %magi%
if not "%magic%"=="0" set q1=Crude
if not "%magic%"=="0" set q2=Inferior
if not "%magic%"=="0" set q3=Balanced
if not "%magic%"=="0" set q4=Perfect
if not "%magic%"=="0" set /a select=%random% %%4 +1
if not "%magic%"=="0" if "%select%"=="1" set /a mod-=%random% %%2 +2&set /a levelspend-=1
if not "%magic%"=="0" if "%select%"=="2" set /a mod-=%random% %%3 +1
if not "%magic%"=="0" if "%select%"=="3" set /a mod+=(%random% %%2 +2)*%diff%&set /a levelspend+=1*%diff%
if not "%magic%"=="0" if "%select%"=="4" set /a mod+=(%random% %%3 +3)*%diff%&set /a levelspend+=1*%diff%
if not "%magic%"=="0" set quality=!q%select%!
if not "%magic%"=="0" if %mod% lss 1 set mod=1
if not "%magic%"=="0" if "%space%"=="n" set item=%quality%%extra% %base%
if not "%magic%"=="0" if "%space%"=="y" set item=%quality% %extra% %base%
goto done
:armor
set b1=Rags
set b2=Robes
set b3=Armor
set b4=Mail
if %dlevel% gtr 0 set /a select=%random% %%2 +1
if %dlevel% gtr 1 set /a select=%random% %%3 +1
if %dlevel% gtr 4 set /a select=%random% %%4 +1
set base=!b%select%!
set space=y
set type=armor
if "%base%"=="Rags" set extra=&set space=n
if "%base%"=="Rags" set /a mod=(%random% %%2 +1)*%diff%&set levelspend=1
if "%base%"=="Robes" set extra=&set space=n
if "%base%"=="Robes" set /a mod=(%random% %%2 +2)*%diff%&set levelspend=1
if "%base%"=="Armor" set e1=Quilted
if "%base%"=="Armor" set e2=Leather
if "%base%"=="Armor" set e3=Studded Leather
if "%base%"=="Armor" set /a select=1
if "%base%"=="Armor" if %dlevel% gtr 2 set /a select=%random% %%2 +1
if "%base%"=="Armor" if %dlevel% gtr 3 set /a select=%random% %%2 +1
if "%base%"=="Armor" set extra=!e%select%!
if "%base%"=="Armor" if "%select%"=="1" set /a mod=(%random% %%2 +3)*%diff%&set levelspend=2
if "%base%"=="Armor" if "%select%"=="2" set /a mod=(%random% %%3 +3)*%diff%&set levelspend=3
if "%base%"=="Armor" if "%select%"=="3" set /a mod=(%random% %%3 +4)*%diff%&set levelspend=4
if "%base%"=="Mail" set e1=Ring
if "%base%"=="Mail" set e2=Chain
if "%base%"=="Mail" set e3=Scale
if "%base%"=="Mail" set e4=Plate
if "%base%"=="Mail" set e5=Full Plate
if "%base%"=="Mail" set /a select=1
if "%base%"=="Mail" if %dlevel% gtr 4 set /a select=%random% %%2 +1
if "%base%"=="Mail" if %dlevel% gtr 5 set /a select=%random% %%4 +1
if "%base%"=="Mail" if %dlevel% gtr 6 set /a select=%random% %%5 +1
if "%base%"=="Mail" set extra=!e%select%!
if "%base%"=="Mail" if "%select%"=="1" set /a mod=(%random% %%3 +5)*%diff%&set levelspend=5
if "%base%"=="Mail" if "%select%"=="2" set /a mod=(%random% %%4 +5)*%diff%&set levelspend=5
if "%base%"=="Mail" if "%select%"=="3" set /a mod=(%random% %%5 +5)*%diff%&set levelspend=6
if "%base%"=="Mail" if "%select%"=="4" set /a mod=(%random% %%5 +6)*%diff%&set levelspend=6
if "%base%"=="Mail" if "%select%"=="5" set /a mod=(%random% %%6 +7)*%diff%&set levelspend=7
set /a levelspend*=%diff%
if "%magic%"=="0" set end=n
if "%magic%"=="0" set /a mod+=(%random% %%2 +2)*%diff%
if "%magic%"=="0" set m1=Strength
if "%magic%"=="0" set m2=Agility
if "%magic%"=="0" set m3=Stamina
if "%magic%"=="0" set m4=Fine
if "%magic%"=="0" set m5=Power
if "%magic%"=="0" set m6=Skill
if "%magic%"=="0" set m7=The Wolf
if "%magic%"=="0" set m8=Strong
if "%magic%"=="0" set m9=Might
if "%magic%"=="0" set m10=Accuracy
if "%magic%"=="0" set m11=The Tiger
if "%magic%"=="0" set m12=Grand
if "%magic%"=="0" set m13=Giants
if "%magic%"=="0" set m14=Precision
if "%magic%"=="0" set m15=The Lion
if "%magic%"=="0" set m16=Glorious
if "%magic%"=="0" set m17=Titans
if "%magic%"=="0" set m18=Perfection
if "%magic%"=="0" set m19=The Whale
if "%magic%"=="0" set m20=Godly
if "%magic%"=="0" if %dlevel% gtr 0 set /a select=%random% %%4 +1
if "%magic%"=="0" if %dlevel% gtr 3 set /a select=%random% %%8 +1
if "%magic%"=="0" if %dlevel% gtr 4 set /a select=%random% %%12 +1
if "%magic%"=="0" if %dlevel% gtr 6 set /a select=%random% %%16 +1
if "%magic%"=="0" if %dlevel% gtr 7 set /a select=%random% %%20 +1
if "%magic%"=="0" set magi=!m%select%!
if "%magic%"=="0" if "%select%"=="1" set mbonus=str&set /a mamount=%random% %%2 +2&set /a levelspend+=2*%diff%
if "%magic%"=="0" if "%select%"=="2" set mbonus=agi&set /a mamount=%random% %%3 +3&set /a levelspend+=2*%diff%
if "%magic%"=="0" if "%select%"=="3" set mbonus=sta&set /a mamount=%random% %%2 +2&set /a levelspend+=2*%diff%
if "%magic%"=="0" if "%select%"=="4" set mbonus=mod&set /a mamount=%random% %%2 +1&set end=y&set /a levelspend+=2*%diff%
if "%magic%"=="0" if "%select%"=="5" set mbonus=str&set /a mamount=%random% %%3 +4&set /a levelspend+=4*%diff%
if "%magic%"=="0" if "%select%"=="6" set mbonus=agi&set /a mamount=%random% %%3 +5&set /a levelspend+=4*%diff%
if "%magic%"=="0" if "%select%"=="7" set mbonus=sta&set /a mamount=%random% %%3 +3&set /a levelspend+=4*%diff%
if "%magic%"=="0" if "%select%"=="8" set mbonus=mod&set /a mamount=%random% %%2 +2&set end=y&set /a levelspend+=4*%diff%
if "%magic%"=="0" if "%select%"=="9" set mbonus=str&set /a mamount=%random% %%3 +6&set /a levelspend+=5*%diff%
if "%magic%"=="0" if "%select%"=="10" set mbonus=agi&set /a mamount=%random% %%3 +7&set /a levelspend+=5*%diff%
if "%magic%"=="0" if "%select%"=="11" set mbonus=sta&set /a mamount=%random% %%3 +5&set /a levelspend+=5*%diff%
if "%magic%"=="0" if "%select%"=="12" set mbonus=mod&set /a mamount=%random% %%2 +4&set end=y&set /a levelspend+=5*%diff%
if "%magic%"=="0" if "%select%"=="13" set mbonus=str&set /a mamount=%random% %%4 +6&set /a levelspend+=7*%diff%
if "%magic%"=="0" if "%select%"=="14" set mbonus=agi&set /a mamount=%random% %%3 +10&set /a levelspend+=7*%diff%
if "%magic%"=="0" if "%select%"=="15" set mbonus=sta&set /a mamount=%random% %%4 +6&set /a levelspend+=7*%diff%
if "%magic%"=="0" if "%select%"=="16" set mbonus=mod&set /a mamount=%random% %%3 +5&set end=y&set /a levelspend+=7*%diff%
if "%magic%"=="0" if "%select%"=="17" set mbonus=str&set /a mamount=%random% %%4 +10&set /a levelspend+=8*%diff%
if "%magic%"=="0" if "%select%"=="18" set mbonus=agi&set /a mamount=%random% %%5 +14&set /a levelspend+=8*%diff%
if "%magic%"=="0" if "%select%"=="19" set mbonus=sta&set /a mamount=%random% %%4 +9&set /a levelspend+=8*%diff%
if "%magic%"=="0" if "%select%"=="20" set mbonus=mod&set /a mamount=%random% %%3 +8&set end=y&set /a levelspend+=8*%diff%
if "%magic%"=="0" set /a mamount*=%diff%
if "%magic%"=="0" if "%space%"=="n" if "%end%"=="n" set item=%extra%%base% Of %magi%
if "%magic%"=="0" if "%space%"=="y" if "%end%"=="n" set item=%extra% %base% Of %magi%
if "%magic%"=="0" if "%space%"=="n" if "%end%"=="y" set item=%magi% %extra%%base%
if "%magic%"=="0" if "%space%"=="y" if "%end%"=="y" set item=%magi% %extra% %base%
if not "%magic%"=="0" set q1=Damaged
if not "%magic%"=="0" set q2=Inferior
if not "%magic%"=="0" set q3=Superior
if not "%magic%"=="0" set q4=Great
if not "%magic%"=="0" set /a select=%random% %%4 +1
if not "%magic%"=="0" if "%select%"=="1" set /a mod-=%random% %%2 +2&set /a levelspend-=1
if not "%magic%"=="0" if "%select%"=="2" set /a mod-=%random% %%2 +1
if not "%magic%"=="0" if "%select%"=="3" set /a mod+=(%random% %%2 +1)*%diff%&set /a levelspend+=1*%diff%
if not "%magic%"=="0" if "%select%"=="4" set /a mod+=(%random% %%2 +2)*%diff%&set /a levelspend+=1*%diff%
if not "%magic%"=="0" set quality=!q%select%!
if not "%magic%"=="0" if %mod% lss 1 set mod=1
if not "%magic%"=="0" if "%space%"=="n" set item=%quality%%extra% %base%
if not "%magic%"=="0" if "%space%"=="y" set item=%quality% %extra% %base%
goto done
:done
if %levelspend% lss 1 set levelspend=1
