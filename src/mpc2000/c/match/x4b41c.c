#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern unsigned char C1_B_0D7D9;

void __far __fastcall __loadds L_4AABE(void)
{
	if (C1_B_0D7D9 >= 0x40) goto br_4B42D;
	C1_B_0D7D9 <<= 1;
br_4B42D:
	((void (__far *)(char __far *, long))far_4B16C)(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 42));
}
