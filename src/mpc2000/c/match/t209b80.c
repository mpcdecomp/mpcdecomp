#include "mpc2k.h"

void __far __fastcall __loadds X_09F6C(void)
{
	install_handler(WIN_K_PAINT, (void (far *)(void))X_09F56);
	edit_range_select();
}
