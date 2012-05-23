@echo off
set tmptxt=temp.txt
set tmphtml=temp.html
echo %* > %tmphtml%
ssed "s/\s\+/\n/g" %tmphtml% > %tmptxt%
REM Short option to long option
ssed -e "{s/^-h$/--help/I;s/^-l$/--last/I;s/^-u\b/--launcher/I;s/^-d\b/--dict/I;s/^-s\b/--sleep/I;s/^-g=/--lang=/I;s/^-t=/--archivetype=/I;s/^-z=/--level=/I;}" %tmptxt% > %tmphtml%
REM now parse the commandline, first remove all invalid preferences (lines not starting with --)
REM put to true option that not have a second argument (=)
ssed -e "s/^--\(launcher\|dict\|sleep\|help\|last\)\s*$/--\1=true/" %tmphtml% > %tmptxt%
REM ssed "/^--/!d" %tmptxt% > %tmphtml%
ssed   -n -e "/^--help\|--last\|--launcher\|--dict\|--sleep\|--lang\|--archivetype\|--level=[-013579a-zA-Z]\+\s*$/{s/--//;p}" %tmptxt% > %tmphtml%
for  /f "delims== tokens=1,2" %%i in (%tmphtml%) do (
echo %%i 
echo ---------
echo %%j
)