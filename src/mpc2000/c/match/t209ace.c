#include "mpc2k.h"

void __far __fastcall __loadds L_09EBA(void)
{
	install_handler(0x32, (void (far *)(void))L_09E4E);
}
