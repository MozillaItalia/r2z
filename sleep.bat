@echo off

REM File per ritardare l'esecuzione all'interno di un file batch
REM usare call per avviare lo script all'interno di un altro file BATcH
REM se non sono specificati parametri viene usato come valore predefinito 5secondi
REM Lunga vita e prosperita`
if "%1"=="" (set delay=5) else (set delay=%1)
set /a start=%time:~0,2%*3600+%time:~3,2%*60+%time:~6,2%
REM 	set delay=%delay:~0,8%
set /a end=%start% + %delay%
if  %start% GEQ %end% goto error


:startloop:
set /a current=%time:~0,2%*3600+%time:~3,2%*60+%time:~6,2%
if  %current% GEQ %end% goto end
goto startloop

goto end
	:error:
	echo Please insert a number value as argument
	exit /b
	:end: