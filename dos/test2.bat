@echo off
title 明子制作  QQ 305603665
cls 
color 1f
echo 明子制作  QQ305603665
echo ----------------------------------------
goto age
:age
set /p age=您的年龄：
if "%age%"=="" goto age
:name
set /p name=您的姓名：
if "%name%"=="" goto name
:ech
echo 您的年龄为 "%age%" ，您的姓名为 "%name%"
set /p choi=是否重新输入[Y/N]?
if "%choi%"=="y" goto age
if "%choi%"=="n" goto end
if "%choi%"==""  goto kong
echo 您输入的不正确，请重新输入  
goto ech

:kong
echo 输入为空，请重新输入
goto ech
:end
echo good bye
pause 
color
cls