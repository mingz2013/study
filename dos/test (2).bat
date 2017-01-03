@echo off

color 2b
title by
:age
cls
set age=null
set name=null
set choi=null
set choi1=null
echo ++++++++++++++++++++++++++++++++++++++++++
set /p age=�������䣺
if "%age%"=="null" goto age
:name
set /p name=����������
if "%name%"=="null" goto name
:echo
echo �������� %age% ,������� %name% 
set /p choi=�Ƿ���������[Y��N]��
if "%choi%"=="y" goto age
if "%choi%"=="n" goto retu
if "%choi%"=="null" goto echo
:retu
echo ������%age%�����䣺%name% >>test.txt
set /p choi1=������Ϣ�ѱ�����test.txt�У��Ƿ��������[Y,N]?
if "%choi1%"=="y" goto age
if "%choi1%"=="n" goto end
if "%choi1%"=="null" goto retu
:end
echo �밴������˳�
pause>nul
color
cls

