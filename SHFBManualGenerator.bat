@ECHO OFF

ECHO Fires SHFB SDK Manual Generator

SET Complier_WorkingRoot=%~1

ECHO Gets MSBuild path
FOR /D %%d in (%SYSTEMROOT%\Microsoft.NET\Framework\v4*) do SET MSBUILDDIR=%%d

ECHO Verifies MSBuild path
SET MSBUILD=%MSBUILDDIR%\MSBuild.exe
IF NOT EXIST "%MSBUILD%" (
SET ERRORMSG=Got MSBuild path failed 
GOTO SHFBManualGenerator_Error_handler
) ELSE (
ECHO Got MSBuild path successfully 
)

ECHO Verifies SHFBManualGenerator path
SET SHFBManualGenerator=%Complier_WorkingRoot%\SHFBManualGenerator.proj
IF NOT EXIST "%SHFBManualGenerator%" (
SET ERRORMSG=Got SHFBManualGenerator path failed
GOTO SHFBManualGenerator_Error_handler
) ELSE (
ECHO Got SHFBManualGenerator path successfully 
)

ECHO Builds SHFBManualGenerator
CALL "%MSBUILD%" "%SHFBManualGenerator%"

:SHFBManualGenerator_Error_handler
SET ERRORMSG=ERROR: %ERRORMSG%
GOTO End

:End
ECHO %ERRORMSG%
SET ERRORMSG=
EXIT /B