; INT 38h heap arena starts at PROGRAM_ARENA_SEG. MPC2000.SYS loads
; 3000h below and must end <= arena (mz_stack.inc verifies stack top).
; raising PROGRAM_ARENA_SEG shrinks the heap by the same amount.
PROGRAM_ARENA_SEG       equ     05a00h
