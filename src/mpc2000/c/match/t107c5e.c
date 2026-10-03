#include "mpc2k.h"

void __near L_07BDE(void)
{
	switch (LOOP_FINE_CURSOR) { case 1: goto br_07BFA; case 2: goto br_07C0A; case 3: goto X_07C22; }
	ui_edit_position(0xb5, 0xc, 0L);
	return;
br_07BFA:
	sample_active_check_3(0xb5, 0x15, 0L);
	return;
br_07C0A:
	((void (__far __pascal *)(char __far *, int, int, int, int, long))voice_trigger_full)(LOOP_LEN_FIX, 1, 0xcd, 0x1f, 5, 0L);
	return;
X_07C22:
	((void (__far __pascal *)(int, int, long))voice_trigger_caller)(0xb5, 0x28, 0L);
}
