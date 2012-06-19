# Istruzioni per rilasciare il pacchetto
Per costruire il pacchetto da rilasciare, procedere come segue:

1. Modificare il file `r2z.bat` inserendo i giusti percorsi alle cartelle su *Droppbox* (latest e old)
2. Assicurarsi di avere la cartella *bin*, che non va aggiunta via git, con gli eseguibili di *ssed*, *7z* e *wget* (Una copia della cartella  nella cartella condivisa su Dropbox
3. Per includere un nuovo file nel pacchetto via r2z.bat (r2z nome_di_chi_rilascia) aggiungerlo a files.txt.
4. Eseguire `r2z.bat` da riga di comando passando il nome di chi rilascia come argomento, esempio: `r2z gialloporpora`

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
