#include "mpc2kxl.h"

extern char C2_W_01998[1];

void __far L_4B110(void)
{
	C2_W_START_FINE_CURSOR = 0;
	far_4A1F0(C2_W_01998);
}
