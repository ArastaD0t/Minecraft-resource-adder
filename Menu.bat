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
IF /I %M1%==D (set mcdir=%appdata%\.minecraft\versions && echo mcdir=%appdata%\.minecraft\versions >> config. )
IF /I %M1%==DEFAULT (set mcdir=%appdata%\.minecraft\versions && echo mcdir=%appdata%\.minecraft\versions >> config. ) ELSE (set mcdir=%M1% && echo mcdir=%M1% >> config.  )

echo Default Texture Editor is %editor%
SET /P "M1=Specific Path to Texture Editor EXE or type DEFAULT:  " 
IF /I %M1%==D (set editor=mspaint && echo editor=mspaint >> config. )
IF /I %M1%==DEFAULT (set editor=mspaint && echo editor=mspaint >> config. ) ELSE (set editor=%M1% && echo editor=%M1% > config.  )

echo Include Minecraft Mods Resourcepacks to process ? %mods%
SET /P "M1=Answare True False DEFAULT is always asking:  " 
IF /I %M1%==D (set mods=prompt && echo mods=prompt >> config.  ) 
IF /I %M1%==DEFAULT (set mods=Prompt && echo mods=Prompt% >> config.  ) 
IF /I %M1%==T (set mods=True && echo mods=True >> config.  )
IF /I %M1%==TRUE (set mods=True && echo mods=True >> config.  )
IF /I %M1%==F (set mods=False && echo mods=False >> config.  )
IF /I %M1%==FALSE (set mods=False && echo mods=False >> config.  )
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



IF exist %mcdir%\mods (GOTO MODS) else GOTO VERSIONS

:MODS
title MinecraftAssetsAdder - Menu - Create - Make %Name% - Mods Founded
SET /p M3=Founded Mods Folder, do you want include mods resourcespacks ? y/n :
IF %M3%==n (GOTO VERSION)
IF %M3%==y (echo Which Modes You want include ? (Write Modname.jar or all) && dir /B %mcdir%\mods\ && SET /P M4 && IF %M4%==all () else (mkdir %tmp%\mods && mkdir %tmp%\mods\extracted && mkdir %tmp%\mods\extracted\%M4% & copy %mcdir%\mods\%M4% %tmp%\mods\%M4%.zip & powershell Expand-Archive -LiteralPath "%tmp%\mods\%M4%.zip" -DestinationPath "%tmp%\mods\extracted\%M4%" -Force & robocopy %tmp%\mods\extracted\%M4%\assets .\assets\ /e) else ()& goto Make ) )

:VERSIONS
echo )Select version(
dir /AD /B %mcdir%\versions\
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
IF %Version%==1.8 SET For=1 & GOTO MODS
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

:: 1.15.X:: VERSION:: MAPPING:: 
IF %Version%==1.15 SET For=5 & GOTO MAKE
IF %Version%==1.15.1 SET For=5 & GOTO MAKE
IF %Version%==1.15.2 SET For=5 & GOTO MAKE

:: 1.16.X:: VERSION:: MAPPING:: 
IF %Version%==1.16 SET For=6 & GOTO MAKE
IF %Version%==1.16.1 SET For=6 & GOTO MAKE
IF %Version%==1.16.2 SET For=6 & GOTO MAKE
IF %Version%==1.16.3 SET For=6 & GOTO MAKE
IF %Version%==1.16.4 SET For=6 & GOTO MAKE
IF %Version%==1.16.5 SET For=6 & GOTO MAKE

:: 1.17.X:: VERSION:: MAPPING:: 
IF %Version%==1.17 SET For=7 & GOTO MAKE
IF %Version%==1.17.1 SET For=7 & GOTO MAKE

:: 1.18.X:: VERSION:: MAPPING:: 
IF %Version%==1.18 SET For=8 & GOTO MAKE
IF %Version%==1.18.1 SET For=8 & GOTO MAKE
IF %Version%==1.18.2 SET For=8 & GOTO MAKE

:: 1.19.X:: VERSION:: MAPPING:: 
IF %Version%==1.19 SET For=9 & GOTO MAKE
IF %Version%==1.19.1 SET For=9 & GOTO MAKE
IF %Version%==1.19.2 SET For=9 & GOTO MAKE




goto WS
:WS
echo )SELECTED(invalid or unsupported version
dir /AD /B %mcdir%\versions\
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
IF %Icon%==y echo after editing done save and close editor & %editor% pack.png & pause & echo edited & GOTO SUBFOLDERS
IF %Icon%==Y echo after editing done save and close editor & %editor% pack.png & pause & echo edited & GOTO SUBFOLDERS
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