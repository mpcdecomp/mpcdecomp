#include "mpc2kxl.h"

extern char C2_W_01AA0[1];

void __far L_4B530(void)
{
	C2_W_END_FINE_CURSOR = 0;
	far_4A5E8(C2_W_01AA0);
}
