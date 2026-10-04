#include "mpc2k.h"

void __near string_byte_scan(void)
{
	char __far *p;
	char c;

	if (!SND_CURRENT)
		switch (LOOP_CURSOR) {
		case 1:
			break;
		default:
			LOOP_CURSOR = 0;
		}
	switch (LOOP_CURSOR) {
	case 0:
		break;
	case 1:
		L_090D4();
		return;
	case 2:
		ui_edit_position(0x14, 0xc, (long)L_07C5E);
		return;
	case 3:
		sample_active_check_3(0x7a, 0xc, (long)L_07C5E);
		return;
	case 4:
		install_handler_15(0);
		if (sample_check_active(SND_CURRENT)) {
			p = (char __far *)&G_EDIT_FIELD_VAL;
			c = *p = 0;
		} else {
			p = (char __far *)SND_CURRENT + 0x24;
			c = 1;
		}
		((void (__far __pascal *)(char __far *, char, int, char, char, void (__far *)(void)))voice_trigger_full)(p, c, 0xda, 0xc, 4, L_09900);
		return;
	default:
		LOOP_CURSOR = 0;
	}
	X_090B2();
}
