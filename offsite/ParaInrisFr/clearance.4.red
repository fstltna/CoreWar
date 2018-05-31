Path: news-rocq!jussieu.fr!oleane!news.maxwell.syr.edu!cyclone.bc.net!nntp.cs.ubc.ca!remarQ73!supernews.com!remarQ.com!news2.randori.com!not-for-mail
Message-ID: <379A10BC.48C3E9CC@nwonline.net>
From: Charles Oblender <charlesII@nwonline.net>
X-Mailer: Mozilla 4.51 [en] (Win98; I)
X-Accept-Language: en
MIME-Version: 1.0
Newsgroups: rec.games.corewar
Subject: Re: Beginner
References: <378f6ab2.42631388@news.iafrica.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Lines: 32
Date: Sat, 24 Jul 1999 15:15:08 -0400
NNTP-Posting-Host: 208.231.148.79
X-Trace: news2.randori.com 932843714 208.231.148.79 (Sat, 24 Jul 1999 12:15:14 PDT)
NNTP-Posting-Date: Sat, 24 Jul 1999 12:15:14 PDT
Xref: news-rocq rec.games.corewar:10440

Here's a bomber I wrote which is based on Dwarf and a core clear that I
stole from muteagen.

;redcode-b
;name clearance .4
;author Charles
;strategy Bombs core every 2 addreses then enters core clear.
;assert CORESIZE==8000

org dwarf
        spl 0, <2667  ;slow enemy processes down
dwarf   add #2, 3
        mov -2, @2
        djn -2, #3973  ;used as counter to keep from bombing self
clear   jmp a1, #12     ;falls through to core clear
ptr1    dat a1, c+100
a4      dat 0,  c+2+1
a3      dat 1, c+2+2
a2      spl #2, c+2+3         ; spl #X, <-Y acts like a split 0.
a1      spl #3, c+2+4         ; you can use x and Y as step values
        mov *ptr1, >ptr1        ; and use the decrement in the b-field
        mov *ptr1, >ptr1        ; as part of an imp gate.
        mov *ptr1, >ptr1        ; > (post-increment) keeps adding 1 to
c       djn.f -3, <4000         ; the b-field of ptr1 to move the bomb
                             ; through core.
        end


any suggestions?



