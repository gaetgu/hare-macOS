.section ".text.rt.segmalloc", "ax"
_rt.segmalloc:
	pushq %rbp
	movq %rsp, %rbp
	movq %rdi, %rsi
	movl $0, %r9d
	movl $-1, %r8d
	movl $4098, %ecx
	movl $3, %edx
	movl $0, %edi
	callq _rt.mmap
	cmpl $-12, %eax
	jnz Lbb3
	movl $0, %eax
Lbb3:
	leave
	ret
/* end function rt.segmalloc */

.section ".text.rt.segfree", "ax"
_rt.segfree:
	pushq %rbp
	movq %rsp, %rbp
	callq _rt.munmap
	leave
	ret
/* end function rt.segfree */

.section ".text.rt.write", "ax"
.globl _rt.write
_rt.write:
	pushq %rbp
	movq %rsp, %rbp
	movq %rdx, %rcx
	movq %rsi, %rdx
	movslq %edi, %rsi
	movl $4, %edi
	callq _rt.syscall3
	leave
	ret
/* end function rt.write */

.section ".text.rt.close", "ax"
.globl _rt.close
_rt.close:
	pushq %rbp
	movq %rsp, %rbp
	movslq %edi, %rsi
	movl $6, %edi
	callq _rt.syscall1
	leave
	ret
/* end function rt.close */

.section ".text.rt.dup2", "ax"
.globl _rt.dup2
_rt.dup2:
	pushq %rbp
	movq %rsp, %rbp
	movl %esi, %eax
	movslq %edi, %rsi
	movslq %eax, %rdx
	movl $90, %edi
	callq _rt.syscall2
	leave
	ret
/* end function rt.dup2 */

.section ".text.rt.getpid", "ax"
.globl _rt.getpid
_rt.getpid:
	pushq %rbp
	movq %rsp, %rbp
	movl $20, %edi
	callq _rt.syscall0
	leave
	ret
/* end function rt.getpid */

.section ".text.rt.exit", "ax"
.globl _rt.exit
_rt.exit:
	pushq %rbp
	movq %rsp, %rbp
	movslq %edi, %rsi
	movl $1, %edi
	callq _rt.syscall1
	leave
	ret
/* end function rt.exit */

.section ".text.rt.fork", "ax"
.globl _rt.fork
_rt.fork:
	pushq %rbp
	movq %rsp, %rbp
	movl $2, %edi
	callq _rt.syscall0
	leave
	ret
/* end function rt.fork */

.section ".text.rt.execve", "ax"
.globl _rt.execve
_rt.execve:
	pushq %rbp
	movq %rsp, %rbp
	movq %rdx, %rcx
	movq %rsi, %rdx
	movq %rdi, %rsi
	movl $59, %edi
	callq _rt.syscall3
	leave
	ret
/* end function rt.execve */

.section ".text.rt.wait4", "ax"
.globl _rt.wait4
_rt.wait4:
	pushq %rbp
	movq %rsp, %rbp
	movq %rcx, %r8
	movl %edx, %eax
	movq %rsi, %rdx
	movslq %edi, %rsi
	movslq %eax, %rcx
	movl $7, %edi
	callq _rt.syscall4
	leave
	ret
/* end function rt.wait4 */

.section ".text.rt.wifexited", "ax"
.globl _rt.wifexited
_rt.wifexited:
	pushq %rbp
	movq %rsp, %rbp
	callq _rt.wtermsig
	cmpl $0, %eax
	setz %al
	movzbl %al, %eax
	leave
	ret
/* end function rt.wifexited */

.section ".text.rt.wexitstatus", "ax"
.globl _rt.wexitstatus
_rt.wexitstatus:
	pushq %rbp
	movq %rsp, %rbp
	movl %edi, %eax
	andl $65280, %eax
	sarl $8, %eax
	leave
	ret
/* end function rt.wexitstatus */

.section ".text.rt.wtermsig", "ax"
.globl _rt.wtermsig
_rt.wtermsig:
	pushq %rbp
	movq %rsp, %rbp
	movl %edi, %eax
	andl $127, %eax
	leave
	ret
/* end function rt.wtermsig */

.section ".text.rt.wifsignaled", "ax"
.globl _rt.wifsignaled
_rt.wifsignaled:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	pushq %rbx
	movl %edi, %ebx
	callq _rt.wtermsig
	movl %ebx, %edi
	cmpl $127, %eax
	setnz %al
	movzbl %al, %eax
	jz Lbb43
	movl %edi, %ebx
	callq _rt.wtermsig
	movl %ebx, %edi
	cmpl $0, %eax
	setnz %al
	movzbl %al, %eax
