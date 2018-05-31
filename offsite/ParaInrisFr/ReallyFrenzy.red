From news-rocq!univ-lyon1.fr!news.ujf-grenoble.fr!ciril.fr!isdnet!news.internetia.pl!news.astercity.net!not-for-mail Thu Dec  6 14:06:10 2001
Article: 13248 of rec.games.corewar
Path: news-rocq!univ-lyon1.fr!news.ujf-grenoble.fr!ciril.fr!isdnet!news.internetia.pl!news.astercity.net!not-for-mail
From: "grabek" <grabek@acn.waw.pl>
Newsgroups: rec.games.corewar
Subject: not the last one
Date: Wed, 05 Dec 2001 19:50:59 +0100
Organization: Aster City Net
Lines: 94
Message-ID: <20011205.195059.1239036029.1386@localhost.localdomain>
Reply-To: grabek@acn.waw.pl
NNTP-Posting-Host: 10.128.129.195
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Trace: pingwin.acn.pl 1007577724 18637 10.128.129.195 (5 Dec 2001 18:42:04 GMT)
X-Complaints-To: abuse@astercity.net
NNTP-Posting-Date: Wed, 5 Dec 2001 18:42:04 +0000 (UTC)
X-Tech-Contact: usenet@astercity.net
X-Server-Info: http://www.astercity.net/news/
User-Agent: Pan/0.9.5 (Unix)
Xref: news-rocq rec.games.corewar:13248

finally, after hours of tweaking and programming... my warrior is not
the last one on 94 nop hill :))) however, i still hope and strongly
believe there are some things could just be improved. i'm still working
on it (now i'm trying to insert two-pass core clear into it).

	i'd like to thank for all the hints.

;redcode-94nop
;name Really Frenzy
;author Lukasz Grabun
;assert 1

	org	qscan
	
step	equ	3315
gate	equ	(TOP-3)
away	equ	2345				; :-)

TOP
start	add	#2*step		, 2
	mov	bim		, @1
	mov	}bis		, @2-step
	jmz.a	-3		, {bis		;hit with spl
bis	spl	#0		, -step+1
	mov	bmb		, >gate
	djn.f	-1		, >gate
bmb	dat	>5335		, 2-gate
bim	mov	step		, >step

for 41
	dat	0		, 0
rof


qf	equ	qptr
qs1	equ	100
qs2	equ	200
qd	equ	4000
qi	equ	7
qr	equ	11
qo	equ	(qi*qr-10)

	dat	#  15,	#  10	; A, D
qtab	dat	#   7,	#   4	; B, E
	dat	#  13,	#  11	; C, F
qbmb	dat	<   1,	<  qo
qinc	dat	#  qd,	#  qd

qfas	mul.f	 qtab,	 qptr	; decode
qfnd	sne	*qptr,	@qptr
	add	 qinc,	 qptr
	sne	>3456,	@qptr
	mov.x	 qptr,	 qptr
qloo	mov	 qbmb,	@qptr	; .5c negative bomber
qptr	mov	< qs2,	@ qs1
	sub.x	#  qi,	 qptr
	djn	 qloo,	#  qr
	jmp	 boot,	>1234

qscan	sne	qf+ 1*qs2,	qf+ 1*qs1
	seq	qf+ 1*qs2+qd,	qf+ 1*qs1+qd	; 1, 1
	jmp	qfnd,	{qf+ 1*qs2+qd+qi
	sne	qf+ 8*qs2,	qf+ 4*qs1
	seq	qf+ 8*qs2+qd,	qf+ 4*qs1+qd	; B+1, E
	jmp	qfas,	}qtab
	sne	qf+ 7*qs2,	qf+ 5*qs1
	seq	qf+ 7*qs2+qd,	qf+ 5*qs1+qd	; B, E+1
	jmp	qfas,	>qtab
	sne	qf+ 6*qs2,	qf+ 3*qs1
	seq	qf+ 6*qs2+qd,	qf+ 3*qs1+qd	; B-1, E-1
	djn.f	qfas,	qtab
	sne	qf+13*qs2,	qf+11*qs1
	seq	qf+13*qs2+qd,	qf+11*qs1+qd	; C, F
	jmp	qfas,	}qfas
	sne	qf+15*qs2,	qf+10*qs1
	seq	qf+15*qs2+qd,	qf+10*qs1+qd	; A, D
	jmp	qfas,	{qfas
	sne	qf+14*qs2,	qf+ 9*qs1
	seq	qf+14*qs2+qd,	qf+ 9*qs1+qd	; A-1, D-1
	djn.f	qfas,	{qfas

boot	mov	bim		, away
for 8
	mov	{boot		, <boot
rof
	spl	2
	spl	2
	spl	1

	djn	>boot		, #5
	jmp	away+boot-7

-- 
pozdrawiam, grabek


