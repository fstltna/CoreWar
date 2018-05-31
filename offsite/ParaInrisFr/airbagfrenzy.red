From news-rocq!jussieu.fr!fr.usenet-edu.net!usenet-edu.net!arclight.uoregon.edu!logbridge.uoregon.edu!newsfeed.direct.ca!look.ca!feed.news.qwest.net!dfw-peer.news.verio.net!phl-feed.news.verio.net!news.verio.net!news.ttsg.com!jpihlaja@cc.helsinki.fi Mon Nov 26 09:42:00 2001
Article: 13216 of rec.games.corewar
Path: news-rocq!jussieu.fr!fr.usenet-edu.net!usenet-edu.net!arclight.uoregon.edu!logbridge.uoregon.edu!newsfeed.direct.ca!look.ca!feed.news.qwest.net!dfw-peer.news.verio.net!phl-feed.news.verio.net!news.verio.net!news.ttsg.com!jpihlaja@cc.helsinki.fi
From: M Joonas Pihlaja <jpihlaja@cc.helsinki.fi>
Newsgroups: rec.games.corewar
Subject: Re: new warrior
Date: 25 Nov 2001 16:25:46 -0500
Organization: TTSG
Lines: 88
Distribution: world
Message-ID: <Pine.OSF.4.30.0111252129120.28503-100000@vesuri.Helsinki.FI>
Reply-To: jpihlaja@cc.helsinki.fi
NNTP-Posting-Host: odin.ttsg.com
X-Trace: odin.ttsg.com 1006723546 13759 216.231.111.29 (25 Nov 2001 21:25:46 GMT)
X-Complaints-To: abuse@news.ttsg.com
NNTP-Posting-Date: 25 Nov 2001 21:25:46 GMT
Originator: corewar-l@koth.org
Xref: news-rocq rec.games.corewar:13216


On Sat, 24 Nov 2001, grabek wrote:

> 	the reason why i didnt put spl 0 before main loop is that i
> wanted it to be _quick_. having more proceses makes one harder to
> kill, but slows the warrior down. i wanted quick bombing raid and then
> clear.

Yeah, OK. (Though as pvk pointed out the speed penalty isn't all
that bad and reduces as time goes on.)

Anyway, I tested the airbag hypothesis, and while it does seem to
help (120 points vs. 118 unmodified), it doesn't solve the
problem with stone/imps (except Blacken).  Here's the code:

;redcode-94nop
;name airbag frenzy
;author Lukasz Grabun
;strategy testing the airbag hypothesis (mjp)
;assert 1

gate	equ	(top-4)
step	equ	2936 ; 2930

top
	add	#2*step,ptr
	mov	stun,@ptr
ptr	mov	}ck,@ck-1
	jmz.a	top,{ck
ck stun	spl	#0,step
	mov	bmb,>gate
	djn.f	-1,>gate
bmb	dat	<-5,2-gate


z for MAXLENGTH-CURLINE-7
  dat 0,0
rof
go	spl	2
psrc	spl	2,top+10
pdest	spl	1,top+10+2000
	mov	<psrc, <pdest
	mov	<psrc, <pdest
	djn	>pdest,#5
	jmp	top+2001
	end	go

I'm not exactly sure what the problem is, except that the spl #0
bomb isn't stunning the opponent's components for long enough or
well enough.  Consider the difference to Behemot's bombs:

	spl #2,-X
	mov @0,}-1
and
	jmp X	; jump to a spl/mov bomb.

If the jmp falls in a loop (even on the last instruction, or a
top spl #0 of a stone), then the opponent should be stunned
effectively quite soon.  This works for basically any live
processes, even if they aren't executed very often.  Ditto for
the spl/mov pair, assuming it isn't mangled by the loop.

A single spl #0 stun bomb is really only effective when it lands
*within* a frequently executed loop.  Landing on the looping
instruction may work, but may cause the opponent to move to its
second phase, without really hampering it.  Landing on a leading
spl instruction of a stone is useless unless it contains
important data, and even then the effect is unpredictable.

Even the benign looking mov.i #0,1 bomb used by Recount is
probably more effective in stunning a stone, since it does its
thing regardless of where it lands in the stone's code.

Something just occured to me about the airbag:  since only the
looping instruction is unprotected from dat bombing, only 3/4 of
the loop is protected.  In a tornado-like bomber, or a bomber
with a bigger payload, it would be better protected.  Hm... time
to have a better look at what Behemot does.

> 	i managed to put my warrior on nop hill; however i dont belive
> if it will stay there for long.

Congratulations!  (It's a huge rush, isn't it?  My first warrior
on -94 had a short and euphoric life too. :) )


Joonas



