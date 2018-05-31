;name Pb(3)NeO(3)
;author Philip Thorne
;strategy Entry for Neogryzor's mini-challenge #3
;strategy Revision A. Still watch'n'wack but smaller.
;strategy Revision B. Reduce scan offset == %++
;strategy Revision C. Place mov before jmz, now 3lines.
;strategy Revision D. Non-exhaustive tweak of 'irrelevent' modifier,
;strategy             consts for better score :-)
;startegy               pmars -f -b -r 10000 == 99.90% wins
;assert CORESIZE==8000

bmb:    mov.i   }0,     <1
lurk:   jmz.b   #88,    -2-2667-1
        jmp.f   *bmb

    end lurk

