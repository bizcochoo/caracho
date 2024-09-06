@echo off
:a
echo.
echo Ingresa URL de Youtube:
set /p "input="
echo Seleccione formato:
echo [VIDEO: .mp4 .webm] [AUDIO: .mp3 .wav .opus .m4a]
set /p "tipo="

set "cal=0"
if "%tipo%" == ".mp4" set "cal=1"
if "%tipo%" == ".webm" set "cal=1"
if "%cal%"=="1" (
    echo Seleccione calidad:
    echo [CALIDAD: 1080 720 480 360 240 144]
    set /p "calidad="
)


if "%tipo%"==".webm" (
    .\yt-dlp -P "./../output" -S res:"%calidad%" "%input%"
) else if "%tipo%"==".mp4" (
    .\yt-dlp.exe -P "./../output" -S res:"%calidad%",ext:mp4:m4a --recode mp4 "%input%"
) else if "%tipo%"==".opus" (
    .\yt-dlp -P "./../output" -x "%input%"
) else if "%tipo%"==".mp3" (
    .\yt-dlp -P "./../output" -x --audio-format mp3 --audio-quality 0 "%input%"
) else if "%tipo%"==".wav" (
    .\yt-dlp -P "./../output" -x --audio-format wav --audio-quality 0 "%input%"
) else if "%tipo%"==".m4a" (
    .\yt-dlp -P "./../output" -x --audio-format m4a --audio-quality 0 "%input%"
)

echo.
echo Desea descargar otro archivo? [y/n]:
set /p "bool= "
if "%bool%" == "y" (goto :a) else (goto :b)

:b
echo.
pause