#include "mpc2k.h"

void __far __fastcall __loadds L_03C56(void)
{
	install_handler(0x48, (void (far *)(void))L_03C30);
}

