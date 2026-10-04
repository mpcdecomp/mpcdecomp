#include "mpc2kxl.h"

void __far __fastcall __loadds sound_spec_open(void)
{
	((int (__far *)(void))(*(char __far **)&C2_W_08D2E))();
}
