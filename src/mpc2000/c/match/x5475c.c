#include "mpc2kxl.h"

void __far __fastcall __loadds fx_mixer_refresh(void)
{
	if (!C2_FP_08DA0) goto br_54796;
	if (((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7)[69] == C2_FP_08DA0[2]) goto br_54796;
	((void (__far *)(char))smem_dma_channel_01)(C0_B_0D7C7);
br_54796:
	(*(long *)&C2_W_PARAM_HOOK_OFF) = 0L;
	return 0;
}
