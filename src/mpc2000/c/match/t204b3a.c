#include "mpc2k.h"

void __far __fastcall __loadds far_04C8A(void)
{
	if (!(B_4FE2 & 3)) goto br_04CA0;
	smem_dma_channel_01(G_STATE_9D8B);
br_04CA0:
	fx_type_load();
	FP_POLL_HOOK = 0L;
	return 0;
}
