;redcode
;assert CORESIZE == 8000
;name rdrc: Sappy Harmonica
;author Dave Hillis
;strat -   Created using RedRace.c.
;strat -   An evolving population playing KOTH.
;strat -   Valentines Day contest 2015.
;strat -   Step bombs with imps, then joins them.
mov  <     0, $     2
spl  <     5, <     0
spl  $    -1, @     0
spl  $     0, $     0
spl  $     0, $     0
mov  $     4, $  3432 ; throw bomb
add  #     9, $    -1 ; add step
jmp  $    -2, $    -8
spl  $     0, $  -414
mov  $     0, <     1 ; imp / bomb
add  $   320, @     3
spl  $     0, $     0
jmp  $    -1, <     0
djn  $     0, #  -712
mov  $    14, $     4
end   3
