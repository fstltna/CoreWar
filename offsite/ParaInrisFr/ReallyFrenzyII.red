From news-rocq!jussieu.fr!freenix!isdnet!news.internetia.pl!news.astercity.net!not-for-mail Tue Feb 12 15:03:58 2002
Article: 13487 of rec.games.corewar
Path: news-rocq!jussieu.fr!freenix!isdnet!news.internetia.pl!news.astercity.net!not-for-mail
From: Lukasz Grabun <grabek@home.sweet.home>
Newsgroups: rec.games.corewar
Subject: Really Frenzy II
Date: Fri, 8 Feb 2002 12:28:27 +0000 (UTC)
Organization: Aster City Net
Lines: 144
Message-ID: <a40g9a$bke$1@pingwin.acn.pl>
Reply-To: gNrOaSbPeAkM@acn.waw.pl
NNTP-Posting-Host: 10.133.131.37
X-Trace: pingwin.acn.pl 1013171307 11918 10.133.131.37 (8 Feb 2002 12:28:27 GMT)
X-Complaints-To: abuse@astercity.net
NNTP-Posting-Date: Fri, 8 Feb 2002 12:28:27 +0000 (UTC)
X-Tech-Contact: usenet@astercity.net
X-Server-Info: http://www.astercity.net/news/
User-Agent: slrn/0.9.7.3 (Linux)
Xref: news-rocq rec.games.corewar:13487

	few weeks ago, after i had entered the nop hill for the first
time, PVK stated that my quick scan didn't work in a proper way; i must
confess that i had no idea what he meant :) i thought there were just
one q^4 code and everyone used it. oh, was i wrong.

	yesterday i was reading archives of r.g.c on google and found
some articles about mentioned quick scanning engine. jade's author
(sorry, i don't remember the name) from whom i've taken q^4 code stated
that his scan was not perfect (it was too long iirc). hey, i thought to
myself, isn't it that what PVK was talking about? :) so - being not
good at cw programming enough - i've decided to steal different q4 from
different warrior. i've chosen L.H. Liporati's "No More Innocuous".
well, it was a huge change: while my old qscan gave me 131 pts against
my warrior suite (behemot, quicksilver, npaper II, hazy lazy, recycled
paper and many other good warriors) the new one pushed my score to 137
pts (2000 fights, no mistakes here).

	other major change is also that i somewhat reorganize the rf
bombs: instead of having huge gaps between two parts of an incendiary
now rf leaves just 15 cells. i was too lazy to check other gaps (despite
445, the results was 15-cell gap: 137.95 pts, 445-cell gap 136.59).

	i've also changed the allignment of code.

	well, if someone is interested, here it comes:

p.s. it seems that a-driven incendiaries works better than b-driven
ones. "rf >" gets 1% less wins than "rf }" when they fight against each
other. dont know why. (2000 fights, also no mistakes here).

;redcode-94nop
;name Really Frenzy II
;author Lukasz Grabun
;strategy optimized and altered version of Really Frenzy
;assert 1

	org	qGo
	
step	equ	3510
gate	equ	(TOP-4)
away	equ	2000
dist	equ	15

boot	mov	bim		, away+20+TOP
src	spl	2		, TOP+10
dest	spl	2		, TOP+10+away
	spl	1		, <-away
	mov	<src		, <dest
	mov	<src		, <dest
	djn	>dest		, #5
	jmp	TOP+away+1	, <-away

TOP
start	add	#step		, 2
	mov	19		, @1
	mov	>bis		, @2-dist
	jmz.b	-3		, <bis
bis	spl	#-dist+1	, #0
	mov	bmb		, >gate
	djn.f	-1		, >gate
bmb	dat	>5335		, 2-gate
for 5
	dat	0		, 0
rof

bim	mov	dist		, }dist

for 36
	dat	0		, 0
rof

qf equ qKil
qs equ 200
qd equ 4000
qi equ 7
qr equ 8

qBmb	dat   	{qi*qr-10	, {1

;    -+)>] 0/1 cycles [(<+-

qGo  	seq   	qd+qf+qs	, qf+qs      ; 1
     	jmp   	qSki		, {qd+qf+qs+qi+2

     	sne   	qd+qf+5*qs	, qf+5*qs    ; B+1
     	seq   	qf+4*qs		, {qTab      ; B
	jmp   	qFas		, }qTab

     	sne   	qd+qf+8*qs	, qf+8*qs    ; A
     	seq   	qf+7*qs		, {qTab-1    ; A-1
     	jmp   	qFas		, {qFas

	sne   	qd+qf+10*qs	, qf+10*qs   ; C
     	seq   	qf+9*qs		, {qTab+1    ; C-1
	jmp   	qFas		, }qFas

	seq   	qd+qf+2*qs	, qf+2*qs    ; B-2
	jmp   	qFas		, {qTab

	seq   	qd+qf+6*qs	, qf+6*qs    ; A-2
	djn.a 	qFas		, {qFas

	seq   	qd+qf+3*qs	, qf+3*qs    ; B-1
        jmp   	qFas		, {qd+qf+3*qs+qi+2

;    -+>)] 2 cycles [(<+-

	sne   	qd+qf+14*qs	, qf+14*qs   ; E+1
	seq   	qf+13*qs	, <qTab      ; E
	jmp   	qSlo		, >qTab

	sne   	qd+qf+17*qs	, qf+17*qs   ; D
	seq   	qf+16*qs	, <qTab-1    ; D-1
	jmp   	qSlo		, {qSlo

	seq   	qd+qf+11*qs	, qf+11*qs   ; E-2
	jmp   	qSlo		, <qTab

	seq   	qd+qf+15*qs	, qf+15*qs   ; D-2
	djn.b 	qSlo		, {qSlo

	sne   	qd+qf+12*qs	, qf+12*qs   ; E-1
	jmz   	boot		, qd+qf+12*qs-qi     ; Free Scan ;-)

qSlo  	mov.ba 	qTab		, qTab
qFas  	mul.ab 	qTab		, qKil
qSki  	sne   	qBmb-1		, @qKil
      	add   	#qd		, qKil

qLoo  	mov.i  	qBmb		, @qKil
qKil  	mov.i  	qBmb		, *qs
      	sub.ab 	#qi		, qKil
      	djn    	qLoo		, #qr
      	jmp    	boot		, <-away
     	dat   	5408		, 7217       ; A*qs =  8*qs ,D*qs = 17*qs
qTab  	dat   	4804		, 6613       ; B*qs =  4*qs ,E*qs = 13*qs
      	dat   	5810		, 1          ; C*qs = 10*qs ,F unused



-- 
Lukasz Grabun (reply-to field is scrambled, remove NOSPAM)
GM d+ s: a-- C++ UL P L++ E---- W-- N++ o? K- w-- O@ M@ V- PS+ 
PE+ Y PGP t-@ 5@ X++(+++) R tv-() b+++ DI+ D- G++ e++ h! r++ y+ 


