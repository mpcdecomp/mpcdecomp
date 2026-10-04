#include "mpc2k.h"

void __far __fastcall __loadds X_04352(void)
{
	ui_screen_enter((long)TBL_WINKEYS_FX_PITCH_SHIFT, (long)fx_type_load_select, (long)((void (far *)(void))X_04352));
	fx_pitch_arm_field();
}
