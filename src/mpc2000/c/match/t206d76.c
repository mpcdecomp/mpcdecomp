#include "mpc2k.h"

void __far L_07154(void)
{
	char far *v0;

	v0 = note_range_clamp(G_PAD_NOTE_BASE) + 3;
	*v0 = *v0 & 0x80 | *WIN_FIELD_VAR;
}
