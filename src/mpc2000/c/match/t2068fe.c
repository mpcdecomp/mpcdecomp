#include "mpc2k.h"

void __far __pascal dispatch_handler_1(int p0)
{
	sample_dispatch_table(p0 ? 6 : 5);
}