Lbb43:
	cmpl $0, %eax
	jz Lbb45
	cmpl $19, %edi
	setnz %al
	movzbl %al, %eax
Lbb45:
	popq %rbx
	leave
	ret
/* end function rt.wifsignaled */

.section ".text.rt.kill", "ax"
.globl _rt.kill
_rt.kill:
	pushq %rbp
	movq %rsp, %rbp
	movl %esi, %eax
	movslq %edi, %rsi
	movslq %eax, %rdx
	movl $37, %edi
	callq _rt.syscall2
	leave
	ret
/* end function rt.kill */

.section ".text.rt.pipe2", "ax"
.globl _rt.pipe2
_rt.pipe2:
	pushq %rbp
	movq %rsp, %rbp
	movl %esi, %eax
	movq %rdi, %rsi
	movslq %eax, %rdx
	movl $542, %edi
	callq _rt.syscall2
	leave
	ret
/* end function rt.pipe2 */

.section ".text.rt.mmap", "ax"
.globl _rt.mmap
_rt.mmap:
	pushq %rbp
	movq %rsp, %rbp
	movq %r9, %rax
	xchgq %r8, %rdi
	xchgq %rcx, %r8
	xchgq %rdx, %rcx
	xchgq %rsi, %rdx
	movl %ecx, %ecx
	movl %r8d, %r8d
	movslq %edi, %r9
	subq $16, %rsp
	movq %rsp, %rdi
	movq %rax, 0(%rdi)
	movl $477, %edi
	callq _rt.syscall6
	subq $-16, %rsp
	leave
	ret
/* end function rt.mmap */

