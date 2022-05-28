.section ".text.testmod.testfunc1", "ax"
.globl _testmod.testfunc1
_testmod.testfunc1:
	pushq %rbp
	movq %rsp, %rbp
	leave
	ret
/* end function testmod.testfunc1 */

.section ".text.testmod.testfunc2", "ax"
.globl _testmod.testfunc2
_testmod.testfunc2:
	pushq %rbp
	movq %rsp, %rbp
	leave
	ret
/* end function testmod.testfunc2 */

