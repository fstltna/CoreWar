;redcode-94
;name   Dire Wolf
;author Philip Thorne
;strategy John Metcalf's Spring/Summer 2002 Tournament 
;strategy  Round 4 [Extinction] Entry #1 Canis Dirus
;strategy
;strategy   One-Shot scanner with S/S/D clear.
;strategy   I assume 1/2 the entrants will be p-spacers as that's 
;strategy   max limit under the rules for the round, and that these
;strategy   will have the long-term advantage over the rest so this
;strategy   is my backup/to-die/to-help warrior.
;
;strategy   I choose a 1-shot so as to take advantage of hopefully denser
;strategy   than usual warriors [given use of -l 50] and to catch slow 
;strategy   p-spacers.
;
;strategy   My R4 benchmark has DW=142. 
;strategy       http://www.museum.state.il.us/exhibits/larson/canis.html
;
;assert (CORESIZE==8000)
;ZZZassert (MAXLENGTH==50)

STEP    EQU (-2673)             ;mod-1 ~ 19
GAP     EQU 9                   ;GAP/OFF/ADJ are dev hangovers
OFF     EQU 17                  ; didn't get to clean them up
ADJ     EQU (-1)

;quiz-based clear
zptr:   dat.f   clr,            (ptr-zptr)-MAXLENGTH
        dat.f   <-15,           20
        dat.f   <-15,           20
clr:    spl     #-2670,         30
        mov.i   @2,             >zptr
        mov.i   @1,             >zptr
        djn.b   -2,             {clr

    for 4
        dat     0,              0
    rof

;find
scan:   add.f   incr,           ptr
ptr:    sne.i   scan+STEP-ADJ+OFF,  scan+STEP-ADJ+OFF+GAP
        djn.f   scan,           @ptr        ;would think <ptr better
        add.b   ptr,            zptr
ztr:    mov.i   clr,            <ptr        ;would think @ptr better
qtr:    jmp     *0,             {0

    for MAXLENGTH-CURLINE-5
        dat     0,              0
    rof

incr:   dat #STEP+ADJ,      #STEP+ADJ

    end scan

