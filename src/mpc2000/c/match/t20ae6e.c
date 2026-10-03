#include "mpc2k.h"

void __far __fastcall __loadds X_0B2A6(void)
{
	char v0;

	v0 = G_NOTE_IN[0];
	if (v0 == (*(char *)&G_PAD_NOTE_BASE)) goto X_0B2BD;
	(*(char *)&G_PAD_NOTE_BASE) = v0;
	cmd_far_stub2();
X_0B2BD:
	;
}
