#include "mpc2k.h"

void __far __fastcall __loadds t1_program_copy(void)
{
	switch (int4B_wrapper()) { case 0: goto br_06668; }
	string_fill_stosb(STR_CANT_COPY_PLAYING);
	return;
br_06668:
	win_keys_merge(TBL_WINKEYS_COPY_PGM);
	G_COPY_DST_PGM = PGM_SLOT;
	G_COPY_SRC_PGM = PGM_SLOT;
	X_06636();
}
