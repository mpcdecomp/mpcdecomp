#include "mpc2k.h"

void __far loop_seq_handler(void)
{
	char l1;

	l1 = PTR_TRACK_DATA[(*(unsigned char *)&G_PAD_INDEX)];
	if ((unsigned)(PTR_TRACK_DATA[(*(unsigned char *)&G_PAD_INDEX)] - 0x23) > 0x3f) goto br_05D4E;
	(*(char *)&G_PAD_NOTE_BASE) = l1;
br_05D4E:
	;
}
