/* MPC2000 SYS text1: the FX DISTORTION screen's cursor keys. */

#include "mpc2k.h"

/* The fields are a 2x2 grid: bit 0 the column, bit 1 the row. */
void __far __loadds __fastcall X_03AEA(void)
{
	if (FX_DIST_CURSOR & 1) {
		FX_DIST_CURSOR--;
		fx_dist_arm_field();
	}
}

void __far __loadds __fastcall X_03B00(void)
{
	if (!(FX_DIST_CURSOR & 1)) {
		FX_DIST_CURSOR++;
		fx_dist_arm_field();
	}
}

void __far __loadds __fastcall X_03B16(void)
{
	if (FX_DIST_CURSOR >= 2) {
		FX_DIST_CURSOR -= 2;
		fx_dist_arm_field();
	}
}

void __far __loadds __fastcall X_03B2E(void)
{
	if (FX_DIST_CURSOR <= 1) {
		FX_DIST_CURSOR += 2;
		fx_dist_arm_field();
	}
}

/* The 4-BAND FILTER screen. */
void __far __loadds __fastcall X_03B46(void)
{
	((void (__near __pascal *)(void __far *, void (__far *hook)(void), void __far *))ui_screen_enter)(TBL_WINKEYS_4BAND_FILTER, L_04D1A, X_03B46);
	midi_note_handler();
}
