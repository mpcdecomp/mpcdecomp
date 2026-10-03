#include "mpc2k.h"

void __far __fastcall __loadds L_05980(void)
{
	PARAMS_CURSOR = TBL_PARAMS_NAV_LEFT[PARAMS_CURSOR];
	timer_dma_sync();
}
