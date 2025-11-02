@echo off
title GiantSourceEditor - GSE by loryfish
cls
echo ===============================================
echo        GiantSourceEditor - OpenSource Editor
echo ===============================================
echo.
echo Type your text below. When finished, write ":endText" on a new line.
echo.

setlocal enabledelayedexpansion

:: Creiamo un file temporaneo dove scrivere le righe
set "tempfile=%temp%\gse_temp.txt"
if exist "%tempfile%" del "%tempfile%"

:inputloop
set "line="
set /p "line=> "

if "%line%"==":endText" goto savefile

>>"%tempfile%" echo %line%
goto inputloop

:savefile
echo.
set /p "filename=Enter filename (with extension, e.g. note.txt): "
if exist "%filename%" del "%filename%"
move "%tempfile%" "%filename%" >nul
echo File saved as %filename%.
echo.
pause
exit



