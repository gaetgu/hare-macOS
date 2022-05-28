.section ".text.rt.segmalloc", "ax"
_rt.segmalloc:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x1, x0
	mov	x5, #0
	mov	w4, #-1
	mov	w3, #4098
	mov	w2, #3
	mov	x0, #0
	adrp	x6, rt.mmap
	add	x6, x6, #:lo12:rt.mmap
	blr	x6
	cmn	w0, #12
	bne	.L3
	mov	x0, #0
.L3:
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.segmalloc */

.section ".text.rt.segfree", "ax"
_rt.segfree:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x2, rt.munmap
	add	x2, x2, #:lo12:rt.munmap
	blr	x2
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.segfree */

.section ".text.rt.write", "ax"
.globl _rt.write
_rt.write:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x3, x2
	mov	x2, x1
	sxtw	x1, w0
	mov	x0, #4
	adrp	x4, rt.syscall3
	add	x4, x4, #:lo12:rt.syscall3
	blr	x4
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.write */

.section ".text.rt.close", "ax"
.globl _rt.close
_rt.close:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	sxtw	x1, w0
	mov	x0, #6
	adrp	x2, rt.syscall1
	add	x2, x2, #:lo12:rt.syscall1
	blr	x2
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.close */

.section ".text.rt.dup2", "ax"
.globl _rt.dup2
_rt.dup2:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	w18, w1
	mov	w1, w0
	mov	w0, w18
	sxtw	x1, w1
	sxtw	x2, w0
	mov	x0, #90
	adrp	x3, rt.syscall2
	add	x3, x3, #:lo12:rt.syscall2
	blr	x3
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.dup2 */

.section ".text.rt.getpid", "ax"
.globl _rt.getpid
_rt.getpid:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x0, #20
	adrp	x1, rt.syscall0
	add	x1, x1, #:lo12:rt.syscall0
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.getpid */

.section ".text.rt.exit", "ax"
.globl _rt.exit
_rt.exit:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	sxtw	x1, w0
	mov	x0, #1
	adrp	x2, rt.syscall1
	add	x2, x2, #:lo12:rt.syscall1
	blr	x2
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.exit */

.section ".text.rt.fork", "ax"
.globl _rt.fork
_rt.fork:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x0, #2
	adrp	x1, rt.syscall0
	add	x1, x1, #:lo12:rt.syscall0
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.fork */

.section ".text.rt.execve", "ax"
.globl _rt.execve
_rt.execve:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x3, x2
	mov	x2, x1
	mov	x1, x0
	mov	x0, #59
	adrp	x4, rt.syscall3
	add	x4, x4, #:lo12:rt.syscall3
	blr	x4
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.execve */

.section ".text.rt.wait4", "ax"
.globl _rt.wait4
_rt.wait4:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x4, x3
	mov	x18, x2
	mov	x2, x0
	mov	x0, x18
	mov	x18, x1
	mov	x1, x2
	mov	x2, x18
	sxtw	x1, w1
	sxtw	x3, w0
	mov	x0, #7
	adrp	x5, rt.syscall4
	add	x5, x5, #:lo12:rt.syscall4
	blr	x5
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.wait4 */

.section ".text.rt.wifexited", "ax"
.globl _rt.wifexited
_rt.wifexited:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x1, rt.wtermsig
	add	x1, x1, #:lo12:rt.wtermsig
	blr	x1
	cmp	w0, #0
	cset	w0, eq
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.wifexited */

.section ".text.rt.wexitstatus", "ax"
.globl _rt.wexitstatus
_rt.wexitstatus:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	w1, #65280
	and	w0, w0, w1
	mov	w1, #8
	asr	w0, w0, w1
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.wexitstatus */

.section ".text.rt.wtermsig", "ax"
.globl _rt.wtermsig
_rt.wtermsig:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	w1, #127
	and	w0, w0, w1
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.wtermsig */

.section ".text.rt.wifsignaled", "ax"
.globl _rt.wifsignaled
_rt.wifsignaled:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	w19, w0
	adrp	x1, rt.wtermsig
	add	x1, x1, #:lo12:rt.wtermsig
	blr	x1
	mov	w1, w0
	mov	w0, w19
	cmp	w1, #127
	cset	w1, ne
	cmp	w1, #0
	beq	.L43
	mov	w19, w0
	adrp	x1, rt.wtermsig
	add	x1, x1, #:lo12:rt.wtermsig
	blr	x1
	mov	w1, w0
	mov	w0, w19
	cmp	w1, #0
	cset	w1, ne
.L43:
	cmp	w1, #0
	bne	.L45
	mov	w0, w1
	b	.L46
.L45:
	cmp	w0, #19
	cset	w0, ne
.L46:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function rt.wifsignaled */

.section ".text.rt.kill", "ax"
.globl _rt.kill
_rt.kill:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	w18, w1
	mov	w1, w0
	mov	w0, w18
	sxtw	x1, w1
	sxtw	x2, w0
	mov	x0, #37
	adrp	x3, rt.syscall2
	add	x3, x3, #:lo12:rt.syscall2
	blr	x3
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.kill */

.section ".text.rt.pipe2", "ax"
.globl _rt.pipe2
_rt.pipe2:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x18, x1
	mov	x1, x0
	mov	x0, x18
	sxtw	x2, w0
	mov	x0, #542
	adrp	x3, rt.syscall2
	add	x3, x3, #:lo12:rt.syscall2
	blr	x3
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.pipe2 */

.section ".text.rt.mmap", "ax"
.globl _rt.mmap
_rt.mmap:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x6, x5
	mov	x18, x4
	mov	x4, x0
	mov	x0, x18
	mov	x18, x3
	mov	x3, x4
	mov	x4, x18
	mov	x18, x2
	mov	x2, x3
	mov	x3, x18
	mov	x18, x1
	mov	x1, x2
	mov	x2, x18
	mov	w3, w3
	mov	w4, w4
	sxtw	x5, w0
	mov	x0, #477
	adrp	x7, rt.syscall6
	add	x7, x7, #:lo12:rt.syscall6
	blr	x7
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.mmap */

.section ".text.rt.munmap", "ax"
.globl _rt.munmap
_rt.munmap:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x2, x1
	mov	x1, x0
	mov	x0, #73
	adrp	x3, rt.syscall2
	add	x3, x3, #:lo12:rt.syscall2
	blr	x3
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.munmap */

.section ".data.strdata.212", "a"
.balign 8
_strdata.212:
	.ascii "Abort: "
/* end data */

.section ".data.strdata.226", "a"
.balign 8
_strdata.226:
	.byte 10
/* end data */

