#include "mpc2k.h"

void __far __fastcall __loadds X_09A88(void)
{
	install_handler(0x32, (void (far *)(void))L_09A72);
	edit_range_select();
}
