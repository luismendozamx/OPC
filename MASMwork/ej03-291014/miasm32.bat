cls
REM  ml32.bat -  Batch file for assembling 32-bit Assembly programs

REM The source file's extension must be ".asm"
ML /nologo -Zi -c -Fl -Sg -coff %1.asm
if errorlevel 1 goto terminate

dir %1.*

:terminate

pause

REM ----o----
