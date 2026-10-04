#include "mpc2k.h"

void __far __fastcall __loadds X_09A88(void)
{
	install_handler(WIN_K_PAINT, (void (far *)(void))L_09A72);
	edit_range_select();
}
