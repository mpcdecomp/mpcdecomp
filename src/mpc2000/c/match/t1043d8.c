#include "mpc2k.h"

void __far __fastcall __loadds X_04352(void)
{
	((void (__near __pascal *)(char __far *, void (__far *)(void), void (__far *)(void)))ui_screen_enter)(TBL_WINKEYS_FX_PITCH_SHIFT, fx_type_load_select, (void (far *)(void))X_04352);
	fx_pitch_arm_field();
}
