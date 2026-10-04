#include "mpc2kxl.h"

extern char C2_W_01880[1];

void __far trim_focus_end(void)
{
	C2_W_TRIM_CURSOR = 3;
	far_4A5E8(C2_W_01880);
}
