#include "mpc2k.h"

void __far timer_poll_wait_5(void)
{
	char far *p;

	p = note_range_clamp(G_PAD_NOTE_BASE) + 3;
	*p &= 0x7f;
	if (*WIN_FIELD_VAR) *p |= 0x80;
}
