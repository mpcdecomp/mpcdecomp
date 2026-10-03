#include "mpc2kxl.h"

struct g_C0_W_052DE {
    long f_0;
};

void __far L_3D23E(void)
{
	long t1;
	long t2;

	t1 = (*(long (far *)())*(long *)((char *)&(*(struct g_C0_W_052DE *)&C0_TBL_FX_DELAY_FIELD_THUNK) + 0 + fn_3D256(C2_W_FX_DELAY_CURSOR) * 42))();
	t2 = disp_request_flush();
	return;
}
