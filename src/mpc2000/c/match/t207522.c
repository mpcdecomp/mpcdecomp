#include "mpc2k.h"

int __far far_07900(void)
{
	int n;
	struct SND __far *p;

	n = 0;
	for (p = PTR_SAMPLE_DATA->next; p != PTR_DMA_STATE; p = p->next) n++;
	return n;
}