.section ".text.rt.abort", "ax"
.globl _rt.abort
_rt.abort:
	stp	x29, x30, [sp, -176]!
	mov	x29, sp
	str	x19, [x29, 168]
	add	x2, x29, #112
	adrp	x1, strdata.212
	add	x1, x1, #:lo12:strdata.212
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #112
	add	x1, x1, x2
	mov	x2, #7
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #7
	str	x1, [x2]
	add	x2, x29, #88
	adrp	x1, strdata.212
	add	x1, x1, #:lo12:strdata.212
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #88
	add	x1, x1, x2
	mov	x2, #7
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #7
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #88
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #88
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #88
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	x19, x0
	add	x0, x29, #64
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x1, x0
	mov	x0, x19
	mov	x3, #8
	add	x2, x29, #88
	add	x2, x2, x3
	ldr	x2, [x2]
	mov	x19, x0
	mov	w0, #2
	adrp	x3, rt.write
	add	x3, x3, #:lo12:rt.write
	blr	x3
	mov	x0, x19
	mov	x1, #16
	add	x1, x0, x1
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x1, #8
	add	x1, x0, x1
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x1, #0
	add	x1, x0, x1
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x19, x0
	add	x0, x29, #40
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x1, x0
	mov	x0, x19
	mov	x2, #8
	add	x0, x0, x2
	ldr	x2, [x0]
	mov	w0, #2
	adrp	x3, rt.write
	add	x3, x3, #:lo12:rt.write
	blr	x3
	add	x1, x29, #136
	adrp	x0, strdata.226
	add	x0, x0, #:lo12:strdata.226
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #136
	add	x0, x0, x1
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	mov	x0, #1
	str	x0, [x1]
	mov	x1, #16
	add	x0, x29, #136
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #136
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #8
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #0
	add	x0, x29, #136
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #0
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	add	x0, x29, #16
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x1, x0
	mov	x2, #1
	mov	w0, #2
	adrp	x3, rt.write
	add	x3, x3, #:lo12:rt.write
	blr	x3
	adrp	x0, rt.getpid
	add	x0, x0, #:lo12:rt.getpid
	blr	x0
	mov	w1, #6
	adrp	x2, rt.kill
	add	x2, x2, #:lo12:rt.kill
	blr	x2
	ldr	x19, [x29, 168]
	ldp	x29, x30, [sp], 176
	ret
/* end function rt.abort */

.section ".data.strdata.230", "a"
.balign 8
_strdata.230:
	.ascii "slice or array access out of bounds"
/* end data */

.section ".data.strdata.231", "a"
.balign 8
_strdata.231:
	.ascii "type assertion failed"
/* end data */

.section ".data.strdata.232", "a"
.balign 8
_strdata.232:
	.ascii "out of memory"
/* end data */

.section ".data.strdata.233", "a"
.balign 8
_strdata.233:
	.ascii "static append exceeds slice capacity"
/* end data */

.section ".data.strdata.234", "a"
.balign 8
_strdata.234:
	.ascii "unreachable code"
/* end data */

.section ".data.rt.reasons", "a"
.balign 8
_rt.reasons:
	.quad _strdata.230+0
	.quad 35
	.quad 35
	.quad _strdata.231+0
	.quad 21
	.quad 21
	.quad _strdata.232+0
	.quad 13
	.quad 13
	.quad _strdata.233+0
	.quad 36
	.quad 36
	.quad _strdata.234+0
	.quad 16
	.quad 16
/* end data */

.section ".data.strdata.242", "a"
.balign 8
_strdata.242:
	.ascii "Abort: "
/* end data */

.section ".data.strdata.249", "a"
.balign 8
_strdata.249:
	.ascii ": "
/* end data */

.section ".data.strdata.273", "a"
.balign 8
_strdata.273:
	.ascii "rt/abort.ha:24:3"
/* end data */

.section ".data.strdata.282", "a"
.balign 8
_strdata.282:
	.ascii "rt/abort.ha:24:5"
/* end data */

.section ".data.strdata.288", "a"
.balign 8
_strdata.288:
	.byte 10
/* end data */

.section ".text.rt.abort_fixed", "ax"
.globl _rt.abort_fixed
_rt.abort_fixed:
	stp	x29, x30, [sp, -368]!
	mov	x29, sp
	str	x19, [x29, 360]
	str	x20, [x29, 352]
	mov	w19, w1
	add	x2, x29, #208
	adrp	x1, strdata.242
	add	x1, x1, #:lo12:strdata.242
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #208
	add	x1, x1, x2
	mov	x2, #7
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #7
	str	x1, [x2]
	add	x2, x29, #184
	adrp	x1, strdata.242
	add	x1, x1, #:lo12:strdata.242
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #184
	add	x1, x1, x2
	mov	x2, #7
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #7
	str	x1, [x2]
	add	x2, x29, #256
	adrp	x1, strdata.249
	add	x1, x1, #:lo12:strdata.249
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #256
	add	x1, x1, x2
	mov	x2, #2
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #2
	str	x1, [x2]
	add	x2, x29, #232
	adrp	x1, strdata.249
	add	x1, x1, #:lo12:strdata.249
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #232
	add	x1, x1, x2
	mov	x2, #2
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #2
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #184
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #184
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #184
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	x20, x0
	add	x0, x29, #64
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x1, x0
	mov	x0, x20
	mov	x3, #8
	add	x2, x29, #184
	add	x2, x2, x3
	ldr	x2, [x2]
	mov	x20, x0
	mov	w0, #2
	adrp	x3, rt.write
	add	x3, x3, #:lo12:rt.write
	blr	x3
	mov	x0, x20
	mov	x1, #16
	add	x1, x0, x1
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x1, #8
	add	x1, x0, x1
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x1, #0
	add	x1, x0, x1
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x20, x0
	add	x0, x29, #40
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x1, x0
	mov	x0, x20
	mov	x2, #8
	add	x0, x0, x2
	ldr	x2, [x0]
	mov	w0, #2
	adrp	x3, rt.write
	add	x3, x3, #:lo12:rt.write
	blr	x3
	mov	x1, #16
	add	x0, x29, #232
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #232
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #8
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #0
	add	x0, x29, #232
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #0
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	add	x0, x29, #16
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x1, x0
	mov	x2, #8
	add	x0, x29, #232
	add	x0, x0, x2
	ldr	x2, [x0]
	mov	w0, #2
	adrp	x3, rt.write
	add	x3, x3, #:lo12:rt.write
	blr	x3
	sxtw	x0, w19
	mov	x1, #24
	mul	x2, x0, x1
	adrp	x1, rt.reasons
	add	x1, x1, #:lo12:rt.reasons
	add	x20, x1, x2
	cmp	x0, #5
	bcc	.L65
	add	x1, x29, #280
	adrp	x0, strdata.273
	add	x0, x0, #:lo12:strdata.273
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #280
	add	x0, x0, x1
	mov	x1, #16
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	mov	x0, #16
	str	x0, [x1]
	mov	x1, #16
	add	x0, x29, #280
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x29, #88
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #280
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #8
	add	x1, x29, #88
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #0
	add	x0, x29, #280
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #0
	add	x1, x29, #88
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #0
	add	x0, x29, #88
	adrp	x2, rt.abort_fixed
	add	x2, x2, #:lo12:rt.abort_fixed
	blr	x2
