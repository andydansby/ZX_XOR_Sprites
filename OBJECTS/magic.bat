rem combine all object files

@if not exist "contended.o" (
call error.bat
)
@if not exist "RAM0.o" (
call error.bat
)
@if not exist "uncontended.o" (
call error.bat
)


z80asm --output=ramALL.o contended.o RAM0.o uncontended.o

@if not exist "ramALL.o" (
call error.bat
)

z80nm ramALL.o > ramALL.txt
	@rem output.txt will have the listing of routines

REM move the object file created above into the RAMMAIN directory to compile the test.c file
copy "ramALL.o" "..\UNCONTENDED\"
