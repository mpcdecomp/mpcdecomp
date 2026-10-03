#include "mpc2k.h"

void __near start_fine_arm_field(void)
{
	switch (START_FINE_CURSOR) { case 0: goto X_0798E; case 1: goto br_07966; case 2: goto br_0797E; }
	START_FINE_CURSOR = 0;
	goto X_0798E;
br_07966:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int))voice_trigger_full)(TRIM_LEN_FIX, 1, 0xcd, 0x1f, 5, 0, 0);
	return;
br_0797E:
	((void (__far __pascal *)(int, int, int, int))voice_trigger_caller)(0xb5, 0x28, 0, 0);
	return;
X_0798E:
	((void (__far __pascal *)(int, int, int, int))sample_active_check_1)(0xb5, 0xc, 0, 0);
}
