@echo off
title by 明子 QQ 305603665
color 2f
set t=1
:main
echo %t%
set /a t=%t%+1
set /p choi=1.下一个数;2.退出
echo.
if %choi%=1 goto main
if %choi%=2 goto end

:end
echo goodbye
echo 按任意键退出
pause>nul
