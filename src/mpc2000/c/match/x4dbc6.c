#include "mpc2kxl.h"

void __far __fastcall __loadds mixer_select_pgm_drum_1(void)
{
	C2_B_PAD_DRUM = 0;
	((int (__far *)(void))(*(char __far **)&C2_W_DRUM_SELECT_HOOK_OFF))();
}
