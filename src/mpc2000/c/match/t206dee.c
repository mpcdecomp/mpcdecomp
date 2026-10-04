#include "mpc2k.h"

void __far L_071CC(void)
{
	char far *v0;

	v0 = note_range_clamp(G_PAD_NOTE_BASE);
	v0[5] = *WIN_FIELD_VAR;
}
