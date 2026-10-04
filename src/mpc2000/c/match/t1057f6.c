#include "mpc2k.h"

void __far __fastcall __loadds X_05776(void)
{
	note_release_latched();
	win_keys_merge(TBL_WINKEYS_02038);
	if (pad_bank_get() == (unsigned char)((unsigned char)G_PAD_INDEX >> 4)) goto br_057AE;
	int3F_wrapper((unsigned char)((unsigned char)G_PAD_INDEX >> 4));
br_057AE:
	L_054DC();
}
