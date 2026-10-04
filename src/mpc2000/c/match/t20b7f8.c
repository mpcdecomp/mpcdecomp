#include "mpc2k.h"

void __far far_0BC30(void)
{
	win_keys_merge(TBL_WINKEYS_LOAD_SOUND);
	((void (__far __pascal *)(int, int, int))install_handler)(5, W_56A8, W_56A6);
	G_MPC60_PAD_SEL = 0;
	load_sound_up();
}
