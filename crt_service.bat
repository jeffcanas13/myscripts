@echo off 
REM Created by JSCANAS For Creation of Service in Windows
REM Dated August 19, 2016
cls
set /p SERVICEKEY="Type Service Name here: "
echo Your Service Name is "%SERVICEKEY%"
set /p DIRPATH="Type here the Directory Path: "
echo Your Directory Path is "%DIRPATH%"
set /p choice=Do you want to continue? [y/n]
if '%choice%'=='y' Goto start
if '%choice%'=='n' Goto last
:start
sc.exe create "%SERVICEKEY%" start= auto binPath= "%DIRPATH%" DisplayName= "%SERVICEKEY%"
echo The service "%SERVICEKEY%" is now created!
:last
echo Exiting...
pause
