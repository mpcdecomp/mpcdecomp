#include "mpc2kxl.h"

extern char C0_TBL_09160[1];
extern char EP_FAR_4EC12_OFF[1];
extern char EP_FAR_4EC12_SEG[1];

void __far L_4EE8C(void)
{
	((void (__far *)(char __near *, char __near *, char))far_4EFFA)(EP_FAR_4EC12_OFF, EP_FAR_4EC12_SEG, C0_TBL_09160[(*(unsigned char *)&C2_B_PAD_DRUM) * 388]);
}
