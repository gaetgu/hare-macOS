.section ".data.strdata.16", "a"
.balign 8
_strdata.16:
	.ascii "Assertion failed: tests/33-yield.ha:9:2"
/* end data */

.section ".data.strdata.23", "a"
.balign 8
_strdata.23:
	.ascii "Assertion failed: tests/33-yield.ha:11:1"
/* end data */

.section ".data.strdata.30", "a"
.balign 8
_strdata.30:
	.ascii "Assertion failed: tests/33-yield.ha:12:1"
/* end data */

.section ".text.basics", "ax"
_basics:
	stp	x29, x30, [sp, -96]!
	mov	x29, sp
	ldp	x29, x30, [sp], 96
	ret
/* end function basics */

.section ".data.strdata.45", "a"
.balign 8
_strdata.45:
	.ascii "Assertion failed: tests/33-yield.ha:20:2"
/* end data */

.section ".text.termination", "ax"
_termination:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	ldp	x29, x30, [sp], 48
	ret
/* end function termination */

.section ".data.strdata.68", "a"
.balign 8
_strdata.68:
	.ascii "tests/33-yield.ha:28:2"
/* end data */

.section ".data.strdata.72", "a"
.balign 8
_strdata.72:
	.ascii "Assertion failed: tests/33-yield.ha:28:1"
/* end data */

.section ".text.cast_lowering", "ax"
_cast_lowering:
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	add	x1, x29, #24
	mov	w0, #27413
	movk	w0, #0x418a, lsl #16
	str	w0, [x1]
	mov	x1, #4
	add	x0, x29, #24
	add	x1, x0, x1
	mov	w0, #10
	str	w0, [x1]
	ldp	x29, x30, [sp], 80
	ret
/* end function cast_lowering */

.section ".text.main", "ax"
.globl _main
_main:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x0, basics
	add	x0, x0, #:lo12:basics
	blr	x0
	adrp	x0, termination
	add	x0, x0, #:lo12:termination
	blr	x0
	adrp	x0, cast_lowering
	add	x0, x0, #:lo12:cast_lowering
	blr	x0
	ldp	x29, x30, [sp], 16
	ret
/* end function main */

