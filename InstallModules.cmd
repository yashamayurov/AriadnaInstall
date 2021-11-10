@ECHO OFF

SET InstallPath=C:\ARIADNA\JAVA
SET SourcePath=\\ariadna-db\ARIADNA\SETUP\JAVA
SET InstallFileName=SetupAriadna.exe
SET ControlPath=C:\ARIADNA\JAVA

net use I:  /delete /y
net use I: %SourcePath%
I:
CD I:

IF Exist %ControlPath%	(GoTo BegLoop)
CALL %InstallFileName% /S /D=%InstallPath%
COPY connection.xml %InstallPath%\bin\connection.xml

REM Начало цикла
:BegLoop
IF -%1==- GOTO ExitLoop
ECHO %1
 rem install_armJavaModule.bat %1 
REM Сдвиг параметров
 SET ControlPath=C:\ARIADNA\JAVA\bin\Arm%1.bat
 SET InstallFileName=SetupArm%1
 IF Exist %ControlPath%	(GoTo endLoop)
 CALL %InstallFileName% /S /D=%InstallPath%
:endLoop 
SHIFT
REM Переход на начало цикла
GOTO BegLoop
:ExitLoop

C:
net use I:  /delete /y

