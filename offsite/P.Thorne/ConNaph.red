;redcode
;name   Contorted Naph
;author Philip Thorne
;strategy Fizmo's Redcoders Frenzy [Random Rage] Entry #2
;strategy   Like Confused Moth [tried too many things and
;strategy   had nothing to show for it] but this time with 
;strategy   a not so good paper instead of a good stone. 
;strategy   Favours the scanner. Argh, it's this horrid.
;
;bench N&S+=143 [Jinx alone is 176]
;assert (CORESIZE>=800) && (CORESIZE<=69000)

;===========================================================

    for 17
        nop     1,          1
    rof

;===========================================================

    for 16
        dat     0,          0
    rof

;===========================================================
;Boot Paper

PBOOT   EQU     (pap1+1234)

wA
prep1:  mov.i   1,          >PBOOT-1
        spl     1,          {666
dest1:  spl     1,          >PBOOT
        mov.i   >boot1,     >dest1
        mov.i   >boot1,     >dest1
boot1:  jmp     @prep1,     pap1

;===========================================================

    for 13
        dat     0,          0
    rof

;===========================================================
;Jinx scanner [Christian Schmidt]
;10lines, start at top+1

scanner:
head:   spl    #-4,         3000
loop:   mov    head,        >head      ;start here
        add.f  step,        scan
scan:   seq    }4,          0
        mov.b  scan,        @loop
        djn    loop,        #950
step:   spl    #-152,       >-152
        mov    clr,         >head-5
        djn.f  -1,          >head-5
clr:    dat    1,           #18

;===========================================================

    for 9
        dat     0,          0
    rof

;===========================================================
;Paper [flap]
;8lines, start at top

P1      EQU     535 
P2      EQU     3875
P3      EQU     5160

pap1:   spl     @0,         >P1
        mov.i   }-1,        >-1
pap2:   spl     @0,         >P2
        mov.i   }-1,        >-1
b1:     mov.i   b2,         }pap1-P1
        mov.i   {pap2,      <pap3
pap3:   jmz.a   @0,         P3
b2:     mov.i   #1,         {1


;===========================================================

    for 6
        dat     0,          0
    rof

;===========================================================
;noideas pbrain [Ilmari Karonen].
;
; *** switch-on-loss p-brain ***
; 5 cycles on win/tie, 6 on loss

pflag   equ     496             ; If bw'd to self will give scanner - hope
                                ; is that brain-wash most likely by paper.
num     equ     5;2               ; fast

; pflag must not be the a-field of num-1 instructions after switch!

first:  ldp.ab  #pflag,     switch
        ldp.a   #0,         switch
        mod.ab  #num,       @first
switch  sne.a   >0,         0
        stp.ba  switch,     first
        djn.b   wA,         @first  ; asymmetric if num>2

;===========================================================
;Scanner boot. 
SBOOT    equ (-1532)

wB:     mov.i   head,       head+SBOOT
        spl     1,          {666
        mov.i   -1,         0
        mov.i   <sboot,     {sboot
        mov.i   <sboot,     {sboot
        mov.i   <sboot,     {sboot
        mod.x   #1,         #1
sboot:  jmp     @clr+1+SBOOT, clr+1

        dat     0,          0

    end first
;===========================================================

