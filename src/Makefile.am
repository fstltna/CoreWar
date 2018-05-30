## Process this file with automake to produce Makefile.in
##
## pMARS -- a portable Memory Array Redcode Simulator
##
## Makefile.am: Input file for automake
## Copyright (C) 2000 Philip Kendall
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
##
## $Id: Makefile.am,v 1.1 2000/12/26 15:22:39 pak21 Exp $

AUTOMAKE_OPTIONS = foreign

bin_PROGRAMS = pmars

pmars_SOURCES = asm.c cdb.c clparse.c disasm.c eval.c global.c pmars.c pos.c\
	sim.c str_eng.c token.c
EXTRA_pmars_SOURCES = alldisp.c curdisp.c grxdisp.c gtdisp.c lnxdisp.c\
	uidisp.c xgraphio.c xwindisp.c

noinst_HEADERS = asm.h config.h global.h lnxdisp.h pmarsicn.h sim.h xwindisp.h

EXTRA_DIST = Makefile.djg Makefile.wat



