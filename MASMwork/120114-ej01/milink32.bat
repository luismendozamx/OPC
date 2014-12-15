cls
REM  lnk32.bat -  Batch file for linking 32-bit Assembly programs

REM The object file's extension must be ".obj"
LINK32 /nologo %1.obj irvine32.lib user32.lib kernel32.lib /SUBSYSTEM:CONSOLE /DEBUG /MAP
if errorLevel 1 goto terminate

dir %1.*

:terminate

pause

REM ----o----
