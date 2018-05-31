From news-rocq!univ-lyon1.fr!news.ujf-grenoble.fr!ciril.fr!easynet-quince!easynet.net!proxad.net!isdnet!news.internetia.pl!news.astercity.net!not-for-mail Thu Jan 24 18:59:44 2002
Article: 13430 of rec.games.corewar
Path: news-rocq!univ-lyon1.fr!news.ujf-grenoble.fr!ciril.fr!easynet-quince!easynet.net!proxad.net!isdnet!news.internetia.pl!news.astercity.net!not-for-mail
From: grabek <grabek@home.sweet.home>
Newsgroups: rec.games.corewar
Subject: scanner, once again
Date: Mon, 21 Jan 2002 17:04:15 +0000 (UTC)
Organization: Aster City Net
Lines: 51
Message-ID: <slrna4oj3p.19t.grabek@localhost.localdomain>
Reply-To: gNrOaSbPeAkM@acn.waw.pl
NNTP-Posting-Host: 10.133.131.37
X-Trace: pingwin.acn.pl 1011632655 55777 10.133.131.37 (21 Jan 2002 17:04:15 GMT)
X-Complaints-To: abuse@astercity.net
NNTP-Posting-Date: Mon, 21 Jan 2002 17:04:15 +0000 (UTC)
X-Tech-Contact: usenet@astercity.net
X-Server-Info: http://www.astercity.net/news/
User-Agent: slrn/0.9.7.2 (Linux)
Xref: news-rocq rec.games.corewar:13430

	and once again... here's another scanner i made. it is somewhat
different from mani 5 i posted two days ago. things i have added is
decoy and boot. wiping out boot engine and warrior body is another
innovation. i also didn't add slt line. one can live without it :)
however, now mani must be a mod - 4 scanner which is _not_ very
effective. and as usual, it does not perform well on nop hill.

;redcode-94nop
;name Mani 24
;author Lukasz Grabun
;assert 1

step	equ	3364
safe	equ	(tail-top+3)
gate	equ	(top-2)
away	equ	3257

	org	boot

;decoy
for 18
	spl	#1		, >1
	spl	#1		, <1
	spl	#1		, *1
	spl	#0		, #0
rof
	dat	0		, 0

boot	mov	tail		, away
for 9
	mov	{boot		, <boot
rof
	add	#3		, boot
	jmp	@boot		, 0

top
ptr	jmp	spb+1		, -away+9
atk	mov	spb		, >ptr
inc	add	#step		, #step
scan	jmz.f	atk		, @inc
	mov.b	inc		, ptr
	jmn	atk		, inc
spb	spl	#0		, #0
	mov	tail		, >gate
	djn.f	-1		, >gate
tail	dat	>5335		, 2-gate



-- 
Lukasz Grabun


