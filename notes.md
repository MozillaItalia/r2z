# Istruzioni per rilasciare il pacchetto
# Ult.agg. 17/8/15 - Gioxx
Per costruire il pacchetto da rilasciare, procedere come segue:

1. Assicurarsi di avere la cartella *bin*, che non va aggiunta via git, con gli eseguibili di *ssed*, *7z* e *wget* (Una copia della cartella  nella cartella condivisa su Dropbox
2. Per includere un nuovo file nel pacchetto via r2z.bat (r2z nome_di_chi_rilascia) aggiungerlo a files.txt.
3. Eseguire `r2z.bat` da riga di comando passando i parametri per la cartella di rilascio (latest) e archivio (oldversion) oltre che il nome di chi crea il pacchetto, esempio: `r2z C:\Dropbox\Release2Zip\latest C:\Dropbox\Release2Zip\oldversion gioxx` (se non si passa alcun argomento vengono prese per buone le variabili impostate in maniera assoluta nel file batch, da modificare se necessario).

## Istruzioni per modificare i vari script ##

*fx2zip* è il template principale, di seguito le modifiche da effettuare agli altri script per allinearli alle modifiche apportate in *fx2zip*
### tb2zip ###

* Cambiare il file di configurazione fxconfig.cfg con tbconfig.cfg
* eliminare, opzionalmente, la riga sulla ux che è superflua


### sm2zip ###

* Cambiare il file di configurazione in smconfig.cfg
* Opzionalmente, la riga sulla ux che è superflua
* Cambiare il blocco :http: con questo:
   ```
:http:
set sed= "/<a href=.#.*>SeaMonkey [0-9\.*]*<\/a>/{s/.*#\([\[0-9b\.]*\).*/\1/;p;q}"
if %channel%==beta set sed= "/<a href=.#.*>SeaMonkey [0-9\.*]* .*<\/a>/{s/.*#\([\[0-9b\.]*\).*/\1/;p;q}"
wget -U %useragent%  %page% -O %tmphtml%
if %errorlevel% neq 0 (
set errmsg=Si e` verificato un errore tentando di scaricare %url%
goto error)
ssed -n -e %sed% %tmphtml% > %tmptxt%
for /f %%i in (%tmptxt%) do set ver=%%i
set url="http://download.mozilla.org/?product=%lowerapp%-%ver%&os=win&lang=%lang%"
goto buildarchive
```
