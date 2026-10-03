#include "mpc2k.h"

void __far __fastcall __loadds L_063DE(void)
{
	note_release_latched();
	win_keys_merge(TBL_WINKEYS_MUTE_ASSIGN);
	mute_assign_row_dispatch();
}