.L65:
	mov	x0, #16
	add	x0, x20, x0
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x29, #112
	add	x1, x1, x2
	str	x0, [x1]
	mov	x0, #8
	add	x0, x20, x0
	ldr	x0, [x0]
	mov	x2, #8
	add	x1, x29, #112
	add	x1, x1, x2
	str	x0, [x1]
	mov	x0, #0
	add	x0, x20, x0
	ldr	x0, [x0]
	mov	x2, #0
	add	x1, x29, #112
	add	x1, x1, x2
	str	x0, [x1]
	add	x0, x29, #112
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x1, x0
	sxtw	x0, w19
	mov	x2, #24
	mul	x3, x0, x2
	adrp	x2, rt.reasons
	add	x2, x2, #:lo12:rt.reasons
	add	x19, x2, x3
	cmp	x0, #5
	bcc	.L67
	add	x2, x29, #304
	adrp	x0, strdata.282
	add	x0, x0, #:lo12:strdata.282
	str	x0, [x2]
	mov	x2, #8
	add	x0, x29, #304
	add	x0, x0, x2
	mov	x2, #16
	str	x2, [x0]
	mov	x2, #8
	add	x2, x0, x2
	mov	x0, #16
	str	x0, [x2]
	mov	x2, #16
	add	x0, x29, #304
	add	x0, x0, x2
	ldr	x0, [x0]
	mov	x3, #16
	add	x2, x29, #136
	add	x2, x2, x3
	str	x0, [x2]
	mov	x2, #8
	add	x0, x29, #304
	add	x0, x0, x2
	ldr	x0, [x0]
	mov	x3, #8
	add	x2, x29, #136
	add	x2, x2, x3
	str	x0, [x2]
	mov	x2, #0
	add	x0, x29, #304
	add	x0, x0, x2
	ldr	x0, [x0]
	mov	x3, #0
	add	x2, x29, #136
	add	x2, x2, x3
	str	x0, [x2]
	mov	x20, x1
	mov	x1, #0
	add	x0, x29, #136
	adrp	x2, rt.abort_fixed
	add	x2, x2, #:lo12:rt.abort_fixed
	blr	x2
	mov	x1, x20
.L67:
	mov	x0, #8
	add	x0, x19, x0
	ldr	x2, [x0]
	mov	w0, #2
	adrp	x3, rt.write
	add	x3, x3, #:lo12:rt.write
	blr	x3
	add	x1, x29, #328
	adrp	x0, strdata.288
	add	x0, x0, #:lo12:strdata.288
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #328
	add	x0, x0, x1
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	mov	x0, #1
	str	x0, [x1]
	mov	x1, #16
	add	x0, x29, #328
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x29, #160
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #328
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #8
	add	x1, x29, #160
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #0
	add	x0, x29, #328
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #0
	add	x1, x29, #160
	add	x1, x1, x2
	str	x0, [x1]
	add	x0, x29, #160
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x1, x0
	mov	x2, #1
	mov	w0, #2
	adrp	x3, rt.write
	add	x3, x3, #:lo12:rt.write
	blr	x3
	adrp	x0, rt.getpid
	add	x0, x0, #:lo12:rt.getpid
	blr	x0
	mov	w1, #6
	adrp	x2, rt.kill
	add	x2, x2, #:lo12:rt.kill
	blr	x2
	ldr	x19, [x29, 360]
	ldr	x20, [x29, 352]
	ldp	x29, x30, [sp], 368
	ret
/* end function rt.abort_fixed */

.section ".text.rt.constchar", "ax"
_rt.constchar:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x0, [x0]
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.constchar */

.section ".data.strdata.329", "a"
.balign 8
_strdata.329:
	.ascii "rt/compile.ha:9:2"
/* end data */

.section ".data.strdata.339", "a"
.balign 8
_strdata.339:
	.ascii "rt/compile.ha:10:2"
/* end data */

.section ".data.strdata.346", "a"
.balign 8
_strdata.346:
	.ascii "./harec"
	.byte 0
/* end data */

.section ".data.strdata.357", "a"
.balign 8
_strdata.357:
	.ascii "-"
	.byte 0
/* end data */

.section ".data.strdata.365", "a"
.balign 8
_strdata.365:
	.ascii "HARECACHE=mod"
	.byte 0
/* end data */

.section ".data.strdata.371", "a"
.balign 8
_strdata.371:
	.ascii "Assertion failed: rt/compile.ha:25:2"
/* end data */

.section ".data.strdata.381", "a"
.balign 8
_strdata.381:
	.ascii "rt/compile.ha:27:23: fork(2) failed"
/* end data */

.section ".data.strdata.390", "a"
.balign 8
_strdata.390:
	.ascii "rt/compile.ha:28:2"
/* end data */

.section ".data.strdata.413", "a"
.balign 8
_strdata.413:
	.ascii "rt/compile.ha:32:4"
/* end data */

.section ".data.strdata.428", "a"
.balign 8
_strdata.428:
	.ascii "rt/compile.ha:33:31: write(2) failed"
/* end data */

.section ".data.strdata.439", "a"
.balign 8
_strdata.439:
	.ascii "rt/compile.ha:37:2"
/* end data */

.section ".data.strdata.461", "a"
.balign 8
_strdata.461:
	.ascii "Assertion failed: rt/compile.ha:43:2"
/* end data */

.section ".text.rt.compile", "ax"
.globl _rt.compile
_rt.compile:
	sub	sp, sp, #640
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	str	x19, [x29, 648]
	str	x20, [x29, 640]
	str	x21, [x29, 632]
	str	x22, [x29, 624]
	str	x23, [x29, 616]
	add	x2, x29, #28
	mov	w1, #0
	str	w1, [x2]
	add	x2, x29, #32
	mov	w1, #-1
	str	w1, [x2]
	mov	x2, #4
	add	x1, x29, #32
	add	x2, x1, x2
	mov	w1, #-1
	str	w1, [x2]
	mov	w1, #0
	mov	x19, x0
	add	x0, x29, #32
	adrp	x2, rt.pipe2
	add	x2, x2, #:lo12:rt.pipe2
	blr	x2
	mov	x0, x19
	mov	x20, x0
	adrp	x0, rt.fork
	add	x0, x0, #:lo12:rt.fork
	blr	x0
	cmp	w0, #0
	bne	.L77
	mov	x1, #4
	mov	w19, w0
	add	x0, x29, #32
	add	x0, x0, x1
	ldr	w0, [x0]
	adrp	x1, rt.close
	add	x1, x1, #:lo12:rt.close
	blr	x1
	mov	w0, w19
	mov	x1, #0
	mov	w19, w0
	add	x0, x29, #32
	add	x0, x0, x1
	ldr	w0, [x0]
	mov	w1, #0
	adrp	x2, rt.dup2
	add	x2, x2, #:lo12:rt.dup2
	blr	x2
	mov	w0, w19
	mov	w19, w0
	mov	w0, #1
	adrp	x1, rt.close
	add	x1, x1, #:lo12:rt.close
	blr	x1
	mov	w0, w19
	mov	w19, w0
	mov	w0, #2
	adrp	x1, rt.close
	add	x1, x1, #:lo12:rt.close
	blr	x1
	mov	w0, w19
	add	x2, x29, #328
	adrp	x1, strdata.346
	add	x1, x1, #:lo12:strdata.346
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #328
	add	x1, x1, x2
	mov	x2, #8
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #8
	str	x1, [x2]
	add	x2, x29, #304
	adrp	x1, strdata.346
	add	x1, x1, #:lo12:strdata.346
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #304
	add	x1, x1, x2
	mov	x2, #8
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #8
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #304
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #136
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #304
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #136
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #304
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #136
	add	x2, x2, x3
	str	x1, [x2]
	mov	w19, w0
	add	x0, x29, #136
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x1, x0
	mov	w0, w19
	add	x2, x29, #352
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #352
	add	x19, x1, x2
	add	x2, x29, #376
	adrp	x1, strdata.357
	add	x1, x1, #:lo12:strdata.357
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #376
	add	x1, x1, x2
	mov	x2, #2
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #2
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #376
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #112
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #376
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #112
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #376
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #112
	add	x2, x2, x3
	str	x1, [x2]
	mov	w21, w0
	add	x0, x29, #112
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x1, x0
	mov	w0, w21
	str	x1, [x19]
	mov	x2, #16
	add	x1, x29, #352
	add	x2, x1, x2
	mov	x1, #0
	str	x1, [x2]
	add	x2, x29, #416
	adrp	x1, strdata.365
	add	x1, x1, #:lo12:strdata.365
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #416
	add	x1, x1, x2
	mov	x2, #14
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #14
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #416
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #88
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #416
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #88
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #416
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #88
	add	x2, x2, x3
	str	x1, [x2]
	mov	w19, w0
	add	x0, x29, #88
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x1, x0
	mov	w0, w19
	add	x2, x29, #400
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #400
	add	x2, x1, x2
	mov	x1, #0
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #304
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #304
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #304
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	w19, w0
	add	x0, x29, #64
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	add	x2, x29, #400
	add	x1, x29, #352
	adrp	x3, rt.execve
	add	x3, x3, #:lo12:rt.execve
	blr	x3
	mov	w0, w19
	add	x2, x29, #440
	adrp	x1, strdata.371
	add	x1, x1, #:lo12:strdata.371
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #440
	add	x1, x1, x2
	mov	x2, #36
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #36
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #440
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #440
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #440
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	w19, w0
	add	x0, x29, #40
	adrp	x1, rt.abort
	add	x1, x1, #:lo12:rt.abort
	blr	x1
	mov	w0, w19
