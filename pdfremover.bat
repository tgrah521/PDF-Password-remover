@echo off
setlocal

echo PDF-Passwort Entferner
echo ----------------------
echo ----------------------
echo Bitte die PDF in dieses Verzeichnis legen und Namen IMMER mit .pdf eingeben

set /p input=Bitte Dateiname der zu Entschluesselnden Datei angeben (z.B. gesichert.pdf): 
if "%input%"=="" goto end

set /p output=Bitte Namen zum speichern der Datei (z.B. unlocked.pdf): 
if "%output%"=="" goto end

set /p password=Bitte Passwort: 
if "%password%"=="" goto end

java -jar "%~dp0nopwd.jar" "%input%" "%output%" "%password%"

echo.
echo Fertig.
pause

:end
endlocal
