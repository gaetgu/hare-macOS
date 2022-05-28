.text
.global _start
.p2align 4		/* This forces 4-bit alignment */
_start:
	mov x29, #0
	mov x30, #0
	mov x0, sp
	add sp, x0, #-16
	b rt.start_ha
