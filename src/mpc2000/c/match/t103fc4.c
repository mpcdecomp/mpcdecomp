#include "mpc2k.h"

void __far __fastcall __loadds X_03F3E(void)
{
	ui_screen_enter((long)TBL_WINKEYS_FX_CHORUS, (long)fx_type_load_select, (long)((void (far *)(void))X_03F3E));
	fx_mod_arm_field();
}
