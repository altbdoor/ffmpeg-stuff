@echo off
setlocal enableExtensions disableDelayedExpansion

echo Press 1 for 60fps, and 2 for 120fps
set question="Enter mode: "
set /p mode=%question%

if exist .\bin\ffmpeg.exe (
    if %mode% == 1 (
        .\bin\ffmpeg.exe -y -hide_banner -i "%~1" -filter:v "minterpolate=fps=60" -c:a copy "%~n1_60fps%~x1"
    ) else if %mode% == 2 (
        .\bin\ffmpeg.exe -y -hide_banner -i "%~1" -filter:v "minterpolate=fps=120" -c:a copy "%~n1_120fps%~x1"
    ) else (
        echo Invalid mode!
    )

    goto :end

) else (
    echo Please download FFmpeg and extract the bin folder to here.
    echo Get it from https://ffmpeg.zeranoe.com/builds/
    goto :end

)

:end
echo.
pause
