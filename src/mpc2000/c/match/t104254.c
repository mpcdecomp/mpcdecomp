#include "mpc2k.h"

void __far __fastcall __loadds X_041CE(void)
{
	((void (__near __pascal *)(char __far *, void (__far *)(void), void (__far *)(void)))ui_screen_enter)(TBL_WINKEYS_0185C, fx_type_load_select, (void (far *)(void))X_041CE);
	fx_autopan_arm_field();
}
