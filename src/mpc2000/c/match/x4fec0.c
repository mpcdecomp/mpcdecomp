#include "mpc2kxl.h"

void __far __fastcall __loadds velocity_mod_open(void)
{
	velocity_mod_refresh();
	pgm_params_enter();
}
