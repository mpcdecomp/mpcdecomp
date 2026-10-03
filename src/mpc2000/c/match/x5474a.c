#include "mpc2kxl.h"

void __far __fastcall __loadds fx_mixer_close(void)
{
	fx_mixer_refresh();
	((int (__far *)(void))((char __far *)C2_W_08D9C))();
}
