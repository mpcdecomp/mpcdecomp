#include "mpc2k.h"

void __far __fastcall __loadds L_0A07A(void)
{
	switch (ZONE_EDIT_ACTION) { case 0: goto br_0A08E; case 1: goto X_0A0A2; }
	return;
br_0A08E:
	G_PLAY_MODE = 1;
	far_call_wrapper_1(TBL_SOUND_NAMES, 0x79, 0x1e);
	return;
X_0A0A2:
	G_PLAY_MODE = 1;
	((void (__far __pascal *)(char __far *, int, int, int, int, int))far_035F2)(((char *)&FP_SND_SECONDARY), 0, 0x79, 0x23, 0, 0);
}
