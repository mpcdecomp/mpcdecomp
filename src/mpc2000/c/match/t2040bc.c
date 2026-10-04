#include "mpc2k.h"

void __far __fastcall __loadds far_04206(void)
{
	win_keys_merge(TBL_WINKEYS_MIXER);
	G_STATE_9D8B &= 3;
	if (B_87E6) {
		switch (G_STATE_9D8B) {
		case 0: case 1:
			X_037FE();
			break;
		case 2: case 3:
			X_03716();
			break;
		}
		FP_POLL_HOOK = (long)(void (__far *)(void))L_0426A;
	} else
		X_0449E();
}
