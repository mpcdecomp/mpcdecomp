#include "mpc2k.h"

void __far __fastcall __loadds program_delete(void)
{
	switch (int4B_wrapper()) { case 0: goto X_0655C; }
	((void (__far __pascal *)(char __far *))string_fill_stosb)(STR_CANT_DELETE_PLAYING);
	return;
X_0655C:
	win_keys_merge(TBL_WINKEYS_DELETE_PGM);
	((void (__far __pascal *)(char __far *, int, int, int, void (__far *)(void), int, int))seq_write_data)(((char *)&PGM_SLOT), 1, 0x61, 0x11, X_064CC, 0, 0);
}
