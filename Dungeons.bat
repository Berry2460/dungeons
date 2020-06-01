echo off
cls
title Dungeons
color 07
mode con cols=45 lines=25
setlocal enabledelayedexpansion
set cup=w
set cdown=s
set cleft=a
set cright=d
set cinv=i
set cpot=q
set cmenu=c
set cchat=t
set select=1
if exist "Data\controls.bat" call "Data\controls.bat"
if not exist "Data\controls.bat" (
echo set cup=!cup!>"Data\controls.bat"
echo set cdown=!cdown!>>"Data\controls.bat"
echo set cleft=!cleft!>>"Data\controls.bat"
echo set cright=!cright!>>"Data\controls.bat"
echo set cinv=!cinv!>>"Data\controls.bat"
echo set cpot=!cpot!>>"Data\controls.bat"
echo set cmenu=!cmenu!>>"Data\controls.bat"
echo set cchat=!cchat!>>"Data\controls.bat"
)
net use Y: /delete
set msplash=y
set nsplash=y
goto menu
:menu
cls
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo Dungeons v1.26
echo ---------------
echo [%s1%] New
echo [%s2%] Load
echo [%s3%] Controls
echo [%s4%] Exit
if "%msplash%"=="y" echo.
if "%msplash%"=="y" echo Use W,S To Navigate, D To Select
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto new
if "%select%"=="2" set select=1&set up=n&set good=10&goto load
if "%select%"=="3" set select=1&goto controls
if "%select%"=="4" exit
)
goto menu
:new
set sv=0
goto findnew
:findnew
if "%sv%"=="9" goto error3
set /a sv+=1
if not exist "Data\save%sv%.bat" goto newstats
goto findnew
:newstats
set points=4
set str=2
set agi=1
set sta=1
goto stats
:stats
cls
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=@
set /a dmg=%str%/2+(%agi%/4)
set /a ac=%agi%/3
set /a life=%sta%*2
echo New Character
echo -------------------
echo Points: %points%
echo -------------------
echo [%s1%] Strength: %str% Damage: +%dmg%
echo [%s2%] Agility.: %agi% Armor: +%ac%
echo [%s3%] Stamina.: %sta% Life: +%life%
echo -------------------
echo [%s4%] Next
echo [%s5%] Back
if "%nsplash%"=="y" echo.
if "%nsplash%"=="y" echo Use A,D To Remove/Add Points
choice /c:wsda /n /m ""
set nsplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" if %points% gtr 0 set /a str+=1&set /a points-=1
if "%select%"=="2" if %points% gtr 0 set /a agi+=1&set /a points-=1
if "%select%"=="3" if %points% gtr 0 set /a sta+=1&set /a points-=1
if "%select%"=="4" if %points% lss 1 goto name
if "%select%"=="4" goto error2
if "%select%"=="5" set select=1&goto menu
)
if "%errorlevel%"=="4" (
if "%select%"=="1" if %str% gtr 2 set /a str-=1&set /a points+=1
if "%select%"=="2" if %agi% gtr 1 set /a agi-=1&set /a points+=1
if "%select%"=="3" if %sta% gtr 1 set /a sta-=1&set /a points+=1
)
goto stats
:name
cls
set lvl=1
set hilvl1=1
set hilvl2=1
set hilvl3=1
set xp=0
set xpmax=12
set gold=100
set points=0
set qw=1
set qac=2
set potion=2
set inv1=Dagger
set inv2=Tunic
set inv3=n
set inv4=n
set inv5=n
set inv6=n
set inv7=n
set inv8=n
set inv9=n
set inv1t=sharp
set inv2t=armor
set inv3t=n
set inv4t=n
set inv5t=n
set inv6t=n
set inv7t=n
set inv8t=n
set inv9t=n
set inv1d=5
set inv2d=2
set inv3d=n
set inv4d=n
set inv5d=n
set inv6d=n
set inv7d=n
set inv8d=n
set inv9d=n
set inv1m=n
set inv2m=n
set inv3m=n
set inv4m=n
set inv5m=n
set inv6m=n
set inv7m=n
set inv8m=n
set inv9m=n
set inv1md=n
set inv2md=n
set inv3md=n
set inv4md=n
set inv5md=n
set inv6md=n
set inv7md=n
set inv8md=n
set inv9md=n
set inv1c=3
set inv2c=3
set inv3c=n
set inv4c=n
set inv5c=n
set inv6c=n
set inv7c=n
set inv8c=n
set inv9c=n
echo New Character
echo -------------------
set /p name=Name:
goto savechar
:load
cls
set load=0
if %select% gtr 10 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s10=-
echo Load Character
echo ------------------
goto loadchar
:loadchar
if "%load%"=="9" goto loadend
set /a load+=1
if exist "Data\save%load%.bat" set good=%load%
if not exist "Data\save%load%.bat" if "%select%"=="%load%" if "%up%"=="y" set select=%good%&goto load
if not exist "Data\save%load%.bat" if "%select%"=="%load%" if "%up%"=="n" set /a select+=1
set s%select%=@
if exist "Data\save%load%.bat" call "Data\save%load%.bat"
if exist "Data\save%load%.bat" echo [!s%load%!] %name%, Level %lvl%
goto loadchar
:loadend
set sv=%select%
echo ------------------
echo [%s10%] Back
choice /c:wsd /n /m ""
if "%errorlevel%"=="1" set /a select-=1&set up=y
if "%errorlevel%"=="2" set /a select+=1&set up=n
if "%errorlevel%"=="3" (
if "%select%"=="10" goto menu
if exist "Data\save%sv%.bat" call "Data\save%sv%.bat"
goto savechar&set select=1
)
goto load
:controls
cls
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=@
echo Controls
echo -----------------
echo [%s1%] Up...: %cup%
echo [%s2%] Down.: %cdown%
echo [%s3%] Left.: %cleft%
echo [%s4%] Right: %cright%
echo [%s5%] Inv..: %cinv%
echo [%s6%] Drink: %cpot%
echo [%s7%] Menu.: %cmenu%
echo [%s8%] Chat.: %cchat%
echo -----------------
echo [%s9%] Back
choice /c:wsd /n /m ""
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set control=cup&goto setkey
if "%select%"=="2" set control=cdown&goto setkey
if "%select%"=="3" set control=cleft&goto setkey
if "%select%"=="4" set control=cright&goto setkey
if "%select%"=="5" set control=cinv&goto setkey
if "%select%"=="6" set control=cpot&goto setkey
if "%select%"=="7" set control=cmenu&goto setkey
if "%select%"=="8" set control=cchat&goto setkey
if "%select%"=="9" (
echo set cup=!cup!>"Data\controls.bat"
echo set cdown=!cdown!>>"Data\controls.bat"
echo set cleft=!cleft!>>"Data\controls.bat"
echo set cright=!cright!>>"Data\controls.bat"
echo set cinv=!cinv!>>"Data\controls.bat"
echo set cpot=!cpot!>>"Data\controls.bat"
echo set cmenu=!cmenu!>>"Data\controls.bat"
echo set cchat=!cchat!>>"Data\controls.bat"
set select=1
goto menu
)
)
goto controls
:setkey
set oldkey=!%control%!
choice /c:abcdefghijklmnopqrstuvwxyz1234567890 /n /m "Enter New Key..."
if "%errorlevel%"=="1" set %control%=a
if "%errorlevel%"=="2" set %control%=b
if "%errorlevel%"=="3" set %control%=c
if "%errorlevel%"=="4" set %control%=d
if "%errorlevel%"=="5" set %control%=e
if "%errorlevel%"=="6" set %control%=f
if "%errorlevel%"=="7" set %control%=g
if "%errorlevel%"=="8" set %control%=h
if "%errorlevel%"=="9" set %control%=i
if "%errorlevel%"=="10" set %control%=j
if "%errorlevel%"=="11" set %control%=k
if "%errorlevel%"=="12" set %control%=l
if "%errorlevel%"=="13" set %control%=m
if "%errorlevel%"=="14" set %control%=n
if "%errorlevel%"=="15" set %control%=o
if "%errorlevel%"=="16" set %control%=p
if "%errorlevel%"=="17" set %control%=q
if "%errorlevel%"=="18" set %control%=r
if "%errorlevel%"=="19" set %control%=s
if "%errorlevel%"=="20" set %control%=t
if "%errorlevel%"=="21" set %control%=u
if "%errorlevel%"=="22" set %control%=v
if "%errorlevel%"=="23" set %control%=w
if "%errorlevel%"=="24" set %control%=x
if "%errorlevel%"=="25" set %control%=y
if "%errorlevel%"=="26" set %control%=z
if "%errorlevel%"=="27" set %control%=1
if "%errorlevel%"=="28" set %control%=2
if "%errorlevel%"=="29" set %control%=3
if "%errorlevel%"=="30" set %control%=4
if "%errorlevel%"=="31" set %control%=5
if "%errorlevel%"=="32" set %control%=6
if "%errorlevel%"=="33" set %control%=7
if "%errorlevel%"=="34" set %control%=8
if "%errorlevel%"=="35" set %control%=9
if "%errorlevel%"=="36" set %control%=0
if not "%control%"=="cup" if "!%control%!"=="%cup%" set cup=%oldkey%
if not "%control%"=="cdown" if "!%control%!"=="%cdown%" set cdown=%oldkey%
if not "%control%"=="cleft" if "!%control%!"=="%cleft%" set cleft=%oldkey%
if not "%control%"=="cright" if "!%control%!"=="%cright%" set cright=%oldkey%
if not "%control%"=="cinv" if "!%control%!"=="%cinv%" set cinv=%oldkey%
if not "%control%"=="cpot" if "!%control%!"=="%cpot%" set cpot=%oldkey%
if not "%control%"=="cmenu" if "!%control%!"=="%cmenu%" set cmenu=%oldkey%
if not "%control%"=="cchat" if "!%control%!"=="%cchat%" set cchat=%oldkey%
goto controls
:savechar
echo set name=!name!>"Data\save%sv%.bat"
echo set lvl=!lvl!>>"Data\save%sv%.bat"
echo set hilvl1=!hilvl1!>>"Data\save%sv%.bat"
echo set hilvl2=!hilvl2!>>"Data\save%sv%.bat"
echo set hilvl3=!hilvl3!>>"Data\save%sv%.bat"
echo set xp=!xp!>>"Data\save%sv%.bat"
echo set xpmax=!xpmax!>>"Data\save%sv%.bat"
echo set points=!points!>>"Data\save%sv%.bat"
echo set str=!str!>>"Data\save%sv%.bat"
echo set agi=!agi!>>"Data\save%sv%.bat"
echo set sta=!sta!>>"Data\save%sv%.bat"
echo set qw=!qw!>>"Data\save%sv%.bat"
echo set qac=!qac!>>"Data\save%sv%.bat"
echo set potion=!potion!>>"Data\save%sv%.bat"
echo set inv1=!inv1!>>"Data\save%sv%.bat"
echo set inv2=!inv2!>>"Data\save%sv%.bat"
echo set inv3=!inv3!>>"Data\save%sv%.bat"
echo set inv4=!inv4!>>"Data\save%sv%.bat"
echo set inv5=!inv5!>>"Data\save%sv%.bat"
echo set inv6=!inv6!>>"Data\save%sv%.bat"
echo set inv7=!inv7!>>"Data\save%sv%.bat"
echo set inv8=!inv8!>>"Data\save%sv%.bat"
echo set inv9=!inv9!>>"Data\save%sv%.bat"
echo set inv1t=!inv1t!>>"Data\save%sv%.bat"
echo set inv2t=!inv2t!>>"Data\save%sv%.bat"
echo set inv3t=!inv3t!>>"Data\save%sv%.bat"
echo set inv4t=!inv4t!>>"Data\save%sv%.bat"
echo set inv5t=!inv5t!>>"Data\save%sv%.bat"
echo set inv6t=!inv6t!>>"Data\save%sv%.bat"
echo set inv7t=!inv7t!>>"Data\save%sv%.bat"
echo set inv8t=!inv8t!>>"Data\save%sv%.bat"
echo set inv9t=!inv9t!>>"Data\save%sv%.bat"
echo set inv1d=!inv1d!>>"Data\save%sv%.bat"
echo set inv2d=!inv2d!>>"Data\save%sv%.bat"
echo set inv3d=!inv3d!>>"Data\save%sv%.bat"
echo set inv4d=!inv4d!>>"Data\save%sv%.bat"
echo set inv5d=!inv5d!>>"Data\save%sv%.bat"
echo set inv6d=!inv6d!>>"Data\save%sv%.bat"
echo set inv7d=!inv7d!>>"Data\save%sv%.bat"
echo set inv8d=!inv8d!>>"Data\save%sv%.bat"
echo set inv9d=!inv9d!>>"Data\save%sv%.bat"
echo set inv1m=!inv1m!>>"Data\save%sv%.bat"
echo set inv2m=!inv2m!>>"Data\save%sv%.bat"
echo set inv3m=!inv3m!>>"Data\save%sv%.bat"
echo set inv4m=!inv4m!>>"Data\save%sv%.bat"
echo set inv5m=!inv5m!>>"Data\save%sv%.bat"
echo set inv6m=!inv6m!>>"Data\save%sv%.bat"
echo set inv7m=!inv7m!>>"Data\save%sv%.bat"
echo set inv8m=!inv8m!>>"Data\save%sv%.bat"
echo set inv9m=!inv9m!>>"Data\save%sv%.bat"
echo set inv1md=!inv1md!>>"Data\save%sv%.bat"
echo set inv2md=!inv2md!>>"Data\save%sv%.bat"
echo set inv3md=!inv3md!>>"Data\save%sv%.bat"
echo set inv4md=!inv4md!>>"Data\save%sv%.bat"
echo set inv5md=!inv5md!>>"Data\save%sv%.bat"
echo set inv6md=!inv6md!>>"Data\save%sv%.bat"
echo set inv7md=!inv7md!>>"Data\save%sv%.bat"
echo set inv8md=!inv8md!>>"Data\save%sv%.bat"
echo set inv9md=!inv9md!>>"Data\save%sv%.bat"
echo set inv1c=!inv1c!>>"Data\save%sv%.bat"
echo set inv2c=!inv2c!>>"Data\save%sv%.bat"
echo set inv3c=!inv3c!>>"Data\save%sv%.bat"
echo set inv4c=!inv4c!>>"Data\save%sv%.bat"
echo set inv5c=!inv5c!>>"Data\save%sv%.bat"
echo set inv6c=!inv6c!>>"Data\save%sv%.bat"
echo set inv7c=!inv7c!>>"Data\save%sv%.bat"
echo set inv8c=!inv8c!>>"Data\save%sv%.bat"
echo set inv9c=!inv9c!>>"Data\save%sv%.bat"
echo set gold=!gold!>>"Data\save%sv%.bat"
if not exist "Data\save%sv%.bat" goto error4
set select=1
goto charmenu
:charmenu
cls
set level=t
set strm=%str%
set agim=%agi%
set stam=%sta%
if "!inv%qw%m!"=="str" set /a strm+=!inv%qw%md!
if "!inv%qac%m!"=="str" set /a strm+=!inv%qac%md!
if "!inv%qw%m!"=="agi" set /a agim+=!inv%qw%md!
if "!inv%qac%m!"=="agi" set /a agim+=!inv%qac%md!
if "!inv%qw%m!"=="sta" set /a stam+=!inv%qw%md!
if "!inv%qac%m!"=="sta" set /a stam+=!inv%qac%md!
set /a dmg=!inv%qw%d!+(%strm%/2)+(%agim%/4)
if "!inv%qw%m!"=="mod" set /a dmg+=!inv%qw%md!
set /a ac=!inv%qac%d!+(%agim%/3)
if "!inv%qac%m!"=="mod" set /a ac+=!inv%qac%md!
set /a life=40+(%stam%*2)
set hp=%life%
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo %name%, Level %lvl%
echo ----------------------
echo Strength: %strm%
echo Agility.: %agim%
echo Stamina.: %stam%
echo ----------------------
echo [%s1%] Create Game
echo [%s2%] Join Game
echo [%s3%] Delete
echo [%s4%] Back
choice /c:wsd /n /m ""
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto create
if "%select%"=="2" goto join
if "%select%"=="3" goto delete
if "%select%"=="4" set select=1&goto menu
)
goto charmenu
:delete
echo.
set /p delete=Are You Sure (Y/N)?:
if "%delete%"=="y" del "Data\save%sv%.bat"
if "%delete%"=="y" if exist "Data\save%sv%.bat" goto error6
if "%delete%"=="y" cls
if "%delete%"=="y" echo Character Deleted
if "%delete%"=="y" echo -----------------
if "%delete%"=="y" timeout /t 3 >nul
if "%delete%"=="y" set select=1&goto menu
if "%delete%"=="Y" del "Data\save%sv%.bat"
if "%delete%"=="Y" if exist "Data\save%sv%.bat" goto error6
if "%delete%"=="Y" cls
if "%delete%"=="Y" echo Character Deleted
if "%delete%"=="Y" echo -----------------
if "%delete%"=="Y" timeout /t 3 >nul
if "%delete%"=="Y" set select=1&goto menu
goto charmenu
:create
cls
set player=1
set host=y
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo Select Difficulty
echo --------------------
echo [%s1%] Normal
echo [%s2%] Expert
echo [%s3%] Insane
echo [%s4%] Back
choice /c:wsd /n /m ""
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="2" if %lvl% lss 10 set req=10&goto error5
if "%select%"=="3" if %lvl% lss 20 set req=20&goto error5
if "%select%"=="1" set diff=1&goto startup
if "%select%"=="2" set diff=2&goto startup
if "%select%"=="3" set diff=3&goto startup
if "%select%"=="4" set select=1&goto charmenu
)
goto create
:startup
if "%host%"=="y" set dir=%public%\Dungeons
if "%host%"=="y" if exist "%dir%" del /q "%dir%"
if "%host%"=="y" if exist "%dir%" rd "%dir%"
if "%host%"=="y" md "%dir%"
if "%host%"=="y" (
echo set p1=n>"%dir%\players.bat"
echo set p2=n>>"%dir%\players.bat"
echo set p3=n>>"%dir%\players.bat"
echo set p4=n>>"%dir%\players.bat"
echo set started=n>>"%dir%\players.bat"
echo set done=n>>"%dir%\players.bat"
echo set diff=!diff!>>"%dir%\players.bat"
)
echo set p%player%=!name!>>"%dir%\players.bat"
set select=1
goto lobby
:lobby
cls
set l1start=n
set l2start=n
set l3start=n
set l4start=n
set l5start=n
set l6start=n
set l7start=n
set l8start=n
set l9start=n
set l10start=n
set hostile=n
set trade=n
set ai=n
set stairs=down
if not exist "%dir%" goto error8
call "%dir%\players.bat"
if "%started%"=="y" call "Data\town.bat"
if "%started%"=="y" goto setgame
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=@
echo Game Lobby
echo ------------------
echo 1: %p1%
if not "%p2%"=="n" echo 2: %p2%
if not "%p3%"=="n" echo 3: %p3%
if not "%p4%"=="n" echo 4: %p4%
if "%p2%"=="n" echo 2: None
if "%p3%"=="n" echo 3: None
if "%p4%"=="n" echo 4: None
echo ------------------
if "%host%"=="y" echo [%s1%] Start Game
if "%host%"=="y" echo [%s2%] Close Game
if "%host%"=="n" echo [%s1%] Refresh
if "%host%"=="n" echo [%s2%] Leave
choice /c:wsd /n /m ""
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" if "%host%"=="y" echo set started=y>>"%dir%\players.bat"
if "%select%"=="1" if "%host%"=="y" call "Data\town.bat"
if "%select%"=="1" if "%host%"=="y" goto setgame
if "%select%"=="2" if "%host%"=="y" goto closegame
if "%select%"=="1" if "%host%"=="n" goto lobby
if "%select%"=="2" if "%host%"=="n" echo set p%player%=n>>"%dir%\players.bat"
if "%select%"=="2" if "%host%"=="n" set select=1&goto charmenu
)
goto lobby
:closegame
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read4.bat"
if "%host%"=="y" del /q "%dir%"
if "%host%"=="y" rd "%dir%"
if "%host%"=="n" echo set p%player%=n>>"%dir%\players.bat"
if "%host%"=="n" if not "%p1%"=="n" echo set message=!name! Left The Game>>"%dir%\read1.bat"
if "%host%"=="n" if not "%p2%"=="n" echo set message=!name! Left The Game>>"%dir%\read2.bat"
if "%host%"=="n" if not "%p3%"=="n" echo set message=!name! Left The Game>>"%dir%\read3.bat"
if "%host%"=="n" if not "%p4%"=="n" echo set message=!name! Left The Game>>"%dir%\read4.bat"
if "%host%"=="n" net use Y: /delete
set select=1
goto savechar
:join
cls
set host=n
echo Join Game
echo ----------------
set /p ip=IP Address:
if exist "Y:\" net use Y: /delete
net use Y: "\\%ip%\Users\Public\Dungeons"
if not exist "Y:\" goto error1
set dir=Y:
goto setup
:setup
set player=1
call "%dir%\players.bat"
if "%started%"=="y" goto error12
if "%done%"=="y" goto error13
if "%diff%"=="2" set req=10
if "%diff%"=="3" set req=20
if %lvl% lss %req% goto error5
goto detectplayer
:detectplayer
if "%player%"=="4" goto error7
set /a player+=1
if "!p%player%!"=="n" goto startup
goto detectplayer
:setgame
if exist "%dir%\newlvl.dat" cls
if exist "%dir%\newlvl.dat" echo Recieving Level Data...
if exist "%dir%\newlvl.dat" echo -----------------------
if exist "%dir%\newlvl.dat" timeout /t 1 >nul
if exist "%dir%\newlvl.dat" goto setgame
call "%dir%\players.bat"
if not "%level%"=="t" (
set xlmax=40
set ylmax=30
)
if "%level%"=="t" (
set xlmax=10
set ylmax=7
)
if not "%level%"=="t" if "!l%level%start!"=="n" call "Data\levels.bat"
if %level% lss 1 set level=t
set spawn=1
goto spawn
:spawn
if exist "%dir%\read%player%.bat" call "%dir%\read%player%.bat"
if exist "%dir%\read%player%.bat" del "%dir%\read%player%.bat"
if "%stairs%"=="down" set /a px=!l%level%startx!+%spawn%
if "%stairs%"=="down" set py=!l%level%starty!
if "%stairs%"=="up" set /a px=!l%level%endx!+%spawn%
if "%stairs%"=="up" set py=!l%level%endy!
if not "!l%level%x%px%x%py%!"=="." (
if "%stairs%"=="down" set px=!l%level%startx!
if "%stairs%"=="down" set /a py=!l%level%starty!-%spawn%
if "%stairs%"=="up" set px=!l%level%endx!
if "%stairs%"=="up" set /a py=!l%level%endy!-%spawn%
)
if not "!l%level%x%px%x%py%!"=="." (
if "%stairs%"=="down" set /a px=!l%level%startx!-%spawn%
if "%stairs%"=="down" set py=!l%level%starty!
if "%stairs%"=="up" set /a px=!l%level%endx!-%spawn%
if "%stairs%"=="up" set py=!l%level%endy!
)
if not "!l%level%x%px%x%py%!"=="." (
if "%stairs%"=="down" set px=!l%level%startx!
if "%stairs%"=="down" set /a py=!l%level%starty!+%spawn%
if "%stairs%"=="up" set px=!l%level%endx!
if "%stairs%"=="up" set /a py=!l%level%endy!+%spawn%
)
if not "!l%level%x%px%x%py%!"=="." set /a spawn+=1&goto spawn
goto gamedata
:gamedata
if not exist "%dir%" goto error8
if exist "%dir%\newlvl.dat" cls
if exist "%dir%\newlvl.dat" echo Recieving Level Data...
if exist "%dir%\newlvl.dat" echo -----------------------
if exist "%dir%\newlvl.dat" timeout /t 1 >nul
if exist "%dir%\newlvl.dat" goto gamedata
call "%dir%\players.bat"
set mon=0
if not "%p1%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read4.bat"
set yitem=n
set titem=n
set ygold=0
set tgold=0
set yagree=n
set tagree=n
if exist "%dir%\read%player%.bat" call "%dir%\read%player%.bat"
if exist "%dir%\read%player%.bat" del "%dir%\read%player%.bat"
if "%done%"=="y" goto donegame
if "%trade%"=="y" (
set fitem=0
goto trade
)
if "%ai%"=="n" goto frame
goto ai
:ai
if "%mon%"=="!mon%level%max!" goto frame
set /a mon+=1
if !l%level%m%mon%hp! lss 1 goto ai
set mx=!l%level%m%mon%x!
set my=!l%level%m%mon%y!
set tx=0
set ty=0
if %px% gtr %mx% set /a tx=%px%-%mx%
if %px% lss %mx% set /a tx=%mx%-%px%
if %py% gtr %my% set /a ty=%py%-%my%
if %py% lss %my% set /a ty=%my%-%py%
set /a range=%tx%+%ty%
set tdmg=1
if %range% lss 2 set /a tdmg=!l%level%m%mon%dmg!-%ac%
if %range% lss 2 if %tdmg% lss 1 set tdmg=1
if %range% lss 2 set /a hp-=%tdmg%
if %range% lss 4 (
set l%level%x%mx%x%my%=.
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%x%mx%x%my%=.>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%x%mx%x%my%=.>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%x%mx%x%my%=.>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%x%mx%x%my%=.>>"%dir%\read4.bat"
)
if %range% lss 4 set move=n
if %range% lss 4 if "%move%"=="n" (
if %px% gtr !l%level%m%mon%x! set /a l%level%m%mon%x+=1&set reverse=set /a l%level%m%mon%x-=1&set move=y
if %px% lss !l%level%m%mon%x! set /a l%level%m%mon%x-=1&set reverse=set /a l%level%m%mon%x+=1&set move=y
)
if %range% lss 4 if "%move%"=="n" (
if %py% gtr !l%level%m%mon%y! set /a l%level%m%mon%y+=1&set reverse=set /a l%level%m%mon%y-=1&set move=y
if %py% lss !l%level%m%mon%y! set /a l%level%m%mon%y-=1&set reverse=set /a l%level%m%mon%y+=1&set move=y
)
if %range% lss 4 (
set mx=!l%level%m%mon%x!
set my=!l%level%m%mon%y!
)
if %range% lss 4 if not "!l%level%x%mx%x%my%!"=="." %reverse%
if %range% lss 4 (
set mx=!l%level%m%mon%x!
set my=!l%level%m%mon%y!
)
if %range% lss 4 (
set l%level%x%mx%x%my%=!l%level%m%mon%i!
if not "%p1%"=="n" echo set l%level%m%mon%x=!mx!>>"%dir%\read1.bat"
if not "%p1%"=="n" echo set l%level%m%mon%y=!my!>>"%dir%\read1.bat"
if not "%player%"=="1" if not "%p1%"=="n" echo set l%level%x%mx%x%my%=!l%level%m%mon%i!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%m%mon%x=!mx!>>"%dir%\read2.bat"
if not "%p2%"=="n" echo set l%level%m%mon%y=!my!>>"%dir%\read2.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set l%level%x%mx%x%my%=!l%level%m%mon%i!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%m%mon%x=!mx!>>"%dir%\read3.bat"
if not "%p3%"=="n" echo set l%level%m%mon%y=!my!>>"%dir%\read3.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set l%level%x%mx%x%my%=!l%level%m%mon%i!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%m%mon%x=!mx!>>"%dir%\read4.bat"
if not "%p4%"=="n" echo set l%level%m%mon%y=!my!>>"%dir%\read4.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set l%level%x%mx%x%my%=!l%level%m%mon%i!>>"%dir%\read4.bat"
)
goto ai
:frame
set x=0
set y=1
set ai=n
goto render
:render
set /a offx=%px%+%x%-8
set /a offy=%py%+%y%-5
set /a off1x=%offx%+1
set /a off2x=%off1x%+1
if %offx% gtr %xlmax% set offx=%xlmax%
if %offy% gtr %ylmax% set offy=%ylmax%
if %off1x% gtr %xlmax% set off1x=%xlmax%
if %off2x% gtr %xlmax% set off2x=%xlmax%
if %offx% lss 1 set offx=1
if %offy% lss 1 set offy=1
if %off1x% lss 1 set off1x=1
if %off2x% lss 1 set off2x=1
if not "!l%level%x%offx%x%offy%!"=="[" if not "!l%level%x%offx%x%offy%!"=="/" if not "!l%level%x%offx%x%offy%!"=="." if not "!l%level%x%offx%x%offy%!"=="#" if not "!l%level%x%offx%x%offy%!"=="$" if not "!l%level%x%offx%x%offy%!"=="1" if not "!l%level%x%offx%x%offy%!"=="2" if not "!l%level%x%offx%x%offy%!"=="3" if not "!l%level%x%offx%x%offy%!"=="4" set ai=y
if not "!l%level%x%off1x%x%offy%!"=="[" if not "!l%level%x%off1x%x%offy%!"=="/" if not "!l%level%x%off1x%x%offy%!"=="." if not "!l%level%x%off1x%x%offy%!"=="#" if not "!l%level%x%off1x%x%offy%!"=="$" if not "!l%level%x%off1x%x%offy%!"=="1" if not "!l%level%x%off1x%x%offy%!"=="2" if not "!l%level%x%off1x%x%offy%!"=="3" if not "!l%level%x%off1x%x%offy%!"=="4" set ai=y
if not "!l%level%x%off2x%x%offy%!"=="[" if not "!l%level%x%off2x%x%offy%!"=="/" if not "!l%level%x%off2x%x%offy%!"=="." if not "!l%level%x%off2x%x%offy%!"=="#" if not "!l%level%x%off2x%x%offy%!"=="$" if not "!l%level%x%off2x%x%offy%!"=="1" if not "!l%level%x%off2x%x%offy%!"=="2" if not "!l%level%x%off2x%x%offy%!"=="3" if not "!l%level%x%off2x%x%offy%!"=="4" set ai=y
set m%x%m%y%=!l%level%x%offx%x%offy%!!l%level%x%off1x%x%offy%!!l%level%x%off2x%x%offy%!
set /a x+=3
if %x% gtr 15 set /a y+=1&set x=0
if %y% gtr 9 (
cls
set vy=0
goto view
)
goto render
:view
if "%vy%"=="9" goto main
set /a vy+=1
echo !m0m%vy%!!m3m%vy%!!m6m%vy%!!m9m%vy%!!m12m%vy%!!m15m%vy%!
goto view
:main
if %xp% gtr %xpmax% goto levelup
if "%xp%"=="%xpmax%" goto levelup
if %hp% lss 1 goto dead
if %hp% gtr %life% set hp=%life%
echo HP.: %hp%/%life% x%potion% Potions
echo AC.: %ac%
echo DMG: %dmg%
echo WPN: !inv%qw%!
echo AMR: !inv%qac%!
echo EXP: %xp%/%xpmax%
echo Gold: %gold%
echo :%message%
choice /c:%cup%%cdown%%cleft%%cright%%cinv%%cpot%%cmenu%%cchat% /n /m ""
if exist "%dir%\newlvl.dat" goto gamedata
if "%errorlevel%"=="1" (
if not "%p1%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read4.bat"
set /a py-=1
set reverse=set /a py+=1
)
if "%errorlevel%"=="2" (
if not "%p1%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read4.bat"
set /a py+=1
set reverse=set /a py-=1
)
if "%errorlevel%"=="3" (
if not "%p1%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read4.bat"
set /a px-=1
set reverse=set /a px+=1
)
if "%errorlevel%"=="4" (
if not "%p1%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read4.bat"
set /a px+=1
set reverse=set /a px-=1
)
if "%errorlevel%"=="5" set select=1&set up=n&set good=10&set sell=n&goto inv
if "%errorlevel%"=="6" if %potion% lss 1 set message=Out Of Potions!
if "%errorlevel%"=="6" if %potion% gtr 0 set /a hp+=%life%/3&set /a potion-=1&set message=Drank Potion&goto gamedata
if "%errorlevel%"=="7" set select=1&goto gamemenu
if "%errorlevel%"=="8" set /p msg=Chat:
if "%errorlevel%"=="8" (
if not "%p1%"=="n" echo set message=!name! Lvl!lvl!: !msg!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set message=!name! Lvl!lvl!: !msg!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set message=!name! Lvl!lvl!: !msg!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set message=!name! Lvl!lvl!: !msg!>>"%dir%\read4.bat"
goto gamedata
)
goto collide
:levelup
if "%lvl%"=="30" set xp=0&goto gamedata
set /a xp-=%xpmax%
set /a lvl+=1
set message=Level %lvl% Reached
set /a xpmax+=%xpmax%/2
set /a points+=6
set hp=%life%
if %xp% gtr %xpmax% goto levelup
if "%xp%"=="%xpmax%" goto levelup
goto gamedata
:potshop
cls
set shop=potshop
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set /a potprice=10*%diff%
set s1=-
set s2=-
set s%select%=@
echo Potion Shop
echo -----------------
echo Gold: %gold%
echo -----------------
echo [%s1%] Buy Potion %potprice%g
echo [%s2%] Leave
choice /c:wsd /n /m ""
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" if %gold% lss %potprice% goto error10
if "%select%"=="1" if %gold% gtr 9 set /a gold-=%potprice%&set /a potion+=1
if "%select%"=="2" goto gamedata
)
goto potshop
:gamble
cls
set shop=potshop
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
if "%select%"=="1" if %bet% lss 1 set bet=0
if "%select%"=="1" if %bet% gtr %gold% set bet=%gold%
set /a win=%random% %%4
set s1=-
set s2=-
set s3=-
set s%select%=@
echo Gambling Table
echo ------------------
echo Bet.: %bet%
echo Gold: %gold%
echo ------------------
echo [%s1%] Change Bet
echo [%s2%] Roll Dice
echo [%s3%] Leave
choice /c:wsda /n /m ""
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set /a bet+=5
if "%select%"=="2" if "%win%"=="0" set /a gold+=%bet%&set bet=0&set select=1
if "%select%"=="2" if not "%win%"=="0" set /a gold-=%bet%&set bet=0&set select=1
if "%select%"=="3" set level=t
if "%select%"=="3" goto gamedata
)
if "%errorlevel%"=="4" (
if "%select%"=="1" set /a bet-=5
)
goto gamble
:newitembs
call "Data\items.bat"
set /a price=%levelspend%*20*%diff%
set /a req=%price%/13/(%lvl%/10+1)
set /a right=%gold%+1
set select=1
goto blacksmith
:blacksmith
cls
set level=!hilvl%diff%!
set shop=blacksmith
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo Blacksmith
echo ------------------
if "%magic%"=="0" if "%mbonus%"=="str" echo %item% +%mod% STR +%mamount%
if "%magic%"=="0" if "%mbonus%"=="agi" echo %item% +%mod% AGI +%mamount%
if "%magic%"=="0" if "%mbonus%"=="sta" echo %item% +%mod% STA +%mamount%
if "%magic%"=="0" if "%mbonus%"=="leech" echo %item% +%mod% Leech +%mamount%
if "%magic%"=="0" if "%mbonus%"=="demon" echo %item% +%mod% To Demon +%mamount%
if "%magic%"=="0" if "%mbonus%"=="mod" if "%type%"=="sharp" echo %item% +%mod% DMG +%mamount%
if "%magic%"=="0" if "%mbonus%"=="mod" if "%type%"=="blunt" echo %item% +%mod% DMG +%mamount%
if "%magic%"=="0" if "%mbonus%"=="mod" if "%type%"=="armor" echo %item% +%mod% AC +%mamount%
if not "%magic%"=="0" echo %item% +%mod%
echo %req% STR Required
echo %price% Gold
echo ------------------
echo Gold: %gold%
echo ------------------
echo [%s1%] Next Item
echo [%s2%] Buy Item
echo [%s3%] Sell Item
echo [%s4%] Leave
choice /c:wsd /n /m ""
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" goto newitembs
if "%select%"=="2" set ifind=0&goto buyitem
if "%select%"=="3" set sell=y&set select=1&set good=10&goto inv
if "%select%"=="4" set level=t&goto gamedata
)
goto blacksmith
:buyitem
if "%ifind%"=="9" goto error9
set /a ifind+=1
if "!inv%ifind%!"=="n" (
if %price% gtr %gold% goto error10 
if %right% gtr %price% set /a gold-=%price%
set inv%ifind%=%item%
set inv%ifind%t=%type%
set inv%ifind%d=%mod%
set inv%ifind%m=%mbonus%
set inv%ifind%md=%mamount%
set /a inv%ifind%c=%price%
goto newitembs
)
goto buyitem
:collide
set hosdmg=n
set totaldmg=1
if exist "%dir%\read%player%.bat" call "%dir%\read%player%.bat"
if exist "%dir%\read%player%.bat" del "%dir%\read%player%.bat"
if not "%hosdmg%"=="n" set /a totaldmg=%hosdmg%-%ac%
if not "%hosdmg%"=="n" if %totaldmg% lss 1 set totaldmg=1
if not "%hosdmg%"=="n" set /a hp-=%totaldmg%
set select=1
set go=n
if "!l%level%x%px%x%py%!"=="/" if "%level%"=="t" %reverse%&goto selectlevel
if "!l%level%x%px%x%py%!"=="B" if "%level%"=="t" set go=B&%reverse%
if "!l%level%x%px%x%py%!"=="P" if "%level%"=="t" set go=P&%reverse%
if "!l%level%x%px%x%py%!"=="G" if "%level%"=="t" set go=G&%reverse%
if "%go%"=="B" (
if not "%p1%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read4.bat"
goto newitembs
)
if "%go%"=="P" (
if not "%p1%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read4.bat"
goto potshop
)
if "%go%"=="G" (
if not "%p1%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read4.bat"
set bet=0
goto gamble
)
if "!l%level%x%px%x%py%!"=="#" %reverse%&goto gamedata
if "!l%level%x%px%x%py%!"=="$" call "Data\items.bat"
if "!l%level%x%px%x%py%!"=="$" set message=Found %item%&set ifind=0&goto itemget
if "!l%level%x%px%x%py%!"=="[" %reverse%&goto goup
if "!l%level%x%px%x%py%!"=="/" %reverse%&goto godown
if "!l%level%x%px%x%py%!"=="1" if "%hostile%"=="n" (
set fitem=0
set pnum=1
set trade=y
echo set pnum=!player!>>"%dir%\read1.bat"
echo set trade=y>>"%dir%\read1.bat"
%reverse%
goto tradeset
)
if "!l%level%x%px%x%py%!"=="2" if "%hostile%"=="n" (
set fitem=0
set pnum=2
set trade=y
echo set pnum=!player!>>"%dir%\read2.bat"
echo set trade=y>>"%dir%\read2.bat"
%reverse%
goto tradeset
)
if "!l%level%x%px%x%py%!"=="3" if "%hostile%"=="n" (
set fitem=0
set pnum=3
echo set trade=y
echo set pnum=!player!>>"%dir%\read3.bat"
set trade=y>>"%dir%\read3.bat"
%reverse%
goto tradeset
)
if "!l%level%x%px%x%py%!"=="4" if "%hostile%"=="n" (
set fitem=0
set pnum=4
set trade=y
echo set pnum=!player!>>"%dir%\read4.bat"
echo set trade=y>>"%dir%\read4.bat"
%reverse%
goto tradeset
)
if "!l%level%x%px%x%py%!"=="1" if "%level%"=="t" (
set fitem=0
set pnum=1
set trade=y
echo set pnum=!player!>>"%dir%\read1.bat"
echo set trade=y>>"%dir%\read1.bat"
%reverse%
goto tradeset
)
if "!l%level%x%px%x%py%!"=="2" if "%level%"=="t" (
set fitem=0
set pnum=2
set trade=y
echo set pnum=!player!>>"%dir%\read2.bat"
echo set trade=y>>"%dir%\read2.bat"
%reverse%
goto tradeset
)
if "!l%level%x%px%x%py%!"=="3" if "%level%"=="t" (
set fitem=0
set pnum=3
set trade=y
echo set pnum=!player!>>"%dir%\read3.bat"
echo set trade=y>>"%dir%\read3.bat"
%reverse%
goto tradeset
)
if "!l%level%x%px%x%py%!"=="4" if "%level%"=="t" (
set fitem=0
set pnum=4
set trade=y
echo set pnum=!player!>>"%dir%\read4.bat"
echo set trade=y>>"%dir%\read4.bat"
%reverse%
goto tradeset
)
if "!l%level%x%px%x%py%!"=="1" if "%hostile%"=="y" if not "%level%"=="t" echo set hosdmg=!dmg!>>"%dir%\read1.bat"&set message=Hit %p1%&%reverse%
if "!l%level%x%px%x%py%!"=="2" if "%hostile%"=="y" if not "%level%"=="t" echo set hosdmg=!dmg!>>"%dir%\read2.bat"&set message=Hit %p2%&%reverse%
if "!l%level%x%px%x%py%!"=="3" if "%hostile%"=="y" if not "%level%"=="t" echo set hosdmg=!dmg!>>"%dir%\read3.bat"&set message=Hit %p3%&%reverse%
if "!l%level%x%px%x%py%!"=="4" if "%hostile%"=="y" if not "%level%"=="t" echo set hosdmg=!dmg!>>"%dir%\read4.bat"&set message=Hit %p4%&%reverse%
if not "!l%level%x%px%x%py%!"=="." set mon=0
if not "!l%level%x%px%x%py%!"=="." goto monfind
goto gamedata
:itemget
if "%ifind%"=="9" %reverse%&set message=Inventory Full&goto gamedata
set /a ifind+=1
if "!inv%ifind%!"=="n" (
set inv%ifind%=%item%
set inv%ifind%t=%type%
set inv%ifind%d=%mod%
set inv%ifind%m=%mbonus%
set inv%ifind%md=%mamount%
set /a inv%ifind%c=%levelspend%*20*%diff%
goto gamedata
)
goto itemget
:monfind
if "%mon%"=="!mon%level%max!" goto gamedata
set /a mon+=1
if !l%level%m%mon%hp! lss 1 goto monfind
set tdmg=0
set glvl=%level%
if %glvl% lss 3 set glvl=3
if "!l%level%m%mon%x!x!l%level%m%mon%y!"=="%px%x%py%" set rdmg=%dmg%
if "!l%level%m%mon%x!x!l%level%m%mon%y!"=="%px%x%py%" if "!inv%qw%t!"=="sharp" if "!l%level%m%mon%t!"=="beast" set /a rdmg+=!inv%qw%d!/2
if "!l%level%m%mon%x!x!l%level%m%mon%y!"=="%px%x%py%" if "!inv%qw%t!"=="blunt" if "!l%level%m%mon%t!"=="undead" set /a rdmg+=!inv%qw%d!/2
if "!l%level%m%mon%x!x!l%level%m%mon%y!"=="%px%x%py%" if "!inv%qw%m!"=="leech" set /a hp+=!inv%qw%md!
if "!l%level%m%mon%x!x!l%level%m%mon%y!"=="%px%x%py%" if "!inv%qw%m!"=="demon" if "!l%level%m%mon%t!"=="demon" set /a rdmg+=!inv%qw%md!
if "!l%level%m%mon%x!x!l%level%m%mon%y!"=="%px%x%py%" (
set /a l%level%m%mon%hp-=%rdmg%
if not "%player%"=="1" if not "%p1%"=="n" echo set /a l%level%m%mon%hp-=!rdmg!>>"%dir%\read1.bat"
if not "%player%"=="2" if not "%p2%"=="n" echo set /a l%level%m%mon%hp-=!rdmg!>>"%dir%\read2.bat"
if not "%player%"=="3" if not "%p3%"=="n" echo set /a l%level%m%mon%hp-=!rdmg!>>"%dir%\read3.bat"
if not "%player%"=="4" if not "%p4%"=="n" echo set /a l%level%m%mon%hp-=!rdmg!>>"%dir%\read4.bat"
)
if "!l%level%m%mon%x!x!l%level%m%mon%y!"=="%px%x%py%" set message=Hit !l%level%m%mon%n!
if "!l%level%m%mon%x!x!l%level%m%mon%y!"=="%px%x%py%" if !l%level%m%mon%hp! lss 1 (
if not "%p1%"=="n" echo set l%level%x!l%level%m%mon%x!x!l%level%m%mon%y!=.>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x!l%level%m%mon%x!x!l%level%m%mon%y!=.>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x!l%level%m%mon%x!x!l%level%m%mon%y!=.>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x!l%level%m%mon%x!x!l%level%m%mon%y!=.>>"%dir%\read4.bat"
if "%diff%"=="1" set /a gold+=5*%glvl%/3
if "%diff%"=="2" set /a gold+=15*%glvl%/3
if "%diff%"=="3" set /a gold+=45*%glvl%/3
if "%diff%"=="1" set /a xp+=2*%level%+%level%
)
if "!l%level%m%mon%x!x!l%level%m%mon%y!"=="%px%x%py%" if !l%level%m%mon%hp! lss 1 if "%diff%"=="2" set /a xp+=22*%level%+(%level%*2)
if "!l%level%m%mon%x!x!l%level%m%mon%y!"=="%px%x%py%" if !l%level%m%mon%hp! lss 1 (
if "%diff%"=="3" set /a xp+=250*%level%*%level%
set message=Killed !l%level%m%mon%n!
%reverse%
goto gamedata
)
if "!l%level%m%mon%x!x!l%level%m%mon%y!"=="%px%x%py%" %reverse%&goto gamedata
goto monfind
:dead
cls
if not "%p1%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read4.bat"
if not "%p1%"=="n" echo set message=!name! Has Died>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set message=!name! Has Died>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set message=!name! Has Died>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set message=!name! Has Died>>"%dir%\read4.bat"
echo You Have Died
echo -------------
timeout /t 3 >nul
set level=t
set hp=1
set stairs=down
goto setgame
:goup
set /a level-=1
set stairs=up
if "%level%"=="0" set level=t
goto setgame
:godown
if "%level%"=="t" set level=0
set /a level+=1
set stairs=down
if %level% gtr 10 goto end
if %level% gtr !hilvl%diff%! set hilvl%diff%=%level%
goto setgame
:end
echo set done=y>>"%dir%\players.bat"
goto gamedata
:donegame
cls
echo You Have Completed The Game
if not "%diff%"=="3" echo Try It On A Harder Difficulty
echo -----------------------------
timeout /t 5 >nul
if "%host%"=="n" goto closegame
goto savechar
:inv
cls
if exist "%dir%\read%player%.bat" call "%dir%\read%player%.bat"
if exist "%dir%\read%player%.bat" del "%dir%\read%player%.bat"
set load=0
if %select% gtr 10 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s10=-
echo Inventory
echo ------------------
goto loadinv
:loadinv
if "%load%"=="9" goto invend
set /a load+=1
if  not "!inv%load%!"=="n" set good=%load%
if  "!inv%load%!"=="n" if "%select%"=="%load%" if "%up%"=="y" set select=%good%&goto inv
if  "!inv%load%!"=="n" if "%select%"=="%load%" if "%up%"=="n" set /a select+=1
set s%select%=@
if not "!inv%load%!"=="n" (
if "!inv%load%m!"=="n" echo [!s%load%!] !inv%load%! +!inv%load%d!
if "!inv%load%m!"=="str" echo [!s%load%!] !inv%load%! +!inv%load%d! STR +!inv%load%md!
if "!inv%load%m!"=="agi" echo [!s%load%!] !inv%load%! +!inv%load%d! AGI +!inv%load%md!
if "!inv%load%m!"=="sta" echo [!s%load%!] !inv%load%! +!inv%load%d! STA +!inv%load%md!
if "!inv%load%m!"=="leech" echo [!s%load%!] !inv%load%! +!inv%load%d! Leech +!inv%load%md!
if "!inv%load%m!"=="demon" echo [!s%load%!] !inv%load%! +!inv%load%d! To Demon +!inv%load%md!
if "!inv%load%m!"=="mod" if "!inv%load%t!"=="sharp" echo [!s%load%!] !inv%load%! +!inv%load%d! DMG +!inv%load%md!
if "!inv%load%m!"=="mod" if "!inv%load%t!"=="blunt" echo [!s%load%!] !inv%load%! +!inv%load%d! DMG +!inv%load%md!
if "!inv%load%m!"=="mod" if "!inv%load%t!"=="armor" echo [!s%load%!] !inv%load%! +!inv%load%d! AC +!inv%load%md!
)
goto loadinv
:invend
echo ------------------
echo [%s10%] Back
choice /c:wsd /n /m ""
if "%errorlevel%"=="1" set /a select-=1&set up=y
if "%errorlevel%"=="2" set /a select+=1&set up=n
if "%errorlevel%"=="3" (
if "%select%"=="10" if "%sell%"=="y" goto blacksmith
if "%sell%"=="n" if "%select%"=="10" goto gamedata
if "%sell%"=="y" if not "%qw%"=="%select%" if not "%qac%"=="%select%" set inv%select%=n&set /a gold+=!inv%select%c!/3&goto newitembs
if "%sell%"=="y" goto error11
set new=y
if "%qw%"=="%select%" set new=n
if "%qac%"=="%select%" set new=n
set lowreq=n
goto applyinv
)
goto inv
:applyinv
if "!inv%select%t!"=="sharp" set oldq=%qw%
if "!inv%select%t!"=="blunt" set oldq=%qw%
if "!inv%select%t!"=="armor" set oldq=%qac%
if "!inv%select%t!"=="sharp" set qw=%select%
if "!inv%select%t!"=="blunt" set qw=%select%
if "!inv%select%t!"=="armor" set qac=%select%
set strm=%str%
set agim=%agi%
set stam=%sta%
if "!inv%qw%m!"=="str" set /a strm+=!inv%qw%md!
if "!inv%qac%m!"=="str" set /a strm+=!inv%qac%md!
if "!inv%qw%m!"=="agi" set /a agim+=!inv%qw%md!
if "!inv%qac%m!"=="agi" set /a agim+=!inv%qac%md!
if "!inv%qw%m!"=="sta" set /a stam+=!inv%qw%md!
if "!inv%qac%m!"=="sta" set /a stam+=!inv%qac%md!
set /a dmg=!inv%qw%d!+(%strm%/2)+(%agim%/4)
if "!inv%qw%m!"=="mod" set /a dmg+=!inv%qw%md!
set /a ac=!inv%qac%d!+(%agim%/3)
if "!inv%qac%m!"=="mod" set /a ac+=!inv%qac%md!
set /a life=40+(%stam%*2)
if "%lowreq%"=="y" goto error15
set sreq=%strm%
set /a req=!inv%select%c!/13/(%lvl%/10+1)
if %sreq% lss %req% (
set select=%oldq%
set lowreq=y
goto applyinv
)
goto gamedata
:gamemenu
cls
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=@
echo %name%, Level %lvl%
echo ----------------------
echo 1: %p1%
if not "%p2%"=="n" echo 2: %p2%
if not "%p3%"=="n" echo 3: %p3%
if not "%p4%"=="n" echo 4: %p4%
echo ----------------------
echo Points: %points%
echo ----------------------
echo [%s1%] Spend Points
echo [%s2%] Travel To Town
if "%hostile%"=="y" echo [%s3%] Hostile ON
if "%hostile%"=="n" echo [%s3%] Hostile OFF
echo [%s4%] Save And Quit
echo [%s5%] Return
choice /c:wsd /n /m ""
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set stamspend=n&goto spend
if "%select%"=="2" (
if not "%p1%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x%px%x%py%=.>>"%dir%\read4.bat"
set level=t&goto setgame
)
if "%select%"=="3" (
if "%hostile%"=="y" set hostile=n
if "%hostile%"=="n" set hostile=y
)
if "%select%"=="4" goto closegame
if "%select%"=="5" goto gamedata
)
goto gamemenu
:spend
cls
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=@
echo Points: %points%
echo -------------------
echo [%s1%] Strength: %strm% Damage: %dmg%
echo [%s2%] Agility.: %agim% Armor: %ac%
echo [%s3%] Stamina.: %stam% Life: %life%
echo -------------------
echo [%s4%] Done
choice /c:wsd /n /m ""
set stamspend=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" if %points% gtr 0 set /a str+=1&set /a points-=1
if "%select%"=="2" if %points% gtr 0 set /a agi+=1&set /a points-=1
if "%select%"=="3" if %points% gtr 0 set /a sta+=1&set /a points-=1
if "%select%"=="4" set select=1&goto gamemenu
)
if "%errorlevel%"=="3" set strm=%str%
if "%errorlevel%"=="3" set agim=%agi%
if "%errorlevel%"=="3" set stam=%sta%
if "%errorlevel%"=="3" if "!inv%qw%m!"=="str" set /a strm+=!inv%qw%md!
if "%errorlevel%"=="3" if "!inv%qac%m!"=="str" set /a strm+=!inv%qac%md!
if "%errorlevel%"=="3" if "!inv%qw%m!"=="agi" set /a agim+=!inv%qw%md!
if "%errorlevel%"=="3" if "!inv%qac%m!"=="agi" set /a agim+=!inv%qac%md!
if "%errorlevel%"=="3" if "!inv%qw%m!"=="sta" set /a stam+=!inv%qw%md!
if "%errorlevel%"=="3" if "!inv%qac%m!"=="sta" set /a stam+=!inv%qac%md!
if "%errorlevel%"=="3" set /a dmg=!inv%qw%d!+(%strm%/2)+(%agim%/4)
if "%errorlevel%"=="3" set /a ac=!inv%qac%d!+(%agim%/3)
if "%errorlevel%"=="3" if "!inv%qw%m!"=="mod" set /a dmg+=!inv%qw%md!
if "%errorlevel%"=="3" if "!inv%qac%m!"=="mod" set /a ac+=!inv%qac%md!
if "%errorlevel%"=="3" set /a life=40+(%stam%*2)
if "%errorlevel%"=="3" if "%select%"=="3" set /a hp+=2
goto spend
:selectlevel
cls
set load=0
if %select% gtr 11 set select=1
if %select% lss 1 set select=10
set /a foundlvl=!hilvl%diff%!+1
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s10=-
set s11=-
echo Travel To Level
echo ------------------
goto loadslvl
:loadslvl
if "%load%"=="10" goto slvlend
set /a load+=1
if %foundlvl% gtr %load% set good=%load%
if !hilvl%diff%! lss %load% if "%select%"=="%load%" if "%up%"=="y" set select=%good%&goto selectlevel
if !hilvl%diff%! lss %load% if "%select%"=="%load%" if "%up%"=="n" set /a select+=1
set s%select%=@
if %foundlvl% gtr %load% echo [!s%load%!] Level %load%
goto loadslvl
:slvlend
echo ------------------
echo [%s11%] Back
choice /c:wsd /n /m ""
set stairs=down
if "%errorlevel%"=="1" set /a select-=1&set up=y
if "%errorlevel%"=="2" set /a select+=1&set up=n
if "%errorlevel%"=="3" (
if "%select%"=="11" goto gamedata
set level=%select%
goto setgame
)
goto selectlevel
:tradeset
if not "%p1%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read1.bat"
if not "%p2%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read2.bat"
if not "%p3%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read3.bat"
if not "%p4%"=="n" echo set l%level%x%px%x%py%=!player!>>"%dir%\read4.bat"
if not "%inv1%"=="n" if not "%inv2%"=="n" if not "%inv3%"=="n" if not "%inv4%"=="n" if not "%inv5%"=="n" if not "%inv6%"=="n" if not "%inv7%"=="n" if not "%inv8%"=="n" if not "%inv9%"=="n" (
set trade=n
echo set trade=n>>"%dir%\read%pnum%.bat"
)
goto trade
:trade
cls
if "%fitem%"=="0" set yitem=n
if not "%fitem%"=="0" if "!inv%fitem%m!"=="n" set yitem=!inv%fitem%! +!inv%fitem%d!
if not "%fitem%"=="0" if "!inv%fitem%m!"=="str" set yitem=!inv%fitem%! +!inv%fitem%d! STR +!inv%fitem%md!
if not "%fitem%"=="0" if "!inv%fitem%m!"=="agi" set yitem=!inv%fitem%! +!inv%fitem%d! AGI +!inv%fitem%md!
if not "%fitem%"=="0" if "!inv%fitem%m!"=="sta" set yitem=!inv%fitem%! +!inv%fitem%d! STA +!inv%fitem%md!
if not "%fitem%"=="0" if "!inv%fitem%m!"=="mod" if "!inv%fitem%t!"=="sharp" set yitem=!inv%fitem%! +!inv%fitem%d! DMG +!inv%fitem%md!
if not "%fitem%"=="0" if "!inv%fitem%m!"=="mod" if "!inv%fitem%t!"=="blunt" set yitem=!inv%fitem%! +!inv%fitem%d! DMG +!inv%fitem%md!
if not "%fitem%"=="0" if "!inv%fitem%m!"=="mod" if "!inv%fitem%t!"=="armor" set yitem=!inv%fitem%! +!inv%fitem%d! AC +!inv%fitem%md!
if not "%fitem%"=="0" if "!inv%fitem%m!"=="leech" set yitem=!inv%fitem%! +!inv%fitem%d! Leech +!inv%fitem%md!
if not "%fitem%"=="0" if "!inv%fitem%m!"=="demon" set yitem=!inv%fitem%! +!inv%fitem%d! To Demon +!inv%fitem%md!
echo set tgold=!ygold!>>"%dir%\read%pnum%.bat"
if "%fitem%"=="0" echo set titem=!yitem!>>"%dir%\read%pnum%.bat"
if not "%fitem%"=="0" echo set titem=!inv%fitem%!>>"%dir%\read%pnum%.bat"
if not "%fitem%"=="0" echo set titemt=!inv%fitem%t!>>"%dir%\read%pnum%.bat"
if not "%fitem%"=="0" echo set titemd=!inv%fitem%d!>>"%dir%\read%pnum%.bat"
if not "%fitem%"=="0" echo set titemm=!inv%fitem%m!>>"%dir%\read%pnum%.bat"
if not "%fitem%"=="0" echo set titemmd=!inv%fitem%md!>>"%dir%\read%pnum%.bat"
if not "%fitem%"=="0" echo set titemc=!inv%fitem%c!>>"%dir%\read%pnum%.bat"
echo set tagree=%yagree%>>"%dir%\read%pnum%.bat"
if exist "%dir%\read%player%.bat" call "%dir%\read%player%.bat"
if exist "%dir%\read%player%.bat" del "%dir%\read%player%.bat"
if "%yagree%%tagree%"=="yy" goto deal
if "%trade%"=="n" goto error14
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo Trade With !p%pnum%!
echo --------------------------
echo You:
if not "%yitem%"=="n" echo %yitem%
echo %ygold% Gold
echo --------------------------
echo Them:
if not "%titem%"=="n" if "%titemm%"=="n" echo %titem% +%titemd%
if not "%titem%"=="n" if "%titemm%"=="str" echo %titem% +%titemd% STR +%titemmd%
if not "%titem%"=="n" if "%titemm%"=="agi" echo %titem% +%titemd% AGI +%titemmd%
if not "%titem%"=="n" if "%titemm%"=="sta" echo %titem% +%titemd% STA +%titemmd%
if not "%titem%"=="n" if "%titemm%"=="mod" if "%titemt%"=="sharp" echo %titem% +%titemd% DMG +%titemmd%
if not "%titem%"=="n" if "%titemm%"=="mod" if "%titemt%"=="blunt" echo %titem% +%titemd% DMG +%titemmd%
if not "%titem%"=="n" if "%titemm%"=="mod" if "%titemt%"=="armor" echo %titem% +%titemd% AC +%titemmd%
if not "%fitem%"=="0" if "%titemm%"=="leech" set yitem=!inv%fitem%! +%titemd% Leech +%titemmd%
if not "%fitem%"=="0" if "%titemm%"=="demon" set yitem=!inv%fitem%! +%titemd% To Demon +%titemmd%
echo %tgold% Gold
if "%tagree%"=="n" echo Agree NO
if "%tagree%"=="y" echo Agree YES
echo --------------------------
echo Current Gold: %gold%
echo --------------------------
echo [%s1%] Next Item
echo [%s2%] Change Gold
if "%yagree%"=="n" echo [%s3%] Agree NO
if "%yagree%"=="y" echo [%s3%] Agree YES
echo [%s4%] Cancel
choice /c:wsda /n /m ""
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" goto itemwheel
if "%select%"=="2" if %gold% gtr 4 (
set /a ygold+=5
set /a gold-=5
)
if "%select%"=="3" if "%yagree%%tagree%"=="yy" goto deal
if "%select%"=="3" (
if exist "%dir%\read%player%.bat" call "%dir%\read%player%.bat"
if exist "%dir%\read%player%.bat" del "%dir%\read%player%.bat"
)
if "%select%"=="3" if "%yagree%%tagree%"=="yy" goto deal
if "%select%"=="3" (
if "%yagree%"=="n" set yagree=y
if "%yagree%"=="y" set yagree=n
)
if "%select%"=="4" (
if exist "%dir%\read%player%.bat" call "%dir%\read%player%.bat"
if exist "%dir%\read%player%.bat" del "%dir%\read%player%.bat"
)
if "%select%"=="4" if "%yagree%%tagree%"=="yy" goto deal
if "%select%"=="4" (
set trade=n
echo set trade=n>>"%dir%\read%pnum%.bat"
)
)
if "%errorlevel%"=="4" if "%select%"=="2" if %ygold% gtr 4 (
set /a gold+=5
set /a ygold-=5
)
goto trade
:itemwheel
if "%fitem%"=="9" set fitem=0&goto trade
set /a fitem+=1
if "!inv%fitem%!"=="n" goto itemwheel
if "%fitem%"=="%qw%" goto itemwheel
if "%fitem%"=="%qac%" goto itemwheel
goto trade
:deal
set trade=n
set inv%fitem%=n
set /a gold+=%tgold%
set ifind=0
if not "%titem%"=="n" goto addit
goto gamedata
:addit
if "%ifind%"=="9" goto error9
set /a ifind+=1
if "!inv%ifind%!"=="n" (
set inv%ifind%=%titem%
set inv%ifind%t=%titemt%
set inv%ifind%d=%titemd%
set inv%ifind%m=%titemm%
set inv%ifind%md=%titemmd%
set inv%ifind%c=%titemc%
goto gamedata
)
goto addit
:error1
cls
echo Unable To Find Host
echo -------------------
timeout /t 3 >nul
set select=1
goto charmenu
:error2
cls
echo Spend All Your Points First
echo ---------------------------
timeout /t 3 >nul
set select=1
goto stats
:error3
cls
echo Too Many Save Files
echo -------------------
timeout /t 3 >nul
set select=1
goto menu
:error4
cls
echo Unable To Save Character
echo ------------------------
timeout /t 3 >nul
set select=1
goto menu
:error5
cls
echo You Must Be Atleast Level %req%
echo ----------------------------
timeout /t 3 >nul
set select=1
goto charmenu
:error6
cls
echo Unable To Delete Character
echo --------------------------
timeout /t 3 >nul
set select=1
goto charmenu
:error7
cls
echo That Game Is Full
echo -----------------
timeout /t 3 >nul
set select=1
goto charmenu
:error8
cls
echo The Game Has Closed
echo -------------------
timeout /t 3 >nul
goto savechar
:error9
cls
echo Inventory Full
echo --------------
timeout /t 3 >nul
set select=1
goto blacksmith
:error10
cls
echo Not Enough Gold
echo ---------------
timeout /t 3 >nul
set select=1
goto %shop%
:error11
cls
echo Unable To Sell Equipped Item
echo ----------------------------
timeout /t 3 >nul
set select=1
goto blacksmith
:error12
cls
echo That Game Has Already Started
echo -----------------------------
timeout /t 3 >nul
set select=1
goto charmenu
:error13
cls
echo That Game Has Ended
echo -------------------
timeout /t 3 >nul
set select=1
goto charmenu
:error14
cls
echo Trade Cancelled
echo ---------------
timeout /t 3 >nul
goto gamedata
:error15
cls
echo You Require %req% Strength To Use That
echo -----------------------------------
timeout /t 3 >nul
set select=1
goto inv
