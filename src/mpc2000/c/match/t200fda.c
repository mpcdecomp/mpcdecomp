#include "mpc2k.h"

void __far __pascal smem_read_words(int p4, long p2, long p0)
{
	smem_dma_copy(p4, p2, p0, 0x1000);
}
