#include "mpc2kxl.h"

extern char C2_W_01312[1];

void __far far_48A04(void)
{
	handler_set_install(C2_W_01312);
}
