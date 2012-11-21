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
- fxconfig.cfg # per modificare il comportamento di fx2zip
-tbconfig.cfg # per modificare il comportamento di tb2zip-tbconfig.cfg # per modificare il comportamento di tb2zip
-smconfig.cfg # per modificare il comportamento di sm2zip
I file si possono trovare nella cartella *config*

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
		
Solo per fx2zip è possibile specificare il canale anziché la versione, i canali disponibili sono: ux, aurora, nightly e release. 
Il canale UX non prevede una versione localizzata quindi sarà scaricata l'unica versione disponibile in inglese (USA)
Si ricorda che le nightly in inglese (USA) sono più aggiornate rispetto alle build localizzate, la vera nightly è quella inglese insomma!
		
Per maggiori dettagli: [http://www.dotnetperls.com/7-zip-examples](7-ZIP Examples]
	
-- Scaricare i file della lingua
__________________________________
Il file dwdict permette di scaricare i file necessari per i dizionari e la sillabazione dal sito di OpenOffice. 
Lo script che costruisce il pacchetto avvia automaticamente il download di questi file (stessa lingua del programma) se non esiste una cartella dictionaries.
Si consiglia di creare manualmente questa cartella e di inserire i file relativi alla lingua scaricandoli dalle pagine del progetto OpenOffice.
Si possono includere più lingue, lo script è impostato per le lingue francese e italiano, per aggiungere altre lingue (sperando che funzioni) editare il file langs.cfg (sottocartella config) inserendo il codice della lingua e l'url alla pagina sul sito di OpenOffice del progetto del dizionario.

oftware inclusi nel pacchetto
-------------------------------
	
1. [SSED] - Sed (versione modificata di sed che non necessita di DLL aggiuntive): [SSED][]
2. [wget] [] - Download Manager da riga di comando
3. [7z] [] -  l'eseguibile utilizzabile da riga dei comandi


[SSED]: http://sed.sourceforge.net/grabbag/ssed/
[wget]: http://www.gnu.org/software/wget/
[7z]: http://www.7-zip.org/
### A cosa servono? ###
*wget* serve per eseguire il download dei file, *sed* per fare un, rozzo, parsing delle pagine web alla ricerca dei link e infine *7z* serve per estrarre e creare gli archivi.
	


CHANGELOG (Versioni)
---
---- La modifica più recente è sempre in testa!

fx2zip / tb2zip / sm2zip 0.7 21/11/2012 (@gioxx)
	Ho sostituito il mirror dei pacchetti aggiornati puntando a ftp.mozilla.org, così da lasciare a loro la selezione random del server che fornisce il download.
	
fx2zip 0.6 rev11 18/06/2012 (@gioxx)
	Sincronizzazione file completata.
	File readme aggiornato.
	Ripopolate le cartelle condivise di Dropbox per distribuire i pacchetti giù pronti del prodotto (e archivio). Ho aggiornato quindi la pagina HTML dato che i file non vengono più conservati su Github.
	
fx2zip 0.6 rev10 18/06/2012 (@gialloporpora)
	Pulizia delle cartelle e organizzazione dei file
	
fx2zip 0.6 rev9 25/04/2012 (@gialloporpora)
	Colorato un po'
	Modificato, anche se continuo a non capirne l'utilità, il nome del pacchetto finale
	
fx2zip 0.6 rev8 25/04/2012 (@gialloporpora)
	Messo wget in modalità quieta quando scarica i file temporanei da analizzare, ora l'output viene prodotto solo quando scarica il file dell'installer
	Messo tutto alla versione 0.6
	
fx2zip 0.5 rev7 24/04/2012 (@gialloporpora)
	Sistemato un problema di nominazione dei file di archivio (veniva duplicata la versione passando un numero di versione). 
	Sistemati gli URL sbagliati in tbconfig.cfg (en-us in minuscolo :-P)
	
fx2zip 0.5 rev6 24/04/2012 (@gialloporpora)
	Aggiunto un rozzo supporto al parsing della riga di comando
	Cambiato il nome di langs.txt in langs.cfg così si capisce che è un file di configurazione
	Aggiunto un pause alla fine per permettere di leggere la finestra del prompt se si avvia da Esplora risorse
	Aggiunto il logo di Mozilla :-D

fx2zip 0.3 rev5 22/04/2012 (@gialloporpora)
	Modificato lo script per supportare i canali di sviluppo. 

fx2zip 0.3 rev4 21/04/2012 (@gialloporpora)
	Aggiunta la possibilità di commentare i file di configurazione.

fx2zip 0.3 rev3 19/04/2012 (@gialloporpora)
	Allineato sm2zip agli altri, ora è possibile utilizzarlo senza parametri aggiuntivi (i.e. da Esplora Risorse);
	Aggiunte le variabili per la gestione dei file temporanei;
	Aggiunto il codice per creare le directory di lavoro (archive e temp) se non esistono.
	
fx2zip 0.3 rev2 20/04/2012 (@gialloporpora)
	Eliminato sleep.exe sostituito con un file BATCH, inserito nel modulo di configurazione la preferenza per attivarlo, mettendo a true la variabile sleep (default è false);
	Sostituito 7z.exe con 7za.exe che non richiede librerie;
	Aggiunto il codice per supportare i canali (solo a fx2zip e escluso il canale beta), il canale va specificato nel file di configurazione alla voce channel;
	I valori supportati sono (release, aurora, nightly ux)), beta is work in progress;
	Si può anche passare il canale come primo parametro da prompt. Se si vuole l'ultima nightly è meglio usare en-US come lingua visto che è più aggiornata;
	Trovato modo alternativo per ritardare lo script facendo n ping a localhost ~n secondi, lascio lo sleep.bat che è più preciso nel caso cambi idea.

