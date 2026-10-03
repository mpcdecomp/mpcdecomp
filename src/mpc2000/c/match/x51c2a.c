#include "mpc2kxl.h"

struct g_C2_TBL_CHANSET_FIELD_THUNK {
    long f_0;
};

void __far L_51C2A(void)
{
	long t1;
	long t2;

	t1 = (*(long (far *)())*(long *)((char *)&(*(struct g_C2_TBL_CHANSET_FIELD_THUNK *)&C2_TBL_CHANSET_FIELD_THUNK) + 0 + C2_W_CHANSET_CURSOR * 42))();
	t2 = disp_request_flush();
	return;
}
