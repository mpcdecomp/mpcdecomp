#include "mpc2kxl.h"

extern long C0_W_0D7C2;

void __far far_48A20(void)
{
	far_4982C();
	C0_W_0D7C2 = (*(long *)&C2_FP_REC_SOUND);
	(*(long *)&C2_FP_REC_SOUND) = 0L;
	sample_record_refresh();
	far_49C2C();
	disp_request_flush();
}
