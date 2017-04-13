@ECHO OFF

SET Complier_WorkingRoot=E:\SandcastleHelpFileBuilderPOC.NET

ECHO "Prepares TMCM SDK Manual"
CALL "%Complier_WorkingRoot%\SHFBManualGenerator.bat" %Complier_WorkingRoot%

ECHO "DONE"

EXIT /B

:ERROR_HANDLE

EXIT %ERRORLEVEL%