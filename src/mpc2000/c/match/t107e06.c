#include "mpc2k.h"

void __near zone_end_fine_arm_field(void)
{
	switch (G_PLAY_MODE) { case 1: goto br_07DA0; case 2: goto X_07DB8; }
	((void (__far __pascal *)(int, int, int, int))ui_edit_zone_start)(0xb5, 0xc, 0, 0);
	return;
br_07DA0:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int))voice_trigger_full)(((char *)&ZONE_LEN_FIX), 1, 0xcd, 0x1f, 5, 0, 0);
	return;
X_07DB8:
	((void (__far __pascal *)(int, int, int, int))voice_trigger_caller)(0xb5, 0x28, 0, 0);
}
