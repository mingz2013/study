@echo off
title test   ---QQ
cls
color 1c
:begin
echo -----------------------------------------------
echo      this is a game,let's begin......       
echo -----------------------------------------------
goto then
:then
pause
goto then1
:then1
::echo                1+1=2,right?
::choice /c:yn yes,no /t 5000
::if errorlevel 2 goto yes
::if errorlevel 1 goto no
set /p choi=        1+1=2,yes or no[Y,N]?
if /i %choi% equ y goto yes
if /i %choi% equ n goto no
::if /i %choi%=="" goto then1

:yes
echo           U are right,congratulations
pause
goto end
:no
echo         U are wrong,how a big egg U are!!!
pause
goto end
:end
echo                     good bye!
pause
color
cls
::start explorer.exe



