#include "mpc2k.h"

void __far __fastcall __loadds X_09F56(void)
{
	install_handler(0x32, (void (far *)(void))X_09EEA);
}
