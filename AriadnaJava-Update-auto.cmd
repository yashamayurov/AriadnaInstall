@echo off
setlocal enabledelayedexpansion
for /f "delims=." %%i in ('wmic.exe OS get LocalDateTime ^| find "."') do set sDateTime=%%i
@echo on
@echo --- %sDateTime% process start

rem SET InstallPath=%ARIADNA_JAVA%
SET SourcePath=\\ariadna-db\ARIADNA\SETUP\JAVA

IF exist "C:\ARIADNA\JAVA\Uninstall.exe" (
	InstallPath=C:\ARIADNA\JAVA
	) ELSE (
		IF exist "C:\ARIADNA\APP\JAVA\Uninstall.exe" (
			InstallPath=C:\ARIADNA\APP\JAVA\
			)
		)
	


IF "%InstallPath%"=="" (
	SET InstallPath=C:\ARIADNA\JAVA
)
	
echo %InstallPath%
pause

net use I:  /delete /y
net use I: %SourcePath%

cd %InstallPath%\bin

CALL I:\SetupAriadna.exe /S /D=%InstallPath%

for %%A in (Arm*.bat) do (
 CALL I:\Setup%%~nA.exe /S /D=%InstallPath%
 )
@echo --- process stop