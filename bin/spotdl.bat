@echo off
:a
echo.
echo Ingresa URL de Spotify [Pista/Album/Playlist]:
set /p "input= "
.\spotdl.exe --output "./../output" %input%

echo Desea descargar mas musica? [y/n]:
set /p "bool= "
if "%bool%" == "y" (goto :a) else (goto :b)

:b
echo.
pause
