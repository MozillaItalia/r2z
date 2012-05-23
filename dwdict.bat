@echo off
set useragent="MozillaItalia-Downloader/1.0"
REM Batch file to download languages files from OpenOffice project
if "%1"=="" goto noparams
set lang=%1
set url=none
for /F "delims=== tokens=1,2" %%i in (langs.cfg) do if  %%i==%lang% set url=%%j
if %url%==none goto nolang
set kindly=%url%
set baseurl=http://extensions.services.openoffice.org/
if "%2"=="debug" (
echo %url%
echo.
echo %lang%
pause
)
wget -U %useragent% %url% -O temp.html
ssed -n -e "/<div class=.dlbutton.>/{s/.*<div class=.dlbutton.><a href=.\([\-zA-Z0-9\/\-_]*\)..*/\1/;p}" temp.html > temp.txt
for /f %%t in (temp.txt) do set url=%baseurl%%%t
wget -U %useragent% %url% -O temp.html
ssed -n -e "/<meta http-equiv=.refresh/{s/.*url=\(http.*oxt\).*/\1/pi;}" temp.html > temp.txt
ssed  "1d" temp.txt > temp2.txt
for /f %%t in (temp2.txt) do set url=%%t
wget -U %useragent% %url% -O  dict.zip
if not exist dictionaries md dictionaries
7z e dict.zip *.aff -odictionaries -r
7z e dict.zip *.dic -odictionaries -r
if not "%2"=="debug" (
del temp*
del dict.zip
)
echo.
echo Success, I hope, check if the dictionaries directory contains your precious files.
echo If not, please download them manually and put them in the dictionaries directory
echo.
echo Language files are kindly powered by OpenOffice project
start %kindly%
goto end


:noparams:
echo ...Please specify a valid lang code as argument
goto end

:nolang:
echo.
echo Sorry your language is not configured correctly :-(
echo Please edit the langs.cfg file inserting the url of the OpenOffice extension that contains your language files
echo Syntax: LANG_CODE==URL
echo.

:end:
echo.