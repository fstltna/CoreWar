;name   gate c-c2
;assert 1
gate1   equ     (gate-5)
	org     start
for 10
	dat 0,0
rof
	dat     -5,   100
gate    dat     -5,   jump-gate1+5
	spl     #-5,  jump-gate1+5 
for 10
	dat     0,0
rof
start   spl     #-10,#10
	mov     @jump,>gate1
	mov     @jump,>gate1
jump    djn     start+1,{gate+1
