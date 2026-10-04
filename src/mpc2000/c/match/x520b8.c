#include "mpc2kxl.h"

struct g_C2_W_044D6 {
    long f_0;
};

void __far L_520B8(void)
{
	long t1;
	long t2;

	t1 = (*(long (far *)())*(long *)((char *)&(*(struct g_C2_W_044D6 *)&C2_TBL_MIXER_FIELD_THUNK) + 0 + C2_W_MIXER_CURSOR * 42))();
	t2 = disp_request_flush();
	return;
}
