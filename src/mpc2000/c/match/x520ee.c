#include "mpc2kxl.h"

extern char C0_TBL_09160[1];
extern char EP_MIXER_SETUP_F6_OFF[1];
extern char EP_MIXER_SETUP_F6_SEG[1];

void __far L_520EE(void)
{
	((void (__far *)(char __near *, char __near *, char))far_4EFFA)(EP_MIXER_SETUP_F6_OFF, EP_MIXER_SETUP_F6_SEG, C0_TBL_09160[C2_B_MIXER_DRUM * 388]);
}
