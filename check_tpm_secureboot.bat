@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as an administrator.
    echo Please right-click the script and select "Run as administrator".
    pause
    exit /b
)

echo v1.0.1
echo Checking TPM 2.0, Secure Boot status, and Motherboard Information...
echo.

echo Motherboard:
wmic baseboard get product,Manufacturer,version,serialnumber
echo.

echo TPM 2.0:
powershell -Command "(Get-Tpm).TpmReady" > temp_tpm.txt
findstr "True" temp_tpm.txt > nul

if %errorlevel% equ 0 (
    powershell -Command "(Get-Tpm).ManufacturerVersion -like '2.0*'" > temp_tpm_version.txt
    findstr "True" temp_tpm_version.txt > nul

    if %errorlevel% equ 0 (
        call :ColorEcho 92 Enabled
        goto :secureboot
    ) else (
        call :ColorEcho 91 "Disabled or Not Found (not version 2.0)"
        goto :secureboot
    )
    del temp_tpm_version.txt
) else (
    call :ColorEcho 91 "Disabled or Not Found"
    goto :secureboot
)

:secureboot
echo.
echo Secure Boot:
powershell -Command "Confirm-SecureBootUEFI" > temp_sb.txt
findstr "True" temp_sb.txt > nul

if %errorlevel% equ 0 (
    call :ColorEcho 92 Enabled
) else (
    call :ColorEcho 91 Disabled
)

del temp_tpm.txt
del temp_sb.txt

echo.
(pause)
goto :eof

:ColorEcho
echo [%1m%~2[0m
exit /b