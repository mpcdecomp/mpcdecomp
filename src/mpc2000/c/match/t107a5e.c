#include "mpc2k.h"

void __near end_fine_arm_field(void)
{
	switch (END_FINE_CURSOR) { case 0: goto X_07A1C; case 1: goto br_079F4; case 2: goto br_07A0C; }
	END_FINE_CURSOR = 0;
	goto X_07A1C;
br_079F4:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int))voice_trigger_full)(TRIM_LEN_FIX, 1, 0xcd, 0x1f, 5, 0, 0);
	return;
br_07A0C:
	((void (__far __pascal *)(int, int, int, int))voice_trigger_caller)(0xb5, 0x28, 0, 0);
	return;
X_07A1C:
	((void (__far __pascal *)(int, int, int, int))sample_active_check_2)(0xb5, 0xc, 0, 0);
}
