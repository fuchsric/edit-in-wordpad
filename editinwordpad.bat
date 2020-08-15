:loop
start "" /MIN powershell -windowstyle hidden -file %~dp0/editinwordpad.ps1 -filename %1
shift
if not "%~1"=="" goto loop
