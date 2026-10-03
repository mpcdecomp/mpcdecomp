#include "mpc2k.h"

void __far __pascal dispatch_handler_2(int p0)
{
	sample_dispatch_table(p0 ? 2 : 1);
	far_06834();
}
