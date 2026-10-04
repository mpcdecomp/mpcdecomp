#include "mpc2k.h"

void __far __fastcall __loadds X_06286(void)
{
	if (G_MUTE_ASSIGN_FIELD <= 0) goto X_06297;
	G_MUTE_ASSIGN_FIELD--;
X_06297:
	mute_assign_row_dispatch();
}