.L77:
	cmn	w0, #1
	bne	.L79
	add	x2, x29, #464
	adrp	x1, strdata.381
	add	x1, x1, #:lo12:strdata.381
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #464
	add	x1, x1, x2
	mov	x2, #35
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #35
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #464
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #160
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #464
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #160
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #464
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #160
	add	x2, x2, x3
	str	x1, [x2]
	mov	w19, w0
	add	x0, x29, #160
	adrp	x1, rt.abort
	add	x1, x1, #:lo12:rt.abort
	blr	x1
	mov	w0, w19
.L79:
	mov	x1, #0
	mov	w19, w0
	add	x0, x29, #32
	add	x0, x0, x1
	ldr	w0, [x0]
	adrp	x1, rt.close
	add	x1, x1, #:lo12:rt.close
	blr	x1
	mov	x0, x20
	mov	x1, #16
	add	x1, x0, x1
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #184
	add	x2, x2, x3
	str	x1, [x2]
	mov	x1, #8
	add	x1, x0, x1
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #184
	add	x2, x2, x3
	str	x1, [x2]
	mov	x1, #0
	add	x1, x0, x1
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #184
	add	x2, x2, x3
	str	x1, [x2]
	mov	x20, x0
	add	x0, x29, #184
	adrp	x1, rt.constchar
	add	x1, x1, #:lo12:rt.constchar
	blr	x1
	mov	x18, x0
	mov	x0, x20
	mov	x20, x18
	mov	w21, w19
	mov	x19, #0
.L82:
	mov	x1, #8
	add	x1, x0, x1
	ldr	x1, [x1]
	cmp	x19, x1
	bcs	.L87
	mov	x1, #4
	mov	x22, x0
	add	x0, x29, #32
	add	x0, x0, x1
	ldr	w0, [x0]
	add	x1, x20, x19
	mov	x2, #8
	add	x2, x22, x2
	ldr	x2, [x2]
	sub	x2, x2, x19
	adrp	x3, rt.write
	add	x3, x3, #:lo12:rt.write
	blr	x3
	mov	x18, x0
	mov	x0, x22
	mov	x22, x18
	cmp	x22, #0
	bhi	.L86
	add	x2, x29, #536
	adrp	x1, strdata.428
	add	x1, x1, #:lo12:strdata.428
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #536
	add	x1, x1, x2
	mov	x2, #36
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #36
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #536
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #208
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #536
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #208
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #536
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #208
	add	x2, x2, x3
	str	x1, [x2]
	mov	x23, x0
	add	x0, x29, #208
	adrp	x1, rt.abort
	add	x1, x1, #:lo12:rt.abort
	blr	x1
	mov	x0, x23
.L86:
	add	x19, x19, x22
	b	.L82
.L87:
	mov	w0, w21
	mov	x1, #4
	mov	w19, w0
	add	x0, x29, #32
	add	x0, x0, x1
	ldr	w0, [x0]
	adrp	x1, rt.close
	add	x1, x1, #:lo12:rt.close
	blr	x1
	mov	w0, w19
	mov	x3, #0
	mov	w2, #0
	add	x1, x29, #28
	adrp	x4, rt.wait4
	add	x4, x4, #:lo12:rt.wait4
	blr	x4
	add	x0, x29, #28
	ldr	w0, [x0]
	adrp	x1, rt.wifexited
	add	x1, x1, #:lo12:rt.wifexited
	blr	x1
	cmp	w0, #0
	bne	.L95
	add	x0, x29, #28
	ldr	w0, [x0]
	adrp	x1, rt.wifsignaled
	add	x1, x1, #:lo12:rt.wifsignaled
	blr	x1
	cmp	w0, #0
	bne	.L94
	add	x1, x29, #584
	adrp	x0, strdata.461
	add	x0, x0, #:lo12:strdata.461
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #584
	add	x0, x0, x1
	mov	x1, #36
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	mov	x0, #36
	str	x0, [x1]
	mov	x1, #16
	add	x0, x29, #584
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x29, #232
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #584
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #8
	add	x1, x29, #232
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #0
	add	x0, x29, #584
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #0
	add	x1, x29, #232
	add	x1, x1, x2
	str	x0, [x1]
	add	x0, x29, #232
	adrp	x1, rt.abort
	add	x1, x1, #:lo12:rt.abort
	blr	x1
	mov	w0, #0
	b	.L96
.L94:
	add	x0, x29, #28
	ldr	w0, [x0]
	adrp	x1, rt.wtermsig
	add	x1, x1, #:lo12:rt.wtermsig
	blr	x1
	b	.L96
.L95:
	add	x0, x29, #28
	ldr	w0, [x0]
	adrp	x1, rt.wexitstatus
	add	x1, x1, #:lo12:rt.wexitstatus
	blr	x1
.L96:
	ldr	x19, [x29, 648]
	ldr	x20, [x29, 640]
	ldr	x21, [x29, 632]
	ldr	x22, [x29, 624]
	ldr	x23, [x29, 616]
	ldp	x29, x30, [sp], 16
	add	sp, sp, #640
	ret
/* end function rt.compile */

.section ".data.strdata.504", "a"
.balign 8
_strdata.504:
	.ascii "rt/ensure.ha:13:23: slice out of memory (overflow)"
/* end data */

.section ".data.strdata.548", "a"
.balign 8
_strdata.548:
	.ascii "Assertion failed: rt/ensure.ha:22:1"
/* end data */

