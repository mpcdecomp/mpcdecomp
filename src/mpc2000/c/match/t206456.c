#include "mpc2k.h"

void __far __fastcall __loadds far_06834(void)
{
	install_handler(0x48, ((void (__far *)(void))L_00DE8));
}
