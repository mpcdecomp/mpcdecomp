#include "mpc2k.h"

void __far __fastcall __loadds midi_channel_handler(int k)
{
	char pad;
	char hit;

	if (!(char)k) return;
	G_FLAG_8CA8 = 1;
	pad = (k >> 8) & 0xf;
	if (pad == NAME_EDIT_LAST_PAD) {
		if (P_0D24[NAME_EDIT_CASE * 32 + pad] == BUF_NAME_EDIT[G_SEQ_MODE]) hit = 1;
		else hit = 0;
	} else {
		hit = 0;
		if (B_8CAB) far_0369C();
		B_8CAB = 1;
		NAME_EDIT_LAST_PAD = pad;
	}
	BUF_NAME_EDIT[G_SEQ_MODE] = P_0D24[(hit + NAME_EDIT_CASE * 2) * 16 + pad];
	((void (__far *)(void))NAME_EDIT_CHANGE_FN)();
}
