From news-rocq!jussieu.fr!freenix!fr.clara.net!heighliner.fr.clara.net!news.tele.dk!small.news.tele.dk!193.174.75.178!news-fra1.dfn.de!news.man.poznan.pl!newsfeed.tpinternet.pl!news.internetia.pl!news.astercity.net!not-for-mail Sun Jan 20 17:43:49 2002
Article: 13425 of rec.games.corewar
Path: news-rocq!jussieu.fr!freenix!fr.clara.net!heighliner.fr.clara.net!news.tele.dk!small.news.tele.dk!193.174.75.178!news-fra1.dfn.de!news.man.poznan.pl!newsfeed.tpinternet.pl!news.internetia.pl!news.astercity.net!not-for-mail
From: grabek <grabek@home.sweet.home>
Newsgroups: rec.games.corewar
Subject: scanner
Date: Sat, 19 Jan 2002 17:30:41 +0000 (UTC)
Organization: Aster City Net
Lines: 40
Message-ID: <slrna4jbt7.19o.grabek@localhost.localdomain>
Reply-To: gNrOaSbPeAkM@acn.waw.pl
NNTP-Posting-Host: 10.133.131.37
X-Trace: pingwin.acn.pl 1011461441 1862 10.133.131.37 (19 Jan 2002 17:30:41 GMT)
X-Complaints-To: abuse@astercity.net
NNTP-Posting-Date: Sat, 19 Jan 2002 17:30:41 +0000 (UTC)
X-Tech-Contact: usenet@astercity.net
X-Server-Info: http://www.astercity.net/news/
User-Agent: slrn/0.9.7.2 (Linux)
Xref: news-rocq rec.games.corewar:13425

	here's scanner i programmed recently. it uses incendiary bombs
(spl #2, 0; mov -1, }-1); after one core pass it turns into double core
clear (thanks, Steve). i wonder whether it can be improved; for now it's
quite effective against silk warriors, it even beats time scape - like
warriors. however stones (even Dewdney's dwarf) and scanners seems to
trash it. i suppose it's just too big. is there a way to improve it? i
wouldn't like to remove double core clear - to beat todays paper one
needs spl/dat clear. but maybe there are smaller double core clears? i
look forward to any comment you may have.

;redcode-94nop
;name Mani 5
;author Lukasz Grabun
;password grabek
;assert 1

step	equ	3364
safe	equ	(tail-top+3)
	org	scan

top
atk	mov	mvb		, @1
ptr	mov	spb		, @step
inc	add	#step		, ptr
scan	jmz.f	-1		, @ptr
	slt	ptr		, #safe
ptrc	jmp	atk		, mvb
	jmn	inc		, ptr
spb	spl	#2		, 0
write	mov	@incr		, >ptrc
	mov	@incr		, >ptrc
incr	djn.f	write		, {wipe
	dat	#ptrc-5		, #incr-ptrc+5
wipe	spl	#ptrc-5		, #incr-ptrc+5
mvb	mov	-1		, }-1
tail	dat	0		, 0


-- 
Lukasz Grabun


