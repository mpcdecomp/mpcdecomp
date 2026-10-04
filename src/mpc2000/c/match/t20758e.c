#include "mpc2k.h"

long __far __pascal sample_ptr_access(char __far *name)
{
	struct SND __far *p;

	for (p = PTR_SAMPLE_DATA->next; p != PTR_DMA_STATE; p = p->next)
		if (!_fstricmp(p->name, name)) return (long)p;
	return 0;
}
