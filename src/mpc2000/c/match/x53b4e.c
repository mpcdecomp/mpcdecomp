#include "mpc2kxl.h"

void __far __fastcall __loadds fx_pitch_shift_open(void)
{
	fx_edit_refresh();
	mixer_setup_f6();
}
