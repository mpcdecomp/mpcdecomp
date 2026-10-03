#include "mpc2kxl.h"

void __far __fastcall __loadds velocity_mod_refresh(void)
{
	pad_audition_note_off();
	(*(long *)&C2_W_PARAM_HOOK_OFF) = 0L;
	pad_route_mode_set(0);
}
