echo off
title MinecraftAssetsAdder - Menu
cls
set WorkingDir=cd
set mcdir=%appdata%\.minecraft

:MENU

echo ########################
echo )Minecraft Assets Adder(
echo )          b y         (
echo )       ArastaD0t      (
echo ########################
echo )_Select__one__of_this_(
echo ------------------------
echo )        1.setup       (
ECHO )        2.create      (
echo )        3.exit        (
echo ------------------------

SET /P M=Select (1/2/3) then press ENTER:
IF %M%==1 GOTO SETUP
IF %M%==2 GOTO CREATE
IF %M%==3 GOTO EXIT

:SETUP
title MinecraftAssetsAdder - Menu - Setup
echo setup MODE
SET /P "M1=Specific Minecraft Versions Directory or type DEFAULT:  " 
IF /I %M1%==DEFAULT (set mcdir=%appdata%\.minecraft\versions) ELSE (set mcdir=%M1%)

echo Default mc version dir is %mcdir%

PAUSE 5


GOTO MENU
:CREATE
title MinecraftAssetsAdder - Menu - Create
echo create MODE
set /p Name=NameOfRP: 
title MinecraftAssetsAdder - Menu - Create %Name%
mkdir Output\%Name%
cd Output\%Name%
SET /p M2=Select (A.DefaultTextures/B.BlankTemplate)  
IF %M2%==A echo )SELECTED(Default Textures
IF %M2%==a echo )SELECTED(Default Textures
IF %M2%==B echo )SELECTED(Empty template
IF %M2%==b echo )SELECTED(Empty template

GOTO VERSIONS


:VERSIONS
echo )Select version(
echo you can select from 1.7.2 ~ 1.14.4
set /p Version=Version: 

:: 1.7.X:: VERSION:: MAPPING:: 
IF %Version%==1.7.2 SET For=1 & GOTO MAKE
IF %Version%==1.7.4 SET For=1 & GOTO MAKE
IF %Version%==1.7.5 SET For=1 & GOTO MAKE
IF %Version%==1.7.6 SET For=1 & GOTO MAKE
IF %Version%==1.7.7 SET For=1 & GOTO MAKE
IF %Version%==1.7.8 SET For=1 & GOTO MAKE
IF %Version%==1.7.9 SET For=1 & GOTO MAKE
IF %Version%==1.7.10 SET For=1 & GOTO MAKE

:: 1.8.X:: VERSION:: MAPPING:: 
IF %Version%==1.8 SET For=1 & GOTO MAKE
IF %Version%==1.8.1 SET For=1 & GOTO MAKE
IF %Version%==1.8.2 SET For=1 & GOTO MAKE
IF %Version%==1.8.3 SET For=1 & GOTO MAKE
IF %Version%==1.8.4 SET For=1 & GOTO MAKE
IF %Version%==1.8.5 SET For=1 & GOTO MAKE
IF %Version%==1.8.6 SET For=1 & GOTO MAKE
IF %Version%==1.8.7 SET For=1 & GOTO MAKE
IF %Version%==1.8.8 SET For=1 & GOTO MAKE
IF %Version%==1.8.9 SET For=1 & GOTO MAKE

:: 1.9.X:: VERSION:: MAPPING:: 
IF %Version%==1.9 SET For=2 & GOTO MAKE
IF %Version%==1.9.1 SET For=2 & GOTO MAKE
IF %Version%==1.9.2 SET For=2 & GOTO MAKE
IF %Version%==1.9.3 SET For=2 & GOTO MAKE
IF %Version%==1.9.4 SET For=2 & GOTO MAKE

:: 1.10.X:: VERSION:: MAPPING:: 
IF %Version%==1.10 SET For=2 & GOTO MAKE
IF %Version%==1.10.1 SET For=2 & GOTO MAKE
IF %Version%==1.10.2 SET For=2 & GOTO MAKE

:: 1.11.X:: VERSION:: MAPPING:: 
IF %Version%==1.11 SET For=3 & GOTO MAKE
IF %Version%==1.11.1 SET For=3 & GOTO MAKE
IF %Version%==1.11.2 SET For=3 & GOTO MAKE

:: 1.12.X:: VERSION:: MAPPING:: 
IF %Version%==1.12 SET For=3 & GOTO MAKE
IF %Version%==1.12.1 SET For=3 & GOTO MAKE
IF %Version%==1.12.2 SET For=3 & GOTO MAKE

:: 1.13.X:: VERSION:: MAPPING:: 
IF %Version%==1.13 SET For=4 & GOTO MAKE
IF %Version%==1.13.1 SET For=4 & GOTO MAKE
IF %Version%==1.13.2 SET For=4 & GOTO MAKE

:: 1.14.X:: VERSION:: MAPPING:: 
IF %Version%==1.14 SET For=4 & GOTO MAKE
IF %Version%==1.14.1 SET For=4 & GOTO MAKE
IF %Version%==1.14.2 SET For=4 & GOTO MAKE
IF %Version%==1.14.3 SET For=4 & GOTO MAKE
IF %Version%==1.14.4 SET For=4 & GOTO MAKE

else goto WS
:WS
echo )SELECTED(invalid or unsupported version
echo example 1.7.2 , 1.10.2, 1.14.1,.....
set /p Version=Version: 

:MAKE
title MinecraftAssetsAdder - Menu - Create - Make %Name%

IF %M2%==A if exist %mcdir%\versions\%Version%\%Version%.jar (mkdir %tmp%\%Version% & copy %mcdir%\versions\%Version%\%Version%.jar %tmp%\%Version%\%Version%.zip & powershell Expand-Archive -LiteralPath "%tmp%\%Version%\%Version%.zip" -DestinationPath "%tmp%\%Version%" -Force & robocopy %tmp%\%Version%\assets .\assets\ /e) else (echo "Selected version not downloaded, please start your Minecraft with %Version% close Minecraft and try again..." & pause & goto MENU )
IF %M2%==a if exist %mcdir%\versions\%Version%\%Version%.jar (mkdir %tmp%\%Version% & copy %mcdir%\versions\%Version%\%Version%.jar %tmp%\%Version%\%Version%.zip & powershell Expand-Archive -LiteralPath "%tmp%\%Version%\%Version%.zip" -DestinationPath "%tmp%\%Version%" -Force & robocopy %tmp%\%Version%\assets .\assets\ /e) else (echo "Selected version not downloaded, please start your Minecraft with %Version% close Minecraft and try again..." & pause & goto MENU )
IF %M2%==B echo )SELECTED(Empty template
IF %M2%==b echo )SELECTED(Empty template

set /p Desc=Description:
echo    "description": ""%Desc%""
@echo %Name% , %Version% , %Desc% > %Name%.maa
(
echo {
echo  "pack": {
echo    "pack_format": %For%,
echo    "description": "%Desc%"
echo  }
echo }
)>pack.mcmeta
echo pack.mcmeta created
pause 2

cls			
cd ../..
copy pack.png .\Output\%Name%
cd Output\%Name%
cd
timeout /t 30
cls
echo Now its time for Icon
echo .
echo do you want edit it
set /p Icon=(y/n):
IF %Icon%==y echo after editing done save and close editor & mspaint pack.png & pause & echo edited & GOTO SUBFOLDERS
IF %Icon%==Y echo after editing done save and close editor & mspaint pack.png & pause & echo edited & GOTO SUBFOLDERS
IF %Icon%==n GOTO SUBFOLDERS
IF %Icon%==N GOTO SUBFOLDERS

else
GOTO SUBFOLDERS
::IF %Icon%==n echo continue & cd .. & copy /Datas/pack.png /%Name%/ & pause
::ELSE
::cls
::echo do you want edit it
::set /p Icon=(y/n)

:SUBFOLDERS
cd 
timeout /t 5
mkdir assets
goto ANIM1
:ANIM1
ECHO Create subfolders.
timeout /t 1
cls
ECHO Create subfolders..
timeout /t 1
cls
ECHO Create subfolders...
timeout /t 1
cls
ECHO Create subfolders....
timeout /t 1
cls
ECHO Create subfolders...
timeout /t 1
cls
ECHO Create subfolders..
timeout /t 1
cls
ECHO Create subfolders.
timeout /t 1
cls
ECHO Done
timeout /t 2
cls
GOTO MAKE2

:MAKE2
ECHO WHAT NEXT ?
PAUSE
title MinecraftAssetsAdder - Menu - Create - Compile %Name%
ECHO Compile time
powershell Compress-Archive ./* ../%Name%-%Version%.zip

set /p CpRp=Do you want copy %Name%-%Version%.zip to yours Minecraft ? (y/n):
IF %CpRp%==y dir & pause 10 &cd .. & dir & echo %mcdir%\resourcepacks & copy %Name%-%Version%.zip %mcdir%\resourcepacks & echo Enjoy RP & pause 3 & GOTO MENU
IF %CpRp%==Y dir & pause 10 &cd .. & dir & echo %mcdir%\resourcepacks & copy %Name%-%Version%.zip %mcdir%\resourcepacks & echo Enjoy RP & pause 3 & GOTO MENU 
IF %CpRp%==n GOTO MENU
IF %CpRp%==N GOTO MENU


GOTO MENU










:exit
CLS
echo.
echo THx for using US :D
ECHO.
cd %WorkingDir%
erase *.lang
SLEEP 5

exit