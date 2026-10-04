#include "mpc2kxl.h"

void __far __fastcall __loadds snd_debug_open(void)
{
	((int (__far *)(void))*(long *)(((char *)&C2_W_06470) + C2_W_SND_DEBUG_CURSOR * 42))();
}
