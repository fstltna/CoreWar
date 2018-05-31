;redcode-88
;name men are from pMARS
;author Simon Wainwright
;strategy fill the core with cute little hearts
;strategy make love, not corewar!
;assert 1

        step         equ            1976
        step1        equ           -2088
        step2        equ            -896
        spl            1
        spl            1
        spl            1
        mov           <8,        <paper1
paper1  spl      @paper1,          step1
        mov           <8,        <paper2
paper2  spl      @paper2,          step2
        spl            0
clear   mov        heart,          <4467
        djn        clear,          <4042
heart   dat           <3,             <3
