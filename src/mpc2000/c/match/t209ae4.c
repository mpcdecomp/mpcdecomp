#include "mpc2k.h"

void __far __fastcall __loadds X_09ED0(void)
{
	install_handler(WIN_K_PAINT, (void (far *)(void))L_09EBA);
	edit_range_select();
}
