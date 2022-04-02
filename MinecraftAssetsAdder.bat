echo off
title MinecraftAssetsAdder
cls
mkdir Output
:LANG
echo.
echo Vyberte jazyk / Select Language
echo "  1 CZ         |    2 ENG"
SET /P Lng=(1/2)
IF %Lng%==1 echo cz > Datas/cz.lang & start Menu.bat & exit
else
IF %Lng%==2 echo eng >Datas/eng.lang & start Menu.bat & exit
else
GOTO LANG