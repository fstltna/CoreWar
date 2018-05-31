From news-rocq!univ-lyon1.fr!news.ujf-grenoble.fr!ciril.fr!fr.usenet-edu.net!usenet-edu.net!news.tele.dk!small.news.tele.dk!195.158.233.21!news.ebone.net!news1.ebone.net!157.25.192.109.MISMATCH!news.ipartners.pl!news.astercity.net!not-for-mail Wed Jan  9 11:38:53 2002
Article: 13392 of rec.games.corewar
Path: news-rocq!univ-lyon1.fr!news.ujf-grenoble.fr!ciril.fr!fr.usenet-edu.net!usenet-edu.net!news.tele.dk!small.news.tele.dk!195.158.233.21!news.ebone.net!news1.ebone.net!157.25.192.109.MISMATCH!news.ipartners.pl!news.astercity.net!not-for-mail
From: "grabek" <grabek@acn.waw.pl>
Newsgroups: rec.games.corewar
Subject: New warrior (once again? :)
Date: Wed, 09 Jan 2002 01:00:35 +0100
Organization: Aster City Net
Lines: 36
Message-ID: <20020109.010034.1186452551.6259@localhost.localdomain>
Reply-To: grabek@acn.waw.pl
NNTP-Posting-Host: 10.133.131.37
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Trace: pingwin.acn.pl 1010533839 7939 10.133.131.37 (8 Jan 2002 23:50:39 GMT)
X-Complaints-To: abuse@astercity.net
NNTP-Posting-Date: Tue, 8 Jan 2002 23:50:39 +0000 (UTC)
X-Tech-Contact: usenet@astercity.net
X-Server-Info: http://www.astercity.net/news/
User-Agent: Pan/0.9.5 (Unix)
Xref: news-rocq rec.games.corewar:13392

here's something i programmed half an hour ago.
	it's a 0.5c .f scanner, that uses spl/jmp bombs
	to stun the opponent. after one core-pass it
	switches to spl/dat clear.

	don't know why (just 99 pts on nop hill) i'm
	very proud of it; maybe it's the due to it's my
	first double core clear? dunno.

	the problem is that it _completely_ loses to
	paper. it works quite well against stones and
	bombers, but paper it's too much for it to take.

	maybe you'll find something that might just
	be improved to make it perform better.

;redcode-94nop
;author Lukasz Grabun
;name La Vibra
;assert 1

step	equ	3315

inc	add.ab	#step		, ptr
scan	jmz.f	-1		, @ptr
bmb1	mov	spb		, @1
ptr	mov	@1		, @1
back	jmp	inc		, mvb
	mov	*bmb1		, {ptr2
mvb	jmp	-1		, 0
spb	spl	#-5		, 1
ptr2	dat	inc-6		, 0


-- 
pozdrawiam, grabek


