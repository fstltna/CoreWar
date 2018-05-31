;redcode-icws verbose
;name Fat Expansion
;author Philip Thorne (RM)
;strategy 05.10.02b Test derivative of a Robert Macrae prog/comments.
;strategy Roberts warrior, One Fat Lady, was a tournament winner
;strategy based on half of the '88 instructions. This isn't :-)
;
;         QS is virtually unchanged except fixed (?) attack/new bomb.
;         Slimmed-down the vamp pre-launch and re-introduced self-SPL
;         Better pit (nothing special - just using full '88 inst set)
;         Booting imp [Not] & pit. Breaking-up body during (slow) boot
;
;         Joint 8000 * 8192 version
;
;kill Fat Expansion
;assert (CORESIZE==8192) || (CORESIZE==8000)

; -------------------------------------------------------------

; QS based on my favourite "special tournament version of Sauron" [RM]

core    equ     (look+102)

look
qscan   for     6
          cmp  look+((qscan+2)*100)+3, look+(CORESIZE/2)+((qscan+2)*100)+3
          mov     #look+((qscan+2)*100)-point+3, @point
        rof

        cmp     #0, point
         jmp    found

qscan   for     7
         cmp  look+((qscan+10)*100)+3,look+(CORESIZE/2)+((qscan+10)*100)+3
          mov     #look+((qscan+10)*100)-point+3, @point
        rof

        cmp     #0, point
         jmp    found

qscan   for     7;8  
          cmp  look+((qscan+18)*100)+3, look+(CORESIZE/2)+((qscan+18)*100)+3
          mov     #look+((qscan+18)*100)-point+3, @point
        rof

        cmp     #0, point
         jmp     found
        jmp     boot

spb     DAT     <0, #-7         ;PBT

found   cmp     core, @point
         add     #(CORESIZE/2), point
        add     #(CORESIZE/2), point    ; point now points to hit
        mov     spb, @point
        add     #45, point
        cmp     core, @point    ; Scan at +45, and start
         add     #53, point     ; bombing at +45
        add     #-53, point     ; or -7

loop    mov     spb, <point     ; 40% bomber, backwards through
point   mov     spb, @0         ; his code
        add     #-14, point
        cmp     core, @point    ; Loop over whole target 
        jmp     loop, <-10      ; PBT, was point. Now really 40%
                                ; PBT removed #98 search

; ---------------------------------------------------------------

OFFS    equ     -199
OFFP    equ     (OFFS-1+20+(boot1-bootp)-3)
OFFI    equ     0
;OFFI    equ     52

FANGOFF equ     -41
STEPOFF equ     -42

for CORESIZE==8192
 STEP    equ     1396            ; PBT check opt for not hitting 5pt imp?
 ANTIIMP equ     2731            ;3-pt
 PADJ    equ     0
rof
for CORESIZE==8000
 STEP    equ     -2908           ; PBT check opt for not hitting 7pt imp?
 ANTIIMP equ     2667            ;3-pt
 PADJ   equ     -1
rof

boot    spl     bootimp
for OFFI!=0
        mov     imp,        imp+OFFI
rof

boot1   mov     evamp,      OFFS+2
        mov     evamp-1,    <boot1
        mov     evamp-2,    <boot1
        mov     evamp-3,    <boot1

        mov     fang,       boot1+OFFS+FANGOFF
        mov     step,       boot1+OFFS+STEPOFF

        spl     1                   ;2      ;Pre-load 18 processes [PBT]
        mov     -1,         0       ;3
        mov     -1,         0       ;5
        mov     -1,         0       ;9
        spl     @boot1
        jmp     @boot1,     <boot1+OFFS-1   ;B==Decoy maker [PBT]

fang    jmp     (pit+OFFP+(bootp-pit))-boot1-OFFS-FANGOFF-STEP, 0+STEP

                    ;PBT pre-SPL and SPL in place - compromise between
                    ;    quickly building processes and small profile.
                    ;    As bombs either side of vamp profile grows to
                    ;    5 regardless.
temp    spl     0,          <-32-ANTIIMP+9  ;PBT 9 for decoy
vamp    mov     FANGOFF,    @FANGOFF
        add     vamp+STEPOFF, vamp+FANGOFF
evamp   jmp     vamp,       <-35            ;PBT seems better before fang
step    dat     #-STEP,     #STEP

pit:    mov     bomb,       <boot1+STEPOFF-5+PADJ
        spl     -1
        spl     -2
epit    jmp     pit

bomb    DAT     #0,         #0  ;PBT not used, but seems to protect
                                ;following code ~ from scan attacks?

; -------------------------------------------

; Nimbus launch for 5 point, 10 process imp. Size is a
; better protection than speed here. Currently has tail
; on the end of my code; not elegant.

for CORESIZE==8192
 ISIZ   EQU     3277                    ; 5pt (2731 for 3pt)
rof
for CORESIZE==8000
 ISIZ   EQU     1143                    ; 7pt
rof

imp     MOV     0,          ISIZ

for CORESIZE==8192
bootimp SPL     1                       ;   2
        MOV     2,          0           ;   3
        MOV     1,          0           ;   5
        SPL     1                       ;   10
rof
for CORESIZE==8000
bootimp SPL     1                       ;   2
        SPL     1                       ;   4
        MOV     -1,         0           ;   7
        SPL     1                       ;   14
rof

        SPL     2
        JMP     @0,         imp+OFFI
        ADD     #ISIZ,      -1
        mov     <ANTIIMP-4, 0           ; PBT A for _if_ wimp gate bootimp+3

bootp   mov     epit,       OFFP+3
        mov     epit-1,     <-1
        mov     epit-2,     <-2
        mov     epit-3,     <-3

    END

