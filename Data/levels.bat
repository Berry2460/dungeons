cls
echo Entering Level %level%...
echo --------------------
echo.>"%dir%\newlvl.dat"
set x=0
set y=1
set roomsx=0
set roomsy=0
set /a gymax=%ylmax%+1
goto grid
:grid
set /a x+=1
set l%level%x%x%x%y%=#
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%x%x%x%y%=#>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%x%x%x%y%=#>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%x%x%x%y%=#>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%x%x%x%y%=#>>"%dir%\read4.bat"
if "%x%"=="%xlmax%" set /a y+=1&set x=0
if "%y%"=="%gymax%" set room=0&set roomdown=1&goto rooms
goto grid
:rooms
set /a roomx=%random% %%3 +2 +%roomsx%
set /a roomy=%random% %%2 +2 +%roomsy%
set /a xmax=%random% %%6 +4 +%roomx%
set /a ymax=%random% %%4 +4 +%roomy%
set r%roomdown%max=%room%
if %xmax% gtr 39 (
set /a roomsy+=9
set roomsx=0
set room=0
set /a roomdown+=1
goto rooms
)
if %ymax%% gtr 29 (
set /a roomdown-=1
goto loot
)
set /a room+=1
set /a roomsx+=%xmax%-%roomx%+4
set /a path%room%x%roomdown%=(%xmax%-%roomx%)/2+%roomx%
set /a path%room%y%roomdown%=(%ymax%-%roomy%)/2+%roomy%
set x=%roomx%
set y=%roomy%
goto carveroom
:carveroom
set /a x+=1
set l%level%x%x%x%y%=.
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%x%x%x%y%=.>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%x%x%x%y%=.>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%x%x%x%y%=.>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%x%x%x%y%=.>>"%dir%\read4.bat"
if "%x%"=="%xmax%" set /a y+=1&set x=%roomx%
if "%y%"=="%ymax%" goto rooms
goto carveroom
:loot
set chest=0
set /a chests=%random% %%5 +6
set l%level%cmax=%chests%
goto spawnloot
:spawnloot
if "%chest%"=="%chests%" goto monsters
set /a chestx=%random% %%%xlmax% +1
set /a chesty=%random% %%%ylmax% +1
if "!l%level%x%chestx%x%chesty%!"=="." set /a chest+=1
if "!l%level%x%chestx%x%chesty%!"=="." (
set l%level%x%chestx%x%chesty%=$
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%x%chestx%x%chesty%=$>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%x%chestx%x%chesty%=$>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%x%chestx%x%chesty%=$>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%x%chestx%x%chesty%=$>>"%dir%\read4.bat"
)
goto spawnloot
:monsters
set /a monnum=%random% %%8 +12
set mon%level%max=%monnum%
if not "%player%"=="1" if not "%p1%"=="n" echo set mon%level%max=!monnum!>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set mon%level%max=!monnum!>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set mon%level%max=!monnum!>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set mon%level%max=!monnum!>>"%dir%\read4.bat"
set /a mon1=%random% %%5 +1
set /a mon2=%random% %%5 +1
set /a mon3=%random% %%5 +1
if "%level%"=="1" set m1=skeleton
if "%level%"=="1" set m2=spider
if "%level%"=="1" set m3=zombie
if "%level%"=="1" set m4=rat
if "%level%"=="1" set m5=fallen
if "%level%"=="2" set m1=goblin
if "%level%"=="2" set m2=zombie
if "%level%"=="2" set m3=corpse
if "%level%"=="2" set m4=fallen
if "%level%"=="2" set m5=fiend
if "%level%"=="3" set m1=goblin
if "%level%"=="3" set m2=fiend
if "%level%"=="3" set m3=corpse
if "%level%"=="3" set m4=goatman
if "%level%"=="3" set m5=devil
if "%level%"=="4" set m1=ghoul
if "%level%"=="4" set m2=goatman
if "%level%"=="4" set m3=devil
if "%level%"=="4" set m4=orc
if "%level%"=="4" set m5=darkone
if "%level%"=="5" set m1=orc
if "%level%"=="5" set m2=darkone
if "%level%"=="5" set m3=burning
if "%level%"=="5" set m4=goatman
if "%level%"=="5" set m5=devil
if "%level%"=="6" set m1=ogre
if "%level%"=="6" set m2=burning
if "%level%"=="6" set m3=hellhound
if "%level%"=="6" set m4=horror
if "%level%"=="6" set m5=orc
if "%level%"=="7" set m1=horror
if "%level%"=="7" set m2=ogre
if "%level%"=="7" set m3=succubus
if "%level%"=="7" set m4=plague
if "%level%"=="7" set m5=magma
if "%level%"=="8" set m1=plague
if "%level%"=="8" set m2=giant
if "%level%"=="8" set m3=succubus
if "%level%"=="8" set m4=lich
if "%level%"=="8" set m5=knight
if "%level%"=="9" set m1=doom
if "%level%"=="9" set m2=giant
if "%level%"=="9" set m3=titan
if "%level%"=="9" set m4=lich
if "%level%"=="9" set m5=knight
if "%level%"=="10" set m1=doom
if "%level%"=="10" set m2=demi
if "%level%"=="10" set m3=titan
if "%level%"=="10" set m4=knight
if "%level%"=="10" set m5=death
set mon1=!m%mon1%!
set mon2=!m%mon2%!
set mon3=!m%mon3%!
set mloop=0
set mon=0
goto placemonster
:placemonster
if "%mon%"=="%monnum%" (
set sd=n
set ed=n
goto leveldown
)
if "%mloop%"=="3" set mloop=0
set /a x=%random% %%%xlmax% +1
set /a y=%random% %%%ylmax% +1
set /a mloop+=1
if "!l%level%x%x%x%y%!"=="." set /a mon+=1
if "!l%level%x%x%x%y%!"=="." set search=!mon%mloop%!
if "!l%level%x%x%x%y%!"=="." call "Data\monsters.bat"
if "!l%level%x%x%x%y%!"=="." (
if "%diff%"=="2" set /a mhp*=3
if "%diff%"=="3" set /a mhp*=5
if "%diff%"=="2" set /a mdmg*=2
if "%diff%"=="3" set /a mdmg*=3
)
if "!l%level%x%x%x%y%!"=="." (
set l%level%x%x%x%y%=%icon%
if not "%p1%"=="n" echo set l%level%m%mon%hp=!mhp!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%m%mon%hp=!mhp!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%m%mon%hp=!mhp!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%m%mon%hp=!mhp!>>"%dir%\read4.bat"
if not "%p1%"=="n" echo set l%level%m%mon%dmg=!mdmg!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%m%mon%dmg=!mdmg!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%m%mon%dmg=!mdmg!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%m%mon%dmg=!mdmg!>>"%dir%\read4.bat"
if not "%p1%"=="n" echo set l%level%m%mon%i=!icon!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%m%mon%i=!icon!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%m%mon%i=!icon!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%m%mon%i=!icon!>>"%dir%\read4.bat"
if not "%p1%"=="n" echo set l%level%m%mon%n=!mname!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%m%mon%n=!mname!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%m%mon%n=!mname!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%m%mon%n=!mname!>>"%dir%\read4.bat"
if not "%p1%"=="n" echo set l%level%m%mon%t=!type!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%m%mon%t=!type!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%m%mon%t=!type!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%m%mon%t=!type!>>"%dir%\read4.bat"
if not "%p1%"=="n" echo set l%level%m%mon%x=!x!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%m%mon%x=!x!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%m%mon%x=!x!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%m%mon%x=!x!>>"%dir%\read4.bat"
if not "%p1%"=="n" echo set l%level%m%mon%y=!y!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%m%mon%y=!y!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%m%mon%y=!y!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%m%mon%y=!y!>>"%dir%\read4.bat"
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%x%x%x%y%=!icon!>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%x%x%x%y%=!icon!>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%x%x%x%y%=!icon!>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%x%x%x%y%=!icon!>>"%dir%\read4.bat"
)
goto placemonster
:leveldown
if "%sd%"=="n" set /a startx=%random% %%%xlmax% +1
if "%sd%"=="n" set /a starty=%random% %%%ylmax% +1
if "%ed%"=="n" set /a endx=%random% %%%xlmax% +1
if "%ed%"=="n" set /a endy=%random% %%%ylmax% +1
set sx=%startx%
set sy=%starty%
set ex=%endx%
set ey=%endy%
set s1=!l%level%x%sx%x%sy%!
set /a sx=%startx%+1
set sy=%starty%
set s2=!l%level%x%sx%x%sy%!
set sx=%startx%
set /a sy=%starty%+1
set s3=!l%level%x%sx%x%sy%!
set /a sx=%startx%-1
set sy=%starty%
set s4=!l%level%x%sx%x%sy%!
set sx=%startx%
set /a sy=%starty%-1
set s5=!l%level%x%sx%x%sy%!
set e1=!l%level%x%ex%x%ey%!
set /a ex=%endx%+1
set ey=%endy%
set e2=!l%level%x%ex%x%ey%!
set ex=%endx%
set /a ey=%endy%+1
set e3=!l%level%x%ex%x%ey%!
set /a ex=%endx%-1
set ey=%endy%
set e4=!l%level%x%ex%x%ey%!
set ex=%endx%
set /a ey=%endy%-1
set e5=!l%level%x%ex%x%ey%!
if "%sd%"=="n" if "%s1%"=="." if "%s2%"=="." if "%s3%"=="." if "%s4%"=="." if "%s5%"=="." (
set l%level%startx=%startx%
set l%level%starty=%starty%
)
if "%sd%"=="n" if "%s1%"=="." if "%s2%"=="." if "%s3%"=="." if "%s4%"=="." if "%s5%"=="." (
set l%level%x!l%level%startx!x!l%level%starty!=[
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%x!l%level%startx!x!l%level%starty!=[>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%x!l%level%startx!x!l%level%starty!=[>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%x!l%level%startx!x!l%level%starty!=[>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%x!l%level%startx!x!l%level%starty!=[>>"%dir%\read4.bat"
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%startx=!l%level%startx!>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%startx=!l%level%startx!>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%startx=!l%level%startx!>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%startx=!l%level%startx!>>"%dir%\read4.bat"
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%starty=!l%level%starty!>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%starty=!l%level%starty!>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%starty=!l%level%starty!>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%starty=!l%level%starty!>>"%dir%\read4.bat"
set sd=y
)
if "%ed%"=="n" if "%e1%"=="." if "%e2%"=="." if "%e3%"=="." if "%e4%"=="." if "%e5%"=="." (
set l%level%endx=%endx%
set l%level%endy=%endy%
)
if "%ed%"=="n" if "%e1%"=="." if "%e2%"=="." if "%e3%"=="." if "%e4%"=="." if "%e5%"=="." (
set l%level%x!l%level%endx!x!l%level%endy!=/
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%x!l%level%endx!x!l%level%endy!=/>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%x!l%level%endx!x!l%level%endy!=/>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%x!l%level%endx!x!l%level%endy!=/>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%x!l%level%endx!x!l%level%endy!=/>>"%dir%\read4.bat"
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%endx=!l%level%endx!>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%endx=!l%level%endx!>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%endx=!l%level%endx!>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%endx=!l%level%endx!>>"%dir%\read4.bat"
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%endy=!l%level%endy!>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%endy=!l%level%endy!>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%endy=!l%level%endy!>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%endy=!l%level%endy!>>"%dir%\read4.bat"
set ed=y
)
if "%sd%%ed%"=="yy" goto pathset
goto leveldown
:pathset
set floor=1
set proom=1
goto sidepath
:sidepath
if %proom% gtr !r%floor%max! set /a floor+=1&set proom=1
if "%proom%"=="!r%floor%max!" set /a floor+=1&set proom=1
if %floor% gtr %roomdown% (
set floor=1
set pass=1
set old=0
goto uppath
)
set x1=!path%proom%x%floor%!
set y1=!path%proom%y%floor%!
set /a proom+=1
set x2=!path%proom%x%floor%!
set y2=!path%proom%y%floor%!
goto carveside
:carveside
set p=n
if "%x1%x%y1%"=="%x2%x%y2%" goto sidepath
if "%p%"=="n" if %x1% gtr %x2% set /a x1-=1&set p=y
if "%p%"=="n" if %x1% lss %x2% set /a x1+=1&set p=y
if "%p%"=="n" if %y1% gtr %y2% set /a y1-=1&set p=y
if "%p%"=="n" if %y1% lss %y2% set /a y1+=1&set p=y
if not "!l%level%x%x1%x%y1%!"=="#" goto carveside
set l%level%x%x1%x%y1%=.
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%x%x1%x%y1%=.>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%x%x1%x%y1%=.>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%x%x1%x%y1%=.>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%x%x1%x%y1%=.>>"%dir%\read4.bat"
goto carveside
:uppath
if %pass% gtr 2 (
goto done
)
set f1=%floor%
set /a f2=%floor%+1
set /a floor+=1
if %floor% gtr %roomdown% (
set floor=1
set /a pass+=1
set old=%rm%
goto uppath
)
set /a rm=%random% %%!r%f1%max! +1
if "%rm%"=="%old%" goto uppath
if !r%f1%max! gtr !r%f2%max! set /a rm=%random% %%!r%f2%max! +1
if !r%f1%max! lss !r%f2%max! set /a rm=%random% %%!r%f1%max! +1
set x1=!path%rm%x%f1%!
set y1=!path%rm%y%f1%!
set x2=!path%rm%x%f2%!
set y2=!path%rm%y%f2%!
goto carveup
:carveup
set p=n
if "%x1%x%y1%"=="%x2%x%y2%" goto uppath
if "%p%"=="n" if %y1% gtr %y2% set /a y1-=1&set p=y
if "%p%"=="n" if %y1% lss %y2% set /a y1+=1&set p=y
if "%p%"=="n" if %x1% gtr %x2% set /a x1-=1&set p=y
if "%p%"=="n" if %x1% lss %x2% set /a x1+=1&set p=y
if not "!l%level%x%x1%x%y1%!"=="#" goto carveup
set l%level%x%x1%x%y1%=.
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%x%x1%x%y1%=.>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%x%x1%x%y1%=.>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%x%x1%x%y1%=.>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%x%x1%x%y1%=.>>"%dir%\read4.bat"
goto carveup
:done
if not "%p1%"=="n" echo set l%level%start=y>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%start=y>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%start=y>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%start=y>>"%dir%\read4.bat"
del "%dir%\newlvl.dat"