.section ".text.rt.ensure", "ax"
.globl _rt.ensure
_rt.ensure:
	stp	x29, x30, [sp, -144]!
	mov	x29, sp
	str	x19, [x29, 136]
	str	x20, [x29, 128]
	str	x21, [x29, 120]
	mov	x2, #16
	add	x2, x0, x2
	ldr	x21, [x2]
	mov	x2, #8
	add	x2, x0, x2
	ldr	x2, [x2]
	cmp	x21, x2
	bcs	.L113
	mov	x19, x21
.L100:
	mov	x2, #8
	add	x2, x0, x2
	ldr	x2, [x2]
	cmp	x19, x2
	bcs	.L106
	mov	x2, #16
	add	x2, x0, x2
	ldr	x2, [x2]
	cmp	x19, x2
	bcs	.L103
	add	x3, x29, #64
	adrp	x2, strdata.504
	add	x2, x2, #:lo12:strdata.504
	str	x2, [x3]
	mov	x3, #8
	add	x2, x29, #64
	add	x2, x2, x3
	mov	x3, #50
	str	x3, [x2]
	mov	x3, #8
	add	x3, x2, x3
	mov	x2, #50
	str	x2, [x3]
	mov	x3, #16
	add	x2, x29, #64
	add	x2, x2, x3
	ldr	x2, [x2]
	mov	x4, #16
	add	x3, x29, #16
	add	x3, x3, x4
	str	x2, [x3]
	mov	x3, #8
	add	x2, x29, #64
	add	x2, x2, x3
	ldr	x2, [x2]
	mov	x4, #8
	add	x3, x29, #16
	add	x3, x3, x4
	str	x2, [x3]
	mov	x3, #0
	add	x2, x29, #64
	add	x2, x2, x3
	ldr	x2, [x2]
	mov	x4, #0
	add	x3, x29, #16
	add	x3, x3, x4
	str	x2, [x3]
	mov	x20, x0
	add	x0, x29, #16
	mov	x21, x1
	adrp	x1, rt.abort
	add	x1, x1, #:lo12:rt.abort
	blr	x1
	mov	x1, x21
	mov	x0, x20
.L103:
	cmp	x19, #0
	beq	.L105
	mov	x2, #2
	mul	x19, x19, x2
	b	.L100
.L105:
	mov	x2, #8
	add	x2, x0, x2
	ldr	x19, [x2]
	b	.L100
.L106:
	mov	x21, x19
	mov	x2, #16
	add	x2, x0, x2
	str	x21, [x2]
	mov	x19, x0
	ldr	x0, [x0]
	mov	x20, x1
	mul	x1, x21, x1
	adrp	x2, rt.realloc
	add	x2, x2, #:lo12:rt.realloc
	blr	x2
	mov	x1, x20
	mov	x18, x0
	mov	x0, x19
	mov	x19, x18
	cmp	x19, #0
	cset	w2, ne
	cmp	w2, #0
	bne	.L109
	mov	x2, #16
	add	x2, x0, x2
	ldr	x2, [x2]
	mul	x1, x2, x1
	cmp	x1, #0
	cset	w1, eq
	b	.L110
.L109:
	mov	w1, w2
.L110:
	cmp	w1, #0
	bne	.L112
	add	x2, x29, #88
	adrp	x1, strdata.548
	add	x1, x1, #:lo12:strdata.548
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #88
	add	x1, x1, x2
	mov	x2, #35
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #35
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #88
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #88
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #88
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x20, x0
	add	x0, x29, #40
	adrp	x1, rt.abort
	add	x1, x1, #:lo12:rt.abort
	blr	x1
	mov	x0, x20
.L112:
	str	x19, [x0]
.L113:
	ldr	x19, [x29, 136]
	ldr	x20, [x29, 128]
	ldr	x21, [x29, 120]
	ldp	x29, x30, [sp], 144
	ret
/* end function rt.ensure */

.section ".data.strdata.604", "a"
.balign 8
_strdata.604:
	.ascii "Assertion failed: rt/ensure.ha:34:1"
/* end data */

.section ".text.rt.unensure", "ax"
.globl _rt.unensure
_rt.unensure:
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	str	x19, [x29, 72]
	str	x20, [x29, 64]
	mov	x2, #16
	add	x2, x0, x2
	ldr	x2, [x2]
.L116:
	mov	x3, #8
	add	x3, x0, x3
	ldr	x3, [x3]
	cmp	x2, x3
	bls	.L118
	mov	x3, #2
	udiv	x2, x2, x3
	b	.L116
.L118:
	mov	x20, x1
	mov	x1, #2
	mul	x1, x2, x1
	mov	x2, #16
	add	x2, x0, x2
	str	x1, [x2]
	mov	x19, x0
	ldr	x0, [x0]
	mul	x1, x1, x20
	adrp	x2, rt.realloc
	add	x2, x2, #:lo12:rt.realloc
	blr	x2
	mov	x1, x20
	mov	x18, x0
	mov	x0, x19
	mov	x19, x18
	cmp	x19, #0
	cset	w2, ne
	cmp	w2, #0
	bne	.L120
	mov	x2, #16
	add	x2, x0, x2
	ldr	x2, [x2]
	mul	x1, x2, x1
	cmp	x1, #0
	cset	w1, eq
	b	.L121
.L120:
	mov	w1, w2
.L121:
	cmp	w1, #0
	bne	.L123
	add	x2, x29, #40
	adrp	x1, strdata.604
	add	x1, x1, #:lo12:strdata.604
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #40
	add	x1, x1, x2
	mov	x2, #35
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #35
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #40
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #16
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #40
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #16
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #40
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #16
	add	x2, x2, x3
	str	x1, [x2]
	mov	x20, x0
	add	x0, x29, #16
	adrp	x1, rt.abort
	add	x1, x1, #:lo12:rt.abort
	blr	x1
	mov	x0, x20
.L123:
	str	x19, [x0]
	ldr	x19, [x29, 72]
	ldr	x20, [x29, 64]
	ldp	x29, x30, [sp], 80
	ret
/* end function rt.unensure */

.section ".bss.rt.bins", "ax"
.balign 8
_rt.bins:
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
/* end data */

.section ".text.rt.bin2size", "ax"
_rt.bin2size:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x1, #1
	add	x0, x0, x1
	mov	x1, #2
	mul	x0, x0, x1
	mov	x1, #1
	sub	x0, x0, x1
	mov	x1, #8
	mul	x0, x0, x1
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.bin2size */

.section ".data.strdata.629", "a"
.balign 8
_strdata.629:
	.ascii "rt/malloc.ha:43:15: Size exceeds maximum for bin"
/* end data */

.section ".text.rt.size2bin", "ax"
_rt.size2bin:
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	str	x19, [x29, 72]
	mov	x19, x0
	mov	x0, #49
	adrp	x1, rt.bin2size
	add	x1, x1, #:lo12:rt.bin2size
	blr	x1
	mov	x1, x0
	mov	x0, x19
	cmp	x0, x1
	bls	.L131
	add	x2, x29, #40
	adrp	x1, strdata.629
	add	x1, x1, #:lo12:strdata.629
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #40
	add	x1, x1, x2
	mov	x2, #48
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #48
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #40
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #16
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #40
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #16
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #40
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #16
	add	x2, x2, x3
	str	x1, [x2]
	mov	x19, x0
	add	x0, x29, #16
	adrp	x1, rt.abort
	add	x1, x1, #:lo12:rt.abort
	blr	x1
	mov	x0, x19
