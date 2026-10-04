#include "mpc2kxl.h"

void __far __fastcall __loadds velo_pitch_close(void)
{
	velo_pitch_refresh();
	pgm_params_enter();
}
