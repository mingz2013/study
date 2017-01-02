@echo off

color 2b
title by 明子 QQ305603665
:age
cls
set age=null
set name=null
set choi=null
set choi1=null
echo ++++++++++++++++++++++++++++++++++++++++++
set /p age=您的年龄：
if "%age%"=="null" goto age
:name
set /p name=您的姓名：
if "%name%"=="null" goto name
:echo
echo 您的年龄 %age% ,你的姓名 %name% 
set /p choi=是否重新输入[Y，N]？
if "%choi%"=="y" goto age
if "%choi%"=="n" goto retu
if "%choi%"=="null" goto echo
:retu
echo 姓名：%age%；年龄：%name% >>test.txt
set /p choi1=您的信息已保存在test.txt中，是否继续输入[Y,N]?
if "%choi1%"=="y" goto age
if "%choi1%"=="n" goto end
if "%choi1%"=="null" goto retu
:end
echo 请按任意键退出
pause>nul
color
cls

