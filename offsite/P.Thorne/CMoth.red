;redcode-94
;name   Confused Moth
;author Philip Thorne
;strategy John Metcalf's Spring/Summer 2002 Tournament 
;strategy  Round 4 [Extinction] Entry #2 Helicoverpa confusa
;strategy
;strategy   Switch-on-loss P-Spacer: Scanner & Stone, both booting
;strategy       Scanner is Jinx by Christian Schimdt
;strategy       Stone is from Recycled Bits by David M Moore
;strategy       Brain is from noideas by Ilmari Karonen
;strategy   My minor contribution is the mostly dual, but inefficient
;strategy   [by 3 instructions each component] boot. I had intended
;strategy   a vamp component too for occassional/varied brain-washing.
;strategy
;strategy   My benchmark has: CM=165, Jinx alone=172, RecBits=141
;strategy
;strategy   The name summarises my approach to this round.
;
;assert (CORESIZE==8000)
;ZZZassert MAXLENGTH==50

;noideas pbrain [Ilmari Karonen].
;
; *** switch-on-loss p-brain ***
; 5 cycles on win/tie, 6 on loss

pflag   equ     248             ; If bw'd to self will give scanner - hope
                                ; is that brain-wash most likely by paper.
num     equ     2               ; fast

; pflag must not be the a-field of num-1 instructions after switch!

first:  ldp.ab  #pflag,     switch
        ldp.a   #0,         switch
        mod.ab  #num,       @first
switch  sne.a   >0,         0
        stp.ba  switch,     first
        djn.b   wB,         @first  ; asymmetric if num>2

;=== boot
BOOT    equ (-2532)                     ;Stone boot

wA
ddd for 10
        mov.i   <boot,      {boot
    rof
boot:   spl     BOOT,       stone+10
        mul.x   {0,         }0
        dat     0,          0

;==
        dat     0,          0
        dat     0,          0
        dat     0,          0

;=== Stone from Recycled Bit's [David M. Moore]
;10lines, start at top

stone:
        SPL.B  #     0, {     0     ;start here
        SPL.B  #     0, < -2721     
        MOV.I  $     7, {  -162     
        MOV.I  $     6, @    -1     
        SUB.AB #    81, $    -2     
        DJN.F  $    -3, < -2725     
        dat 0,0
        dat 0,0
        dat 0,0
        DAT.F  < -2722, >     1     
;==
        dat     0,          0
        dat     0,          0

;=== Jinx scanner [Christian Schmidt]
;10lines, start at top+1
;This is the starting warrior

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

;==
        dat     0,          0
        dat     0,          0
;==
;Scanner boot. 
SBOOT    equ (-1532)
sBoot:  spl  SBOOT+(sBoot-boot), scanner+10+(sBoot-boot)
wB:     mov.i   head,       (sBoot-wB) + SBOOT-10
        mov.i   sBoot,      boot
        jmp     boot-9

