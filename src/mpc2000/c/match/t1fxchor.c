/* MPC2000 SYS text1: the FX CHORUS screen's cursor keys. */

#include "mpc2k.h"

void __far __loadds __fastcall fx_chorus_up(void)
{
	if (G_UI_MODE != 0) {
		G_UI_MODE--;
		fx_mod_arm_field();
	}
}

void __far __loadds __fastcall fx_chorus_down(void)
{
	if (G_UI_MODE < 3) {
		G_UI_MODE++;
		fx_mod_arm_field();
	}
}

void __far __loadds __fastcall fx_chorus_left(void)
{
	if (G_UI_MODE != 0) {
		G_UI_MODE = 0;
		fx_mod_arm_field();
	}
}

void __far __loadds __fastcall fx_chorus_right(void)
{
	if (G_UI_MODE == 0) {
		G_UI_MODE = 1;
		fx_mod_arm_field();
	}
}

/* FX ROTARY: the screen's keys, fx_type_load_select as its poll hook, and
 * itself as the screen to come back to. */
void __far __loadds __fastcall X_04058(void)
{
	ui_screen_enter((long)TBL_WINKEYS_FX_ROTARY, (long)fx_type_load_select, (long)X_04058);
	fx_rotary_arm_field();
}
