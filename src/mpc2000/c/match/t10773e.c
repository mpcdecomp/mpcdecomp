#include "mpc2k.h"

void __far __fastcall __loadds X_076BE(void)
{
	if (G_SAMPLE_MODE != SAMPLE_ST_RECORDING) goto X_076CE;
	fn_070B6();
X_076CE:
	;
}
