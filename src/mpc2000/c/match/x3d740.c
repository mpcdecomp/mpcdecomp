#include "mpc2kxl.h"

void __far __fastcall __loadds sample_dump_refresh(void)
{
	if (C0_W_08DC4 == 2) goto br_3D754;
	if (C0_W_08DC4 != 3) goto br_3D759;
br_3D754:
	sample_dump_cancel();
br_3D759:
	fn_3D3DC();
	voices_release_all();
}
