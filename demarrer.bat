@echo off
setlocal
set "APP_PORT=8501"
if not "%~1"=="" set "APP_PORT=%~1"
cd /d "%~dp0"
if errorlevel 1 goto erreur
if not exist "app.py" goto erreur
if not exist ".venv\Scripts\python.exe" (
    py -m venv .venv
    if errorlevel 1 goto erreur
)
".venv\Scripts\python.exe" -c "import streamlit, pandas, plotly, networkx, defusedxml" >nul 2>&1
if errorlevel 1 (
    ".venv\Scripts\python.exe" -m pip install -r requirements.txt
    if errorlevel 1 goto erreur
)
echo Dossier du projet : %CD%
echo Application : http://localhost:%APP_PORT%
".venv\Scripts\python.exe" -m streamlit run "%~dp0app.py" --server.address 127.0.0.1 --server.port %APP_PORT%
if errorlevel 1 goto erreur
exit /b 0
:erreur
echo Echec du lancement. Verifiez Python 3.10 ou plus et les messages ci-dessus.
pause
exit /b 1
