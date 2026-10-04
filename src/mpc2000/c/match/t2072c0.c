#include "mpc2k.h"

void __far sample_data_load_1(void)
{
	struct SND __far *p;

	for (p = PTR_SAMPLE_DATA->next; p != PTR_DMA_STATE; p = p->next)
		if ((unsigned)p->pool_idx < SMEM_POOL_COUNT) smem_free(p->pool_idx);
	far_074EE();
}
