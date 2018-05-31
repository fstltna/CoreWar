From news-rocq!jussieu.fr!news.crihan.fr!univ-rennes1.fr!univ-angers.fr!enst!freenix!fr.clara.net!heighliner.fr.clara.net!esplande3000.net!isdnet!sn-xit-02!supernews.com!postnews1.google.com!not-for-mail Thu Feb 14 14:02:51 2002
Article: 13500 of rec.games.corewar
Path: news-rocq!jussieu.fr!news.crihan.fr!univ-rennes1.fr!univ-angers.fr!enst!freenix!fr.clara.net!heighliner.fr.clara.net!esplande3000.net!isdnet!sn-xit-02!supernews.com!postnews1.google.com!not-for-mail
From: pk6811s@acad.drake.edu (P. Kline)
Newsgroups: rec.games.corewar
Subject: RevivalFire
Date: 13 Feb 2002 14:18:14 -0800
Organization: http://groups.google.com/
Lines: 72
Message-ID: <92b0a3d6.0202131418.b44476d@posting.google.com>
NNTP-Posting-Host: 207.28.195.56
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Trace: posting.google.com 1013638697 23892 127.0.0.1 (13 Feb 2002 22:18:17 GMT)
X-Complaints-To: groups-abuse@google.com
NNTP-Posting-Date: 13 Feb 2002 22:18:17 GMT
Xref: news-rocq rec.games.corewar:13500

Hope this does well on Koenigstuhl :-)

;redcode-94nop
;name Revival Fire
;kill Revival Fire
;author P.Kline
;assert CORESIZE == 8000
;strategy ok, it's Airbag
;strategy changed to use imp-bombs; tweaked spacing, step and placement
;strategy imp failsafe (against nPaper) like Recount
;bmb1 (simple imp) is effective against stone-imps
;bmb2 kills scanners immediately but turns into an imp in a few cycles
;one-two stone is improved by gathering all its parts closer together
;imp carpets are separated and moved away from home

step            equ     335

one             add.f   incr    ,ptr    ; part 1 of .5c bomber
                mov.i   bmb2    ,*ptr
                jmz.f   one     ,>check ; airbag check
                jmp     imps1   ,<cptr
check           dat.f   0,0
incr            dat     #step*3 ,step*3
bmb2            mov     step*16 ,1      ; kills scanners immediately
bmb1            mov.i   #step   ,1      ; stuns spl-loops, delays paper
            for 12
                dat.f   0,0
            rof
two             mov.i   bmb1    ,@ptr   ; part 2 of .5c bomber
ptr             mov.i   check+4*step,*check+5*step
                jmz.f   two     ,<check ; airbag check
;break
                djn.f   imps2   ,<check+5
            for 16
                dat.f   0,0
            rof
                dat.f   0,0
cptr            dat.f   0       ,4000
                dat.f   0,0
cbmb1           dat.f   <5335   ,(finish+8-cptr)
                dat.f   0,0
finish          spl     #0
                spl     #0      ,<cptr+1      ; d-clear to finish
                mov.i   cbmb1   ,>cptr
                djn.f   -1      ,>cptr
                mov.i   #step   ,1
            for 20
                dat.f   0,0
            rof
impst1          equ     (check+221)
impst2          equ     (check+132)
imps2           spl     >finish   ,<check+8     ; continuous imp launcher
                spl      #0      ,<check+4     ; "<" to kill runaway imps
                add.a   #2668    ,1
                djn.f   impst2-2668,<check+16
            for 11
                dat.f   0,0
            rof
imps1           spl     finish   ,<cbmb1       ; continuous imp launcher
                spl     #0       ,<cptr
                add.f   #2668    ,1
                jmp     impst1-2668,<-5000
            for 5
                dat.f   0,0
            rof
imp1            mov.i   #500,2667
start           spl     one  ,impst1+4        ; start bomber 1
                spl     two  ,impst2+4        ; start bomber 2
                mov     imp1 ,<-2
                mov     imp1 ,<-2
                djn     -2   ,#4
                end     start


