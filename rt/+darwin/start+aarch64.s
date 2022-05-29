.text
.global _start
.p2align 4		/* This forces 4-bit alignment. Probably a bad idea, but THIS IS HOW WE GOT TO THE MOON! BAD IDEAS! */
_start:
	mov x29, #0
	mov x30, #0
	mov x0, sp
	add sp, x0, #-16
	b rt.start_ha
