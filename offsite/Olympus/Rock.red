;redcode
;author Scott Nelson
;name Rock
;strategy sort of Dwarf with bigger steps.
 
rock	add	s,	p
p	mov	<1,	2
	jmp	rock
	dat		#0
s	dat	#5084,	#-5084
	end	rock
