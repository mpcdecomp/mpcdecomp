#include "mpc2kxl.h"

void __far __fastcall __loadds effect_mixer_refresh(void)
{
	if (!C2_FP_08DAA) goto br_54B40;
	if (((char __far * (__far *)(int))pgm_fx_reverb_ptr)(C0_B_0D7C7)[1] == C2_FP_08DAA[2]) goto br_54B40;
	((void (__far *)(char))smem_dma_channel_01)(C0_B_0D7C7);
br_54B40:
	(*(long *)&C2_W_PARAM_HOOK_OFF) = 0L;
	return 0;
}
