#include "mpc2kxl.h"

extern char C2_W_01856[1];

void __far trim_focus_start(void)
{
	C2_W_TRIM_CURSOR = 2;
	far_4A1F0(C2_W_01856);
}
