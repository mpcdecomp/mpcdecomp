#include "mpc2kxl.h"

void __far __fastcall __loadds mute_assign_open(void)
{
	mute_assign_refresh();
	pgm_params_enter();
}
