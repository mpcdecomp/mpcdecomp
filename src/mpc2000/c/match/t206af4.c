#include "mpc2k.h"

void __far __pascal timer_dma_setup3(int p0)
{
	sample_dispatch_table(p0 ? 4 : 3);
}
