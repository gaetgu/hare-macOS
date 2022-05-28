.text
.global rt.syscall0
rt.syscall0:
	movq %rdi, %rax
	syscall
	ret

.text
.global rt.syscall1
rt.syscall1:
	movq %rdi, %rax
	movq %rsi, %rdi
	syscall
	ret

.text
.global rt.syscall2
rt.syscall2:
	movq %rdi, %rax
	movq %rsi, %rdi
	movq %rdx, %rsi
	syscall
	ret

.text
.global rt.syscall3
rt.syscall3:
	movq %rdi, %rax
	movq %rsi, %rdi
	movq %rdx, %rsi
	movq %rcx, %rdx
	syscall
	ret

.text
.global rt.syscall4
rt.syscall4:
	movq %rdi, %rax
	movq %r8, %r10
	movq %rsi, %rdi
	movq %rdx, %rsi
	movq %rcx, %rdx
	syscall
	ret

.text
.global rt.syscall5
rt.syscall5:
	movq %rdi, %rax
	movq %r8, %r10
	movq %rsi, %rdi
	movq %r9, %r8
	movq %rdx, %rsi
	movq %rcx, %rdx
	syscall
	ret

.text
.global rt.syscall6
rt.syscall6:
	movq %rdi, %rax
	movq %r8, %r10
	movq %rsi, %rdi
	movq %r9, %r8
	movq %rdx, %rsi
	movq 8(%rsp), %r9
	movq %rcx, %rdx
	syscall
	ret
