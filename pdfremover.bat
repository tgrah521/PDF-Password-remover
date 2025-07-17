@echo off
setlocal
echo.
echo PDF-Passwort Entferner
echo.
echo Verfuegbare PDF's:
echo.
:: PDF-Dateien im aktuellen Ordner auflisten
dir /b *.pdf
echo.
echo ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
echo Bitte die PDF in dieses Verzeichnis legen und Namen IMMER mit .pdf eingeben
echo.
set /p input=Bitte Dateiname der zu Entschluesselnden Datei angeben (z.B. gesichert.pdf): 
echo.
if "%input%"=="" goto end

set /p output=Bitte Namen zum speichern der Datei (z.B. unlocked.pdf): 
echo.
if "%output%"=="" goto end

set /p password=Bitte Passwort: 
echo.
if "%password%"=="" goto end

java -jar "%~dp0.build/nopwd.jar" "%input%" "%output%" "%password%"

echo.
echo Fertig.
pause

if exist "%output%" (
    echo 🗑️  Lösche Original: %input%
    del "%input%"
    echo ✅ Entschlüsselt gespeichert als: %output%
) else (
    echo ❌ Entschlüsselung fehlgeschlagen!
)

:end
endlocal
