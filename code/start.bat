@echo off
Rem Creazione orario
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%DD%/%MM%/%YYYY%" & set "timestamp=%HH%:%Min%:%Sec%"
set "fullstamp=%YYYY%/%MM%/%DD% ALLE ORE %HH%:%Min%:%Sec%"
set "hour = %HH%" & set "min = %Min%"
Rem Titolo:
echo   DOWNLOAD FILES DA 192.168.207.169 TINTOMETRO RUBIERA INIZIATO ALLE %timestamp% IL %datestamp%
start IL percorso del programma.exe

Rem ciclo infinito che ogni 2 ore(7200 secondi) crea la copia di backup
:loop
net use G: \\server2003\dati$
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%DD%/%MM%/%YYYY%" & set "timestamp=%HH%:%Min%:%Sec%"
set "fullstamp=%YYYY%/%MM%/%DD% ALLE ORE %HH%:%Min%:%Sec%"
set "hour = %HH%" & set "min = %Min%"
Rem 7200 secondi
Timeout /t 7200 /nobreak
echo %timestamp% esecuzione del programma

Rem Si ripete l'orario perchè non viene aggiornato automaticamente
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%DD%/%MM%/%YYYY%" & set "timestamp=%HH%:%Min%:%Sec%"
set "fullstamp=%YYYY%/%MM%/%DD% ALLE ORE %HH%:%Min%:%Sec%"
set "hour = %HH%" & set "min = %Min%"

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%DD%/%MM%/%YYYY%" & set "timestamp=%HH%:%Min%:%Sec%"
set "fullstamp=%YYYY%/%MM%/%DD% ALLE ORE %HH%:%Min%:%Sec%"
set "hour = %HH%" & set "min = %Min%"

echo %timestamp% Connessione a 192.168.207.169...

set "hour = %HH%" & set "min = %Min%"
Timeout /t 3 /nobreak >nul
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%DD%/%MM%/%YYYY%" & set "timestamp=%HH%:%Min%:%Sec%"
set "fullstamp=%YYYY%/%MM%/%DD% ALLE ORE %HH%:%Min%:%Sec%"
set "hour = %HH%" & set "min = %Min%"

echo %timestamp% Connessione accettata

Timeout /t 4 /nobreak >nul

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%DD%/%MM%/%YYYY%" & set "timestamp=%HH%:%Min%:%Sec%"
set "fullstamp=%YYYY%/%MM%/%DD% ALLE ORE %HH%:%Min%:%Sec%"
set "hour = %HH%" & set "min = %Min%"
echo %timestamp% Download files in Programmi\Eurom\Dati...

Timeout /t 3 /nobreak >nul
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%DD%/%MM%/%YYYY%" & set "timestamp=%HH%:%Min%:%Sec%"
set "fullstamp=%YYYY%/%MM%/%DD% ALLE ORE %HH%:%Min%:%Sec%"
set "hour = %HH%" & set "min = %Min%"


echo %timestamp% Dati Scaricati in \\server2003\dati$\ITC\BK_Tintometro Rubiera


TASKLIST | FINDSTR Main.exe> NUL 2> NUL
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%DD%/%MM%/%YYYY%" & set "timestamp=%HH%:%Min%:%Sec%"
set "fullstamp=%YYYY%/%MM%/%DD% ALLE ORE %HH%:%Min%:%Sec%"
set "hour = %HH%" & set "min = %Min%"

Rem Questo accade solo se il programma e' stato arrestato
IF %ERRORLEVEL%==1 (
echo %timestamp% IL PROGRAMMA HA SMESSO DI FUNZIONARE! PROVO A RIAVVIARLO TRA 30 MINUTI
Timeout /t 1800 /nobreak
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%DD%/%MM%/%YYYY%" & set "timestamp=%HH%:%Min%:%Sec%"
set "fullstamp=%YYYY%/%MM%/%DD% ALLE ORE %HH%:%Min%:%Sec%"
set "hour = %HH%" & set "min = %Min%"
echo %timestamp% Riavvio...
start IL percorso del programma.exe
)
IF %HH% == 22 (
	echo Stop!!! Ritorno a lavoro alle 8
	taskkill /f /im Main.exe
	Timeout /t 32400 /nobreak
	for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
	set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
	set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

	set "datestamp=%DD%/%MM%/%YYYY%" & set "timestamp=%HH%:%Min%:%Sec%"
	set "fullstamp=%YYYY%/%MM%/%DD% ALLE ORE %HH%:%Min%:%Sec%"
	set "hour = %HH%" & set "min = %Min%"

echo   DOWNLOAD FILES DA 192.168.207.169 TINTOMETRO RUBIERA INIZIATO ALLE %timestamp% IL %datestamp%
start IL percorso del programma.exe
)

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
	set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
	set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

	set "datestamp=%DD%/%MM%/%YYYY%" & set "timestamp=%HH%:%Min%:%Sec%"
	set "fullstamp=%YYYY%/%MM%/%DD% ALLE ORE %HH%:%Min%:%Sec%"
	set "hour = %HH%" & set "min = %Min%"
IF %DD% == 30 IF %HH% == 17 goto min
:min
IF %Min% == 30 (
Timeout /t 50 /nobreak
echo backup completo...
taskkill /f /im Main.exe
start IL percorso del programma.exe(FTP.exe)
Timeout /t 8 /nobreak > nul
start IL percorso del programma.exe
)
echo Controllo Cartelle vuote per eliminarle...
net use G: /delete
goto loop
