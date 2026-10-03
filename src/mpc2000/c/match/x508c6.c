#include "mpc2kxl.h"

struct g_MUTE_FIELDS {
    char pad_0[14];
    long f_e;
};

void __far L_508C6(void)
{
	long t1;
	long t2;

	t1 = (*(long (far *)())*(long *)((char *)&(*(struct g_MUTE_FIELDS *)MUTE_FIELDS) + 14 + C2_W_MUTE_ASSIGN_CURSOR * 42))();
	t2 = disp_request_flush();
	return;
}