fx2zip 0.3 rev1 13/04/2012 (@gioxx)
	Avviando lo script da una posizione sotto condivisione capitava che la cancellazione delle cartelle o l'esecuzione rapida di comandi in 7Za fallisse, aggiunto quindi lo "Sleep.exe" per intervallare brevi pause tra le istruzioni "critiche";
	Modificate alcune istruzioni e corretti un paio di errori. Script testato con successo su 7 SP1;
	Le modifiche saranno quanto prima replicate su tb2zip e sm2zip.

fx2zip 0.2 rev3 16/03/2012 (@gialloporpora)
	Aggiunta la possibilità di impostare tutte le preferenze dal file di configurazione compreso il tipo di archivio e il livello di compressione;
	Se si specificano le opzioni da prompt dei comandi, queste avranno la priorità su quelle inserite nel file di configurazione.
	
fx2zip 0.2 rev2 14/03/2012 (@gialloporpora)
	Corretto un errore presente in tb2zip, non permetteva di terminare correttamente lo script e di ottenere quindi l'archivio ZIP della release. Prevista ora l'uscita dal WGET in caso di errore con notifica a video, dovrebbe essere introdotta con la versione 0.3 degli script;
	Aggiunta la possibilità di impostare tutte le preferenze dal file di configurazione compreso il tipo di archivio e il livello di compressione;
	Se si specificano le opzioni da prompt dei comandi, queste avranno la priorità su quelle inserite nel file di configurazione.

fx2zip 0.2 rev1 14/03/2012 (@gioxx)
	Il download del pacchetto e tutti i file che permettono la lavorazione del file ZIP finale vengono ora scritti nella cartella "temp" presente all'interno della cartella principale della suite;
	A fine impacchettamento l'archivio verrà spostato in automatico sotto la cartella "archive", anch'essa presente nella root come "temp". Se esiste ancora, viene ordinata la cancellazione della cartella "core" / "firefox" utile alla creazione del file ZIP finale;
	Ancora oggi non è possibile evitare l'errore del WGET nel caso in cui il sito web selezionato autonomamente dal round-robin Mozilla non permetta il download batch del software;
	Quanto prima anche tb2zip verrà allineato a questo comportamento, che lascia pulita la cartella principale della suite durante la lavorazione batch.