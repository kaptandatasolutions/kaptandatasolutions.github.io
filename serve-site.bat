@echo off
SETLOCAL

REM ------------------------------------------------
REM  Script : serve-site.bat
REM  But    : installer les gems et lancer Jekyll
REM  Usage  : 
REM    1) Ouvrir "Start Command Prompt with Ruby"
REM    2) Double‑cliquer sur ce .bat ou lancer "serve-site.bat"
REM ------------------------------------------------

REM 1) Aller dans le dossier du script
cd /d "%~dp0"

REM 2) Installer (ou mettre à jour) les gems
echo [INFO] bundle install...
call bundle install
if ERRORLEVEL 1 (
  echo [ERROR] « bundle install » a echoue.
  pause
  exit /b 1
)

REM 3) Lancer le serveur Jekyll avec livereload
echo [INFO] bundle exec jekyll serve --livereload...
call bundle exec jekyll serve --livereload
if ERRORLEVEL 1 (
  echo [ERROR] « jekyll serve » a echoue.
  pause
  exit /b 1
)

:end
echo.
echo [INFO] Serveur arrete.  
pause >nul