.L131:
	mov	x1, #7
	add	x0, x0, x1
	mov	x1, #16
	udiv	x0, x0, x1
	ldr	x19, [x29, 72]
	ldp	x29, x30, [sp], 80
	ret
/* end function rt.size2bin */

.section ".bss.rt.nalloc", "ax"
.balign 8
_rt.nalloc:
	.int 0
/* end data */

.section ".bss.rt.nfree", "ax"
.balign 8
_rt.nfree:
	.int 0
/* end data */

.section ".data.strdata.647", "a"
.balign 8
_strdata.647:
	.ascii "Assertion failed: rt/malloc.ha:50:3"
/* end data */

.section ".text.finifunc.638", "ax"
_finifunc.638:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	adrp	x0, rt.nalloc
	add	x0, x0, #:lo12:rt.nalloc
	ldr	w0, [x0]
	adrp	x1, rt.nfree
	add	x1, x1, #:lo12:rt.nfree
	ldr	w1, [x1]
	cmp	w0, w1
	beq	.L136
	add	x1, x29, #40
	adrp	x0, strdata.647
	add	x0, x0, #:lo12:strdata.647
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #40
	add	x0, x0, x1
	mov	x1, #35
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	mov	x0, #35
	str	x0, [x1]
	mov	x1, #16
	add	x0, x29, #40
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #40
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #8
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #0
	add	x0, x29, #40
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #0
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	add	x0, x29, #16
	adrp	x1, rt.abort
	add	x1, x1, #:lo12:rt.abort
	blr	x1
.L136:
	ldp	x29, x30, [sp], 64
	ret
/* end function finifunc.638 */

.section ".fini_array", "ax"
.balign 8
_.fini.finifunc.638:
	.quad _finifunc.638+0
/* end data */

.section ".text.rt.malloc", "ax"
.globl _rt.malloc
_rt.malloc:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	cmp	x0, #0
	beq	.L143
	mov	x19, x0
	mov	x0, #49
	adrp	x1, rt.bin2size
	add	x1, x1, #:lo12:rt.bin2size
	blr	x1
	mov	x1, x0
	mov	x0, x19
	cmp	x0, x1
	bhi	.L141
	adrp	x1, rt.malloc_small
	add	x1, x1, #:lo12:rt.malloc_small
	blr	x1
	b	.L142
.L141:
	adrp	x1, rt.malloc_large
	add	x1, x1, #:lo12:rt.malloc_large
	blr	x1
.L142:
	adrp	x1, rt.nalloc
	add	x1, x1, #:lo12:rt.nalloc
	ldr	w1, [x1]
	mov	w2, #1
	add	w1, w1, w2
	adrp	x2, rt.nalloc
	add	x2, x2, #:lo12:rt.nalloc
	str	w1, [x2]
	b	.L144
.L143:
	mov	x0, #0
.L144:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function rt.malloc */

.section ".data.strdata.709", "a"
.balign 8
_strdata.709:
	.ascii "rt/malloc.ha:68:1"
/* end data */

.section ".text.rt.malloc_large", "ax"
_rt.malloc_large:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [x29, 56]
	mov	x19, x0
	mov	x0, #8
	add	x0, x19, x0
	mov	x1, #8
	add	x0, x0, x1
	adrp	x1, rt.segmalloc
	add	x1, x1, #:lo12:rt.segmalloc
	blr	x1
	cmp	x0, #0
	beq	.L149
	mov	x1, #8
	add	x1, x0, x1
	mov	x2, #0
	add	x1, x1, x2
	str	x19, [x1]
	mov	x1, #8
	add	x0, x0, x1
	mov	x1, #8
	add	x0, x0, x1
	b	.L150
.L149:
	mov	x0, #0
.L150:
	ldr	x19, [x29, 56]
	ldp	x29, x30, [sp], 64
	ret
/* end function rt.malloc_large */

.section ".data.strdata.735", "a"
.balign 8
_strdata.735:
	.ascii "rt/malloc.ha:74:2"
/* end data */

.section ".data.strdata.764", "a"
.balign 8
_strdata.764:
	.ascii "rt/malloc.ha:78:2"
/* end data */

.section ".data.strdata.785", "a"
.balign 8
_strdata.785:
	.ascii "rt/malloc.ha:83:2"
/* end data */

.section ".text.rt.malloc_small", "ax"
_rt.malloc_small:
	stp	x29, x30, [sp, -192]!
	mov	x29, sp
	str	x19, [x29, 184]
	str	x20, [x29, 176]
	str	x21, [x29, 168]
	adrp	x1, rt.size2bin
	add	x1, x1, #:lo12:rt.size2bin
	blr	x1
	mov	x21, x0
	mov	x0, #8
	mul	x1, x21, x0
	adrp	x0, rt.bins
	add	x0, x0, #:lo12:rt.bins
	add	x19, x0, x1
	cmp	x21, #50
	bcc	.L154
	add	x1, x29, #88
	adrp	x0, strdata.735
	add	x0, x0, #:lo12:strdata.735
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #88
	add	x0, x0, x1
	mov	x1, #17
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	mov	x0, #17
	str	x0, [x1]
	mov	x1, #16
	add	x0, x29, #88
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #88
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #8
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #0
	add	x0, x29, #88
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #0
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #0
	add	x0, x29, #16
	adrp	x2, rt.abort_fixed
	add	x2, x2, #:lo12:rt.abort_fixed
	blr	x2
.L154:
	ldr	x0, [x19]
	cmp	x0, #0
	bne	.L159
	mov	x0, x21
	adrp	x1, rt.fill_bin
	add	x1, x1, #:lo12:rt.fill_bin
	blr	x1
	cmp	x0, #0
	beq	.L159
	mov	x1, #8
	mul	x2, x21, x1
	adrp	x1, rt.bins
	add	x1, x1, #:lo12:rt.bins
	add	x19, x1, x2
	cmp	x21, #50
	bcc	.L158
	add	x2, x29, #112
	adrp	x1, strdata.764
	add	x1, x1, #:lo12:strdata.764
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #112
	add	x1, x1, x2
	mov	x2, #17
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #17
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #112
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #112
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #112
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x1, #0
	mov	x20, x0
	add	x0, x29, #40
	adrp	x2, rt.abort_fixed
	add	x2, x2, #:lo12:rt.abort_fixed
	blr	x2
	mov	x0, x20
.L158:
	str	x0, [x19]
.L159:
	cmp	x0, #0
	bne	.L161
	mov	x0, #0
	b	.L164
.L161:
	ldr	x19, [x0]
	mov	x1, #8
	mul	x2, x21, x1
	adrp	x1, rt.bins
	add	x1, x1, #:lo12:rt.bins
	add	x20, x1, x2
	cmp	x21, #50
	bcc	.L163
	add	x2, x29, #136
	adrp	x1, strdata.785
	add	x1, x1, #:lo12:strdata.785
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #136
	add	x1, x1, x2
	mov	x2, #17
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #17
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #136
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #136
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #136
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #64
	add	x2, x2, x3
	str	x1, [x2]
	mov	x1, #0
	mov	x21, x0
	add	x0, x29, #64
	adrp	x2, rt.abort_fixed
	add	x2, x2, #:lo12:rt.abort_fixed
	blr	x2
	mov	x0, x21
