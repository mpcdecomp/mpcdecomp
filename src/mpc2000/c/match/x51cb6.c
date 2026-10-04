#include "mpc2kxl.h"

void __far L_51CB6(char p0)
{
	((char __far * (__far *)(char, int))pgm_stereo_mix_ptr)(C2_B_PAD_DRUM, (*(unsigned char *)&C2_B_PAD_NOTE))[1] = p0 + 0x32;
}
