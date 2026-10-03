#include "mpc2k.h"

void __far __fastcall __loadds L_04E88(void)
{
	FP_POLL_HOOK = 0L;
	win_keys_merge(P_1CF0);
	(*(char *)&COPY_FX_CURSOR) = 0;
	G_COPY_DST_PGM = PGM_SLOT;
	G_COPY_SRC_PGM = PGM_SLOT;
	G_COPY_DST_NOTE[0] = G_STATE_9D8B;
	G_COPY_SRC_NOTE[0] = G_STATE_9D8B;
	fx_copy_arm_field();
}
