#include "mpc2kxl.h"

void __far __fastcall __loadds mixer_refresh(void)
{
	(*(long *)&C2_W_PARAM_HOOK_OFF) = 0L;
	return 0;
}
