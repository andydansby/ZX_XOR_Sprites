SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config

cd codemaps
	del uncontended.o
cd ..

rem compiling string for SDCC object file
zcc +zx -vn -clib=sdcc_iy -c -o uncontended.o -m @ramMain.lst



@if not exist "uncontended.o" (
call error.bat
)

copy "uncontended.o" "..\"
move "uncontended.o" "codemaps\"


@REM Cleanup
del zcc_opt.def

REM a nice map view
cd codemaps
	echo on
	@REM all these objects match up
	z80nm uncontended.o
	z80nm uncontended.o > uncontended.txt
	copy "uncontended.txt" "..\"
	echo off
cd ..


call beep.bat
