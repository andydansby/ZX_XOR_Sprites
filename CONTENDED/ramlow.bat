SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config

cd codemaps
	del contended.o
cd ..

@rem this creates an object file
@rem zcc +zx -vn -SO3 -c -clib=new --fsigned-char -pragma-include:zpragma.inc -o contended.o @ramlow.lst
@rem sccz80 working
@rem zcc +zx -vn -SO3 -c -clib=new --fsigned-char -o contended.o @ramlow.lst


rem compiling string for SDCC object file
zcc +zx -vn -clib=sdcc_iy @ramlow.lst -c -o contended.o -m

@if not exist "contended.o" (
call error.bat
)

copy "contended.o" "..\"
move "contended.o" "codemaps\"

@REM Cleanup
del zcc_opt.def

REM a nice map view
cd codemaps
	echo on
	@REM all these objects match up
	z80nm contended.o
	z80nm contended.o > contended.txt
	copy "contended.txt" "..\"
	echo off
cd ..

@call beep.bat
