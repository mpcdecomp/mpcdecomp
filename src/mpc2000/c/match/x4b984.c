#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;

void __far far_4B984(void)
{
	((void (__far *)(char __far *, long))far_4B16C)(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 42));
}
