#include "mpc2k.h"

void __far __fastcall __loadds program_close(void)
{
	if (!G_PGM_RETURN_PARAMS) {
		pgm_assign_enter();
	} else {
		pgm_params_enter();
	}
	int44_wrapper(1);
}
