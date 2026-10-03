#include "mpc2k.h"

void __far __fastcall __loadds X_03F3E(void)
{
	((void (__near __pascal *)(char __far *, void (__far *)(void), void (__far *)(void)))ui_screen_enter)(TBL_WINKEYS_FX_CHORUS, fx_type_load_select, (void (far *)(void))X_03F3E);
	fx_mod_arm_field();
}
