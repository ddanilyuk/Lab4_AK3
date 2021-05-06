.global lab1
.syntax unified

lab1:
	push {lr}

// F = 16(X1 + X2 - 1) & (X3 - X4)/2

// get data memory
	ldr r4, =xxx
	
// load X1, X2 to regs
	ldm r4!, {r0, r1, r2, r3}
	
// X1 + X2
	adds r1, r3
	adc r0, r2
	
// X1 + X2 - 1
	subs r1, #1
	sbc r0, #0
	
// 16(X1 + X2 - 1)
	mov r2, #4	
.x16:
	lsls r1, #1
	lsl r0, r0, #1
	adc r0, #0
	subs r2, #1
	bne .x16
	
// load X3, X4 to regs
	ldm r4!, {r2, r3, r7, r8}
		
// (X3 - X4)
	subs r3, r8
	sbc r2, r7
	
// (X3 - X4)/2
	asrs r2, #1
	lsr r3, r3, #1
	IT CS
	orrCS r3, #0x80000000
	
// 16(X1 + X2 - 1) & (X3 - X4)/2
	and r3, r1
	and r2, r0

// result correction
// 1)
	ITTT VS
	lsrVS r2, r2, #1
	lsrVS r3, r3, #1
	orrVS r2, #0x80000000
	
// 2)
	cmp r3, 0

// 3)	
	ITT EQ
	movEQ r3, #0b10000000010000
	lslEQ r3, r3, #16
	
// 4)
	mov r2, #0b10000000010000
	
// 5)
	and r0, r2, #0xC0000000
	cmp r0, #0x80000000
	
// 6)
	ITT EQ
	asrEQ r2, r2, #1
	lsrEQ r3, r3, #1
	
// 7)
	IT VC

// result to mem
	stmVC r4!, {r2, r3}

	pop {pc}

