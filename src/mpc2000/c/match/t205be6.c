#include "mpc2k.h"

void __far smem_loop_proc(void)
{
	char l1;

	l1 = PTR_TRACK_DATA[(*(unsigned char *)&G_PAD_INDEX)];
	if ((unsigned)(PTR_TRACK_DATA[(*(unsigned char *)&G_PAD_INDEX)] - 0x23) > 0x3f) goto L_05D76;
	(*(char *)&G_PAD_NOTE_BASE) = l1;
L_05D76:
	;
}
