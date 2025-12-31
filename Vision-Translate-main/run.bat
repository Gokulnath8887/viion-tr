@echo off
TITLE Vision-Translate (GlobalSpeak) Runner
CLS

REM Set working directory to script location
cd /d "%~dp0"

ECHO ======================================================
ECHO         Vision-Translate (GlobalSpeak)
ECHO ======================================================
ECHO.

REM Check if Python is installed
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO [ERROR] Python is not installed or not in your PATH.
    ECHO Please install Python from https://www.python.org/downloads/
    PAUSE
    EXIT /B
)

ECHO [INFO] Checking and installing requirements...
python -m pip install -r requirements.txt
IF %ERRORLEVEL% NEQ 0 (
    ECHO [ERROR] Failed to install requirements.
    PAUSE
    EXIT /B
)

ECHO.
ECHO [INFO] Starting Streamlit App...
ECHO.
python -m streamlit run app.py

IF %ERRORLEVEL% NEQ 0 (
    ECHO.
    ECHO [ERROR] The application crashed or was stopped.
    PAUSE
)
