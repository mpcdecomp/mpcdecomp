#include "mpc2k.h"

void __far __fastcall __loadds X_0AEF0(void)
{
	switch (G_ASSIGN_VIEW_FIELD) {
	case 0: case 1:
		G_ASSIGN_VIEW_FIELD += 2;
		break;
	case 3:
		if (!*(long *)PTR_LCD_STATE || !(*(char __far **)PTR_LCD_STATE)[0x13]) return;
		G_ASSIGN_VIEW_FIELD = 5;
		break;
	default:
		return;
	}
	midi_txrx_arm_field();
}
