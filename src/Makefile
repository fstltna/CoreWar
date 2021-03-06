# generic UNIX makefile
CC = gcc			# req. for linux
#CC = cc				# if you don't have gcc
# Configuration options:
#
# No.   Name            Incompatible with   Description
# (1)   -DSERVER        2                   disables cdb debugger (koth server 
#                                           version)
# (2)   -DGRAPHX        1                   enables platform specific core 
#                                           graphics
# (3)   -DKEYPRESS                          only for curses display on SysV:
#                                           enter cdb upon keypress (use if
#                                           Ctrl-C doesn't work)
# (4)   -DEXT94                             ICWS'94 + SEQ,SNE,NOP,*,{,}
# (5)   -DSMALLMEM                          16-bit addresses, less memory
# (6)   -DXWINGRAPHX    1                   X-Windows graphics (UNIX)
# (7)   -DPERMUTATE                         enables -P switch
# (8)   -DBBSMODE                           enables BBS mode

CFLAGS = -O -DEXT94 -DPERMUTATE -DBBSMODE
LFLAGS = -x
LIB = -lcurses				# enable this one for curses display
# LIB = -lcurses -ltermlib		# enable this one for curses display
# LIB = -lvgagl -lvga			# enable this one for Linux/SVGA
#LIB = -L/usr/X11R6/lib -lX11		# enable this one for X11
COREUSER = ftn

.SUFFIXES: .o .c .c~ .man .doc .6
MAINFILE = pmars

HEADER = global.h config.h asm.h sim.h 
OBJ1 = pmars.o asm.o eval.o disasm.o cdb.o sim.o pos.o
OBJ2 = clparse.o global.o token.o 
OBJ3 = str_eng.o

all: flags $(MAINFILE)

flags:
	@echo Making $(MAINFILE) with compiler flags $(CFLAGS)

$(MAINFILE): $(OBJ1) $(OBJ2) $(OBJ3)
	@echo Linking $(MAINFILE)
	@$(CC) -o $(MAINFILE) $(OBJ1) $(OBJ2) $(OBJ3) $(LIB)
	@strip $(MAINFILE)
	@echo done

token.o asm.o disasm.o: asm.h

sim.o cdb.o pos.o disasm.o: sim.h

sim.o: curdisp.c uidisp.c lnxdisp.c xwindisp.c

xwindisp.c: xwindisp.h pmarsicn.h

lnxdisp.c: lnxdisp.h

$(OBJ1) $(OBJ2) $(OBJ3): Makefile config.h global.h

.c.o:
	@echo Compiling $*.o 
	@$(CC) $(CFLAGS) -c $*.c


clean:
	rm -f $(OBJ1) $(OBJ2) $(OBJ3) core

install:
	mkdir -p /sbbs/doors/corewar/warriors
	cp ../warriors/* /sbbs/doors/corewar/warriors
	mkdir -p /sbbs/doors/corewar/doc
	cp -r ../doc/* /sbbs/doors/corewar/doc
	mkdir -p /sbbs/doors/corewar/players
	cp -r ../offsite/* /sbbs/doors/corewar/players
	cp pmars /sbbs/doors/corewar/
	cp ../run_leaderboard.pl /sbbs/doors/corewar/
	cp corewar.pl /sbbs/doors/corewar/
	cp ../sorttable.js /sbbs/doors/corewar/
	cp ../README_BBS.md ../README_BBS.pdf /sbbs/doors/corewar
	touch /sbbs/doors/corewar/stats.txt
	chown -R $(COREUSER):$(COREUSER) /sbbs/doors/corewar

