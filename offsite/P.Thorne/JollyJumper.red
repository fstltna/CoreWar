;redcode-94
;name Jolly Jumper
;author Philip Thorne [PVK/JM]
;strategy John Metcalf's Spring/Summer 2002/3 Tournament 
;strategy  Round 5 [Tri-Athelon] Entry #2 Jolly Jumper
;strategy
;strategy   This is steal of nPaperII [Paul-V Khoung & John Metcalf]
;strategy   with the QS replaced by a QB for Round 5 as my imp-stone
;strategy   effort [Rataplan] is lamentable [~85 vs R5 benchmark]
;strategy   Hurts Digitals and Vanquisher so should be a plus.
;strategy
;strategy   MERITLESS COPY - SHOULDN'T BE SUBMITTED TO THE KOENIGSTUHL!
;strategy
;strategy   R5 benchmark result over 400 rounds~122 [QB made it worse?]
;strategy       http://lcg-www.uia.ac.be/~erikt/comics/luke.html
;
;assert CORESIZE==8000

;This is nPaperII - same constants, everything
     pStep1 equ 560
     pStep2 equ 2680
     pStep3 equ -1120

     x equ -3781
     y equ -2013

pGo: spl   1,      >424
     spl   1,      {761
     spl   1,      {933
     mov   {pap1,  {pBoo
pBoo:spl   pEnd+4000,{2093
pap1:spl   @pEnd,  <pStep1
     mov.i }pap1,  >pap1
pap2:spl   @0,     {pStep2
     mov.i }pap2,  >pap2
     mov.i #1,     {1
     mov   x,      <y
     mov.i {pap2,  <pap3
pap3:jmz.a @0,     pStep3
pEnd:dat    0,      0

    for MAXLENGTH-CURLINE-20
        dat     0,                  0
    rof

;QB replacement for nPaperII's QS [to avoid add/sub]
;--
JCNT    EQU     (18)
JSTEP   EQU     ((CORESIZE - MAXLENGTH) / JCNT)
start:
J   for JCNT
        mov.i   qbmb,               <(JSTEP*J)+(start)
    rof
        jmp     pGo,                {0
qbmb:   dat     >0,                 >-1

;--
    end start

