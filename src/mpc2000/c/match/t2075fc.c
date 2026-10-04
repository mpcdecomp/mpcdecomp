#include "mpc2k.h"

struct SND __far * __far __pascal sample_data_load_2(char __far *name)
{
	struct SND __far *p;

	for (p = PTR_SAMPLE_DATA->next; p != PTR_DMA_STATE; p = p->next)
		if ((char __far *)p != name && !_fstricmp((char __far *)p, name)) return p;
	return 0;
}
