#include "mpc2k.h"

void __far __fastcall __loadds X_09ED0(void)
{
	install_handler(0x32, (void (far *)(void))L_09EBA);
	edit_range_select();
}