.L163:
	str	x19, [x20]
.L164:
	ldr	x19, [x29, 184]
	ldr	x20, [x29, 176]
	ldr	x21, [x29, 168]
	ldp	x29, x30, [sp], 192
	ret
/* end function rt.malloc_small */

.section ".text.rt.fill_bin", "ax"
_rt.fill_bin:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	adrp	x1, rt.bin2size
	add	x1, x1, #:lo12:rt.bin2size
	blr	x1
	mov	x19, x0
	mov	x0, #1048576
	adrp	x1, rt.segmalloc
	add	x1, x1, #:lo12:rt.segmalloc
	blr	x1
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #0
	beq	.L168
	adrp	x2, rt.list_from_block
	add	x2, x2, #:lo12:rt.list_from_block
	blr	x2
	b	.L169
.L168:
	mov	x0, #0
.L169:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function rt.fill_bin */

.section ".data.strdata.872", "a"
.balign 8
_strdata.872:
	.ascii "rt/malloc.ha:108:2"
/* end data */

.section ".text.rt.list_from_block", "ax"
_rt.list_from_block:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	mov	x2, #8
	add	x3, x0, x2
	mov	x2, #1048568
	udiv	x4, x2, x3
	mov	x2, #8
	add	x2, x1, x2
	mov	x3, #0
.L173:
	mov	x5, #1
	sub	x5, x4, x5
	cmp	x3, x5
	beq	.L176
	mov	x5, #8
	add	x6, x2, x5
	add	x5, x6, x0
	mov	x7, #8
	add	x5, x5, x7
	str	x0, [x2]
	str	x5, [x6]
	mov	x5, #8
	add	x5, x0, x5
	add	x2, x2, x5
	mov	x5, #1
	add	x3, x3, x5
	b	.L173
.L176:
	mov	x3, #0
	add	x3, x2, x3
	str	x0, [x3]
	mov	x0, #1
	add	x2, x2, x0
	mov	x0, #0
	str	x0, [x2]
	mov	x0, #8
	add	x0, x1, x0
	mov	x1, #8
	add	x0, x0, x1
	ldp	x29, x30, [sp], 48
	ret
/* end function rt.list_from_block */

.section ".data.strdata.916", "a"
.balign 8
_strdata.916:
	.ascii "rt/malloc.ha:121:3"
/* end data */

.section ".text.rt.free", "ax"
.globl _rt.free
_rt.free:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [x29, 56]
	str	x20, [x29, 48]
	cmp	x0, #0
	beq	.L185
	adrp	x1, rt.nfree
	add	x1, x1, #:lo12:rt.nfree
	ldr	w1, [x1]
	mov	w2, #1
	add	w1, w1, w2
	adrp	x2, rt.nfree
	add	x2, x2, #:lo12:rt.nfree
	str	w1, [x2]
	mov	x1, #8
	sub	x1, x0, x1
	mov	x2, #0
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x19, x0
	mov	x0, #49
	mov	x20, x1
	adrp	x1, rt.bin2size
	add	x1, x1, #:lo12:rt.bin2size
	blr	x1
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	cmp	x1, x2
	bls	.L184
	adrp	x2, rt.free_large
	add	x2, x2, #:lo12:rt.free_large
	blr	x2
	b	.L185
.L184:
	adrp	x2, rt.free_small
	add	x2, x2, #:lo12:rt.free_small
	blr	x2
.L185:
	ldr	x19, [x29, 56]
	ldr	x20, [x29, 48]
	ldp	x29, x30, [sp], 64
	ret
/* end function rt.free */

.section ".data.strdata.956", "a"
.balign 8
_strdata.956:
	.ascii "rt/malloc.ha:130:15: free: munmap failed"
/* end data */

.section ".text.rt.free_large", "ax"
_rt.free_large:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	mov	x2, #16
	sub	x0, x0, x2
	mov	x2, #8
	add	x1, x1, x2
	mov	x2, #8
	add	x1, x1, x2
	adrp	x2, rt.segfree
	add	x2, x2, #:lo12:rt.segfree
	blr	x2
	cmp	w0, #0
	beq	.L189
	add	x1, x29, #40
	adrp	x0, strdata.956
	add	x0, x0, #:lo12:strdata.956
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #40
	add	x0, x0, x1
	mov	x1, #40
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	mov	x0, #40
	str	x0, [x1]
	mov	x1, #16
	add	x0, x29, #40
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #8
	add	x0, x29, #40
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #8
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	mov	x1, #0
	add	x0, x29, #40
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x2, #0
	add	x1, x29, #16
	add	x1, x1, x2
	str	x0, [x1]
	add	x0, x29, #16
	adrp	x1, rt.abort
	add	x1, x1, #:lo12:rt.abort
	blr	x1
.L189:
	ldp	x29, x30, [sp], 64
	ret
/* end function rt.free_large */

.section ".data.strdata.974", "a"
.balign 8
_strdata.974:
	.ascii "rt/malloc.ha:135:2"
/* end data */

.section ".data.strdata.985", "a"
.balign 8
_strdata.985:
	.ascii "rt/malloc.ha:137:1"
/* end data */

.section ".text.rt.free_small", "ax"
_rt.free_small:
	stp	x29, x30, [sp, -144]!
	mov	x29, sp
	str	x19, [x29, 136]
	str	x20, [x29, 128]
	str	x21, [x29, 120]
	mov	x19, x0
	mov	x0, x1
	adrp	x1, rt.size2bin
	add	x1, x1, #:lo12:rt.size2bin
	blr	x1
	mov	x20, x0
	mov	x0, x19
	mov	x1, #8
	mul	x2, x20, x1
	adrp	x1, rt.bins
	add	x1, x1, #:lo12:rt.bins
	add	x19, x1, x2
	cmp	x20, #50
	bcc	.L193
	add	x2, x29, #64
	adrp	x1, strdata.974
	add	x1, x1, #:lo12:strdata.974
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #64
	add	x1, x1, x2
	mov	x2, #18
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #18
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #64
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #16
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #64
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #16
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #64
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #16
	add	x2, x2, x3
	str	x1, [x2]
	mov	x1, #0
	mov	x21, x0
	add	x0, x29, #16
	adrp	x2, rt.abort_fixed
	add	x2, x2, #:lo12:rt.abort_fixed
	blr	x2
	mov	x0, x21
.L193:
	ldr	x1, [x19]
	str	x1, [x0]
	mov	x1, #8
	mul	x2, x20, x1
	adrp	x1, rt.bins
	add	x1, x1, #:lo12:rt.bins
	add	x19, x1, x2
	cmp	x20, #50
	bcc	.L195
	add	x2, x29, #88
	adrp	x1, strdata.985
	add	x1, x1, #:lo12:strdata.985
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #88
	add	x1, x1, x2
	mov	x2, #18
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	mov	x1, #18
	str	x1, [x2]
	mov	x2, #16
	add	x1, x29, #88
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #8
	add	x1, x29, #88
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #8
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x2, #0
	add	x1, x29, #88
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x3, #0
	add	x2, x29, #40
	add	x2, x2, x3
	str	x1, [x2]
	mov	x1, #0
	mov	x20, x0
	add	x0, x29, #40
	adrp	x2, rt.abort_fixed
	add	x2, x2, #:lo12:rt.abort_fixed
	blr	x2
	mov	x0, x20
