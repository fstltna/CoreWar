Path: news-rocq!nslave.kpnqwest.net!nloc.kpnqwest.net!nmaster.kpnqwest.net!newsfeed.Austria.EU.net!newsfeed.kpnqwest.at!newsrouter.chello.at!newsfeed01.sul.t-online.de!newsfeed00.sul.t-online.de!t-online.de!skynet.be!skynet.be!newspump.sol.net!dfw-peer.news.verio.net!phl-feed.news.verio.net!news.verio.net!news.ttsg.com!adamow@if.pw.edu.pl
From: Lukasz Adamowski <adamow@if.pw.edu.pl>
Newsgroups: rec.games.corewar
Subject: Let it snow, let it snow, let it snow...
Date: 4 Jan 2002 12:20:57 -0500
Organization: TTSG
Lines: 48
Distribution: world
Message-ID: <Pine.GUL.4.31.0201031846180.3918-100000@dingo.if.pw.edu.pl>
Reply-To: adamow@if.pw.edu.pl
NNTP-Posting-Host: odin.ttsg.com
X-Trace: odin.ttsg.com 1010164857 29948 216.231.111.29 (4 Jan 2002 17:20:57 GMT)
X-Complaints-To: abuse@news.ttsg.com
NNTP-Posting-Date: 4 Jan 2002 17:20:57 GMT
Originator: corewar-l@koth.org
Xref: news-rocq rec.games.corewar:13382

	Hi, guys!
	I've just come back from holiday. I was home and the thing I
mostly did there was throwing the snow out of my court-yard. When I
finished in the last corner the first one was already full. Now that was
just a fun!
	And at the moment I read all the post you've sent me since I left.
I noticed that someone (Uri Bruck AFAIR) mentioned about 2D core wars.
It's not a new idea. I used to work around it some time ago but left it
because of CMP problem and not-enough-free-time problem. Maybe some day I
will get to it once again and fix it. I promise I'll show you what I
think up but I truly don't know, when would it be. Maybe in June or later
or even never? Who knows?
	As for scanners I invented something recently. I mean scanning
engine. It uses 4 parallel processes and is 0.5c quick. The most advantage
is that it can run bombing without stopping scanning. The most
disadvantage is, I think, that if the first line is erased, it will surely
die. So it is rather to be a part of something bigger with more processes.
The version below isn't of course the best I wrote. You can improve it by
changing dat $0, $0 to dat {-5, <-6 or something to make it 0.25c imp
gated. This means you should find another place for bomb/scan
pointer, beacuse it's hold there. Bombing part below is only a one-shot
and it needs initializating of bombing pointer, but you may resolve this
part in any different way. So, the code:

;redcode
;name Pure Morning
;author Lukasz Adamowski
;assert CORESIZE==8000

start	spl	#30,	#-30
	add.f	$-1,	$1
	sne	$1,	$6
	dat	$0,	$0
	mov.f	$-2,	$-1
	sub.f	$-5,	$-2
	mov	$-3,	{-3
	mov	$-4,	<-4
	end	start

And I used no checking of target or pointer to find if the target is me or
not. Why? Because it's sure it's not. Maybe it's not the best step for
scanner, but it does work properly. The only problem is: HOW TO STOP IT?!
:)))

I believe it can be a good example for newbies to make some experiments.
Enjoy!
	Lukasz Adamowski

