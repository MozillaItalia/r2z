Mozilla Italia Release2Zip Suite
================================
Ultima mod. 18-06-2012
Rif. http://mozilla.gfsolone.com/r2z

Il software viene rilasciato as-is, non esiste attualmente alcun supporto
per il prodotto. Tutto il materiale disponibile viene pubblicato nei blog degli sviluppatori.
Fare riferimento all'URL "Rif." sopra specificato.

Sommario
------
* [Esempi](#Esempi)
* [Opzioni avanzate](#avanzate)
* [Scaricare i file della lingua](#lingue)
* [Software inclusi nel pacchetto](#software)


Esempi
-------

    fx2zip
    
Senza parametri, equivalente a lanciarlo da Esplora risorse.
Scarica l'ultima versione disponibile dal canale indicato in `fxconfig.cfg`, per impostazione predefinita si consiglia di lasciare release in modo da scaricare l'ultima versione stabile.

    fx2zip 10.0
	
Scarica la versione indicata nella riga di comando (nell'esempio la versione 10.0) e la comprime in formato ZIP. 
Col passaggio al ciclo di rilascio rapido è possibile trovare solo l'ultima versione sui server mozilla.
È possibile sfruttare questa possibilità per scaricare l'ultima versione se essa non è ancora stata rilasciata ufficialmente, si scarica dal server FTP che di solito viene aggiornato il giorno prima.

    fx2zip canale
    
Scarica l'ultima versione disponibile dal canale indicato. 
Passando l'opzione --last (o -l) è possibile ignorare l'impostazione della lingua e scaricare la versione en-US, che è solitamente più aggiornata.
Il canale UX ignorerà le impostazioni relative alla lingua in quanto non esistono versioni localizzate per questo canale ultra sperimentale.
Per scaricare l'ultima nightly (senza modificare le impostazioni di lingua dal file di configurazione):

  fx2zip nightly -last
  
I canali supportati da tutti gli script sono:
* nightly
* aurora
* beta
* release

per Firefox fx2zip) ci sono questi ulteriori canali:
* esr
* ux
Per Thunderbird (tb2zip) si possono indicare i canali aurora e nightly anche con earlybird e daily.
Il canale esr è disponibile anche per Thunderbird (ma non per Seamonkey).
Il canale ux è disponibile solo per Firefox.

TODO: 
----

Opzioni avanzate
-----------------
Per ottenere un elenco completo delle opzioni da riga di comando digitare `fx2zip --help`
Le opzioni avanzate si possono impostare modificando con un editor di testo i file di configurazione:
* fxconfig.cfg # per modificare il comportamento di fx2zip
* tbconfig.cfg # per modificare il comportamento di
* smconfig.cfg # per modificare il comportamento di sm2zip

I file si possono trovare nella cartella *config*. Vanno modificati con un editor di testo semplice: no Wordpad, no Word e nemmeno Writer di OpenOffice, in mancanza di un editor avanzato è possibile usare il Blocco Note di Windows (notepad).
È possibile inserire dei commenti usando il carattere #
***WARNING: non modificare le preferenze che riportano gli url dei canali e il nome delle applicazioni, potrebbero inficiare il corretto funzionamento dello script.***
E` possibile impostare la lingua (esempio fr per il francese) e di impostare lo script per includere/escludere i dizionari e il launcher dal pacchetto.
Dalla versione 0.2 è possibile indicare il tipo di archivio e il livello di compressione. 
Per il livello di compressione, questi sono i valori possibili:
* 0 - nessuna compressione (modalità copia)
* 1 - compressione molto bassa (modalità ultra veloce)
* 3 - compressione bassa (modalità veloce)
* 5 - compressione normale
* 7 - compressione maggiore
* 9 - compressione massima

Per maggiori dettagli: [http://www.dotnetperls.com/7-zip-examples](7-ZIP Examples]
	
a
------------------------------
Lo script dwdict.bat permette di scaricare i file necessari per i dizionari e la sillabazione dal sito di OpenOffice. 
Lo script che costruisce il pacchetto avvia automaticamente il download di questi file (stessa lingua del programma) se non esiste una cartella dictionaries.
Si consiglia di creare manualmente questa cartella e di inserire i file relativi alla lingua scaricandoli dalle pagine del progetto OpenOffice.
Si possono includere più lingue, lo script è impostato per le lingue francese e italiano, per aggiungere altre lingue (sperando che funzioni) editare il file langs.cfg (sottocartella config) inserendo il codice della lingua e l'url alla pagina sul sito di OpenOffice del progetto del dizionario.

Software inclusi nel pacchetto
-------------------------------
1. [SSED] - Sed (versione modificata di sed che non necessita di DLL aggiuntive): [SSED][]
2. [wget] [] - Download Manager da riga di comando
3. [7z] [] -  l'eseguibile utilizzabile da riga dei comandi


[SSED]: http://sed.sourceforge.net/grabbag/ssed/
[wget]: http://www.gnu.org/software/wget/
[7z]: http://www.7-zip.org/
### A cosa servono? ###
*wget* serve per eseguire il download dei file, *sed* per fare un, rozzo, parsing delle pagine web alla ricerca dei link e infine *7z* serve per estrarre e creare gli archivi.
	
