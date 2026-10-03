#include "mpc2k.h"

void __far __pascal smem_dma_init(int p0)
{
	int38_call_02(p0);
	smem_io_helper();
}
