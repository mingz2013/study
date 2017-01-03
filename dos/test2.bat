@echo off
title QQ
cls 
color 1f
echo sddd
echo ----------------------------------------
goto age
:age
set /p age=�������䣺
if "%age%"=="" goto age
:name
set /p name=����������
if "%name%"=="" goto name
:ech
echo ��������Ϊ "%age%" ����������Ϊ "%name%"
set /p choi=�Ƿ���������[Y/N]?
if "%choi%"=="y" goto age
if "%choi%"=="n" goto end
if "%choi%"==""  goto kong
echo ������Ĳ���ȷ������������  
goto ech

:kong
echo ����Ϊ�գ�����������
goto ech
:end
echo good bye
pause 
color
cls