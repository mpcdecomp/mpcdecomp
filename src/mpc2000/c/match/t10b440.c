#include "mpc2k.h"

void __near __pascal ui_sound_dialog_draw(unsigned char p0)
{
	G_KEEP_RETRY_FOCUS = p0;
	switch (p0) { case 0: goto br_0B748; case 1: goto br_0B71E; }
	G_KEEP_RETRY_FOCUS = 0;
	goto br_0B748;
br_0B71E:
	timer_value_read_1(G_NOTE_IN, 0x85, 0x25, 1);
	far_02DD2();
	X_02D4A();
	int44_wrapper(1);
	PAD_INPUT_MODE = 1;
	return;
br_0B748:
	((void (__far __pascal *)(char __far *, int, int))far_call_wrapper_1)(P_5140, 0x85, 0x13);
	int44_wrapper(0);
	PAD_INPUT_MODE = 0;
}
