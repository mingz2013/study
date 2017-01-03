@echo off
title by Q
color 2f
set t=1
:main
echo %t%
set /a t=%t%+1
set /p choi=1.��һ����;2.�˳�
echo.
if %choi%=1 goto main
if %choi%=2 goto end

:end
echo goodbye
echo ��������˳�
pause>nul
