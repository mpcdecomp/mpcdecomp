#include "mpc2k.h"

void __near trim_start_fine_arm_field(void)
{
	if (*(int *)(((char *)&SND_CURRENT) + 2) | *(int *)((char *)&SND_CURRENT)) goto br_0785B;
	switch (TRIM_CURSOR) { case 1: goto br_0785B; }
	TRIM_CURSOR = 0;
br_0785B:
	switch (TRIM_CURSOR) { case 0: goto X_078A2; case 1: goto X_07876; case 2: goto br_0787C; case 3: goto br_0788C; case 4: goto X_0789C; }
	TRIM_CURSOR = 0;
	goto X_078A2;
X_07876:
	L_090D4();
	return;
br_0787C:
	sample_active_check_1(0x1a, 0xc, (void (far *)(void))L_079CA);
	return;
br_0788C:
	sample_active_check_2(0x7a, 0xc, (void (far *)(void))L_07A58);
	return;
X_0789C:
	X_090F4();
	return;
X_078A2:
	X_090B2();
}
