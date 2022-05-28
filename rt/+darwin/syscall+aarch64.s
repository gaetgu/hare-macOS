.text
.global rt.syscall0
rt.syscall0:
	mov x8, x0
	svc 0
	ret

.text
.global rt.syscall1
rt.syscall1:
	mov x8, x0
	mov x0, x1
	svc 0
	ret

.text
.global rt.syscall2
rt.syscall2:
	mov x8, x0
	mov x0, x1
	mov x1, x2
	svc 0
	ret

.text
.global rt.syscall3
rt.syscall3:
	mov x8, x0
	mov x0, x1
	mov x1, x2
	mov x2, x3
	svc 0
	ret

.text
.global rt.syscall4
rt.syscall4:
	mov x8, x0
	mov x0, x1
	mov x1, x2
	mov x2, x3
	mov x3, x4
	svc 0
	ret

.text
.global rt.syscall5
rt.syscall5:
	mov x8, x0
	mov x0, x1
	mov x1, x2
	mov x2, x3
	mov x3, x4
	mov x4, x5
	svc 0
	ret

.text
.global rt.syscall6
rt.syscall6:
	mov x8, x0
	mov x0, x1
	mov x1, x2
	mov x2, x3
	mov x3, x4
	mov x4, x5
	mov x5, x6
	svc 0
	ret
