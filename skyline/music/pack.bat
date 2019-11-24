@echo off

REM Test11.bat - putting it all together.
for %%F in (*.rar *.zip) do (
REM Extract...
"C:\Portable Programs\7-Zip\7z" x "%%F" -o"%%F contents"
REM delete old file
DEL "%%F" /F /Q
REM Change directory, create 7zip of contents of directory...
CD "%%F contents"
"C:\Portable Programs\7-Zip\7z" a -mx9 -tzip "../%%~nF.zip" *
CD ..
REM Delete the old files
REM WHAT NO! -- DEL "%%F" /F /Q
RMDIR "%%F contents" /S /Q
)
pause