.L195:
	str	x0, [x19]
	ldr	x19, [x29, 136]
	ldr	x20, [x29, 128]
	ldr	x21, [x29, 120]
	ldp	x29, x30, [sp], 144
	ret
/* end function rt.free_small */

.section ".text.rt.realloc", "ax"
.globl _rt.realloc
_rt.realloc:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	str	x22, [x29, 16]
	mov	x19, x0
	mov	x0, x1
	cmp	x0, #0
	beq	.L210
	cmp	x19, #0
	beq	.L209
	mov	x1, #8
	sub	x1, x19, x1
	ldr	x20, [x1]
	cmp	x20, x0
	bcs	.L208
	mov	x21, x0
	mov	x0, #49
	adrp	x1, rt.bin2size
	add	x1, x1, #:lo12:rt.bin2size
	blr	x1
	mov	x1, x0
	mov	x0, x21
	cmp	x0, x1
	cset	w1, cc
	cmp	w1, #0
	beq	.L203
	mov	x21, x0
	adrp	x1, rt.size2bin
	add	x1, x1, #:lo12:rt.size2bin
	blr	x1
	mov	x18, x0
	mov	x0, x21
	mov	x21, x18
	mov	x22, x0
	mov	x0, x20
	adrp	x1, rt.size2bin
	add	x1, x1, #:lo12:rt.size2bin
	blr	x1
	mov	x1, x0
	mov	x0, x22
	cmp	x21, x1
	cset	w1, eq
.L203:
	cmp	w1, #0
	bne	.L207
	adrp	x1, rt.malloc
	add	x1, x1, #:lo12:rt.malloc
	blr	x1
	mov	x2, x20
	mov	x18, x0
	mov	x0, x19
	mov	x19, x18
	cmp	x19, #0
	bne	.L206
	mov	x0, x19
	b	.L212
.L206:
	mov	x1, x0
	mov	x20, x0
	mov	x0, x19
	adrp	x3, rt.memcpy
	add	x3, x3, #:lo12:rt.memcpy
	blr	x3
	mov	x0, x20
	adrp	x1, rt.free
	add	x1, x1, #:lo12:rt.free
	blr	x1
	mov	x0, x19
	b	.L212
.L207:
	mov	x0, x19
	b	.L212
.L208:
	mov	x0, x19
	b	.L212
.L209:
	adrp	x1, rt.malloc
	add	x1, x1, #:lo12:rt.malloc
	blr	x1
	b	.L212
.L210:
	mov	x0, x19
	adrp	x1, rt.free
	add	x1, x1, #:lo12:rt.free
	blr	x1
	mov	x0, #0
.L212:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldr	x22, [x29, 16]
	ldp	x29, x30, [sp], 48
	ret
/* end function rt.realloc */

.section ".text.rt.memcpy", "ax"
.globl _rt.memcpy
_rt.memcpy:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x3, #0
.L215:
	cmp	x3, x2
	bcs	.L218
	add	x5, x0, x3
	add	x4, x1, x3
	ldrb	w4, [x4]
	strb	w4, [x5]
	mov	x4, #1
	add	x3, x3, x4
	b	.L215
.L218:
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.memcpy */

.section ".text.rt.memmove", "ax"
.globl _rt.memmove
_rt.memmove:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	cmp	x0, x1
	beq	.L230
	cmp	x0, x1
	bcc	.L226
	mov	x3, #0
.L223:
	cmp	x3, x2
	bcs	.L230
	sub	x4, x2, x3
	mov	x5, #1
	sub	x4, x4, x5
	add	x5, x0, x4
	sub	x4, x2, x3
	mov	x6, #1
	sub	x4, x4, x6
	add	x4, x1, x4
	ldrb	w4, [x4]
	strb	w4, [x5]
	mov	x4, #1
	add	x3, x3, x4
	b	.L223
.L226:
	mov	x3, #0
.L227:
	cmp	x3, x2
	bcs	.L230
	add	x5, x0, x3
	add	x4, x1, x3
	ldrb	w4, [x4]
	strb	w4, [x5]
	mov	x4, #1
	add	x3, x3, x4
	b	.L227
.L230:
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.memmove */

.section ".text.rt.memset", "ax"
.globl _rt.memset
_rt.memset:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x3, #0
.L233:
	cmp	x3, x2
	bcs	.L236
	add	x5, x0, x3
	uxtb	w4, w1
	strb	w4, [x5]
	mov	x4, #1
	add	x3, x3, x4
	b	.L233
.L236:
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.memset */

.section ".text.rt.start_ha", "ax"
.globl _rt.start_ha
_rt.start_ha:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	adrp	x1, __init_array_start
	add	x1, x1, #:lo12:__init_array_start
	adrp	x0, __init_array_end
	add	x0, x0, #:lo12:__init_array_end
	sub	x0, x0, x1
	mov	x1, #8
	udiv	x20, x0, x1
	mov	x19, #0
.L240:
	cmp	x19, x20
	bcs	.L243
	mov	x0, #8
	mul	x1, x19, x0
	adrp	x0, __init_array_start
	add	x0, x0, #:lo12:__init_array_start
	add	x0, x0, x1
	ldr	x0, [x0]
	blr	x0
	mov	x0, #1
	add	x19, x19, x0
	b	.L240
.L243:
	adrp	x0, main
	add	x0, x0, #:lo12:main
	blr	x0
	adrp	x1, __fini_array_start
	add	x1, x1, #:lo12:__fini_array_start
	adrp	x0, __fini_array_end
	add	x0, x0, #:lo12:__fini_array_end
	sub	x0, x0, x1
	mov	x1, #8
	udiv	x20, x0, x1
	mov	x19, #0
.L245:
	cmp	x19, x20
	bcs	.L248
	mov	x0, #8
	mul	x1, x19, x0
	adrp	x0, __fini_array_start
	add	x0, x0, #:lo12:__fini_array_start
	add	x0, x0, x1
	ldr	x0, [x0]
	blr	x0
	mov	x0, #1
	add	x19, x19, x0
	b	.L245
.L248:
	mov	w0, #0
	adrp	x1, rt.exit
	add	x1, x1, #:lo12:rt.exit
	blr	x1
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function rt.start_ha */

.section ".text.rt.strcmp", "ax"
.globl _rt.strcmp
_rt.strcmp:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x2, #8
	add	x2, x0, x2
	ldr	x2, [x2]
	mov	x3, #8
	add	x3, x1, x3
	ldr	x3, [x3]
	cmp	x2, x3
	bne	.L259
	ldr	x3, [x0]
	ldr	x4, [x1]
	mov	x1, #0
.L254:
	cmp	x1, x2
	bcs	.L258
	add	x5, x3, x1
	ldrb	w5, [x5]
	add	x6, x4, x1
	ldrb	w6, [x6]
	cmp	w5, w6
	bne	.L257
	mov	x5, #1
	add	x1, x1, x5
	b	.L254
.L257:
	mov	w0, #0
	b	.L260
.L258:
	mov	w0, #1
	b	.L260
.L259:
	mov	w0, #0
.L260:
	ldp	x29, x30, [sp], 16
	ret
/* end function rt.strcmp */

