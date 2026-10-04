#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C2_W_04294[1];

void __far mixer_chan_field2_thunk(void)
{
	C0_B_098B8[0] = ((char __far * (__far *)(char, int))pgm_stereo_mix_ptr)(C2_B_PAD_DRUM, (*(unsigned char *)&C2_B_PAD_NOTE))[1] - 0x32;
	C2_W_CHANSET_CURSOR = 2;
	((void (__far *)(char __far *, char __far *))ui_field_engine)(C2_W_04294, C0_B_098B8);
}
