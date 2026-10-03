#include "mpc2k.h"

int __far __pascal sample_ptr_helper(struct SND __far *s)
{
	struct SND __far *p;

	for (p = PTR_SAMPLE_DATA->next; p != PTR_DMA_STATE; p = p->next)
		if (p == s) return 1;
	return 0;
}
