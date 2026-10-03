#include "mpc2k.h"

void __far __fastcall __loadds X_07D92(void)
{
	if (G_SAMPLE_MODE != 1) goto L_07DB0;
	callback_set_main(0, 0);
	G_SAMPLE_MODE = 0;
L_07DB0:
	;
}
