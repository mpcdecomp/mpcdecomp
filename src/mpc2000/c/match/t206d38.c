#include "mpc2k.h"

void __far mix_pan_store(void)
{
	char far *v0;

	v0 = note_clamp_flag(G_PAD_NOTE_BASE);
	v0[1] = *WIN_FIELD_VAR + 0x32;
}
