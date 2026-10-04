#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern char C1_W_08FCB[1];

void __far L_4BBCE(void)
{
	((void (__far *)(char __far *, char __far *))far_484D6)(C1_W_08FCB, C0_W_0D7C2 + 0x12);
}
