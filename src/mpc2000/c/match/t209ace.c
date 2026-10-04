#include "mpc2k.h"

void __far __fastcall __loadds L_09EBA(void)
{
	install_handler(WIN_K_PAINT, (void (far *)(void))L_09E4E);
}
