#include "mpc2k.h"

void __far __fastcall __loadds L_0629C(void)
{
	if (G_MUTE_ASSIGN_FIELD >= 2) goto br_062AD;
	G_MUTE_ASSIGN_FIELD++;
br_062AD:
	mute_assign_row_dispatch();
}
