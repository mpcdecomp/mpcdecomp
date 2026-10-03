#include "mpc2k.h"

void __far __fastcall __loadds X_066D6(void)
{
	if (G_COPY_NOTE_CURSOR <= 0) goto X_066E7;
	G_COPY_NOTE_CURSOR--;
X_066E7:
	fn_06680();
}
