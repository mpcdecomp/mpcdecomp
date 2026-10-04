#include "mpc2kxl.h"

void __far __fastcall __loadds far_48782(void)
{
	voice_release_all();
	event_cb_set_main(0, 0);
	C2_B_06474 = 0;
	far_5545E();
	asic_reg1_bank_clear();
	smem_compact();
	(*(long *)&C2_FP_REC_SOUND) = 0L;
	(*(long *)&C2_W_REC_STATE) = 0L;
	far_489C6();
}
