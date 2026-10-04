#include "mpc2k.h"

void __far L_07136(void)
{
	char far *v0;

	v0 = note_range_clamp(G_PAD_NOTE_BASE);
	v0[2] = *WIN_FIELD_VAR;
}
