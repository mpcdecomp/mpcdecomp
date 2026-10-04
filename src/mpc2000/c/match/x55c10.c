#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;

void __far L_55C10(void)
{
	*(int far *)(C2_FP_MIDI_IN_BLOCK + 2) = (unsigned char)C0_W_0D7C2[8];
}
