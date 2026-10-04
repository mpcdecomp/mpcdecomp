#include "mpc2kxl.h"

void __far __fastcall __loadds effect_mixer_close(void)
{
	effect_mixer_refresh();
	((int (__far *)(void))((char __far *)C2_W_08DA6))();
}
