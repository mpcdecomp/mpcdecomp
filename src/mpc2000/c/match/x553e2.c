#include "mpc2kxl.h"

void __far __fastcall __loadds snd_debug_return(void)
{
	((int (__far *)(void))(*(char __far **)&C2_W_08DBE))();
}
