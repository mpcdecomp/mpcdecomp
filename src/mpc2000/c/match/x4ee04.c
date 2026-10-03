#include "mpc2kxl.h"

void __far __fastcall __loadds pgm_midi_refresh(void)
{
	(*(long *)&C2_W_PARAM_HOOK_OFF) = 0L;
	pad_route_mode_set(0);
}
