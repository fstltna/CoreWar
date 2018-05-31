From news-rocq!univ-lyon1.fr!pasteur.fr!oleane.net!oleane!news.maxwell.syr.edu!newsfeed.direct.ca!look.ca!newshub2.rdc1.sfba.home.com!news.home.com!news2.POSTED!not-for-mail Wed Nov 28 15:10:50 2001
Article: 13228 of rec.games.corewar
Path: news-rocq!univ-lyon1.fr!pasteur.fr!oleane.net!oleane!news.maxwell.syr.edu!newsfeed.direct.ca!look.ca!newshub2.rdc1.sfba.home.com!news.home.com!news2.POSTED!not-for-mail
Sender: David Moore <mooredav@cc1094850-a.roylok1.mi.home.com>
From: David Matthew Moore <mooredav@mac.com>
Subject: Fire and Ice II
Newsgroups: rec.games.corewar
Distribution: world
User-Agent: tin/1.4.5-20010409 ("One More Nightmare") (UNIX) (Darwin/1.4 (Power Macintosh))
Lines: 233
Message-ID: <hnUM7.55667$RI2.30319783@news2>
Date: Tue, 27 Nov 2001 22:23:09 GMT
NNTP-Posting-Host: 24.36.117.161
X-Complaints-To: abuse@home.net
X-Trace: news2 1006899789 24.36.117.161 (Tue, 27 Nov 2001 14:23:09 PST)
NNTP-Posting-Date: Tue, 27 Nov 2001 14:23:09 PST
Organization: Excite@Home - The Leader in Broadband http://home.com/faster
Xref: news-rocq rec.games.corewar:13228

M Joonas Pihlaja <jpihlaja@cc.helsinki.fi> wrote:
> 
> The time is ripe for stone/anti-imp-paper. (And if Gunnell will
> supply us with another batch of killer scanners, in your own
> time, please. ;-) )

I've got another idea.

Let's show some more love to the -94x big hill.

Pizza hills have been down for ages, so play
the hill with better parameters. Mod-anything step sizes!
More time for brainy pspace strategies!
Best of all, wimps can no longer hide behind
an aggressive quickscan!

Let me start by offering Fire and Ice II.
It's a big hill pspacer that switches between two strategies.

First is a stone. Borrowing from a hint posted to r.g.c,
it bombs with:

	mov -2019, 1

Another bomb is placed at -2019. When run, this expands to:

	mov -2019, 1
	mov -2019, 1
	dat 0, 0

After every 3rd cell has been bombed, then a dclear
cleans up the rest.

The other half of Fire and Ice II is an f-scanner.
To explain where this scanner came from, let's revisit KoFoCoTo.

In round 3 of the koth.org tournament, we jabbed at
an unpublished "black" warrior on its own special hill.
We could see score results, but not source code.

I hypothesized that Black Box contained a silk of the form:

	spl @0, }step
	mov }-1, >-1

I sent a warrior that tested for instructions like "spl @x, }y".
If it found any, then it would launch paper to tie the game;
otherwise, it would simply die.

The results for "spl @, }" were all ties. In this way, you can
test for the precense or absence of anything. Yes or No.

The next step was to determine the distance between
copies of the silk.

Q: Is it less than 10000 or more?
A: less

Q: Is it less than 5000 or more?
A: less

Q: Is it less than 2500 or more?
A: more

...

log_2 55440 = 15 questions. It took 15 submissions to determine
the silk copy distance. My entry, The Truth Is Out There,
could bomb all of the copies once it found the first one.

In retrospect, there's an easier way to do this.
Let the scanner read the step size during the battle.

Fire and Ice II scans for the first instruction
in any program it finds. If that instruction is an imp
or a silk, then it points to the next copy. F&I2
can folow the trail and SPL carpet all of the imps and silks
very quickly.

A brainwash trap is added at the end of each spl carpet:

	spl #0, 0
	spl #0, 0
        stp.ab >0, #0

