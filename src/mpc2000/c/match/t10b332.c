#include "mpc2k.h"

#pragma intrinsic(memcpy)

void __far ui_enter_sound_dialog(int p0, int x1, int x2, int x3, int x4, int x5, int x6, int x7, int x8, int x9, int x10, int x11, int x12, int x13, int x14, int x15, int x16, int x17, int x18, int x19, int x20, int x21, int x22, int x23, int x24, int x25, int x26, long p27)
{
	memcpy(P_5140, &p0, 0x36);
	FP_SOUND_DLG_CALLBACK = p27;
	win_keys_merge(P_43C2);
	(*(char *)&G_PAD_NOTE_BASE) = G_NOTE_IN[0];
	(*(unsigned char *)&G_NOTE_CAPTURE) = 1;
	PAD_INPUT_MODE = PADIN_ON;
	ui_sound_dialog_draw(G_KEEP_RETRY_FOCUS);
}
