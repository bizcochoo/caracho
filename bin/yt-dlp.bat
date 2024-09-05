@echo off
echo.
echo Ingresa URL de Youtube:
set /p "input="
echo Seleccione formato:
echo [VIDEO: .mp4 .webm] [AUDIO: .mp3 .wav .opus .m4a]
set /p "tipo="

if "%tipo%"==".webm" (
    .\yt-dlp.exe -P "./../output" "%input%"
) else if "%tipo%"==".opus" (
    .\yt-dlp -P "./../output" -x "%input%"
) else if "%tipo%"==".mp3" (
    .\yt-dlp -P "./../output" -x --audio-format mp3 --audio-quality 0 "%input%"
) else if "%tipo%"==".wav" (
    .\yt-dlp -P "./../output" -x --audio-format wav --audio-quality 0 "%input%"
) else if "%tipo%"==".m4a" (
    .\yt-dlp -P "./../output" -x --audio-format m4a --audio-quality 0 "%input%"
) else if "%tipo%"==".mp4" (
    .\yt-dlp -P "./../output" -S res,ext:mp4:m4a --recode mp4 "%input%"
)

pause