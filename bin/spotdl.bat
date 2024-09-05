@echo off
echo.
echo Ingresa URL de Spotify:
set /p "input= "
.\spotdl.exe --output "./../output" %input%
pause
