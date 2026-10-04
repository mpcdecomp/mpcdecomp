#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern unsigned char C1_B_0D7D9;

void __far __fastcall __loadds far_4B83C(void)
{
	if (C1_B_0D7D9 <= 1) goto br_4B84D;
	C1_B_0D7D9 >>= 1;
br_4B84D:
	((void (__far *)(char __far *, long))far_4B16C)(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 42));
}
