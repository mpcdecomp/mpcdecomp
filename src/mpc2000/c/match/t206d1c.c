#include "mpc2k.h"

void __far L_070FA(void)
{
	char far *v0;

	v0 = note_clamp_flag(G_PAD_NOTE_BASE);
	*v0 = *WIN_FIELD_VAR;
}
