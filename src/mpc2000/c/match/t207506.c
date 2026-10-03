#include "mpc2k.h"

long __far far_078E4(void)
{
	if (PTR_SAMPLE_DATA->next == PTR_DMA_STATE) return 0;
	return (long)PTR_SAMPLE_DATA->next;
}
