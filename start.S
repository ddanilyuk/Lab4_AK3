.syntax unified
.cpu cortex-m4
//.fpu softvfp
.thumb

// Global memory locations.
.global vtable
.global __hard_reset__

.global xxx

/*
 * vector table
 */
.type vtable, %object
.type __hard_reset__, %function
vtable:
	.word __stack_start 
	.word __hard_reset__+1
	.size vtable, .-vtable

__hard_reset__:
// initialize stack here
// if not initialized yet
	bl lab1
	bl lab2
	_loop: b _loop
	.size __hard_reset__, .-__hard_reset__

xxx:
	.word 	0xFFFFFFFF
	.word	0xFFFFFFEF	// -17
	.word	0
	.word	12		    // 12
	.word	0
	.word	17		    // 17
	.word	0
	.word	3		    // 3
	.word	0
	.word	0
