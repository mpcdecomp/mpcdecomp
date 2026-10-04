#include "mpc2k.h"

void __far __fastcall __loadds X_066EC(void)
{
	if (G_COPY_NOTE_CURSOR >= 3) goto L_066FD;
	G_COPY_NOTE_CURSOR++;
L_066FD:
	fn_06680();
}
