@echo off
if exist profile goto launch
md profile
xcopy /E mozillaitalia\profile\* profile\
:launch:
REM set profilepath=%~dp0profile\
start "" "#app#.exe" -profile profile