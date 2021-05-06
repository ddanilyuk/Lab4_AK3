.global lab2
.syntax unified

lab2:
	push {lr}
	mov r0, #2
	mov r1, #3
	
// 1)
	add r7, r1, r0
	
// 2)
	mul r7, r1, r0

x3:
// 3)
	sub r7, r1, r0
	
// III
	bl first
	
// 4)
	ITEE EQ
	
// 6)
	subEQ r7, r1, r0
	
// 5)
	mulNE r7, r1, r0
	
// 7)
	lsrsNE r7, r0, #1
	
// 8)
	bCS x3
	
// 9)
	add r7, r1, r0
	
	pop {pc}


first:
	push {lr}
	
x10:
// 10)
	mov r7, #1
	lsrs r7, #1
	
// IX
	bl second
	
// 11)
	IT PL

// 12)
	lsrPL r7, #1

// 13)
	bNE x10
	
// 14)
	sub r7, r1, r0
	
// 15)
	adds r7, r1, r0
	
	pop {pc}
	

second:
	push {lr}
	
// 17)
	and r7, r1, r0
	
// 18)
	orr r7, r1, r0
	
	pop {pc}
