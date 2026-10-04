#include "mpc2kxl.h"

void __far __fastcall __loadds velo_env_filter_open(void)
{
	velo_env_filter_refresh();
	pgm_params_enter();
}
