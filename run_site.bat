@echo off
REM ------------------------------------------------------------------
REM run_site.bat - run one ASP.NET Web Site folder with IIS Express.
REM Usage:  run_site.bat "C:\...\Program_04"  [port]  [page]
REM   port defaults to 8080; page defaults to the first .aspx file.
REM   Or drag a Program_XX folder onto this .bat file.
REM Stop the site with Ctrl+C (or close the window).
REM Set NOBROWSER=1 to skip opening the browser.
REM ------------------------------------------------------------------
setlocal
set "SITE=%~1"
if "%SITE%"=="" set "SITE=%CD%"
REM A trailing backslash breaks the quoted /path: argument ("Invalid physical path"), so remove all of them.
:trimslash
if "%SITE:~-1%"=="\" (
  set "SITE=%SITE:~0,-1%"
  goto trimslash
)
set "PORT=%~2"
if "%PORT%"=="" set "PORT=8080"
set "PAGE=%~3"

if not exist "%SITE%\" (
  echo Folder not found: "%SITE%"
  exit /b 1
)

set "IIS=%ProgramFiles%\IIS Express\iisexpress.exe"
if not exist "%IIS%" set "IIS=%ProgramFiles(x86)%\IIS Express\iisexpress.exe"
if not exist "%IIS%" (
  echo IIS Express not found. Install Visual Studio "ASP.NET and web development" workload.
  exit /b 1
)

REM If the port is already taken by another program, try the next one (up to 10 tries).
set /a TRIES=0
:checkport
netstat -ano | findstr /R /C:":%PORT% .*LISTENING" >nul
if errorlevel 1 goto portok
echo Port %PORT% is busy, trying next port...
set /a PORT+=1
set /a TRIES+=1
if %TRIES% LSS 10 goto checkport
echo No free port found. Pass one explicitly, e.g. run_site.bat "%SITE%" 9090
exit /b 1
:portok

REM Pick the first .aspx page when none was given (root URL has no Default.aspx in Assignment 2).
if "%PAGE%"=="" for /f "delims=" %%F in ('dir /b /on "%SITE%\*.aspx" 2^>nul') do if not defined PAGE set "PAGE=%%F"

echo Site : %SITE%
echo Pages:
for /f "delims=" %%F in ('dir /b /on "%SITE%\*.aspx" 2^>nul') do echo    http://localhost:%PORT%/%%F
echo.
REM Open the browser after a short delay so IIS Express is already listening.
if not "%NOBROWSER%"=="1" start "" /min cmd /c "timeout /t 3 /nobreak >nul & start "" http://localhost:%PORT%/%PAGE%"

"%IIS%" /path:"%SITE%" /port:%PORT%
endlocal
