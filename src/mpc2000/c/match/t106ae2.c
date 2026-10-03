#include "mpc2k.h"

void __far __fastcall __loadds X_06A62(void)
{
	P_0610 = 0;
	dma_018ee();
	L_018D0();
	int44_wrapper(0);
	callback_set_main(0, 0);
	G_SAMPLE_MODE = 0;
	G_SAMPLE_MODE_PREV = 0;
	P_9D40 = 0;
	if (L_00116()) goto X_06AA3;
	SAMPLE_INPUT = 0;
X_06AA3:
	voice_release_all();
	L_00026();
	fn_0761C();
}
