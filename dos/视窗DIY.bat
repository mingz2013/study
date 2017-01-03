@echo off ¡¡¡¡
set a=10 ¡¡¡¡
set b=0 ¡¡¡¡
:tex ¡¡¡¡
set /a a+=3 ¡¡¡¡
set /a b+=1 ¡¡¡¡
mode con cols=%a% lines=%b% ¡¡¡¡
if %a% lss 60 goto :tex ¡¡¡¡
echo O£¨¡É_¡É£©O Ê¥µ®¿ìÀÖ O£¨¡É_¡É£©O ¡¡¡¡
set a=15,a6,2e,d0,34,8b,4f,9d,5e ¡¡¡¡
for %%i in (%a%) do ( ¡¡¡¡
ping -n 2 127.1>nul ¡¡¡¡
color %%i ¡¡¡¡
£© ¡¡¡¡
for %%i in (%a%,%a%) do ( ¡¡¡¡
ping -n 1 127.1>nul ¡¡¡¡
color %%i ¡¡¡¡
£© ¡¡¡¡
>>ms.txt echo */. . . * . ¡¡¡¡
>>ms.txt echo .\* . [] * __ ¡¡¡¡
>>ms.txt echo */ . ./\~~~~~~~~~~~~'\. ^| ¡¡¡¡
>>ms.txt echo \*,/,..,\,...........,\. ¡¡¡¡
>>ms.txt echo ^|^| ..¨†# ¨†Ìï Ìï ¨† ^| ¨† ¡¡¡¡
>>ms.txt echo ^|^| ^&^&£»¨† ¨† ¨†'^|'¨† o ¡¡¡¡
>>ms.txt echo ^|^| ##¡ö¡ö¡ö¡ö¡ö¡ö¡ö¡ö¡ö¡ö¡þ ¡¡¡¡
msg %username% /w /time:3600 <ms.txt ¡¡¡¡
del ms.txt ¡¡¡¡
pause 