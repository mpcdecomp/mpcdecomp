#include "mpc2kxl.h"

extern char C1_W_00E8C[1];

void __far far_468EA(void)
{
	handler_set_install(C1_W_00E8C);
}
