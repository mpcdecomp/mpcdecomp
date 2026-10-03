#include "mpc2kxl.h"

extern char C2_TBL_031AA[1];

void __far L_4EE1E(void)
{
	((int (__far *)(void))*(long *)(C2_TBL_031AA + C2_W_PGM_MIDI_CURSOR * 42))();
	disp_request_flush();
}
