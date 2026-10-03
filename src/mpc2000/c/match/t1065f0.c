#include "mpc2k.h"

void __far __fastcall __loadds L_06570(void)
{
	note_release_latched();
	win_keys_merge(P_2768);
	L_064F4();
	int44_wrapper(0);
}
