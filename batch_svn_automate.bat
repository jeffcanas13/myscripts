@echo off
REM Created by JSCANAS For EMA Deployment Automation 
REM Phase 1
REM Create Folder with current date + revision no.
cls 
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%a%%b%%c)
:start
set /p SVNrev="Type the revision no.: "
pause
D:
cd "EMA proj"\"EMA QC"
mkdir "%mydate% svn%SVNrev%"

REM svn export instead of svn checkout
set SVNexe="C:\Program Files\TortoiseSVN\bin\svn.exe"
set /p SVNURL="Type the SVN URL here: "
set ChkOutLocation="D:\EMA Proj\EMA QC\%mydate% svn%SVNrev%"
%SVNexe% export %SVNURL% %ChkOutLocation%\ema --force
echo folder "%ChkOutLocation% is created!
echo checkout from "%SVNURL%" 
echo EMA Rev. %SVNrev% is successfully exported!
echo STEP 1 is done!
pause

REM Backup of existing EMA root folder on QA 
set PATH=C:\cygwin\bin;%PATH% 
set LiveBackup="D:\EMA Proj\BACK-UP\EMA_QC\"
cd %LiveBackup%
rsync -avz qctest@10.0.12.124:/var/www/ema .
set /p BKPSEQ="Type the Backup Sequence No.: "
mv ema EMA_qc_%mydate%n%BKPSEQ%
echo EMA QA has been backup in %LiveBackup%
echo EMA_qc_%mydate%n%BKPSEQ% is successfully backup in %LiveBackup%
echo STEP 2 is done!
pause

REM Show the last running version on QA
set PATH=C:\cygwin\bin;%PATH%
echo The current version in QA is
cat %LiveBackup%\EMA_qc_%mydate%n%BKPSEQ%\app\version.php
pause
