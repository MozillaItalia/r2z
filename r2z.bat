@echo off
set author=%1
if "%1"=="" set author=gialloporpora
set name=Release2Zip-%date:~6,4%%date:~3,2%%date:~0,2%@%author%.7z

7z a %name%  @files.txt
if %errorlevel% neq 0  goto end
md5sum  %name%

move %name% download
a
echo @@@ %name% released @@@@

:end: