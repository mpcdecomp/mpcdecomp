#include "mpc2kxl.h"

extern char C1_W_00AD6[1];

void __far far_44982(long p0)
{
	(*(long *)&C1_W_08B0E) = p0;
	handler_set_install(C1_W_00AD6);
	disp_request_flush();
}
