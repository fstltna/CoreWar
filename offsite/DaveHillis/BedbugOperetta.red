;redcode
;assert CORESIZE == 8000
;name rdrc: Bedbug Operetta
;author Dave Hillis
;strat -   Created using RedRace.c.
;strat -   An evolving population playing KOTH.
;strat -   Valentines Day contest 2015.
;strat -   Evolved paper.
add  $    -5, $  -500 ; junk code
mov  @     2, $ -2405 ; junk code
mov  <     6, <     1 ; copy
spl  $    -1, $  3898
mov  <    99, <    -4 ; core clear
spl  @    -2, $     0 ; split to copy
jmp  $    -4, $     0
dat  #     0, #     1 ; junk code
jmn  $     2, @     9 ; holds constant
end   3
