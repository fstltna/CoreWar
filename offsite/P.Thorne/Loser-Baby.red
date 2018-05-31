;redcode
;name Loser Baby
;strategy Put Loser to Shame
;strategy Password=STOPFAIL (!)
;password STOPFAIL
;kill Loser Baby
;author PBT
;assert 1

        dat     #1248,  #1357
start:  jmz     #3,     }0
        sne     -2,     {-1
        jmp     #1248,  #1357

    end start

