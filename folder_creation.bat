echo off
:start
set DIR1=E:\DEPLOYMENTS\Deployment\ADECinnovations_deployment\
set DIR2=E:\DEPLOYMENTS\Deployment\ADECkenya_deployment\
set DIR3=E:\DEPLOYMENTS\Deployment\ASETCDP_deployment\
set DIR4=E:\DEPLOYMENTS\Deployment\EMA_deployment\
set DIR5=E:\DEPLOYMENTS\Deployment\EnviroSite_deployment\
set DIR6=E:\DEPLOYMENTS\Deployment\FCSWebsite_deployment\

echo Select a Deployment Folder:
echo =============
echo -
echo 1) ADEC Innovations
echo 2) ADEC Kenya
echo 3) ASETCDP
echo 4) EMA
echo 5) ENVIROSITE
echo 6) FCS Website
echo 7) EXIT
set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
if "%op%"=="4" goto op4
if "%op%"=="5" goto op5
if "%op%"=="6" goto op6
if "%op%"=="7" goto start

echo Please Pick an option:
goto begin

:op1
echo you picked ADEC Innovations
set /p Date="Enter the Date: "
mkdir %Date%
pause
move "%Date%" "%DIR1%"
pause
cls
goto start

:op2
echo you picked ADEC Innovations
set /p Date="Enter your Date: "
mkdir %Date%
pause
move "%Date%" "%DIR2%"
pause
cls
goto start

:op3
echo you picked ASETCDP
set /p Date="Enter your Date: "
mkdir %Date%
pause
move "%Date%" "%DIR3%"
pause
cls
goto start

:op4
echo you picked EMA
set /p Date="Enter your Date: "
mkdir %Date%
pause
move "%Date%" "%DIR4%"
pause
cls
goto start

:op5
echo you picked ENVIROSITE
set /p Date="Enter your Date: "
mkdir %Date%
pause
move "%Date%" "%DIR5%"
pause
cls
goto start

:op6
echo you picked FCS Greenwatch
set /p Date="Enter your Date: "
mkdir %Date%
pause
move "%Date%" "%DIR6%"
pause
cls
goto start

:exit
@exit
