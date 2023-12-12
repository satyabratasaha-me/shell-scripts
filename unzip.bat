@echo off

REM Check if the correct number of arguments is provided
if "%1"=="" (
    echo Usage: %0 ^<zip_file^>
    exit /b 1
)

REM Get the zip file name from the command line argument
set "zip_file=%1"

REM Check if the file exists
if not exist "%zip_file%" (
    echo Error: File not found - %zip_file%
    exit /b 1
)

REM Create a folder with the same name as the zip file (without extension)
set "output_folder=%~n1"
mkdir "%output_folder%" 2>nul

REM Extract the contents of the zip file
powershell -Command "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('%zip_file%', '%output_folder%')"

echo Extraction complete.