.section ".text.rt.munmap", "ax"
.globl _rt.munmap
_rt.munmap:
	pushq %rbp
	movq %rsp, %rbp
	movq %rsi, %rdx
	movq %rdi, %rsi
	movl $73, %edi
	callq _rt.syscall2
	leave
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
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	leaq _strdata.212(%rip), %rax
	movq %rax, -48(%rbp)
	movq $7, -40(%rbp)
	movq $7, -32(%rbp)
	leaq _strdata.212(%rip), %rax
	movq %rax, -72(%rbp)
	movq $7, -64(%rbp)
	movq $7, -56(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -56(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -64(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -72(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	movq %rax, %rsi
	subq $-32, %rsp
	movq -64(%rbp), %rdx
	movl $2, %edi
	callq _rt.write
	subq $32, %rsp
	movq %rsp, %rcx
	movq 32(%rbp), %rax
	movq %rax, 16(%rcx)
	movq 24(%rbp), %rax
	movq %rax, 8(%rcx)
	movq 16(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	movq %rax, %rsi
	subq $-32, %rsp
	movq 24(%rbp), %rdx
	movl $2, %edi
	callq _rt.write
	leaq _strdata.226(%rip), %rax
	movq %rax, -24(%rbp)
	movq $1, -16(%rbp)
	movq $1, -8(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	movq %rax, %rsi
	subq $-32, %rsp
	movl $1, %edx
	movl $2, %edi
	callq _rt.write
	callq _rt.getpid
	movl %eax, %edi
	movl $6, %esi
	callq _rt.kill
	leave
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
	pushq %rbp
	movq %rsp, %rbp
	subq $176, %rsp
	pushq %rbx
	pushq %r12
	movl %edi, %ebx
	leaq _strdata.242(%rip), %rax
	movq %rax, -144(%rbp)
	movq $7, -136(%rbp)
	movq $7, -128(%rbp)
	leaq _strdata.242(%rip), %rax
	movq %rax, -168(%rbp)
	movq $7, -160(%rbp)
	movq $7, -152(%rbp)
	leaq _strdata.249(%rip), %rax
	movq %rax, -96(%rbp)
	movq $2, -88(%rbp)
	movq $2, -80(%rbp)
	leaq _strdata.249(%rip), %rax
	movq %rax, -120(%rbp)
	movq $2, -112(%rbp)
	movq $2, -104(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -152(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -160(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -168(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	movl %ebx, %edi
	movq %rax, %rsi
	subq $-32, %rsp
	movq -160(%rbp), %rdx
	movl %edi, %ebx
	movl $2, %edi
	callq _rt.write
	subq $32, %rsp
	movq %rsp, %rcx
	movq 32(%rbp), %rax
	movq %rax, 16(%rcx)
	movq 24(%rbp), %rax
	movq %rax, 8(%rcx)
	movq 16(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	movl %ebx, %edi
	movq %rax, %rsi
	subq $-32, %rsp
	movq 24(%rbp), %rdx
	movl %edi, %ebx
	movl $2, %edi
	callq _rt.write
	subq $32, %rsp
	movq %rsp, %rcx
	movq -104(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -112(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -120(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	movl %ebx, %edi
	movq %rax, %rsi
	subq $-32, %rsp
	movq -112(%rbp), %rdx
	movl %edi, %ebx
	movl $2, %edi
	callq _rt.write
	movl %ebx, %edi
	movslq %edi, %rax
	imulq $24, %rax, %rdx
	leaq _rt.reasons(%rip), %rcx
	movq %rcx, %r12
	addq %rdx, %r12
	cmpq $5, %rax
	jb Lbb64
	leaq _strdata.273(%rip), %rax
	movq %rax, -72(%rbp)
	movq $16, -64(%rbp)
	movq $16, -56(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -56(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -64(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -72(%rbp), %rax
	movq %rax, 0(%rcx)
	movl %edi, %ebx
	movl $0, %edi
	callq _rt.abort_fixed
	subq $-32, %rsp
	jmp Lbb65
Lbb64:
	movl %edi, %ebx
Lbb65:
	subq $32, %rsp
	movq %rsp, %rcx
	movq 16(%r12), %rax
	movq %rax, 16(%rcx)
	movq 8(%r12), %rax
	movq %rax, 8(%rcx)
	movq 0(%r12), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	movl %ebx, %edi
	movq %rax, %r12
	subq $-32, %rsp
	movslq %edi, %rax
	imulq $24, %rax, %rdx
	leaq _rt.reasons(%rip), %rcx
	movq %rcx, %rbx
	addq %rdx, %rbx
	cmpq $5, %rax
	jb Lbb67
	leaq _strdata.282(%rip), %rax
	movq %rax, -48(%rbp)
	movq $16, -40(%rbp)
	movq $16, -32(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -32(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -40(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -48(%rbp), %rax
	movq %rax, 0(%rcx)
	movl $0, %edi
	callq _rt.abort_fixed
	movq %r12, %rsi
	subq $-32, %rsp
	jmp Lbb68
Lbb67:
	movq %r12, %rsi
Lbb68:
	movq 8(%rbx), %rdx
	movl $2, %edi
	callq _rt.write
	leaq _strdata.288(%rip), %rax
	movq %rax, -24(%rbp)
	movq $1, -16(%rbp)
	movq $1, -8(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	movq %rax, %rsi
	subq $-32, %rsp
	movl $1, %edx
	movl $2, %edi
	callq _rt.write
	callq _rt.getpid
	movl %eax, %edi
	movl $6, %esi
	callq _rt.kill
	popq %r12
	popq %rbx
	leave
	ret
/* end function rt.abort_fixed */

.section ".text.rt.constchar", "ax"
_rt.constchar:
	pushq %rbp
	movq %rsp, %rbp
	movq 16(%rbp), %rax
	leave
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
	pushq %rbp
	movq %rsp, %rbp
	subq $368, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	movl $0, -364(%rbp)
	movl $-1, -360(%rbp)
	movl $-1, -356(%rbp)
	movl $0, %esi
	leaq -360(%rbp), %rdi
	callq _rt.pipe2
	callq _rt.fork
	movl %eax, %edi
	cmpl $0, %edi
	jz Lbb76
	movl %edi, %ebx
	jmp Lbb79
Lbb76:
	leaq -360(%rbp), %rax
	addq $4, %rax
	movl %edi, %ebx
	movl (%rax), %edi
	callq _rt.close
	movl %ebx, %edi
	leaq -360(%rbp), %rax
	addq $0, %rax
	movl %edi, %ebx
	movl (%rax), %edi
	movl $0, %esi
	callq _rt.dup2
	movl %ebx, %edi
	movl %edi, %ebx
	movl $1, %edi
	callq _rt.close
	movl %ebx, %edi
	movl %edi, %ebx
	movl $2, %edi
	callq _rt.close
	leaq _strdata.346(%rip), %rax
	movq %rax, -280(%rbp)
	movq $8, -272(%rbp)
	movq $8, -264(%rbp)
	leaq _strdata.346(%rip), %rax
	movq %rax, -304(%rbp)
	movq $8, -296(%rbp)
	movq $8, -288(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -288(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -296(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -304(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	subq $-32, %rsp
	movq %rax, -256(%rbp)
	leaq _strdata.357(%rip), %rax
	movq %rax, -232(%rbp)
	movq $2, -224(%rbp)
	movq $2, -216(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -216(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -224(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -232(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	subq $-32, %rsp
	movq %rax, -248(%rbp)
	movq $0, -240(%rbp)
	leaq _strdata.365(%rip), %rax
	movq %rax, -192(%rbp)
	movq $14, -184(%rbp)
	movq $14, -176(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -176(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -184(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -192(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	subq $-32, %rsp
	movq %rax, -208(%rbp)
	movq $0, -200(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -288(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -296(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -304(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	movq %rax, %rdi
	subq $-32, %rsp
	leaq -208(%rbp), %rdx
	leaq -256(%rbp), %rsi
	callq _rt.execve
	leaq _strdata.371(%rip), %rax
	movq %rax, -168(%rbp)
	movq $36, -160(%rbp)
	movq $36, -152(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -152(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -160(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -168(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.abort
	subq $-32, %rsp
Lbb79:
	cmpl $-1, %ebx
	jnz Lbb81
	leaq _strdata.381(%rip), %rax
	movq %rax, -144(%rbp)
	movq $35, -136(%rbp)
	movq $35, -128(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -128(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -136(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -144(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.abort
	movl %ebx, %edi
	subq $-32, %rsp
	jmp Lbb82
Lbb81:
	movl %ebx, %edi
Lbb82:
	leaq -360(%rbp), %rax
	addq $0, %rax
	movl %edi, %ebx
	movl (%rax), %edi
	callq _rt.close
	subq $32, %rsp
	movq %rsp, %rcx
	movq 32(%rbp), %rax
	movq %rax, 16(%rcx)
	movq 24(%rbp), %rax
	movq %rax, 8(%rcx)
	movq 16(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.constchar
	movl %ebx, %edi
	movq %rax, %r12
	subq $-32, %rsp
	movl %edi, %r13d
	movl $0, %ebx
Lbb85:
	movq 24(%rbp), %rax
	cmpq %rax, %rbx
	jae Lbb90
	leaq -360(%rbp), %rax
	addq $4, %rax
	movl (%rax), %edi
	movq %r12, %rsi
	addq %rbx, %rsi
	movq 24(%rbp), %rax
	movq %rax, %rdx
	subq %rbx, %rdx
	callq _rt.write
	movq %rax, %r14
	cmpq $0, %r14
	ja Lbb89
	leaq _strdata.428(%rip), %rax
	movq %rax, -72(%rbp)
	movq $36, -64(%rbp)
	movq $36, -56(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -56(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -64(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -72(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.abort
	subq $-32, %rsp
Lbb89:
	addq %r14, %rbx
	jmp Lbb85
Lbb90:
	movl %r13d, %edi
	leaq -360(%rbp), %rax
	addq $4, %rax
	movl %edi, %ebx
	movl (%rax), %edi
	callq _rt.close
	movl %ebx, %edi
	movl $0, %ecx
	movl $0, %edx
	leaq -364(%rbp), %rsi
	callq _rt.wait4
	movl -364(%rbp), %edi
	callq _rt.wifexited
	cmpl $0, %eax
	jnz Lbb98
	movl -364(%rbp), %edi
	callq _rt.wifsignaled
	cmpl $0, %eax
	jnz Lbb97
	leaq _strdata.461(%rip), %rax
	movq %rax, -24(%rbp)
	movq $36, -16(%rbp)
	movq $36, -8(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.abort
	subq $-32, %rsp
	movl $0, %eax
	jmp Lbb99
Lbb97:
	movl -364(%rbp), %edi
	callq _rt.wtermsig
	jmp Lbb99
Lbb98:
	movl -364(%rbp), %edi
	callq _rt.wexitstatus
Lbb99:
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	leave
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
	pushq %rbp
	movq %rsp, %rbp
	subq $56, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	movq %rsi, %r13
	movq %rdi, %r12
	movq 16(%r12), %rbx
	movq 8(%r12), %rax
	cmpq %rax, %rbx
	jae Lbb115
Lbb102:
	movq 8(%r12), %rax
	cmpq %rax, %rbx
	jae Lbb110
	movq 16(%r12), %rax
	cmpq %rax, %rbx
	jae Lbb105
	leaq _strdata.504(%rip), %rax
	movq %rax, -48(%rbp)
	movq $50, -40(%rbp)
	movq $50, -32(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -32(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -40(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -48(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.abort
	movq %r13, %rsi
	movq %r12, %rdi
	subq $-32, %rsp
	jmp Lbb106
Lbb105:
	movq %r13, %rsi
	movq %r12, %rdi
Lbb106:
	cmpq $0, %rbx
	jz Lbb108
	imulq $2, %rbx, %rbx
	jmp Lbb109
Lbb108:
	movq 8(%rdi), %rbx
Lbb109:
	movq %rsi, %r13
	movq %rdi, %r12
	jmp Lbb102
Lbb110:
	movq %rbx, 16(%r12)
	movq (%r12), %rdi
	movq %rbx, %rsi
	imulq %r13, %rsi
	callq _rt.realloc
	movq %rax, %rbx
	cmpq $0, %rbx
	setnz %al
	movzbl %al, %eax
	jnz Lbb112
	movq 16(%r12), %rax
	imulq %r13, %rax
	cmpq $0, %rax
	setz %al
	movzbl %al, %eax
Lbb112:
	cmpl $0, %eax
	jnz Lbb114
	leaq _strdata.548(%rip), %rax
	movq %rax, -24(%rbp)
	movq $35, -16(%rbp)
	movq $35, -8(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.abort
	subq $-32, %rsp
Lbb114:
	movq %rbx, (%r12)
Lbb115:
	popq %r13
	popq %r12
	popq %rbx
	leave
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
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	pushq %rbx
	pushq %r12
	movq 16(%rdi), %rax
Lbb118:
	movq 8(%rdi), %rcx
	cmpq %rcx, %rax
	jbe Lbb120
	movl $2, %ecx
	movl $0, %edx
	divq %rcx
	jmp Lbb118
Lbb120:
	imulq $2, %rax, %rax
	movq %rax, 16(%rdi)
	movq %rdi, %r12
	movq (%rdi), %rdi
	movq %rsi, %rbx
	imulq %rax, %rsi
	callq _rt.realloc
	movq %rbx, %rsi
	movq %rax, %rbx
	cmpq $0, %rbx
	setnz %al
	movzbl %al, %eax
	jnz Lbb122
	movq 16(%r12), %rax
	imulq %rsi, %rax
	cmpq $0, %rax
	setz %al
	movzbl %al, %eax
Lbb122:
	cmpl $0, %eax
	jnz Lbb124
	leaq _strdata.604(%rip), %rax
	movq %rax, -24(%rbp)
	movq $35, -16(%rbp)
	movq $35, -8(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.abort
	movq %r12, %rdi
	subq $-32, %rsp
	jmp Lbb125
Lbb124:
	movq %r12, %rdi
Lbb125:
	movq %rbx, (%rdi)
	popq %r12
	popq %rbx
	leave
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
	pushq %rbp
	movq %rsp, %rbp
	movq %rdi, %rax
	addq $1, %rax
	imulq $2, %rax, %rax
	subq $1, %rax
	imulq $8, %rax, %rax
	leave
	ret
/* end function rt.bin2size */

.section ".data.strdata.629", "a"
.balign 8
_strdata.629:
	.ascii "rt/malloc.ha:43:15: Size exceeds maximum for bin"
/* end data */

.section ".text.rt.size2bin", "ax"
_rt.size2bin:
	pushq %rbp
	movq %rsp, %rbp
	subq $40, %rsp
	pushq %rbx
	movq %rdi, %rbx
	movl $49, %edi
	callq _rt.bin2size
	cmpq %rax, %rbx
	jbe Lbb133
	leaq _strdata.629(%rip), %rax
	movq %rax, -24(%rbp)
	movq $48, -16(%rbp)
	movq $48, -8(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.abort
	movq %rbx, %rdi
	subq $-32, %rsp
	jmp Lbb134
Lbb133:
	movq %rbx, %rdi
Lbb134:
	movq %rdi, %rax
	addq $7, %rax
	movl $16, %ecx
	movl $0, %edx
	divq %rcx
	popq %rbx
	leave
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
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movl _rt.nalloc(%rip), %ecx
	movl _rt.nfree(%rip), %eax
	cmpl %eax, %ecx
	jz Lbb139
	leaq _strdata.647(%rip), %rax
	movq %rax, -24(%rbp)
	movq $35, -16(%rbp)
	movq $35, -8(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.abort
	subq $-32, %rsp
Lbb139:
	leave
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
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	pushq %rbx
	cmpq $0, %rdi
	jz Lbb146
	movq %rdi, %rbx
	movl $49, %edi
	callq _rt.bin2size
	movq %rbx, %rdi
	cmpq %rax, %rdi
	ja Lbb144
	callq _rt.malloc_small
	jmp Lbb145
Lbb144:
	callq _rt.malloc_large
Lbb145:
	movl _rt.nalloc(%rip), %ecx
	addl $1, %ecx
	movl %ecx, _rt.nalloc(%rip)
	jmp Lbb147
Lbb146:
	movl $0, %eax
Lbb147:
	popq %rbx
	leave
	ret
/* end function rt.malloc */

.section ".data.strdata.709", "a"
.balign 8
_strdata.709:
	.ascii "rt/malloc.ha:68:1"
/* end data */

.section ".text.rt.malloc_large", "ax"
_rt.malloc_large:
	pushq %rbp
	movq %rsp, %rbp
	subq $40, %rsp
	pushq %rbx
	movq %rdi, %rax
	addq $8, %rax
	movq %rdi, %rbx
	movq %rax, %rdi
	addq $8, %rdi
	callq _rt.segmalloc
	movq %rbx, %rdi
	cmpq $0, %rax
	jz Lbb152
	movq %rax, %rcx
	addq $8, %rcx
	addq $0, %rcx
	movq %rdi, (%rcx)
	addq $8, %rax
	addq $8, %rax
	jmp Lbb153
Lbb152:
	movl $0, %eax
Lbb153:
	popq %rbx
	leave
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
	pushq %rbp
	movq %rsp, %rbp
	subq $88, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	callq _rt.size2bin
	movq %rax, %r13
	imulq $8, %r13, %rcx
	leaq _rt.bins(%rip), %rax
	movq %rax, %rbx
	addq %rcx, %rbx
	cmpq $50, %r13
	jb Lbb157
	leaq _strdata.735(%rip), %rax
	movq %rax, -72(%rbp)
	movq $17, -64(%rbp)
	movq $17, -56(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -56(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -64(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -72(%rbp), %rax
	movq %rax, 0(%rcx)
	movl $0, %edi
	callq _rt.abort_fixed
	subq $-32, %rsp
Lbb157:
	movq (%rbx), %rax
	cmpq $0, %rax
	jnz Lbb162
	movq %r13, %rdi
	callq _rt.fill_bin
	cmpq $0, %rax
	jz Lbb162
	imulq $8, %r13, %rdx
	leaq _rt.bins(%rip), %rcx
	movq %rcx, %rbx
	addq %rdx, %rbx
	cmpq $50, %r13
	jb Lbb161
	leaq _strdata.764(%rip), %rcx
	movq %rcx, -48(%rbp)
	movq $17, -40(%rbp)
	movq $17, -32(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -32(%rbp), %rdx
	movq %rdx, 16(%rcx)
	movq -40(%rbp), %rdx
	movq %rdx, 8(%rcx)
	movq %rax, %r12
	movq -48(%rbp), %rax
	movq %rax, 0(%rcx)
	movl $0, %edi
	callq _rt.abort_fixed
	movq %r12, %rax
	subq $-32, %rsp
Lbb161:
	movq %rax, (%rbx)
Lbb162:
	cmpq $0, %rax
	jnz Lbb164
	movl $0, %eax
	jmp Lbb167
Lbb164:
	movq (%rax), %rbx
	imulq $8, %r13, %rdx
	leaq _rt.bins(%rip), %rcx
	movq %rcx, %r12
	addq %rdx, %r12
	cmpq $50, %r13
	jb Lbb166
	leaq _strdata.785(%rip), %rcx
	movq %rcx, -24(%rbp)
	movq $17, -16(%rbp)
	movq $17, -8(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rdx
	movq %rdx, 16(%rcx)
	movq -16(%rbp), %rdx
	movq %rdx, 8(%rcx)
	movq %rax, %r13
	movq -24(%rbp), %rax
	movq %rax, 0(%rcx)
	movl $0, %edi
	callq _rt.abort_fixed
	movq %r13, %rax
	subq $-32, %rsp
Lbb166:
	movq %rbx, (%r12)
Lbb167:
	popq %r13
	popq %r12
	popq %rbx
	leave
	ret
/* end function rt.malloc_small */

.section ".text.rt.fill_bin", "ax"
_rt.fill_bin:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	pushq %rbx
	callq _rt.bin2size
	movq %rax, %rdi
	movq %rdi, %rbx
	movl $1048576, %edi
	callq _rt.segmalloc
	movq %rbx, %rdi
	movq %rax, %rsi
	cmpq $0, %rsi
	jz Lbb171
	callq _rt.list_from_block
	jmp Lbb172
Lbb171:
	movl $0, %eax
Lbb172:
	popq %rbx
	leave
	ret
/* end function rt.fill_bin */

.section ".data.strdata.872", "a"
.balign 8
_strdata.872:
	.ascii "rt/malloc.ha:108:2"
/* end data */

.section ".text.rt.list_from_block", "ax"
_rt.list_from_block:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq %rdi, %rcx
	addq $8, %rcx
	movl $1048568, %eax
	movl $0, %edx
	divq %rcx
	movq %rax, %rdx
	movq %rsi, %rax
	addq $8, %rax
	movl $0, %ecx
Lbb176:
	movq %rdx, %r8
	subq $1, %r8
	cmpq %r8, %rcx
	jz Lbb179
	movq %rax, %r8
	addq $8, %r8
	addq %rdi, %r8
	addq $8, %r8
	movq %rdi, (%rax)
	movq %r8, 8(%rax)
	movq %rdi, %r8
	addq $8, %r8
	addq %r8, %rax
	addq $1, %rcx
	jmp Lbb176
Lbb179:
	movq %rax, %rcx
	addq $0, %rcx
	movq %rdi, (%rcx)
	movq $0, 1(%rax)
	movq %rsi, %rax
	addq $8, %rax
	addq $8, %rax
	leave
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
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	pushq %rbx
	pushq %r12
	cmpq $0, %rdi
	jz Lbb188
	movl _rt.nfree(%rip), %eax
	addl $1, %eax
	movl %eax, _rt.nfree(%rip)
	movq %rdi, %rax
	subq $8, %rax
	addq $0, %rax
	movq (%rax), %r12
	movq %rdi, %rbx
	movl $49, %edi
	callq _rt.bin2size
	movq %r12, %rsi
	movq %rbx, %rdi
	cmpq %rax, %rsi
	jbe Lbb187
	callq _rt.free_large
	jmp Lbb188
Lbb187:
	callq _rt.free_small
Lbb188:
	popq %r12
	popq %rbx
	leave
	ret
/* end function rt.free */

.section ".data.strdata.956", "a"
.balign 8
_strdata.956:
	.ascii "rt/malloc.ha:130:15: free: munmap failed"
/* end data */

.section ".text.rt.free_large", "ax"
_rt.free_large:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	subq $16, %rdi
	movq %rsi, %rax
	addq $8, %rax
	movq %rax, %rsi
	addq $8, %rsi
	callq _rt.segfree
	cmpl $0, %eax
	jz Lbb192
	leaq _strdata.956(%rip), %rax
	movq %rax, -24(%rbp)
	movq $40, -16(%rbp)
	movq $40, -8(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 0(%rcx)
	callq _rt.abort
	subq $-32, %rsp
Lbb192:
	leave
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
	pushq %rbp
	movq %rsp, %rbp
	subq $56, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	movq %rdi, %rbx
	movq %rsi, %rdi
	callq _rt.size2bin
	movq %rbx, %rdi
	movq %rax, %r12
	imulq $8, %r12, %rcx
	leaq _rt.bins(%rip), %rax
	movq %rax, %rbx
	addq %rcx, %rbx
	cmpq $50, %r12
	jb Lbb196
	leaq _strdata.974(%rip), %rax
	movq %rax, -48(%rbp)
	movq $18, -40(%rbp)
	movq $18, -32(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -32(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -40(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -48(%rbp), %rax
	movq %rax, 0(%rcx)
	movq %rdi, %r13
	movl $0, %edi
	callq _rt.abort_fixed
	movq %r13, %rdi
	subq $-32, %rsp
Lbb196:
	movq (%rbx), %rax
	movq %rax, (%rdi)
	imulq $8, %r12, %rcx
	leaq _rt.bins(%rip), %rax
	movq %rax, %rbx
	addq %rcx, %rbx
	cmpq $50, %r12
	jb Lbb198
	leaq _strdata.985(%rip), %rax
	movq %rax, -24(%rbp)
	movq $18, -16(%rbp)
	movq $18, -8(%rbp)
	subq $32, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 0(%rcx)
	movq %rdi, %r12
	movl $0, %edi
	callq _rt.abort_fixed
	movq %r12, %rdi
	subq $-32, %rsp
Lbb198:
	movq %rdi, (%rbx)
	popq %r13
	popq %r12
	popq %rbx
	leave
	ret
/* end function rt.free_small */

.section ".text.rt.realloc", "ax"
.globl _rt.realloc
_rt.realloc:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	movq %rdi, %rbx
	movq %rsi, %rdi
	cmpq $0, %rdi
	jz Lbb215
	cmpq $0, %rbx
	jz Lbb214
	movq %rbx, %rax
	subq $8, %rax
	movq (%rax), %r12
	cmpq %rdi, %r12
	jae Lbb212
	movq %rdi, %r13
	movl $49, %edi
	callq _rt.bin2size
	movq %r13, %rdi
	cmpq %rax, %rdi
	setb %al
	movzbl %al, %eax
	jae Lbb206
	movq %rdi, %r13
	callq _rt.size2bin
	movq %r13, %rdi
	movq %rax, %r13
	movq %rdi, %r14
	movq %r12, %rdi
	callq _rt.size2bin
	movq %r14, %rdi
	cmpq %rax, %r13
	setz %al
	movzbl %al, %eax
Lbb206:
	cmpl $0, %eax
	jnz Lbb210
	callq _rt.malloc
	movq %r12, %rdx
	movq %rbx, %rdi
	movq %rax, %rbx
	cmpq $0, %rbx
	jnz Lbb209
	movq %rbx, %rax
	jmp Lbb217
Lbb209:
	movq %rdi, %rsi
	movq %rdi, %r12
	movq %rbx, %rdi
	callq _rt.memcpy
	movq %r12, %rdi
	callq _rt.free
	movq %rbx, %rax
	jmp Lbb217
Lbb210:
	movq %rbx, %rdi
	movq %rdi, %rax
	jmp Lbb217
Lbb212:
	movq %rbx, %rdi
	movq %rdi, %rax
	jmp Lbb217
Lbb214:
	callq _rt.malloc
	jmp Lbb217
Lbb215:
	movq %rbx, %rdi
	callq _rt.free
	movl $0, %eax
Lbb217:
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	leave
	ret
/* end function rt.realloc */

.section ".text.rt.memcpy", "ax"
.globl _rt.memcpy
_rt.memcpy:
	pushq %rbp
	movq %rsp, %rbp
	movl $0, %eax
Lbb220:
	cmpq %rdx, %rax
	jae Lbb223
	movzbl (%rsi, %rax, 1), %ecx
	movb %cl, (%rdi, %rax, 1)
	addq $1, %rax
	jmp Lbb220
Lbb223:
	leave
	ret
/* end function rt.memcpy */

.section ".text.rt.memmove", "ax"
.globl _rt.memmove
_rt.memmove:
	pushq %rbp
	movq %rsp, %rbp
	cmpq %rsi, %rdi
	jz Lbb235
	cmpq %rsi, %rdi
	jb Lbb231
	movl $0, %eax
Lbb228:
	cmpq %rdx, %rax
	jae Lbb235
	movq %rdx, %rcx
	subq %rax, %rcx
	movq %rcx, %r8
	subq $1, %r8
	movq %rdx, %rcx
	subq %rax, %rcx
	subq $1, %rcx
	movzbl (%rsi, %rcx, 1), %ecx
	movb %cl, (%rdi, %r8, 1)
	addq $1, %rax
	jmp Lbb228
Lbb231:
	movl $0, %eax
Lbb232:
	cmpq %rdx, %rax
	jae Lbb235
	movzbl (%rsi, %rax, 1), %ecx
	movb %cl, (%rdi, %rax, 1)
	addq $1, %rax
	jmp Lbb232
Lbb235:
	leave
	ret
/* end function rt.memmove */

.section ".text.rt.memset", "ax"
.globl _rt.memset
_rt.memset:
	pushq %rbp
	movq %rsp, %rbp
	movl $0, %eax
Lbb238:
	cmpq %rdx, %rax
	jae Lbb241
	movzbl %sil, %ecx
	movb %cl, (%rdi, %rax, 1)
	addq $1, %rax
	jmp Lbb238
Lbb241:
	leave
	ret
/* end function rt.memset */

.section ".text.rt.start_ha", "ax"
.globl _rt.start_ha
_rt.start_ha:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rbx
	pushq %r12
	leaq ___init_array_start(%rip), %rcx
	leaq ___init_array_end(%rip), %rax
	subq %rcx, %rax
	movl $8, %ecx
	movl $0, %edx
	divq %rcx
	movq %rax, %r12
	movl $0, %ebx
Lbb245:
	cmpq %r12, %rbx
	jae Lbb248
	leaq ___init_array_start(%rip), %rax
	movq (%rax, %rbx, 8), %rax
	callq *%rax
	addq $1, %rbx
	jmp Lbb245
Lbb248:
	callq _main
	leaq ___fini_array_start(%rip), %rcx
	leaq ___fini_array_end(%rip), %rax
	subq %rcx, %rax
	movl $8, %ecx
	movl $0, %edx
	divq %rcx
	movq %rax, %r12
	movl $0, %ebx
Lbb250:
	cmpq %r12, %rbx
	jae Lbb253
	leaq ___fini_array_start(%rip), %rax
	movq (%rax, %rbx, 8), %rax
	callq *%rax
	addq $1, %rbx
	jmp Lbb250
Lbb253:
	movl $0, %edi
	callq _rt.exit
	popq %r12
	popq %rbx
	leave
	ret
/* end function rt.start_ha */

.section ".text.rt.strcmp", "ax"
.globl _rt.strcmp
_rt.strcmp:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rcx
	movq 48(%rbp), %rax
	cmpq %rax, %rcx
	jnz Lbb264
	movq 16(%rbp), %rdx
	movq 40(%rbp), %rsi
	movl $0, %eax
Lbb259:
	cmpq %rcx, %rax
	jae Lbb263
	movzbl (%rdx, %rax, 1), %r8d
	movzbl (%rsi, %rax, 1), %edi
	cmpl %edi, %r8d
	jnz Lbb262
	addq $1, %rax
	jmp Lbb259
Lbb262:
	movl $0, %eax
	jmp Lbb265
Lbb263:
	movl $1, %eax
	jmp Lbb265
Lbb264:
	movl $0, %eax
Lbb265:
	leave
	ret
/* end function rt.strcmp */

