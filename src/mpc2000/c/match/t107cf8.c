#include "mpc2k.h"

void __near zone_start_fine_arm_field(void)
{
	if (*(int *)(((char *)&SND_CURRENT) + 2) | *(int *)((char *)&SND_CURRENT)) goto br_07C92;
	switch (ZONE_START_FINE_CURSOR) { case 1: case 4: goto br_07C92; }
	ZONE_START_FINE_CURSOR = 0;
br_07C92:
	switch (ZONE_START_FINE_CURSOR) { case 0: goto L_07CAC; case 1: goto X_07CB2; case 2: goto T1_br_07CB8; case 3: goto br_07CC8; case 4: goto X_07CD8; }
	ZONE_START_FINE_CURSOR = 0;
	return;
L_07CAC:
	X_090B2();
	return;
X_07CB2:
	L_090D4();
	return;
T1_br_07CB8:
	ui_edit_zone_start(0x1a, 0xc, (void (far *)(void))L_07DF4);
	return;
br_07CC8:
	ui_edit_zone_end(0x7a, 0xc, (void (far *)(void))L_07E7C);
	return;
X_07CD8:
	X_090F4();
}