The job is finished with a simple core clear:

	mov bomb, >gate
	jmp   -1, {gate

If an imp of the form "mov.i #x, step" reaches the gate,
then the first line will bomb two imps at once.
As long as it runs at least one time out of two,
then it is a 100% effective gate (although this scanner
doesn't need the gate much).

Here's the rest:


;redcode-94x
;name Fire and Ice II
;author David Moore
;strategy anti-imp scanner or stone with airbag
;assert CORESIZE==55440

org start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                           ;
;   airbag stone + dclear   ;
;                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

dDist  equ (dBoot+43990)
dGate  equ    -5
dStep  equ 53421  ;dStep % 3 == 0
dbPos  equ    11

dBoot  spl  dBoot2, >dDist+(dPtr-dTop)+dStep*1030
       spl       1, >dDist+(dPtr-dTop)+dStep*1033
       mov.i    {0, #0
       mov   {dSpl, <dAway1
       mov   {dSpl, <dAway2
       jmp }dAway1, >dBoot2
dAway1 dat dDist+1,  dDist+(dLast-dTop)+1

       dat 0, 0
       dat 0, 0

dDat   dat <27721, 5-dGate

dSpl   spl     #dLast+1, {dSpl+dGate+2
       mov dSpl+dGate+1, >dSpl+dGate
       djn.f         -1, >dSpl+dGate

dTop   add.ab #dStep*2, dPtr
       mov      >2,    @dPtr
dPtr   mov      <1,    *(dStep*2)
       jmn.b  dTop,     dTop+dbPos
dLast  jmp dPtr+dStep, <dGate-1

dBomb  mov dStep, 1

       dat 0, 0
       dat 0, 0

dBoot2 mov   dBomb,  dDist+dbPos
       spl       1, {dDist+(dPtr-dTop)+dStep*1036
       mov   {dSpl, <dAway1
dAway2 mov    dDat, <dDist+(dPtr-dTop)+dStep+3
       jmp >dAway1, <dAway2

  for 71
    dat 0,0
  rof

;;;;;;;;;;;;;;;
;             ;
;   P-Brain   ;
;             ;
;;;;;;;;;;;;;;;

pState equ 2001

start  ldp.a      #0,  pTab2
       ldp.a #pState,  pTable
       mod.ba *pTab2,  pTable
       stp.b *pTable, #pState
pTable jmp     }0, 155 ;= (22*7)+1 = (25*6)+5 = (31*5)+0
       spl #sBoot, 156 ;= (22*7)+2 = (26*6)+0 = (31*5)+1
       spl #sBoot,  37 ;= ( 5*7)+2 = ( 6*6)+1 = ( 7*5)+2
       spl #dBoot,  94 ;= (13*7)+3 = (15*6)+4 = (18*5)+4
       spl #dBoot,  59 ;= ( 8*7)+3 = ( 9*6)+5 = (11*5)+4
       spl #dBoot, 150 ;= (21*7)+3 = (25*6)+0 = (30*5)+0
       jmp #dBoot, 180 ;= (25*7)+5 = (30*6)+0 = (36*5)+0

       dat 0, 0
       dat 0, 0
       spl #1, 1

pTab2  spl #0, 6
       spl #0, 7
       spl #0, 5

  for 56
    dat 0,0
  rof

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                               ;
;   The Truth Is Out There II   ;
;                               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sDist equ 19241
sStep equ 13379
sTop  equ (sPtr-1)

sPtr   jmn.f #sStep-1, {sTop
sI1    sne.b  }sTop, *sTop
       mov.ab *sTop, *sTop
       jmz.b  sMain, *sTop
sI2    mov.ab  @sI1, @sI1
       add.ba *sTop, @sI1
       mov     sSpl, >sTop
       jmn.f     -1, @sTop
       mov    sWash, >sTop
sGate  slt.ab  @sI1, #27
sI3    jmn.f   sPtr, @sI2
sMain  add.a #sStep-1, sPtr
sStart jmz.f     -1, }sPtr
       mov.a   sPtr, @sI1
       jmn.a  sGate, *sI3
sSpl   spl   #0,  0
       mov    2, >sGate
       djn.f -1, {sGate
sBP    dat sPtr, 3-sGate
sWash  stp.ab >0, #0

       dat 0, 0

sBoot  mov }sBP, >sAway
       mov }sBP, >sAway
       mov }sBP, >sAway
       mov }sBP, >sAway
       mov }sBP, >sAway
       djn sBoot, #4
       spl *sAway,  >sBoot
sAway  mod.f #sDist+(sStart-sPtr), #sDist
       dat 0, 0

end



